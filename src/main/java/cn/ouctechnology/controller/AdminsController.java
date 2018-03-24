package cn.ouctechnology.controller;

import cn.ouctechnology.captcha.Captcha;
import cn.ouctechnology.captcha.GifCaptcha;
import cn.ouctechnology.domain.Admins;
import cn.ouctechnology.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.ResponseWrapper;
import java.io.IOException;

@Controller
public class AdminsController {
    @Autowired
    private AdminsService service;

    @RequestMapping("/doLogin")

    public ModelAndView doLogin(String account, String password, String check, HttpServletRequest req) {
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("res", service.login(account, password, check, req));
        return mv;
    }

    @RequestMapping("/login")
    public String login(HttpServletResponse resp) {
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().invalidate();
        return "login";
    }

    @RequestMapping("/admin")
    public String index(HttpServletRequest req) {
//        Admins account = (Admins) req.getSession().getAttribute("account");
//        Admins admin = service.getByAccoount(account.getAccount());
//        ModelAndView mv = new ModelAndView("admin/index");
//        mv.addObject("user", admin);
//        return mv;
        return "admin/index";
    }

    @ResponseBody
    @RequestMapping("/captcha")
    public void captcha(HttpServletRequest req, HttpServletResponse resp) {
        //设置输出图片
        resp.setContentType("image/gif");
        resp.setHeader("Pragma", "No-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);

        // gif验证码, 宽、高、位数
        Captcha captcha = new GifCaptcha(130, 38, 5);
        String code = captcha.text();
        // 存入servletContext
        req.getSession().setAttribute("captcha", code);

        //输入图片
        try {
            captcha.out(resp.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping("/admin/changePwd")
    public String changPwd(String pwd, Long id, HttpServletResponse resp) {
        return service.changePwd(pwd, id);
    }


    @ResponseBody
    @RequestMapping("/admin/doAdd")
    public String doAdd(Admins admins, HttpServletResponse resp) {
        return service.add(admins);
    }

    @RequestMapping("/admin/add")
    public String add(HttpServletResponse resp) {
        return "/admin/add";
    }
}
