package com.micamash.geoquiz.model;

public class Question {

    private int questionId;
    private int topicId;
    private String questionText;
    private String imageName;

    public Question(){}

    public Question(int questionId, int topicId, String questionText, String imageName){
        this.questionId = questionId;
        this.topicId = topicId;
        this.questionText = questionText;
        this.imageName = imageName;
    }

    public int getQuestionId(){
        return questionId;
    }

    public void setQuestionId(int questionId){
        this.questionId = questionId;
    }

    public int getTopicId(){
        return topicId;
    }

    public void setTopicId(int topicId){
        this.topicId = topicId;
    }

    public String getQuestionText(){
        return questionText;
    }

    public void setQuestionText(String questionText){
        this.questionText = questionText;
    }

    public String getImageName(){
        return imageName;
    }

    public void setImageName(String imageName){
        this.imageName = imageName;
    }
}
