package cn.ouctechnology.service.impl;

import cn.ouctechnology.dao.IAdminsDao;
import cn.ouctechnology.domain.Admins;
import cn.ouctechnology.service.AdminsService;
import com.alibaba.fastjson.JSON;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class AdminsServiceImpl implements AdminsService {
    @Autowired
    private IAdminsDao dao;

    @Override
    public String login(String account, String password, String check, HttpServletRequest req) {
        String res = null;
        String contextPath = req.getContextPath();
        if (!check.equalsIgnoreCase((String) req.getSession().getAttribute("captcha"))) {
            res = "<script>alert('验证码错误');location='./login'</script>";
            return res;
        }
        Admins admins = dao.selectByAccount(account);
        String realPassword = admins.getPassword();
        password = DigestUtils.sha1Hex(password);
        if (realPassword == null) {
            res = "<script>alert('用户名不存在');location='"+contextPath+"/login'</script>";
        } else if (!realPassword.equals(password)) {
            res = "<script>alert('密码错误');location='"+contextPath+"/login'</script>";
        } else {
            res = "<script>alert('登陆成功');location='"+contextPath+"/admin'</script>";
            req.getSession().setAttribute("account", admins);
            req.getSession().removeAttribute("captcha");
        }
        return res;
    }

    @Override
    public Admins getByAccoount(String account) {
        return dao.selectByAccount(account);
    }

    @Override
    public String changePwd(String pwd, Long id) {
        //SHA-1
        pwd = DigestUtils.sha1Hex(pwd);
        Integer res = dao.changePwd(pwd, id);
        Map<String, Integer> resMap = new HashMap();
        resMap.put("success", res);
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    @Override
    public String add(Admins admins) {
        Admins prev = dao.selectByAccount(admins.getAccount());
        Map<String, Integer> resMap = new HashMap();
        if (prev != null) {
            resMap.put("success", -1);
        } else {
            admins.setAdminClass(2);
            String password = DigestUtils.sha1Hex(admins.getAccount());
            admins.setPassword(password);
            System.out.println(admins);
            Integer res = dao.add(admins);
            resMap.put("success", res);
        }
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }
}
