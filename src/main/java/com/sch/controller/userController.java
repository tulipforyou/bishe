package com.sch.controller;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.sch.model.uploadExercise;
import com.sch.service.uploadExerciseServiceImpl;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sch.model.user;
import com.sch.service.courseServiceImpl;
import com.sch.service.userServiceImpl;

import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author sch
 */
@Controller
@SessionAttributes(value = {"hasLogin","userType","userId"})
public class userController {
	@Autowired
	private userServiceImpl ss;

	@Autowired
	private uploadExerciseServiceImpl ues;

	@Autowired
	private courseServiceImpl cs;

	@RequestMapping("/record")
	@ResponseBody
	public String login(String name, String no, String password, HttpServletRequest req, Model model)
			throws Exception {
		int r=ss.login(name, no,password);
		Map<String,String> data=new HashMap<String,String>();

		if(r==0){
			data.put("result", "UserNotFount");
		}else if(r==1){
			user u=ss.queryByid(no, name);
			HttpSession session=req.getSession();
			session.setAttribute("uno",u.getUno());
			session.setAttribute("name", u.getName());

			data.put("name", u.getName());
			data.put("type", u.getFlag());
			data.put("result", "LoginSuccess");
			model.addAttribute("hasLogin",u.getName()); //传到request域
			model.addAttribute("userType",u.getFlag()); //传到request域
			model.addAttribute("userId",u.getNo()); //传到request域
			//System.out.println("fghdfhshfhRH     "+u.getFlag());
			//System.out.println("dfgdsfbdSB   "+model.getAttribute("hasLogin"));
		}else{
			data.put("result", "PasswordError");
		}
		JSONObject json= JSONObject.fromObject(data);
		System.out.println(json);
		return json.toString();

	}


	@RequestMapping("/register")
	@ResponseBody
	public String login(user u)throws Exception{
		System.out.println(u.getEmail());
		System.out.println(u.getFlag());
		System.out.println("学校："+u.getShool());
		String result;
		if(ss.addUser(u)==1){
			result="RegisterSuccess";
			if("1".equals(u.getFlag())){
				System.out.println(u.getFlag());
				user temp=ss.queryByid(u.getNo(), u.getName());
				cs.insertCourse(temp);
			}
		}else{
			result="RegisterError";
		}
		return "\""+result+"\"";
	}

	@RequestMapping("/quit")
	public String quit(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "redirect:/index";
	}


	/**
	 * 	注意：upload名字要和表单里文件选择框的name一样，不一样springMVC无法自动封装
	 */
	@RequestMapping(path = "/wm_upload")
	public String fileUpload1(HttpServletRequest request, MultipartFile upload,Model model){
		//创建上传文件保存目录
		String path=request.getSession().getServletContext().getRealPath("/upload/");
		File file=new File(path);
		if(!file.exists()){
			boolean success=file.mkdirs();
			if(!success) {
				System.out.println("文件夹创建失败");
			}
		}
		//获取文件名字
		String fileName=upload.getOriginalFilename();
		if(fileName==null){
			fileName="null.txt";
		}
		String uuid= UUID.randomUUID().toString().replace("-","");
		fileName=uuid+fileName;
		//上传文件
		try {
			//将文件上传到path
			upload.transferTo(new File(path,fileName));
		} catch (IOException e) {
			System.out.println("wm文件上传失败");
		}

		//文件數據處理
		Map<String,List<String>> map=new LinkedHashMap<>();

		try {
			BufferedReader bufferedReader=new BufferedReader(new FileReader(path+fileName));
			String str=null;
			int i=0;
			while((str=bufferedReader.readLine())!=null){
				List<String> list=new ArrayList<>();
				i++;
				char[] chars = str.toCharArray();
				for (char aChar : chars) {
					list.add(String.valueOf(aChar));
				}
				map.put("student_"+i,list);
			}

		} catch (IOException e) {
			System.out.println("*-*-*/*//*/*/-*/-*wm---------->出錯了");
			e.printStackTrace();
		}

		Set<Map.Entry<String, List<String>>> entries = map.entrySet();
		for (Map.Entry<String, List<String>> entry : entries) {
			System.out.println(entry.getKey()+":"+entry.getValue());
		}


		model.addAttribute("resultMap",map);
		return "wm";
	}

