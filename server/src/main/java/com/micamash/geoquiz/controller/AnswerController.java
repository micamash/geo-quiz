package com.micamash.geoquiz.controller;

import com.micamash.geoquiz.model.Answer;
import com.micamash.geoquiz.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/answers")
public class AnswerController {

    private final AnswerService answerService;

    @Autowired
    public AnswerController(AnswerService answerService) {
        this.answerService = answerService;
    }

    @GetMapping("/{questionId}")
    public ResponseEntity<List<Answer>> getAnswersByQuestionId(@PathVariable int questionId) {
        List<Answer> answers = answerService.getAnswersByQuestionId(questionId);
        if (!answers.isEmpty()) {
            return new ResponseEntity<>(answers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/correct/{questionId}")
    public ResponseEntity<Answer> getCorrectAnswer(@PathVariable int questionId) {
        Answer correctAnswer = answerService.getCorrectAnswer(questionId);
        if (correctAnswer != null) {
            return new ResponseEntity<>(correctAnswer, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
