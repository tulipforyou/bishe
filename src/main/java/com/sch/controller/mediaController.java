package com.sch.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sch.model.*;
import com.sch.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mediaController {
	@Autowired
	private mediaServiceImpl ms;


	@Autowired
	private userServiceImpl us;

	@Autowired
	private wordsServiceImpl ws;

	@Autowired
	private chooseServiceImpl cs;

	@Autowired
	private courseServiceImpl ks;

	@Autowired
	private replyServiceImpl rs;

	@Autowired
	private uploadExerciseServiceImpl ues;

	@RequestMapping("/ToUploadFiles")
	@ResponseBody
	public Integer addUser(@RequestParam("files") MultipartFile[] files, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String name = "";
		int uno = 0;
		if (session != null) {
			String str = session.getAttribute("name").toString();
			if (str != null) {
				name = str;
			}
		}
		System.out.println("进来了");
		String title = request.getParameter("title");
		String descript = request.getParameter("descript");
		String uptime = request.getParameter("uptime");
		String src[] = new String[files.length];
		System.out.println(files[0].getOriginalFilename());
		System.out.println(files[1].getOriginalFilename());
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				try {
					request.setCharacterEncoding("utf-8");
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				response.setContentType("text/html;charset=utf-8");
				response.addHeader("Access-Control-Allow-Origin", "*");
				response.addHeader("Access-Control-Allow-Methods", "GET,POST");
				String originalFilename = null;
				try {
					if (file.isEmpty()) {
						return 0;

					} else {
						originalFilename = file.getOriginalFilename();
						long size = file.getSize();
						String contentType = file.getContentType();
						System.out.println("原始文件全路径名：" + originalFilename);
						System.out.println("文件大小：" + size + "KB");
						System.out.println("文件类型：" + contentType);
						System.out.println("=====================");
					}

					String root = request.getServletContext().getRealPath("/upload/media");
					String filename = file.getOriginalFilename();

					int index = filename.lastIndexOf("\\");
					if (index != -1) {
						filename = filename.substring(index + 1);
						System.out.println(filename);
					}

					String savename = UUID.randomUUID() + "-" + filename;
					src[i] = savename;
					System.out.println(src[i]);
//				int hCode=filename.hashCode();
//				String hex=Integer.toHexString(hCode);
//				
//				File dirFile=new File(root,hex.charAt(0)+"/"+hex.charAt(1));
//				dirFile.mkdirs();

					File dirFile = new File(root);

					File destFile = new File(dirFile, savename);
					String courseFile = destFile.getCanonicalPath();

					file.transferTo(destFile);

				} catch (Exception e) {
					e.printStackTrace();
					return 0;
				}


			}
			media media = new media(title, name, src[0], src[1], descript, uptime);
			ms.insertMedia(media);
		}
		return 1;


	}

	@RequestMapping(path = "/findMediaByName")
	public ModelAndView findMediaByName(HttpServletRequest req, String mediaName) {
		media media = ms.selectByTitle(mediaName);
		System.out.println("******************"+media);
		return showcourse(req, media);
	}

	@RequestMapping("/playMedia")
	public ModelAndView re() {
		ModelAndView mav=new ModelAndView( "findMediaByName");
		List<media> allTitles=ms.findAllTitles();
		mav.addObject("allTitles",allTitles);
		return mav;
	}

	public ModelAndView showcourse(HttpServletRequest req, media media) {
		ModelAndView mv = null;
		try {
			HttpSession session = req.getSession(false);
			//media media=null;
			List<words> words_list = new ArrayList<words>();
			List<reply> reply_list = new ArrayList<reply>();
			String name = "";
			if (session != null) {
				String str = session.getAttribute("uno").toString();
				if (str != null) {
					int uno = Integer.parseInt(str);

					user u = us.queryByUno(uno);

					String flag = u.getFlag();
					System.out.println(flag);
					if ("2".equals(flag)) {
						int cno = cs.queryByUno(uno).getCourse().getCno();
						name = ks.queryByNo(cno).getUser().getName();
						System.out.println(name);
					} else {
						name = us.queryByUno(uno).getName();
					}

					words_list = ws.selectByMedia(media.getId());

					reply_list = new ArrayList<reply>();
					for (words words : words_list) {
						List<reply> reply_list_temp = rs.selectByWords(words.getId(), words.getMedia_id());
						reply_list.addAll(reply_list_temp);

					}
				}
			}

			mv = new ModelAndView("playMedia");
			mv.addObject("media", media);
			mv.addObject("words_list", words_list);
			mv.addObject("reply_list", reply_list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("/saveWords")
	@ResponseBody
	public String saveWords(words words) {
		System.out.println("进来了");
		System.out.println(words.getName() + " " + words.getContent() + " ");
		if (words != null) {
			ws.insertWords(words);
		}
		return "\"" + "LeaveMessageSuccess！" + "\"";

	}

	@RequestMapping("/saveReply")
	@ResponseBody
	public String saveReply(reply reply) {
		System.out.println("进来了");
		System.out.println(reply.getName() + " " + reply.getContent() + " ");
		if (reply != null) {
			rs.insertReply(reply);
		}
		return "\"" + "ReplySuccess！" + "\"";

	}

	@RequestMapping(path = "/teacherUploadExercise")
	public String teacherUploadExercise(uploadExercise uploadExercise) {
		if (uploadExercise != null) {
			ues.insertUploadExercise(uploadExercise);
		}
		return "teacher";
	}

	@RequestMapping(path = "/managerExercise")
	public ModelAndView managerExercise() {
		List<uploadExercise> uploadExercises = ues.findAll1();
		ModelAndView mav = new ModelAndView("managerExercise");
		mav.addObject("allExercise", uploadExercises);
		return mav;
	}

	@RequestMapping(path = "/deleteExercise")
	@ResponseBody
	public String deleteExercise(@RequestBody String data) {
		System.out.println(data);
		JSONArray jsonArr = JSONArray.fromObject(data);
		System.out.println(jsonArr);
		for (Object o : jsonArr) {
			String temp = o.toString();
			int no = Integer.parseInt(temp);
			ues.deleteById(no);
		}
		//直接返回json数组对象
		return "\"" + "effectSuccess" + "\"";
	}


	@RequestMapping(path = "/doExercise")
	public ModelAndView doExercise(HttpServletRequest request) {

		List<uploadExercise> uploadExercises = ues.findAll1();
		ModelAndView mav = new ModelAndView("doExercise");
		mav.addObject("allExercise", uploadExercises);
		return mav;
	}

	@RequestMapping(path = "/showMyExercises")
	public ModelAndView showMyExercises(HttpServletRequest request) {
		int studentId= Integer.parseInt((String) request.getSession().getAttribute("userId"));
		System.out.println("学生ID============="+studentId);

		List<uploadExercise> uploadExercises = ues.findAll(studentId);
		ModelAndView mav = new ModelAndView("showMyExercises");
		mav.addObject("showMyExercises", uploadExercises);
		return mav;
	}

	@RequestMapping(path = "/checkAnswer")
	public ModelAndView checkAnswer(@RequestBody String studentAnswer,HttpServletRequest request) {
		Map<Integer,String> answers=new HashMap<>();

		int studentId= Integer.parseInt((String) request.getSession().getAttribute("userId"));
		System.out.println("学生ID============="+studentId);


		String[] strings1 = studentAnswer.split("&");
		List<String> strings=new ArrayList<>();
		for (String string : strings1) {
			if(!"studentAnswer=".equals(string)) {
				System.out.println(string);
				strings.add(string);
			}
		}

		int answerLength=strings.size()/2;
		for (int i = 0; i < answerLength; i++) {

			String[] split = strings.get(i).split("=");
			String[] split1 = strings.get(i+answerLength).split("=");

			int key = 0;
			String value=null;

			if("checkbox".equals(split[0])){
				key=Integer.parseInt(split[1]);
			}
			if("checkbox".equals(split1[0])){
				key=Integer.parseInt(split1[1]);
			}
			if("studentAnswer".equals(split[0])){
				value=split1[1];
			}
			if("studentAnswer".equals(split1[0])){
				value=split1[1];
			}

			answers.put(key,value);
		}

		for (Integer integer : answers.keySet()) {
			System.out.println(integer+":"+answers.get(integer));
			//正确答案
			String correctAnswer=ues.findAnswerById(integer);
			if(correctAnswer.equals(answers.get(integer))){
				ues.updateStudentAnswerCheck(integer,"answerIsRight",studentId,answers.get(integer));
			}else{
				ues.updateStudentAnswerCheck(integer,"answerIsWrong",studentId,answers.get(integer));
			}
		}
		List<uploadExercise> checkAnswers=ues.findAll(studentId);

		ModelAndView mav=new ModelAndView();
		mav.addObject("studentAnswersHasChecked",checkAnswers);
		mav.setViewName("reviewMyAnswers");
		return mav;
	}

	@RequestMapping(path = "/lookStudentAnswers")
	public ModelAndView lookStudentAnswers() {
		List<uploadExercise> uploadExercises = ues.findAll1();
		ModelAndView mav = new ModelAndView("lookStudentAnswers");
		mav.addObject("studentAnswers", uploadExercises);
		return mav;
	}
}
