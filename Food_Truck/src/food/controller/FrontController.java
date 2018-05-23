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
		// post����� ��� �ѱ� ���ڵ� ó��.
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("command");		// command ���� ������	// requestScope.list�� ���ؼ� ���� list�� ������ ���� ���
		map.get(key).execute(request, response);			// map���� Ű���� �޾ƿ´�. map�� ������Ƽ �׸��� excute �� ȣ���
	}

}
