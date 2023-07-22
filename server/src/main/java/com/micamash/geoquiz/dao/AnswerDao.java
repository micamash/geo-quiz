package com.micamash.geoquiz.dao;

import com.micamash.geoquiz.model.Answer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class AnswerDao {

    private final JdbcTemplate jdbcTemplate;

    public AnswerDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    public List<Answer> listAnswerTextForQuestion(int questionId) {

        List<Answer> answers = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM answer " +
                "WHERE question_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            Answer product = mapRowToAnswer(results);
            answers.add(product);
        }
        return answers;
    }

    public Answer getByAnswerId(int answerId) {

        String sql = "SELECT * " +
                "FROM answer " +
                "WHERE answer_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, answerId);

        if (results.next()) {
            Answer answer = mapRowToAnswer(results);
            return answer;
        } else {
            return null;
        }
    }

    public Answer getByQuestionId(int questionId) {

        String sql = "SELECT * " +
                "FROM answer " +
                "WHERE question_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, questionId);

        if (results.next()) {
            Answer answer = mapRowToAnswer(results);
            return answer;
        } else {
            return null;
        }
    }

    public boolean isAnswerCorrect(int questionId) {

        String sql = "SELECT *" +
                "FROM answer " +
                "WHERE question_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, questionId);

        if (results.next()) {
            Answer answer = mapRowToAnswer(results);
            return answer.isCorrect();
        } else {
            return false;
        }
    }

    public Answer getCorrectAnswer(int questionId) {
        String sql = "SELECT * FROM answer WHERE question_id = ? AND is_correct = true";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, questionId);
        if (rowSet.next()) {
            return mapRowToAnswer(rowSet);
        }
        return null;
    }

    private Answer mapRowToAnswer(SqlRowSet rowSet) {
        Answer answer = new Answer();
        answer.setAnswerId(rowSet.getInt("answer_id"));
        answer.setQuestionId(rowSet.getInt("question_id"));
        answer.setAnswerText(rowSet.getString("answer_text"));
        answer.setCorrect(rowSet.getBoolean("is_correct"));
        return answer;
    }

}
