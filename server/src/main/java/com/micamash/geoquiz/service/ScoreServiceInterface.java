package com.micamash.geoquiz.service;

public interface ScoreServiceInterface {

    /**
     * Calculates the user's quiz score based on the number of correct answers and the total number of questions.
     *
     * @param correctAnswers The number of correct answers.
     * @param totalQuestions The total number of questions in the quiz.
     * @return The user's quiz score as a percentage (value between 0 and 100).
     */
    int calculateQuizScore(int correctAnswers, int totalQuestions);

}
