package food.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import food.model.dto.Truck;
import food.model.dto.Truck2;

public interface TruckDAO 
{
	/**
	  * 레코드 전체 검색
	  * */
	ArrayList<Truck> selectAll(String title) throws SQLException;
	
	/**
	  * 레코드 일부 검색
	  * */
	ArrayList<Truck2> selectDetail(String title) throws SQLException;
	
	/**
	 * 레코드 삽입
	 * @return : true-삽입성공 , false - 삽입실패
	 * */
	int insert(Truck tru) throws SQLException;
	
}
