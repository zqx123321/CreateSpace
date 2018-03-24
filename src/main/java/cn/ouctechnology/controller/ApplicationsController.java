package cn.ouctechnology.controller;

import cn.ouctechnology.domain.Applications;
import cn.ouctechnology.service.ApplicationsService;
import cn.ouctechnology.utils.ExcelUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.print.DocFlavor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ApplicationsController {
    @Autowired
    private ApplicationsService service;

    @RequestMapping("/index")
    public String index(HttpServletRequest req) {
        return "index";
    }


    @RequestMapping("/input")
    public ModelAndView input(HttpServletRequest req) {
        String token = UUID.randomUUID().toString();
        req.getSession().setAttribute("token", token);
        ModelAndView mv = new ModelAndView("input");
        return mv;
    }

    @ResponseBody
    @RequestMapping("/admin/list")
    public String list(int page, int limit, String type, HttpServletResponse resp) throws UnsupportedEncodingException {
        resp.setCharacterEncoding("UTF-8");
        type = new String(type.getBytes("ISO8859-1"), "UTF-8");
        String res = service.list(page, limit, type);
        return res;
    }


    @ResponseBody
    @RequestMapping("/save")
    public String save(Applications applications, HttpServletRequest req, HttpServletResponse response) {
        Object TOKEN_IN_SESSION = req.getSession().getAttribute("token");
        if (TOKEN_IN_SESSION == null) {
            req.setAttribute("msg", "<script>alert('Token失效，请重新预约');location='/index'</script>");
            return null;
        }
        req.getSession().removeAttribute("token");
        return service.add(applications);
    }

    @RequestMapping("/admin/applications")
    public String applications() {
        return "admin/applications";
    }


    @ResponseBody
    @RequestMapping("/admin/applications_refuse")
    public String refuse(Long id, HttpServletResponse response) {
        return service.refuse(id);
    }

    @ResponseBody
    @RequestMapping("/admin/applications_agreeCheck")
    public String agreeCheck(Long id, HttpServletResponse response) {
        return service.agreeCheck(id);
    }


    @ResponseBody
    @RequestMapping("/admin/applications_agree")
    public String agree(Long id, HttpServletResponse response) {
        return service.agree(id);
    }

    @RequestMapping("/admin/applications_detail")
    public ModelAndView detail(Long id) {
        ModelAndView mv = new ModelAndView("/admin/appdetail");
        Applications app = service.get(id);
        mv.addObject("app", app);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/admin/applications_delete")
    public String delete(Long id, HttpServletResponse response) {
        return service.delete(id);
    }

    @ResponseBody
    @RequestMapping("/getApplications")
    public String getApplications(Long id) {
        return service.getApplicatios();
    }

    @ResponseBody
    @RequestMapping("/admin/excel")
    public void exportExcel(String type, HttpServletRequest req, HttpServletResponse resp) {
        service.exportExcel(type, req, resp);
    }

}
