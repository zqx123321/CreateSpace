package cn.ouctechnology.dao;

import cn.ouctechnology.domain.Admins;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAdminsDao {

    Admins selectByAccount(String account);

    List<Admins> list();

    Integer changePwd(@Param("pwd") String pwd, @Param("id") Long id);

    Integer add(Admins admins);

}
