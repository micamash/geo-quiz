package com.micamash.geoquiz.service;

import com.micamash.geoquiz.model.Answer;

public interface AnswerServiceInterface {

    /**
     * Retrieves the correct answer for a given questionId.
     *
     * @param questionId the ID of the question to get the correct answer for.
     * @return the correct answer as an Answer object, or null if not found.
     */
    Answer getCorrectAnswer(int questionId);

    /**
     * Validates whether the user's answer matches the correct answer for a given question.
     *
     * @param questionId the ID of the question to validate the answer for.
     * @param userAnswer the user's provided answer.
     * @return true if the user's answer is correct, false otherwise.
     */
    boolean validateUserAnswer(int questionId, String userAnswer);

}
