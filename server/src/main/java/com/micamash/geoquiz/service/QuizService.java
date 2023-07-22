package com.micamash.geoquiz.service;

import com.micamash.geoquiz.dao.AnswerDao;
import com.micamash.geoquiz.dao.QuestionDao;
import com.micamash.geoquiz.dao.TopicDao;
import com.micamash.geoquiz.model.Answer;
import com.micamash.geoquiz.model.Question;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class QuizService implements QuizServiceInterface {

    private final TopicDao topicDao;
    private final QuestionDao questionDao;
    private final AnswerDao answerDao;

    public QuizService(TopicDao topicDao, QuestionDao questionDao, AnswerDao answerDao) {
        this.topicDao = topicDao;
        this.questionDao = questionDao;
        this.answerDao = answerDao;
    }

    @Override
    public Question generateRandomQuestion(int topicId) {
        List<Question> questions = questionDao.getQuestionByTopicId(topicId);
        if (questions.isEmpty()) {
            return null;
        }
        int randomIndex = new Random().nextInt(questions.size());
        return questions.get(randomIndex);
    }

    @Override
    public boolean validateUserAnswer(int questionId, String userAnswer) {
        Question question = questionDao.getQuestionByQuestionId(questionId);
        if (question == null) {
            throw new IllegalArgumentException("Invalid questionId: " + questionId);
        }

        Answer correctAnswer = answerDao.getCorrectAnswer(questionId);
        if (correctAnswer == null) {
            throw new IllegalArgumentException("No correct answer found for questionId: " + questionId);
        }

        return userAnswer.equals(correctAnswer.getAnswerText());
    }

    @Override
    public int calculateQuizScore(int correctAnswers, int totalQuestions) {
        if (totalQuestions == 0) {
            return 0; // Avoid division by zero.
        }
        double percentage = (double) correctAnswers / totalQuestions * 100;
        return (int) Math.round(percentage);
    }
}
