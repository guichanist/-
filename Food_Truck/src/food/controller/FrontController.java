package food.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/tru")
public class FrontController extends HttpServlet 
{
	HashMap<String, Action> map;


	public void init(ServletConfig config) throws ServletException 
	{
		map = (HashMap<String, Action>)config.getServletContext().getAttribute("map");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// post방식인 경우 한글 인코딩 처리.
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("command");		// command 값을 받으면	// requestScope.list를 위해서 값을 list로 넣으면 값을 사용
		map.get(key).execute(request, response);			// map에서 키값을 받아온다. map은 프로펄티 그리고 excute 가 호출됨
	}

}
