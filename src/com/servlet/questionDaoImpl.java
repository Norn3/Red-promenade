package com.servlet;

import com.dao.questionDao;
import com.servlet.question;
import com.untils.OracleJdbc;
import java.util.ArrayList;
import java.util.List;

// questionDao接口实现

public class questionDaoImpl implements questionDao {
    @Override
    public List<question> select() {
        OracleJdbc.quesResult = OracleJdbc.query("select * from questions order by qid");
        List<question> list = new ArrayList<question>();
        try {
            while (OracleJdbc.quesResult.next()){  //遍历结果集创建list（注意只能遍历一次）
                question question = new question();
                question.setQID(OracleJdbc.quesResult.getInt("qID"));
                question.setQuestion(OracleJdbc.quesResult.getString("question"));
                question.setAnswer1(OracleJdbc.quesResult.getString("answer1"));
                question.setAnswer2(OracleJdbc.quesResult.getString("answer2"));
                question.setAnswer3(OracleJdbc.quesResult.getString("answer3"));
                question.setAnswer4(OracleJdbc.quesResult.getString("answer4"));
                question.setSolution(OracleJdbc.quesResult.getInt("solution"));
                list.add(question);
            }
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }

    public void insert(question q) {
        String sql = "INSERT INTO questions (qID,question,answer1,answer2,answer3,answer4,solution)  \n" +
                "VALUES(?,?,?,?,?,?,?)";
        try {
            int qID=q.getQID();
            String question=q.getQuestion();
            String answer1=q.getAnswer1();
            String answer2=q.getAnswer2();
            String answer3=q.getAnswer3();
            String answer4=q.getAnswer4();
            int solution=q.getSolution();
            OracleJdbc.insert(sql,qID,question,answer1,answer2,answer3,answer4,solution);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }

    public void update(String sql,String newItem,int qID) {
        try {
            OracleJdbc.update(sql,newItem,qID);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }

    public void delete(int qID) {
        String sql = "delete from questions where qid= ?";
        try {
            OracleJdbc.delete(sql,qID);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }


    @Override
    public question getQuestion(int qID) {
        String sql = "select * from questions where qID = ? ";
        OracleJdbc.quesResult = OracleJdbc.query(sql,qID);
        try {
            while (OracleJdbc.quesResult.next()){
                question question = new question();
                question.setQID(OracleJdbc.quesResult.getInt("qID"));
                question.setQuestion(OracleJdbc.quesResult.getString("question"));
                question.setAnswer1(OracleJdbc.quesResult.getString("answer1"));
                question.setAnswer2(OracleJdbc.quesResult.getString("answer2"));
                question.setAnswer3(OracleJdbc.quesResult.getString("answer3"));
                question.setAnswer4(OracleJdbc.quesResult.getString("answer4"));
                question.setSolution(OracleJdbc.quesResult.getInt("solution"));
                return question;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }
}


