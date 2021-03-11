package com.chby.mapper;

import com.chby.pojo.Paper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface PaperMapper {
    int addPaper(Paper paper);

    int deletePaperById(long id);

    int updatePaper(Paper paper);

    Paper queryById(long id);

    List<Paper> queryAllPaper();

}

