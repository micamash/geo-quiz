package com.projects.geoquiz.model;

public class Topic {

    private int topicId;
    private String name;

    public Topic() {}

    public Topic(String name) {
        this.name = name;
    }

    public int getTopicId(){
        return topicId;
    }

    public void setTopicId(int topicId){
        this.topicId = topicId;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }
}
