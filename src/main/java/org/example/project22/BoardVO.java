package org.example.project22;

import java.util.Date;

public class BoardVO {
    private int id;
    private String title;
    private String writer;
    private String content;
    private Date regdate;
    private int cnt;

    // 기본 생성자
    public BoardVO() {}

    // 생성자 (INSERT용)
    public BoardVO(String title, String writer, String content) {
        this.title = title;
        this.writer = writer;
        this.content = content;
    }

    // Getters & Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
}