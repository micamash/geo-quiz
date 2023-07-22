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
    Question getQuestionByQuestionId(int questionId);

    /**
     * Retrieves a list of questions for a given topic.
     *
     * @param topicId The ID of the topic for which to retrieve questions.
     * @return A list of Question objects for the specified topic.
     */
    List<Question> getQuestionsByTopicId(int topicId);
}
