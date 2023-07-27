package com.micamash.geoquiz.service;

import com.micamash.geoquiz.dao.QuestionDao;
import com.micamash.geoquiz.model.Question;
import com.micamash.geoquiz.dao.AnswerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class QuestionService implements QuestionServiceInterface {

    private final QuestionDao questionDao;
    private final AnswerDao answerDao;

    @Autowired
    public QuestionService(QuestionDao questionDao, AnswerDao answerDao) {
        this.questionDao = questionDao;
        this.answerDao = answerDao;
    }

    @Override
    public List<Question> listAllQuestions() {
        return questionDao.listAllQuestions();
    }

    @Override
    public Question getQuestionByQuestionId(int questionId) {
        return questionDao.getQuestionByQuestionId(questionId);
    }

    @Override
    public List<Question> getQuestionsByTopicId(int topicId) {
        return questionDao.getQuestionByTopicId(topicId);
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
}
