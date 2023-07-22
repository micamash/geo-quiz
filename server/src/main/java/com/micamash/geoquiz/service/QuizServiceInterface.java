package com.micamash.geoquiz.service;

import com.micamash.geoquiz.model.Question;

public interface QuizServiceInterface {

    /**
     * Generate a random quiz question for a given topic.
     *
     * @param topicId The ID of the topic for which to generate the question.
     * @return A random question for the specified topic, or null if no questions found.
     */
    Question generateRandomQuestion(int topicId);

    /**
     * Validate the user's answer for a specific question.
     *
     * @param questionId The ID of the question.
     * @param userAnswer The answer provided by the user.
     * @return true if the user's answer is correct, false otherwise.
     */
    boolean validateUserAnswer(int questionId, String userAnswer);

    /**
     * Calculate the user's score for a quiz.
     *
     * @param correctAnswers The number of correct answers.
     * @param totalQuestions The total number of questions in the quiz.
     * @return The user's score as a percentage.
     */
    int calculateQuizScore(int correctAnswers, int totalQuestions);
}
