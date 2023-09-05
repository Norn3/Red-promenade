package com.servlet;

public class turnString {
    public turnString(){}

    public String turn(int value)
    {
        String str="E";
        switch (value)
        {
            case 1 :str="A";break;
            case 2 :str="B";break;
            case 3 :str="C";break;
            case 4 :str="D";break;
        }
        return str;
    }
}
