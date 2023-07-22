package com.micamash.geoquiz.service;

import com.micamash.geoquiz.dao.TopicDao;
import com.micamash.geoquiz.model.Topic;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicService implements TopicServiceInterface {

    private final TopicDao topicDao;

    public TopicService(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    @Override
    public void createTopic(Topic topic) {
        topicDao.createTopic(topic);
    }

    @Override
    public Topic getTopicById(int topicId) {
        return topicDao.getTopicById(topicId);
    }

    @Override
    public void updateTopic(Topic topic) {
        topicDao.updateTopic(topic);
    }

    @Override
    public void deleteTopic(int topicId) {
        topicDao.deleteTopic(topicId);
    }

    @Override
    public List<Topic> listAllTopics() {
        return topicDao.listAllTopics();
    }
}
