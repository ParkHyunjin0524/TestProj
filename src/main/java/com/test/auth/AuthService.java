package com.test.auth;

import java.util.List;
import java.util.Map;

public interface AuthService {
    int insertMember(Map map);
    int updateMember(Map map);
    int deleteMember(Map map);
    int insertAuth(Map map);
    List<AuthDTO> selectListMember(Map map);
    AuthDTO selectOneMember(Map map);

}
