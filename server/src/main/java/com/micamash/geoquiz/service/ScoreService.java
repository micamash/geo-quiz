package com.micamash.geoquiz.service;

import org.springframework.stereotype.Service;

@Service
public class ScoreService implements ScoreServiceInterface {

    @Override
    public int calculateQuizScore(int correctAnswers, int totalQuestions) {
        if (totalQuestions <= 0) {
            throw new IllegalArgumentException("Total questions must be greater than zero.");
        }

        double percentage = (double) correctAnswers / totalQuestions * 100;

        return (int) Math.round(percentage);
    }

}
