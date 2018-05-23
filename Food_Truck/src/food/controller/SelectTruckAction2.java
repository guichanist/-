package food.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import food.model.dto.Truck2;
import food.model.service.TruckService;

public class SelectTruckAction2 implements Action
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException 
	{
		String url = "errorView/error.jsp"; 	// ���н� ����ó��

		try
		{
			String title = request.getParameter("target_no");
			ArrayList<Truck2> list = TruckService.selectDetail(title);
			
			String truckname = list.get(0).getTruck_name();
			String trucklat = list.get(0).getTruck_lat();
			String trucklong = list.get(0).getTruck_long();
			String truckintro = list.get(0).getTruck_intro();
			String truckphoto = list.get(0).getTruck_photo();
	
			String[] menuname = new String[list.size()];
			String[] menuprice = new String[list.size()];
			String[] menuphoto = new String[list.size()];

			int total = list.size();
			for(int index =0; index < total; index++)
			{
				menuname[index] = list.get(index).getMenu_name();
				menuprice[index] = list.get(index).getMenu_price();
				menuphoto[index] = list.get(index).getMenu_photo();
			}
		
			
			// �˻��Ѵ� selectAll
			request.setAttribute("list", list);	
			request.setAttribute("truckname", truckname);
			request.setAttribute("trucklat", trucklat);
			request.setAttribute("trucklong", trucklong);
			request.setAttribute("truckintro", truckintro);
			request.setAttribute("truckphoto", truckphoto);
			request.setAttribute("menuname", menuname);
			request.setAttribute("menuprice", menuprice);
			request.setAttribute("menuphoto", menuphoto);
			
			System.out.println(list.size());

			url = "detail.jsp";				// ����!!!!!!!!!!!
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();								   // �ֿܼ� ���� ��� 
			request.setAttribute("errorMsg", e.getMessage());      // ���������� error �޼��� �޾ƿ���
		}
		
		RequestDispatcher view = request.getRequestDispatcher(url);
        view.forward(request, respone); 						   //���� ������ ���� ������ forward ����
		
		
	}
		
}
