
/*
 *  @Author SunChanHui
 *  @Create Time 2020-04-26
 * @PackName PACKAGE_NAME
 * @Project bishe
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import jdk.nashorn.internal.ir.CallNode;
import org.junit.Test;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;


public class test {
    @Test
    public void test01(){
        //文件數據處理
        String jsonStr = "";
        try {

            File jsonFile = new File("data/gammajs.json");
            FileReader fileReader = new FileReader(jsonFile);

            Reader reader = new InputStreamReader(new FileInputStream(jsonFile), StandardCharsets.UTF_8);
            int ch = 0;
            StringBuilder sb = new StringBuilder();
            while ((ch = reader.read()) != -1) {
                sb.append((char) ch);
            }
            fileReader.close();
            reader.close();
            jsonStr = sb.toString();
            JSONObject jobj = JSON.parseObject(jsonStr);

            Map<String, Map<String,String>> resultMap=new LinkedHashMap<>();
            Map<String,String> supportMap=new LinkedHashMap<>();

            for (int i = 0; i < jobj.size(); i++) {
                JSONObject jsonObject = (JSONObject) jobj.get(Integer.toString(i));
                System.out.println(jsonObject.get("0"));
                System.out.println(jsonObject.get("1"));
                System.out.println("----------------------------");
                //结果存入map
                supportMap.put("0",jsonObject.get("0").toString());
                supportMap.put("1",jsonObject.get("1").toString());
                resultMap.put(Integer.toString(i),supportMap);
            }

            Set<Map.Entry<String, Map<String, String>>> entries = resultMap.entrySet();
            for (Map.Entry<String, Map<String, String>> entry : entries) {
                System.out.println(entry.getKey() + ":");
                for (Map.Entry<String, String> stringStringEntry : entry.getValue().entrySet()) {
                    System.out.println(stringStringEntry);
                }
            }


        } catch (IOException e) {
            System.out.println("*-*-*/*//*/*/-*/-*yhc---------->出錯了");
            e.printStackTrace();
        }
    }
    @Test
    public void test02(){
        System.out.println(002==2);
    }
}
