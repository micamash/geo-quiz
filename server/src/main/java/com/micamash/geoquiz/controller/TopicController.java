package com.micamash.geoquiz.controller;

import com.micamash.geoquiz.model.Topic;
import com.micamash.geoquiz.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/topics")
@CrossOrigin(origins = "http://localhost:8080")
public class TopicController {

    private final TopicService topicService;

    @Autowired
    public TopicController(TopicService topicService) {
        this.topicService = topicService;
    }

    @GetMapping
    public ResponseEntity<List<Topic>> listAllTopics() {
        List<Topic> topics = topicService.listAllTopics();
        return new ResponseEntity<>(topics, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Void> createTopic(@RequestBody Topic topic) {
        topicService.createTopic(topic);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("/{topicId}")
    public ResponseEntity<Topic> getTopicById(@PathVariable int topicId) {
        Topic topic = topicService.getTopicById(topicId);
        if (topic != null) {
            return new ResponseEntity<>(topic, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{topicId}")
    public ResponseEntity<Void> updateTopic(@PathVariable int topicId, @RequestBody Topic topic) {
        Topic existingTopic = topicService.getTopicById(topicId);
        if (existingTopic != null) {
            topic.setTopicId(topicId);
            topicService.updateTopic(topic);
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{topicId}")
    public ResponseEntity<Void> deleteTopic(@PathVariable int topicId) {
        Topic existingTopic = topicService.getTopicById(topicId);
        if (existingTopic != null) {
            topicService.deleteTopic(topicId);
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}