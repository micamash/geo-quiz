package com.micamash.geoquiz.dao;

import com.micamash.geoquiz.model.Question;
import com.micamash.geoquiz.model.Topic;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;


@Component
public class TopicDao {

    private final JdbcTemplate jdbcTemplate;
    public TopicDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    public void createTopic(Topic topic) {
        String sql = "INSERT INTO topic (topic_id, topic_name) " +
                "VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, topic.getTopicId(), topic.getTopicName());
    }

    public Topic getTopicById(int topicId) {
        String sql = "SELECT * FROM topic WHERE topic_id = ?";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, topicId);
        if (rowSet.next()) {
            return mapRowToTopic(rowSet);
        }
        return null;
    }

    public void updateTopic(Topic topic) {
        String sql = "UPDATE topic SET topic_name = ? " +
                "WHERE topic_id = ?";
        jdbcTemplate.update(sql, topic.getTopicId(), topic.getTopicName());
    }

    public void deleteTopic(int topicId) {
        String sql = "DELETE FROM topic WHERE topic_id = ?";
        jdbcTemplate.update(sql, topicId);
    }

    public List<Topic> listAllTopics() {
        List<Topic> topics = new ArrayList<>();
        String sql = "SELECT * FROM topic";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while (rowSet.next()) {
            Topic topic = mapRowToTopic(rowSet);
            topics.add(topic);
        }
        return topics;
    }

    private Topic mapRowToTopic(SqlRowSet rowSet) {
        int topicId = rowSet.getInt("topic_id");
        String topicName = rowSet.getString("topic_name");
        return new Topic(topicId, topicName);
    }
}
