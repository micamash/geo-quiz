package com.micamash.geoquiz.service;

import com.micamash.geoquiz.dao.AnswerDao;
import com.micamash.geoquiz.model.Answer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerService implements AnswerServiceInterface {

    private final AnswerDao answerDao;

    public AnswerService(AnswerDao answerDao) {
        this.answerDao = answerDao;
    }

    @Override
    public List<Answer> listAllAnswers() {
        return answerDao.listAllAnswers();
    }
    @Override
    public Answer getCorrectAnswer(int questionId) {
        return answerDao.getCorrectAnswer(questionId);
    }

    @Override
    public boolean validateUserAnswer(int questionId, String userAnswer) {
        Answer correctAnswer = getCorrectAnswer(questionId);
        return correctAnswer != null && correctAnswer.getAnswerText().equalsIgnoreCase(userAnswer);
    }

    @Override
    public List<Answer> getAnswersByQuestionId(int questionId) {
        return answerDao.getAnswersByQuestionId(questionId);
    }

}
