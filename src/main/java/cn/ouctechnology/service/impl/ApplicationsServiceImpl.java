package cn.ouctechnology.service.impl;

import cn.ouctechnology.dao.IAdminsDao;
import cn.ouctechnology.dao.IApplicationsDao;
import cn.ouctechnology.domain.Admins;
import cn.ouctechnology.domain.Applications;
import cn.ouctechnology.service.ApplicationsService;
import cn.ouctechnology.utils.ExcelUtils;
import cn.ouctechnology.utils.MailUtils;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ApplicationsServiceImpl implements ApplicationsService {

    @Autowired
    private IApplicationsDao dao;
    @Autowired
    private IAdminsDao adminsDao;

    @Override
    public String list(int page, int limit, String type) {
        List<String> typeList = Arrays.asList("上午", "下午", "晚上");
        List<Map<String, Object>> res = new ArrayList<>();
        List<Applications> list = dao.list(limit, (page - 1) * limit, type);
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        list.forEach(item -> {
            try {
                Map<String, Object> temp = new HashMap<>();
                BeanInfo beanInfo = Introspector.getBeanInfo(Applications.class, Object.class);
                PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
                for (PropertyDescriptor pd : pds) {
                    temp.put(pd.getName(), pd.getReadMethod().invoke(item));
                }
                Date date = new Date(item.getApptime() * 1000L);
                String s = sdf.format(date);
                temp.put("orderTime", s + " " + typeList.get(item.getState() - 1));
                res.add(temp);

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        Long count = dao.count(type);
        Map<String, Object> resMap = new HashMap<>();
        resMap.put("code", 0);
        resMap.put("msg", "");
        resMap.put("count", count);
        resMap.put("data", res);
        return JSON.toJSONString(resMap);
    }

    @Override
    public String add(Applications applications) {
        applications.setDeal("未审核");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd HH:mm");
        String s = sdf.format(date);
        applications.setCreatetime(s);
        Integer res = dao.add(applications);
        Map<String, Integer> resMap = new HashMap();
        resMap.put("state", res);
        if (res > 0) {
            StringBuffer userSb = new StringBuffer();
            userSb.append("尊敬的");
            userSb.append(applications.getStuname());
            userSb.append(",您提交的众创空间预约申请已经成功提交，请您耐心等待审核结果。");
            MailUtils.sendMail(applications.getEmail(), "众创空间预约成功通知", userSb.toString());
            List<Admins> admins = adminsDao.list();

            admins.forEach(admin -> {
                StringBuffer adminSb = new StringBuffer();
                adminSb.append("尊敬的");
                adminSb.append(admin.getNickname());
                adminSb.append(",有一条新的众创空间预约申请待您审核。请您点击以下页面进入<a href='http://it.ouc.edu.cn/create/admin'>点我</a>");
                MailUtils.sendMail(admin.getEmail(), "一条新的众创空间预约申请待您审核", adminSb.toString());
            });
        }
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    @Override
    public String delete(Long id) {
        int res = dao.delete(id);
        Map<String, Integer> resMap = new HashMap();
        resMap.put("success", res);
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    @Override
    public String refuse(Long id) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd HH:mm");
        String s = sdf.format(date);
        int res = dao.refuse(id, s);
        if (res > 0) {
            Applications app = dao.get(id);
            StringBuffer sb = new StringBuffer();
            sb.append("尊敬的");
            sb.append(app.getStuname());
            sb.append(",您的众创空间预约申请没有通过审核，请尝试重新申请或者与信息学院团委联系。");
            MailUtils.sendMail(app.getEmail(), "众创空间预约审核未通过", sb.toString());
        }
        Map<String, Integer> resMap = new HashMap();
        resMap.put("success", res);
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    @Override
    public String agree(Long id) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd HH:mm");
        String s = sdf.format(date);
        int res = dao.agree(id, s);
        if (res > 0) {
            Applications app = dao.get(id);
            StringBuffer sb = new StringBuffer();
            sb.append("尊敬的");
            sb.append(app.getStuname());
            sb.append(",您的众创空间预约申请已经通过审核，请您按照规定时间使用，注意场地卫生，祝您愉快。");
            MailUtils.sendMail(app.getEmail(), "众创空间预约审核通过", sb.toString());
        }
        Map<String, Integer> resMap = new HashMap();
        resMap.put("success", res);
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    public String agreeCheck(Long id) {
        Applications app = dao.get(id);
        Long res = dao.getApplications(app.getApptime(), app.getState(), "已同意");
        Map<String, Object> resMap = new HashMap<>();
        resMap.put("count", res);
        String jsonString = JSON.toJSONString(resMap);
        return jsonString;
    }

    @Override
    public List<Applications> listAll(String type) {
        return dao.listAll(type);
    }

    @Override
    public void exportExcel(String type, HttpServletRequest req, HttpServletResponse resp) {
        try {
            //from表单提交，需要转码
            type = new String(type.getBytes("ISO8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<String> typeList = Arrays.asList("上午", "下午", "晚上");
        SimpleDateFormat sdf = new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        String[] objects = new String[]{"申请人", "申请标题", "申请内容", "联系邮箱", "联系电话", "申请时间段", "创建时间", "处理状态", "处理时间"};
        String[] title = new String[]{"stuname", "title", "body", "email", "mobile", "apptime", "createtime", "deal", "dealtime"};
        int[] ds_format = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        try {
            List<Applications> list = dao.listAll(type);
            List<Map<String, Object>> data = new ArrayList<>();

            for (Applications app : list) {
                Date date = new Date(app.getApptime() * 1000L);
                String s = sdf.format(date);

                Map<String, Object> map = new HashMap<>();
                BeanInfo beanInfo = Introspector.getBeanInfo(Applications.class, Object.class);
                PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
                for (PropertyDescriptor pd : pds) {
                    String name = pd.getName();
                    if ("apptime".equals(name)) {
                        map.put(name, s + " " + typeList.get(app.getState() - 1));
                    } else {
                        if (!"state".equals(name))
                            map.put(name, pd.getReadMethod().invoke(app));
                    }
                }
                data.add(map);
            }

            ExcelUtils.export("预约申请表", "预约申请表", objects, title, ds_format, null, data, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Applications get(Long id) {
        return dao.get(id);
    }


    @Override
    public String getApplicatios() {
        List<Map<String, Object>> resList = new ArrayList<>();
        Date begin = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(begin);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        begin = calendar.getTime();
        Long unixTimeStamp = begin.getTime() / 1000;
        for (int i = 0; i < 7; i++) {
            for (int j = 1; j <= 3; j++) {
                Map<String, Object> app = new HashMap<>();
                Long agree = dao.getApplications(unixTimeStamp, j, "已同意");
                if (agree > 0) {
                    app.put("status", 0);
                } else {
                    app.put("status", 1);
                    Long nosee = dao.getApplications(unixTimeStamp, j, "未审核");
                    app.put("count", nosee);
                }
                resList.add(app);
            }
            unixTimeStamp += 24 * 60 * 60;
        }
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("result", resList);
        return JSON.toJSONString(returnMap);
    }
}
