package cn.ouctechnology.service;

import cn.ouctechnology.domain.Applications;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ApplicationsService {
    String list(int page, int limit, String type);

    String add(Applications dir);

    String delete(Long id);

    String refuse(Long id);

    String agree(Long id);

    Applications get(Long id);

    String getApplicatios();

    String agreeCheck(Long id);

    List<Applications> listAll(String type);

    void exportExcel(String type, HttpServletRequest req, HttpServletResponse resp);

}
