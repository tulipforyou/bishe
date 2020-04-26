package com.sch.service;

import com.sch.dao.uploadExerciseDao;
import com.sch.model.uploadExercise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
@author 孙朝辉
@createTime 2020-03-08
@packName com.sch.service
@sys 25243
@project bs
*/
@Service
public class uploadExerciseServiceImpl implements uploadExerciseService {
    @Autowired
    private uploadExerciseDao dao;
    @Override
    public void insertUploadExercise(uploadExercise uploadExercise) {
        System.out.println(uploadExercise);
        dao.insertUploadExercise(uploadExercise);
    }

    @Override
    public List<uploadExercise> findAll(int sId) {
        return dao.findAll(sId);
    }

    @Override
    public List<uploadExercise> findAll1() {
        return dao.findAll1();
    }

    @Override
    public void deleteById(int no) {
        dao.deleteById(no);
    }

    @Override
    public String findAnswerById(Integer integer) {
        return dao.findAnswerById(integer);
    }

    @Override
    public void updateStudentAnswerCheck(Integer integer, String answerMessage,int sId,String studentAnswer) {
        dao.updateStudentAnswerCheck(integer,answerMessage,sId,studentAnswer);
    }

    @Override
    public List<uploadExercise> peculiarityRecommendByUserId(Integer userId) {
        return dao.peculiarityRecommendByUserId(userId);
    }

    @Override
    public List<uploadExercise> findExerciseByType(String key) {
        return dao.findExerciseByType(key);
    }
}
