import org.junit.Test;

import java.io.*;
import java.util.*;

/*
@author 孙朝辉
@createTime 2020-03-22
@packName PACKAGE_NAME
@sys 25243
@project bs
*/
public class zstp {
    public Map<String, String> ZSTP() throws IOException {
        BufferedReader bufferedReader=new BufferedReader(new FileReader(new File("data//dataStructure.txt")));
        String s=null;
        List<String> list=new ArrayList<>();
        Map<String,String> map=new LinkedHashMap<>();
        while((s=bufferedReader.readLine())!=null){
            list.add(s);  //读取每一行数据
        }

        map.put("title",list.get(0));

        for (int i=1;i<list.size();i++) {
            String head= list.get(i).split(" ")[0];
            StringBuilder body = new StringBuilder(" ");
            for(int j=1;j<list.get(i).split(" ").length;j++){
                body.append(list.get(i).split(" ")[j]);
                body.append(" ");
            }
            //对head进行去空格(全角和半角空格)
            head = head.trim();
            while (head.startsWith("　")) {
                head = head.substring(1, head.length()).trim();
            }
            while (head.endsWith("　")) {
                head = head.substring(0, head.length() - 1).trim();
            }

            map.put(head, body.toString());
        }

        return map;
    }
    @Test
    public void test() throws IOException {
        Map<String, String> zstp = ZSTP();
        Set<Map.Entry<String, String>> entries = zstp.entrySet();
        for (Map.Entry<String, String> entry : entries) {
            System.out.println(entry.getKey().length());
        }
    }
}
