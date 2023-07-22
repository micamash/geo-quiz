package com.micamash.geoquiz.service;

import com.micamash.geoquiz.model.Question;

import java.util.List;

public interface QuestionServiceInterface {

    /**
     * Generates a random question for a given topic.
     *
     * @param topicId The ID of the topic for which the question should be generated.
     * @return A random Question object for the specified topic, or null if no question is available.
     */
    Question generateRandomQuestion(int topicId);

    /**
     * Retrieves a Question by its ID.
     *
     * @param questionId The ID of the question to retrieve.
     * @return The Question object if found, or null if not found.
     */
    Question getQuestionById(int questionId);

    /**
     * Retrieves a list of questions for a given topic.
     *
     * @param topicId The ID of the topic for which to retrieve questions.
     * @return A list of Question objects for the specified topic.
     */
    List<Question> getQuestionsByTopicId(int topicId);

    /**
     * Validates the user's answer for a specific question.
     *
     * @param questionId The ID of the question for which to validate the user's answer.
     * @param userAnswer The user's answer to the question.
     * @return true if the user's answer is correct, false otherwise.
     */
    boolean validateUserAnswer(int questionId, String userAnswer);

    /**
     * Calculates the user's quiz score based on the number of correct answers and the total number of questions.
     *
     * @param correctAnswers The number of correct answers.
     * @param totalQuestions The total number of questions in the quiz.
     * @return The user's quiz score as a percentage (value between 0 and 100).
     */
    int calculateQuizScore(int correctAnswers, int totalQuestions);

    // Add any additional methods related to QuestionService here, if needed.
}
