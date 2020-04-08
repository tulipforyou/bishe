import com.sch.controller.userController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring-service.xml", "classpath:spring-mybatis.xml" })
public class BaseTest {
    @Test
    public void test1(){

    }
@Test
    public void fileUpload1(){
        //创建上传文件保存目录
        File file=new File("/sch");
        if(!file.exists()){
            boolean success=file.mkdirs();
            if(!success) {
                System.out.println("文件夹创建失败");
            }
        }
    }
}

