package org.example.project22;

import java.util.Date;

//자바 빈
public class BoardVO {
    private int seq;
    private String title;
    private String content;
    private Date regdate;
    private int cnt;

    public int getSeq() {
        return seq;
    }
    public void setSeq(int seq) {
        this.seq = seq;
    }
    public String getTitle() {
        return title;
    }
}
