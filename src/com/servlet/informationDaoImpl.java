package com.servlet;

import com.dao.informationDao;
import com.servlet.information;
import com.untils.OracleJdbc;
import java.util.ArrayList;
import java.util.List;

// informationDao接口实现

public class informationDaoImpl implements informationDao {
    @Override
    public List<information> select() {
        OracleJdbc.infoResult = OracleJdbc.query("select * from information");
        List<information> list = new ArrayList<information>();
        try {
            while (OracleJdbc.infoResult.next()){  //遍历结果集创建list（注意只能遍历一次）
                information information = new information();
                information.setUID(OracleJdbc.infoResult.getString("userID"));
                information.setName(OracleJdbc.infoResult.getString("userName"));
                information.setPassword(OracleJdbc.infoResult.getString("userPassword"));
                information.setSex(OracleJdbc.infoResult.getString("userSex"));
                information.setBirth(OracleJdbc.infoResult.getString("userBirth"));
                information.setAuthority(OracleJdbc.infoResult.getString("userAuthority"));
                list.add(information);
            }
            return  list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }

    public void insert(information information) {
        String sql = "INSERT INTO information (userID,userName,userPassword,userSex,userBirth,userAuthority)  \n" +
                "VALUES(?,?,?,?,?,?)";
        try {
            String userID=information.getUID();
            String userName=information.getName();
            String userPassword=information.getPassword();
            String userSex=information.getSex();
            String userBirth=information.getBirth();
            String userAuthority=information.getAuthority();
            OracleJdbc.insert(sql,userID,userName,userPassword,userSex,userBirth,userAuthority);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }

    public void update(String sql,String newItem,String uID) {
        try {
            OracleJdbc.update(sql,newItem,uID);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return;
    }

    @Override
    public information getInformation(String userID) {
        String sql = "select * from information where userID = ? ";
        OracleJdbc.infoResult = OracleJdbc.query(sql,userID);
        try {
            while (OracleJdbc.infoResult.next()){
                information information = new information();
                information.setUID(OracleJdbc.infoResult.getString("userID"));
                information.setName(OracleJdbc.infoResult.getString("userName"));
                information.setPassword(OracleJdbc.infoResult.getString("userPassword"));
                information.setSex(OracleJdbc.infoResult.getString("userSex"));
                information.setBirth(OracleJdbc.infoResult.getString("userBirth"));
                information.setAuthority(OracleJdbc.infoResult.getString("userAuthority"));
                return information;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            OracleJdbc.closeObject();
        }
        return null;
    }
}
