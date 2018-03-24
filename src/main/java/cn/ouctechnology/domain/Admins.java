package cn.ouctechnology.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Admins {
    private Long id;
    private String account;
    private String password;
    private String email;
    private String nickname;
    private Integer adminClass;
}
