package food.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import food.model.dto.Truck;
import food.model.service.TruckService;

public class SelectTruckAction implements Action
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException 
	{
		String url = "errorView/error.jsp"; 	// ���н� ����ó��

		try
		{
			String title = request.getParameter("target_no");
			
			ArrayList<Truck> list = TruckService.selectAll(title);
			
			String[] truckno = new String[list.size()];
			String[] trucklat = new String[list.size()];
			String[] trucklong = new String[list.size()];
			String[] truckphoto = new String[list.size()];
			String[] locationlat = new String[list.size()];
			String[] locationlong = new String[list.size()];
			String[] truckname = new String[list.size()];
			/*String truck_lat = list.get(0).getTruck_lat();
			String truck_long = list.get(0).getTruck_long();*/

			int total = list.size();
			for(int index =0; index < total; index++)
			{
				truckno[index] = list.get(index).getTruck_no();
				trucklat[index] = list.get(index).getTruck_lat();
				trucklong[index] = list.get(index).getTruck_long();
				truckphoto[index] = list.get(index).getTruck_photo();
				locationlat[index] = list.get(index).getLocation_lat();
				locationlong[index] = list.get(index).getLocation_long();
				truckname[index] = list.get(index).getTruck_name();
			}
			// �˻��Ѵ� selectAll
			request.setAttribute("list", list);	
			request.setAttribute("truckno", truckno);
			request.setAttribute("trucklat", trucklat);
			request.setAttribute("trucklong", trucklong);			// ${}�ȿ� ���� �빮�ڷ� �ϸ� �ȵȴ�!!!!
			request.setAttribute("truckphoto", truckphoto);
			request.setAttribute("locationlat", locationlat);
			request.setAttribute("locationlong", locationlong);
			request.setAttribute("truckname", truckname);
			
			url = "list.jsp";				// ����!!!!!!!!!!!
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