	/**
	 * 	注意：upload名字要和表单里文件选择框的name一样，不一样springMVC无法自动封装
	 */
	@RequestMapping(path = "/yhc_upload")
	public String fileUpload2(HttpServletRequest request, MultipartFile upload,Model model){
		//创建上传文件保存目录
		String path=request.getSession().getServletContext().getRealPath("/upload/");
		File file=new File(path);
		if(!file.exists()){
			boolean success=file.mkdirs();
			if(!success) {
				System.out.println("yhc文件夹创建失败");
			}
		}
		//获取文件名字
		String fileName=upload.getOriginalFilename();
		if(fileName==null){
			fileName="null.txt";
		}
		String uuid= UUID.randomUUID().toString().replace("-","");
		fileName=uuid+fileName;
		//上传文件
		try {
			//将文件上传到path
			upload.transferTo(new File(path,fileName));
		} catch (IOException e) {
			System.out.println("文件上传失败");
		}
		System.out.println("***********************************************************"+fileName);

		//文件數據處理
		String jsonStr = "";
		Map<String, Map<String,String>> resultMap=new LinkedHashMap<>();

		try {
			File jsonFile = new File(path+fileName);
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
			com.alibaba.fastjson.JSONObject jobj = com.alibaba.fastjson.JSON.parseObject(jsonStr);

			for (int i = 0; i < jobj.size(); i++) {
				Map<String,String> supportMap=new LinkedHashMap<>();
				com.alibaba.fastjson.JSONObject jsonObject = (com.alibaba.fastjson.JSONObject) jobj.get(Integer.toString(i));
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
		model.addAttribute("resultMap",resultMap);
		return "yhc";
	}

	/**
	 * intelligentAnalysis ：认知诊断部分展示
	 */
	@RequestMapping(path = "intelligentAnalysis")
	public String intelligentAnalysis(){
		return "wm";
	}


	/**
	 * 个性推荐
	 */
	@RequestMapping(path = "peculiarityRecommend")
	public ModelAndView peculiarityRecommend(HttpServletRequest request){
		Integer userId = Integer.parseInt((String)request.getSession().getAttribute("userId"));
		System.out.println("----------------------"+userId);
		List<uploadExercise> uploadExercises = ues.peculiarityRecommendByUserId(userId);
		//分类型计数
		Map<String,Integer> typeCount=new HashMap<>();
		for (uploadExercise uploadExercise : uploadExercises) {
			if("answerIsWrong".equals(uploadExercise.getStudentAnswerCheck())){
				if(typeCount.containsKey(uploadExercise.getExerciseType())){
					typeCount.put(uploadExercise.getExerciseType(),
							typeCount.get(uploadExercise.getExerciseType()) +1);
				}else{
					typeCount.put(uploadExercise.getExerciseType(),1);
				}
			}
		}

		//习题推送判断
		Set<Map.Entry<String, Integer>> entries = typeCount.entrySet();
		//存储推送的习题
		Map<String,List<uploadExercise>> exercises=new HashMap<>();

		for (Map.Entry<String, Integer> entry : entries) {
			//同类型题错的次数大于4就推送这一类型的题目
			if(entry.getValue()>=1){
				exercises.put(entry.getKey(),ues.findExerciseByType(entry.getKey()));
			}
		}

		ModelAndView mav=new ModelAndView("peculiarityRecommend");
		mav.addObject("exercises",exercises);
		return mav;
	}

	/**
	 * 知识图谱展示
	 */
	@RequestMapping(path = "/zstp")
	public String fileUpload3(HttpServletRequest request, MultipartFile upload,Model model) throws IOException {
		//创建上传文件保存目录
		String path=request.getSession().getServletContext().getRealPath("/upload/zstp/");
		File file=new File(path);
		if(!file.exists()){
			boolean success=file.mkdirs();
			if(!success) {
				System.out.println("知识图谱文件夹创建失败");
			}
		}
		//获取文件名字
		String fileName=upload.getOriginalFilename();
		if(fileName==null){
			fileName="null.txt";
		}
		String uuid= UUID.randomUUID().toString().replace("-","");
		fileName=uuid+fileName;
		//上传文件
		try {
			//将文件上传到path
			upload.transferTo(new File(path,fileName));
		} catch (IOException e) {
			System.out.println("知识图谱文件夹创建失败");
		}
		System.out.println("***********************************************************"+fileName);

		BufferedReader bufferedReader = new BufferedReader(new FileReader(new File(path+fileName)));
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

		model.addAttribute("zstp",map);

//		Set<Map.Entry<String, String>> entries = map.entrySet();
//		for (Map.Entry<String, String> entry : entries) {
//			System.out.println(entry.getKey()+":"+entry.getValue());
//		}

		return "zstp";
	}
}
