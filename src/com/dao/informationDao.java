package com.dao;

import com.servlet.information;

import java.util.List;

public interface informationDao {
    public List<information> select();

    public void insert(information information);

    public information getInformation(String userID);
}