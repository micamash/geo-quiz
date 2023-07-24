package com.micamash.geoquiz.service;

import com.micamash.geoquiz.model.Topic;
import java.util.List;

public interface TopicServiceInterface {

    /**
     * Retrieves a list of all topics.
     *
     * @return A list of all Topic objects.
     */
    List<Topic> listAllTopics();


    /**
     * Retrieves a topic by its ID.
     *
     * @param topicId The ID of the topic to retrieve.
     * @return The Topic object if found, or null if not found.
     */
    Topic getTopicById(int topicId);

    /**
     * Creates a new topic.
     *
     * @param topic The topic to create.
     */
    void createTopic(Topic topic);

    /**
     * Updates an existing topic.
     *
     * @param topic The topic to update.
     */
    void updateTopic(Topic topic);

    /**
     * Deletes a topic by its ID.
     *
     * @param topicId The ID of the topic to delete.
     */
    void deleteTopic(int topicId);

}