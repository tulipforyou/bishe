package com.sch.service;

import com.sch.model.uploadExercise;

import java.util.List;

/*
@author 孙朝辉
@createTime 2020-03-08
@packName com.sch.service
@sys 25243
@project bs
*/
public interface uploadExerciseService {
    void insertUploadExercise(uploadExercise uploadExercise);

    List<uploadExercise> findAll(int sId);
    List<uploadExercise> findAll1();
    void deleteById(int no);

    String findAnswerById(Integer integer);

    void updateStudentAnswerCheck(Integer integer, String answerMessage,int sId,String studentAnswer);

    List<uploadExercise> peculiarityRecommendByUserId(Integer userId);

    List<uploadExercise> findExerciseByType(String key);
}
