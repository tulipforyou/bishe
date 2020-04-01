package com.sch.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sch.model.user;
import com.sch.service.courseServiceImpl;
import com.sch.service.userServiceImpl;

import net.sf.json.JSONObject;
import org.springframework.web.bind.support.SessionStatus;


@Controller
@SessionAttributes(value = {"hasLogin","userType","userId"})
public class userController {
	@Autowired
	private userServiceImpl ss;

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
		JSONObject json=JSONObject.fromObject(data);
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
		return "index";
	}

}
