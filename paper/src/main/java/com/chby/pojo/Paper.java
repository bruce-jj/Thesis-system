package com.chby.pojo;

public class Paper {
    private long paperId;
    private String paperName;
    private String paperDetail;
    private String teacherId;

    public Paper() {
    }

    public Paper(long paperId, String paperName, String paperDetail) {
        this.paperId = paperId;
        this.paperName = paperName;
        this.paperDetail = paperDetail;
    }

    public Paper(long paperId, String paperName, String paperDetail, String teacherId) {
        this.paperId = paperId;
        this.paperName = paperName;
        this.paperDetail = paperDetail;
        this.teacherId = teacherId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public long getPaperId() {
        return paperId;
    }

    public void setPaperId(long paperId) {
        this.paperId = paperId;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public String getPaperDetail() {
        return paperDetail;
    }

    public void setPaperDetail(String paperDetail) {
        this.paperDetail = paperDetail;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "paperId=" + paperId +
                ", paperName='" + paperName + '\'' +
                ", paperDetail='" + paperDetail + '\'' +
                ", teacherId='" + teacherId + '\'' +
                '}';
    }
}
