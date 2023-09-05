package com.servlet;

public class record {
    /*record实体类*/
    private String userID;
    private int qID1;
    private int answer1;
    private int qID2;
    private int answer2;
    private int qID3;
    private int answer3;
    private int qID4;
    private int answer4;
    private int qID5;
    private int answer5;
    private int score;


    public record() {
    }

    public record(String userID,int qID1,int answer1,int qID2,int answer2,int qID3,int answer3,int qID4,int answer4,int qID5,int answer5,int score) {
        this.userID = userID;
        this.qID1 = qID1;
        this.answer1 = answer1;
        this.qID2 = qID2;
        this.answer2 = answer2;
        this.qID3 = qID3;
        this.answer3 = answer3;
        this.qID4 = qID4;
        this.answer4 = answer4;
        this.qID5 = qID5;
        this.answer5 = answer5;
        this.score = score;
    }

    public String getUID() {
        return userID;
    }
    public void setUID(String userID) {
        this.userID = userID;
    }

    public int getQID1() {
        return qID1;
    }
    public void setQID1(int qID1) {
        this.qID1 = qID1;
    }
    public int getAnswer1() {
        return answer1;
    }
    public void setAnswer1(int answer1) {
        this.answer1 = answer1;
    }

    public int getQID2() {
        return qID2;
    }
    public void setQID2(int qID2) {
        this.qID2 = qID2;
    }
    public int getAnswer2() {
        return answer2;
    }
    public void setAnswer2(int answer2) {
        this.answer2= answer2;
    }

    public int getQID3() {
        return qID3;
    }
    public void setQID3(int qID3) {
        this.qID3 = qID3;
    }
    public int getAnswer3() {
        return answer3;
    }
    public void setAnswer3(int answer3) {
        this.answer3 = answer3;
    }

    public int getQID4() {
        return qID4;
    }
    public void setQID4(int qID4) {
        this.qID4 = qID4;
    }
    public int getAnswer4() {
        return answer4;
    }
    public void setAnswer4(int answer4) {
        this.answer4 = answer4;
    }

    public int getQID5() {
        return qID5;
    }
    public void setQID5(int qID5) {
        this.qID5 = qID5;
    }
    public int getAnswer5() {
        return answer5;
    }
    public void setAnswer5(int answer5) {
        this.answer5 = answer5;
    }

    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "record{" +
                "uID=" + userID +
                ", qID1='" + qID1 + '\'' +
                ", answer1='" + answer1 + '\'' +
                ", qID2='" + qID2 + '\'' +
                ", answer2='" + answer2 + '\'' +
                ", qID3='" + qID3 + '\'' +
                ", answer3='" + answer3 + '\'' +
                ", qID4='" + qID4 + '\'' +
                ", answer4='" + answer4 + '\'' +
                ", qID5='" + qID5 + '\'' +
                ", answer5='" + answer5 + '\'' +
                ", score=" + score +
                '}';
    }

}
