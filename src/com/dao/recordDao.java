package com.dao;

import com.servlet.record;

import java.util.List;

public interface recordDao {

        public List<record> select();

        public void insert(record record);

        public List<record> getRecord(String userID);
}

