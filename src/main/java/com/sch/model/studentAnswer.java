package com.sch.model;

import java.util.List;

/*
@author 孙朝辉
@createTime 2020-03-09
@packName com.sch.model
@sys 25243
@project bs
*/
public class studentAnswer {
    private List<uploadExercise> uploadExercise;

    @Override
    public String toString() {
        return "studentAnswer{" +
                "uploadExercise=" + uploadExercise +
                '}';
    }

    public List<com.sch.model.uploadExercise> getUploadExercise() {
        return uploadExercise;
    }

    public void setUploadExercise(List<com.sch.model.uploadExercise> uploadExercise) {
        this.uploadExercise = uploadExercise;
    }
}
