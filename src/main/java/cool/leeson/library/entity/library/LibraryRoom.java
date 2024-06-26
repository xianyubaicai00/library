package cool.leeson.library.entity.library;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.time.LocalTime;
import java.io.Serializable;
import java.util.List;

/**
 * (LibraryRoom)实体类
 *
 * @author Leeson0202
 * @since 2024-03-11 02:02:35
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LibraryRoom implements Serializable {
    private static final long serialVersionUID = 458821484453473103L;
    /**
     * 图书室id
     */
    private String roomId;
    /**
     * 图书馆Id
     */
    @NotBlank(message = "libraryId 不能为空")
    private String libraryId;
    /**
     * 图书室名字
     */
    @NotBlank(message = "名字 不能为空")
    private String name;
    /**
     * 图书室描述
     */
    private String descs;
    /**
     * 座位数量
     */
    private Integer seatNum;
    // 椅子
    private List<LibrarySeat> librarySeats;
    // 桌子
    private List<LibraryTable> libraryTables;

}

