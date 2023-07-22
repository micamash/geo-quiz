package com.micamash.geoquiz.dao;

import com.micamash.geoquiz.model.Question;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class QuestionDao {
    private final JdbcTemplate jdbcTemplate;

    public QuestionDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    public void createQuestion(Question question) {
        String sql = "INSERT INTO question (topic_id, question_text, image_name) " +
                "VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, question.getTopicId(), question.getQuestionText(), question.getImageName());
    }

    public Question getQuestionByQuestionId(int questionId) {
        String sql = "SELECT * FROM question WHERE question_id = ?";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, questionId);
        if (rowSet.next()) {
            return mapRowToQuestion(rowSet);
        }
        return null;
    }

    public List<Question> getQuestionByTopicId(int topicId) {
        String sql = "SELECT * FROM question WHERE topic_id = ?";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, topicId);
        List<Question> questions = new ArrayList<>();

        while (rowSet.next()) {
            Question question = mapRowToQuestion(rowSet);
            questions.add(question);
        }

        return questions;
    }

    public void updateQuestion(Question question) {
        String sql = "UPDATE question SET topic_id = ?, question_text = ?, image_name = ? " +
                "WHERE question_id = ?";
        jdbcTemplate.update(sql, question.getTopicId(), question.getQuestionText(), question.getImageName(), question.getQuestionId());
    }

    public void deleteQuestion(int questionId) {
        String sql = "DELETE FROM question WHERE question_id = ?";
        jdbcTemplate.update(sql, questionId);
    }

    public List<Question> listAllQuestions() {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM question";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while (rowSet.next()) {
            Question question = mapRowToQuestion(rowSet);
            questions.add(question);
        }
        return questions;
    }

    private Question mapRowToQuestion(SqlRowSet rowSet) {
        int questionId = rowSet.getInt("question_id");
        int topicId = rowSet.getInt("topic_id");
        String questionText = rowSet.getString("question_text");
        String imageName = rowSet.getString("image_name");
        return new Question(questionId, topicId, questionText, imageName);
    }
}
