package cn.ouctechnology.test;


import cn.ouctechnology.dao.IApplicationsDao;
import cn.ouctechnology.domain.Applications;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BaseTest {
    @Autowired
    private IApplicationsDao dao;
    @Test
    public void testMail(){
        List<Applications> list = dao.listAll("全部");
        list.forEach(l-> System.out.println(l));
    }
}
