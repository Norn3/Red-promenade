package com.dao;

import com.servlet.question;

import java.util.List;

public interface questionDao {
    public List<question> select();

    public question getQuestion(int qID);
}
