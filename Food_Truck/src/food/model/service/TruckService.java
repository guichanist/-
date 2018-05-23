package food.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import food.model.dao.TruckDAOImpl;
import food.model.dto.Truck;
import food.model.dto.Truck2;

public class TruckService 
{
	static TruckDAOImpl dao = new TruckDAOImpl();
	public static ArrayList<Truck> selectAll(String title) throws SQLException
	{
		return dao.selectAll(title);
	}
	
	public static ArrayList<Truck2> selectDetail(String title) throws SQLException
	{
		return dao.selectDetail(title);
	}
	
	
	public static int insert(Truck tru) throws SQLException
	{
		int result = dao.insert(tru);
		if(result == 0)
		{
			throw new SQLException("���Ե��� �ʾҽ��ϴ�."); // insert�� �ȵǸ� 0 ����  ��ϱ� ���������� ����ó���� �ϴ� ��
		}
		
		return result;
		//return dao.insert(electronics);
	}
}
