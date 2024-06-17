package cool.leeson.library.entity.library;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SchoolNotification implements Serializable {
    private static final long serialVersionUID = -26626992453291970L;

    private String notificationId;

    @NotBlank(message = "schoolId 不能为空")
    private String schoolId;

    private String userId;
    private String nickName;

    @NotBlank(message = "title 不能为空")
    private String title;

    @NotBlank(message = "context 不能为空")
    private String context;

    private Integer view;
    private Date date; // 日期精确到秒

    private String formattedDate; // 用于存储格式化后的日期

    // 其他字段和方法...
}
