package com.servlet;

import com.dao.recordDao;
import com.servlet.record;
import com.untils.OracleJdbc;
import java.util.ArrayList;
import java.util.List;

// recordDaoImpl接口实现

public class recordDaoImpl implements recordDao {
    @Override
    public List<record> select() {
        OracleJdbc.recResult = OracleJdbc.query("select * from answer_record order by userID");
        List<record> list = new ArrayList<record>();
        try {
            while (OracleJdbc.recResult.next()){  //遍历结果集创建list（注意只能遍历一次）
                record record = new record();
                record.setUID(OracleJdbc.recResult.getString("userID"));
                record.setQID1(OracleJdbc.recResult.getInt("qID1"));
                record.setAnswer1(OracleJdbc.recResult.getInt("useranswer1"));
                record.setQID2(OracleJdbc.recResult.getInt("qID2"));
                record.setAnswer2(OracleJdbc.recResult.getInt("useranswer2"));
                record.setQID3(OracleJdbc.recResult.getInt("qID3"));
                record.setAnswer3(OracleJdbc.recResult.getInt("useranswer3"));
                record.setQID4(OracleJdbc.recResult.getInt("qID4"));
                record.setAnswer4(OracleJdbc.recResult.getInt("useranswer4"));
                record.setQID5(OracleJdbc.recResult.getInt("qID5"));
                record.setAnswer5(OracleJdbc.recResult.getInt("useranswer5"));
                record.setScore(OracleJdbc.recResult.getInt("score"));
                list.add(record);
            }
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }

    public void insert(record record) {
        String sql = "INSERT INTO answer_record (userID,QID1,useranswer1,QID2,useranswer2," +
                "QID3,useranswer3,QID4,useranswer4,QID5,useranswer5,score)  \n" +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            String userID=record.getUID();
            int qID1=record.getQID1();
            int answer1=record.getAnswer1();
            int qID2=record.getQID2();
            int answer2=record.getAnswer2();
            int qID3=record.getQID3();
            int answer3=record.getAnswer3();
            int qID4=record.getQID4();
            int answer4=record.getAnswer4();
            int qID5=record.getQID5();
            int answer5=record.getAnswer5();
            int score=record.getScore();
            OracleJdbc.insert(sql,userID,qID1,answer1,qID2,answer2,qID3,answer3,qID4,answer4,qID5,answer5,score);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }

    @Override
    public List<record> getRecord(String userID) {
        String sql = "select * from answer_record where userID = ? ";
        OracleJdbc.recResult = OracleJdbc.query(sql,userID);
        List<record> list = new ArrayList<record>();
        try {
            while (OracleJdbc.recResult.next()){  //遍历结果集创建list（注意只能遍历一次）
                record record = new record();
                record.setUID(OracleJdbc.recResult.getString("userID"));
                record.setQID1(OracleJdbc.recResult.getInt("qID1"));
                record.setAnswer1(OracleJdbc.recResult.getInt("useranswer1"));
                record.setQID2(OracleJdbc.recResult.getInt("qID2"));
                record.setAnswer2(OracleJdbc.recResult.getInt("useranswer2"));
                record.setQID3(OracleJdbc.recResult.getInt("qID3"));
                record.setAnswer3(OracleJdbc.recResult.getInt("useranswer3"));
                record.setQID4(OracleJdbc.recResult.getInt("qID4"));
                record.setAnswer4(OracleJdbc.recResult.getInt("useranswer4"));
                record.setQID5(OracleJdbc.recResult.getInt("qID5"));
                record.setAnswer5(OracleJdbc.recResult.getInt("useranswer5"));
                record.setScore(OracleJdbc.recResult.getInt("score"));
                list.add(record);
            }
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }
}
