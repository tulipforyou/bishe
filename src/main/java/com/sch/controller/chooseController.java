package com.sch.controller;




import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sch.model.choose;
import com.sch.model.course;
import com.sch.model.grade;
import com.sch.model.grade1;
import com.sch.model.image;
import com.sch.model.user;
import com.sch.service.chooseServiceImpl;
import com.sch.service.courseServiceImpl;
import com.sch.service.userServiceImpl;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@Scope("session")
public class chooseController {
	private List<grade1> Grade;

	@PostConstruct
	public void init(){
		Grade = new ArrayList<grade1>();
	}

	@Autowired
	private chooseServiceImpl csi;
	@Autowired
	private courseServiceImpl cs;
	@Autowired
	private userServiceImpl us;
	@RequestMapping("/choose")
	public ModelAndView showcourse(HttpServletRequest req) {
		ModelAndView mv = null;
		try {
			HttpSession session=req.getSession(false);
			choose mychoose=null;
			user teacher=null;
			if(session!=null){
				String str=session.getAttribute("uno").toString();
				System.out.println(str);
				if(str!=null){
					int uno=Integer.parseInt(str);
					mychoose=csi.queryByUno(uno);
					System.out.println(mychoose);
					System.out.println("1111111"+mychoose.getCourse());
					System.out.println("2222222"+mychoose.getCourse().getCno());
					course k=cs.queryByNo(mychoose.getCourse().getCno());
					teacher=us.queryByUno(k.getUser().getUno());
				}
			}

			mv = new ModelAndView("choose");
			mv.addObject("data", mychoose);
			mv.addObject("teacher", teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}
	@RequestMapping("/grade1")
	public ModelAndView teacher_choose(HttpServletRequest req) throws Exception{
		ModelAndView mv;

		HttpSession session=req.getSession(false);
		ArrayList<choose> myteach=new ArrayList<choose> ();
		if(session!=null){
			String str=session.getAttribute("uno").toString();

			if(str!=null){
				int uno=Integer.parseUnsignedInt(str);

				course c=cs.queryByUno(uno);
				myteach=csi.queryByCno(c.getCno());

			}
		}

		mv = new ModelAndView("grade1");
		mv.addObject("data", myteach);


		return mv;

	}


//	@RequestMapping("/AddGrade")
//	@ResponseBody
//	public JSONArray toUpdateGrade(@RequestBody List<grade> students) {
//		int len=students.size();
//		for(int i=0;i<len;i++){
//			System.out.println(students.get(i).getNo()+" "+students.get(i).getGrade());
//			csi.updateChoose_teacher(students.get(i).getNo(),students.get(i).getGrade());
//		}
//		List<choose> grade=new ArrayList<choose>();
//		grade=csi.queryAll();
//		JSONArray array = new JSONArray();
//		if(grade!= null && grade.size()>0) {
//			for (choose dept : grade) {
//				JSONObject obj = new JSONObject();
//				obj.put("grade", dept.getGrade());
//				array.add(obj);
//			}
//		}
//		return array;//直接返回json数组对象
//	}


	@RequestMapping("/controller1")
	@ResponseBody
	public String toUpdateGrade(@RequestBody String data) {
		System.out.println(data);
		JSONArray jsonArr=JSONArray.fromObject(data);
		System.out.println(jsonArr);
		for (Object o : jsonArr) {
			String temp = o.toString();
			int no = Integer.parseInt(temp);
			csi.deleteChooseNo(no);
		}
		//直接返回json数组对象
		return "\""+"effectSuccess"+"\"";
	}

	@RequestMapping("/grade2")
	public ModelAndView grade1(HttpServletRequest req) throws Exception{
		ModelAndView mv = null;

		HttpSession session=req.getSession(false);
		ArrayList<choose> myteach=new ArrayList<choose> ();
		if(session!=null){
			String str=session.getAttribute("uno").toString();

			if(str!=null){
				int uno=Integer.parseUnsignedInt(str);

				course c=cs.queryByUno(uno);
				myteach=csi.queryByCno(c.getCno());

			}
		}

		mv = new ModelAndView("grade2");
		mv.addObject("data", myteach);


		return mv;

	}

	@RequestMapping("/Controller2")
	@ResponseBody
	public  String gradeOne(@RequestBody List<grade1> gradeAll) {
		int len=gradeAll.size();
		int result[]=new int[len];
		for(int i=0;i<len;i++){
			result[i]=gradeAll.get(i).getGrade1()+gradeAll.get(i).getGrade2()+gradeAll.get(i).getGrade3();
			grade1 g=new grade1(gradeAll.get(i).getGrade1(),gradeAll.get(i).getGrade2(),gradeAll.get(i).getGrade3());
			Grade.add(g);
		}
//		JSONObject obj=new JSONObject();
//		obj.put("result", result);
		//直接返回json数组对象
		return "\""+"effectSuccess"+"\"";
	}


	@RequestMapping("/grade3")
	public ModelAndView Controller3(HttpServletRequest req) {
		ModelAndView mv = null;

		HttpSession session=req.getSession(false);
		ArrayList<choose> myteach;
		ArrayList<choose> myteach1=new ArrayList<choose> ();
		if(session!=null){
			String str=session.getAttribute("uno").toString();

			if(str!=null){
				int uno=Integer.parseUnsignedInt(str);

				System.out.println("Grade3的uno= "+uno);

				course c=cs.queryByUno(uno);
				System.out.println("Grade3的course= "+c);

				myteach=csi.queryByCno(c.getCno());
				System.out.println("Grade3的myteach= "+myteach);

				for(int i=0;i<myteach.size();i++){
					int temp= Grade.get(i).getGrade1()+Grade.get(i).getGrade2()+Grade.get(i).getGrade3();
					csi.updateChoose_teacher(myteach.get(i).getNo(), temp);
				}
				myteach1=csi.queryByCno(c.getCno());

			}
		}

		System.out.println("***********************"+myteach1);
		System.out.println("***********************"+Grade);

		mv = new ModelAndView("grade3");
		mv.addObject("data", myteach1);
		mv.addObject("grade", Grade);
		return mv;

	}

	@RequestMapping("/grade4")
	public ModelAndView Controller4(HttpServletRequest req) {
		ModelAndView mv = null;

		HttpSession session=req.getSession(false);
		ArrayList<choose> myteach=new ArrayList<choose> ();
		if(session!=null){
			String str=session.getAttribute("uno").toString();

			if(str!=null){
				int uno=Integer.parseUnsignedInt(str);

				course c=cs.queryByUno(uno);
				myteach=csi.queryByGrade(c.getCno());

			}
		}

		mv = new ModelAndView("grade4");
		mv.addObject("data", myteach);
		return mv;

	}


//
//	@RequestMapping("/choose")
//	public ModelAndView showAllcourse() {
//		ModelAndView mv = null;
//		try {
//			ArrayList<choose> choose=csi.queryAll();
//			ArrayList<user> teacher=new ArrayList<user> ();
//			for(choose c:choose){
//				course k=cs.queryByNo(c.getCourse().getCno());
//				user u=us.queryByUno(k.getUser().getUno());
//				teacher.add(u);
//				System.out.println(u.getName());
//			}
//			mv = new ModelAndView("choose");
//			mv.addObject("data", choose);
//			mv.addObject("teacher", teacher);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mv;
//
//	}


}
