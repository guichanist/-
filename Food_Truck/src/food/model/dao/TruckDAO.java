package food.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import food.model.dto.Truck;
import food.model.dto.Truck2;

public interface TruckDAO 
{
	/**
	  * ���ڵ� ��ü �˻�
	  * */
	ArrayList<Truck> selectAll(String title) throws SQLException;
	
	/**
	  * ���ڵ� �Ϻ� �˻�
	  * */
	ArrayList<Truck2> selectDetail(String title) throws SQLException;
	
	/**
	 * ���ڵ� ����
	 * @return : true-���Լ��� , false - ���Խ���
	 * */
	int insert(Truck tru) throws SQLException;
	
}
