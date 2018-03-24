package cn.ouctechnology.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Applications {
    private Long id;
    private String email;
    private String stuname;
    private Integer state;
    private String title;
    private String body;
    private String mobile;
    private String deal;
    private Long apptime;
    private String createtime;
    private String dealtime;
}
