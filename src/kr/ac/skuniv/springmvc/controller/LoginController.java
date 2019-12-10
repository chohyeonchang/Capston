package kr.ac.skuniv.springmvc.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.skuniv.springmvc.dto.History;
import kr.ac.skuniv.springmvc.dto.Member;
import kr.ac.skuniv.springmvc.service.HistoryService;
import kr.ac.skuniv.springmvc.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService memberservice;
	
	@Autowired
	HistoryService historyservice;
	HttpSession session;

	@RequestMapping("/logincheck")
	public String logincheck(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		boolean check = memberservice.loginCheck(id, password);
		
		if (check == true) {
			session = request.getSession();
			session.setAttribute("login", id);
			return "redirect:/hello";
		} else
			return "redirect:/";
	}

	@RequestMapping("/logout")
	public String logout(){
		try {
			session.invalidate();
		}catch(Exception e) {
			return "redirect:/";
			}
			return "redirect:/";
	}

	@RequestMapping("/update")
	public String update(HttpServletRequest request,  Model model) {
		session = request.getSession();
		String id="";
		id = (String)session.getAttribute("login");
		if(id==null || id.equals("")) {
			return "redirect:/";
		}
		
		model.addAttribute("id", id);
		
		Member member = memberservice.getMember(id);
		model.addAttribute("member",member);
		
		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);
		
		return "updateForm";
	}
	
	@RequestMapping("/updatecheck")
	public void updateCheck(HttpServletRequest request,  Model model,  HttpServletResponse response) throws Exception {
		session = request.getSession();
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter script = response.getWriter();
		String id="";
		id = (String)session.getAttribute("login");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if (name.equals("") || name.equals(null) || email.equals("")
				|| email.equals(null) || password.equals("") || password.equals(null)) {
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			memberservice.updateMember(name, email, password, id);
			script.println("<script>");
			script.println("alert('회원정보가 수정되었습니다.')");
			script.println("history.go(-2)");
			script.println("</script>");
		}
		
		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);
	}

	@RequestMapping("/register")
	public String resgister(HttpServletRequest request) {
		return "registerForm";
	}

	@RequestMapping("/memberInsert")
	public void memberInsert(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter script = response.getWriter();
		List<Member> idlist = memberservice.getId();
		int result = 0;
		for (int i = 0; i < idlist.size(); i++) {
			if (id.equals(idlist.get(i).getId())) {
				result = -1;
			}
		}
		if (id.equals("") || id.equals(null) || name.equals("") || name.equals(null) || email.equals("")
				|| email.equals(null) || password.equals("") || password.equals(null)) {
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}

		else if (result == -1) {
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			memberservice.insertMember(id, name, email, password);
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("history.go(-2)");
			script.println("</script>");
		}

	}

}
