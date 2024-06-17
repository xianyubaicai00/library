package cool.leeson.library.controller.file;

import com.aliyuncs.utils.StringUtils;
import cool.leeson.library.exceptions.MyException;
import cool.leeson.library.util.ResMap;
import lombok.Setter;
import org.apache.commons.io.FileUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.util.UUID;

@RestController
@Setter
@Configuration
@ConfigurationProperties(prefix = "document")
@PropertySource("classpath:config/private-config.properties")
public class FileUploadController {
    @Resource
    private HttpServletRequest request;
    private HttpServletResponse response;

    private String uploadDir = "/upload";

    @RequestMapping("/upload")
    @ResponseBody
    public Object upload(@RequestBody MultipartFile file) throws Exception {//实现文件上传

        if (file.isEmpty()) {
            throw new Exception("上传文件不能为空");
        }
        String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        File path = new File(ResourceUtils.getURL("classpath:static").getPath());
        if (!path.exists()) {
            path = new File("");
        }
        File upload = new File(path.getAbsolutePath(), "src/main/resources/static/upload/");
        if (!upload.exists()) {
            upload.mkdirs();
        }
        String fileName = new Date().getTime() + "." + fileExt;
        File dest = new File(upload.getAbsolutePath() + "/" + fileName);
        file.transferTo(dest);
        FileUtils.copyFile(dest, new File("/Users/laohou/Downloads/图书馆座位预约/Library-Server/Library-Server/src/main/resources/static/upload" + "/" + fileName));
        return ResMap.ok("download/" + fileName);
    }

    public String saveFile(MultipartFile item) throws Exception {//将文件保存到本地
        File path = new File(uploadDir);
        if (!path.exists()) {//如果当前目录不存在
            path.mkdir();
        }
        String fileName = UUID.randomUUID().toString();
        String originalFilename = item.getOriginalFilename();
        int i = originalFilename.indexOf('.');
        if (i < 0) throw new MyException(MyException.STATUS.requestErr);
        fileName = fileName + originalFilename.substring(i);
        File file = new File(uploadDir + "/" + fileName);
        item.transferTo(file);//将此图像保存到file本地
        return "download/" + fileName;
    }
}
