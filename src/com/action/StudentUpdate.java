package com.action;

import com.bean.StudentBean;
import com.dao.StudentDao;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


public class StudentUpdate extends ActionSupport {

	//下面是Action内用于封装用户请求参数的属性
	private String Student_ID;
	private StudentBean cnbean;
	public String getStudent_ID() {
		return Student_ID;
	}

	public void setStudent_ID(String studentID) {
		Student_ID = studentID;
	}

	public StudentBean getCnbean() {
		return cnbean;
	}

	public void setCnbean(StudentBean cnbean) {
		this.cnbean = cnbean;
	}

	//处理用户请求的execute方法
	public String execute() throws Exception {
		
		//解决乱码，用于页面输出
		HttpServletResponse response=null;
		response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		//创建session对象
		HttpSession session = ServletActionContext.getRequest().getSession();
		//验证是否正常登录
		if(session.getAttribute("id")==null){
			out.print("<script language='javascript'>alert('请重新登录！');window.location='Login.jsp';</script>");
			out.flush();out.close();return null;
		}
		
		//查询
		cnbean=new StudentDao().GetAllBean(Integer.parseInt(Student_ID));
		return SUCCESS;
		
	}
	
	//判断是否空值
	private boolean isInvalid(String value) {
		return (value == null || value.length() == 0);
	}
	
	//测试
	public static void main(String[] args) {
		System.out.println();
	}
	
}
