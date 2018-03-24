package cn.ouctechnology.dao;

import cn.ouctechnology.domain.Applications;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IApplicationsDao {

    List<Applications> list(@Param("page") int page, @Param("limit") int limit, @Param("type") String type);

    Integer add(Applications applications);

    Long count(@Param("type") String type);

    int delete(Long id);

    int refuse(@Param("id") Long id, @Param("dealtime") String dealtime);

    int agree(@Param("id") Long id, @Param("dealtime") String dealtime);

    Applications get(Long id);

    Long getApplications(@Param("time") Long time, @Param("state") int end, @Param("type") String type);

    List<Applications> listAll(@Param("type") String type);

}
