package com.micamash.geoquiz.service;

import com.micamash.geoquiz.model.Answer;
import com.micamash.geoquiz.model.Question;

import java.util.List;

public interface AnswerServiceInterface {

    /**
     * Retrieves a list of all answers.
     *
     * @return A list of all answer objects.
     */
    List<Answer> listAllAnswers();

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

    /**
     * Gets available answers for a question.
     *
     * @param questionId the ID of the question to validate the answer for.
     * @return list of answer options.
     */
    List<Answer> getAnswersByQuestionId(int questionId);}
