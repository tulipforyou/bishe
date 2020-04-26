package com.sch.dao;

import com.sch.model.uploadExercise;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
@author 孙朝辉
@createTime 2020-03-08
@packName com.sch.dao
@sys 25243
@project bs
*/

/**
 * @author 孙朝辉
 */
public interface uploadExerciseDao {
    /**
     * 保存习题
     * @param uploadExercise
     */
    void insertUploadExercise(uploadExercise uploadExercise);

    List<uploadExercise> findAll(int sId);

    List<uploadExercise> findAll1();

    void deleteById(int no);

    String findAnswerById(Integer integer);

    void updateStudentAnswerCheck(@Param("id") Integer integer,
                                  @Param("msg") String answerMessage,
                                  @Param("sId") int sId,
                                  @Param("sa") String studentAnswer);

    List<uploadExercise> peculiarityRecommendByUserId(Integer userId);

    List<uploadExercise> findExerciseByType(String key);
}
