package com.micamash.geoquiz.controller;

import com.micamash.geoquiz.model.Question;
import com.micamash.geoquiz.model.Topic;
import com.micamash.geoquiz.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/questions")
public class QuestionController {

    private final QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping
    public ResponseEntity<List<Question>> listAllQuestions() {
        List<Question> questions = questionService.listAllQuestions();
        return new ResponseEntity<>(questions, HttpStatus.OK);
    }

    @GetMapping("/{topicId}")
    public ResponseEntity<Question> generateRandomQuestion(@PathVariable int topicId) {
        Question randomQuestion = questionService.generateRandomQuestion(topicId);
        if (randomQuestion != null) {
            return new ResponseEntity<>(randomQuestion, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/{questionId}")
    public ResponseEntity<Question> getQuestionById(@PathVariable int questionId) {
        Question question = questionService.getQuestionByQuestionId(questionId);
        if (question != null) {
            return new ResponseEntity<>(question, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/topics/{topicId}")
    public ResponseEntity<List<Question>> getQuestionsByTopicId(@PathVariable int topicId) {
        List<Question> questions = questionService.getQuestionsByTopicId(topicId);
        if (!questions.isEmpty()) {
            return new ResponseEntity<>(questions, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
