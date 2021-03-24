package com.test.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Repository("authDAO")
public class AuthDAO implements AuthService{

    @Autowired
    private SqlSessionTemplate sqlMapper;
    @Override
    public int insertMember(Map map){
        return sqlMapper.insert("insertMember",map);
    }

    @Override
    public int updateMember(Map map) {
        return 0;
    }

    @Override
    public int deleteMember(Map map) {
        return 0;
    }

    @Override
    public List<AuthDTO> selectListMember(Map map) {
        return null;
    }


}
