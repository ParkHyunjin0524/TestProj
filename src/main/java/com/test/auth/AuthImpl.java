package com.test.auth;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("authService")
public class AuthImpl implements AuthService{

    @Resource(name="authDAO")
    private AuthDAO dao;

    @Override
    public int insertMember(Map map) {
        return dao.insertMember(map);
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
