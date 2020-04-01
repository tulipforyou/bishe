package com.sch.model;

/*
@author 孙朝辉
@createTime 2020-03-08
@packName com.sch.model
@sys 25243
@project bs
*/

/*
* position: relative;
    width: 100%;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px
* */

import java.io.Serializable;

/**
 * 老师上传习题model
 * @author 孙朝辉
 */
public class uploadExercise implements Serializable {
    private int id;
    private String className;
    private String exerciseType;
    private String knowledgePoints;
    private String subject;
    private String answer1;
    private String answer2;
    private String answer3;
    private String answer4;
    private String correctAnswer;
    private String uptime;
    private String studentAnswerCheck;
    private int studentId;
    private String studentAnswer;

    @Override
    public String toString() {
        return "uploadExercise{" +
                "id=" + id +
                ", className='" + className + '\'' +
                ", exerciseType='" + exerciseType + '\'' +
                ", knowledgePoints='" + knowledgePoints + '\'' +
                ", subject='" + subject + '\'' +
                ", answer1='" + answer1 + '\'' +
                ", answer2='" + answer2 + '\'' +
                ", answer3='" + answer3 + '\'' +
                ", answer4='" + answer4 + '\'' +
                ", correctAnswer='" + correctAnswer + '\'' +
                ", uptime='" + uptime + '\'' +
                ", studentAnswerCheck='" + studentAnswerCheck + '\'' +
                ", studentId=" + studentId +
                ", studentAnswer='" + studentAnswer + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getExerciseType() {
        return exerciseType;
    }

    public void setExerciseType(String exerciseType) {
        this.exerciseType = exerciseType;
    }

    public String getKnowledgePoints() {
        return knowledgePoints;
    }

    public void setKnowledgePoints(String knowledgePoints) {
        this.knowledgePoints = knowledgePoints;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getAnswer4() {
        return answer4;
    }

    public void setAnswer4(String answer4) {
        this.answer4 = answer4;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getStudentAnswerCheck() {
        return studentAnswerCheck;
    }

    public void setStudentAnswerCheck(String studentAnswerCheck) {
        this.studentAnswerCheck = studentAnswerCheck;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }
}
