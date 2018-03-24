package cn.ouctechnology.service;

import cn.ouctechnology.domain.Admins;

import javax.servlet.http.HttpServletRequest;

public interface AdminsService {
    String login(String account, String password, String text, HttpServletRequest req);

    Admins getByAccoount(String account);

    String changePwd(String pwd, Long id);

    String add(Admins admins);


}
