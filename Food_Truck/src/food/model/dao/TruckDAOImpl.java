package food.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import food.model.dto.Truck;
import food.model.dto.Truck2;

public class TruckDAOImpl implements TruckDAO 
{
   @SuppressWarnings("finally")
   @Override
   public ArrayList<Truck> selectAll(String title) throws SQLException 
   {   
      PreparedStatement ps = null;                           // PreparedStatement(占쏙옙占썩에 占쏙옙占쏙옙占쏙옙 占쌍는댐옙)
      ResultSet rs = null;
      Connection con = null;
      ArrayList<Truck> tru = new ArrayList<Truck>();
      Truck trus = null;
      
      int compare =  Integer.parseInt(title);
      try 
      {
         String sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no ='"+title+"';";
         if(compare == 1)
         {
            sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no = 1 and Truck_no BETWEEN 1 and 7;";
         } 
         
         else if(compare == 2)
         {
            sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no = 2 and Truck_no BETWEEN 8 and 15;";
         }
         
         else if(compare == 3)
         {
            sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no = 3 and Truck_no BETWEEN 16 and 23;";
         }
         
         else if(compare == 4)
         {
            sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no = 4 and Truck_no BETWEEN 24 and 31;";
         }
         
         else if(compare == 5)
         {
            sql = "select Truck_no, Truck_name, Truck_Lat, Truck_Long, Truck_photo, Location_Lat, Location_Long from Truck, Location where Location.Location_no = 5 and Truck_no BETWEEN 32 and 39;";
         }
         
         else if(compare == 6)
         {
            sql = "select distinct t.Truck_no, t.Truck_name, t.Truck_Lat, t.Truck_Long, t.Truck_photo, l.Location_Lat, l.Location_Long From Truck_Menu tm, Truck t, Location l where t.Truck_no = tm.Truck_no and l.Location_no = 1 and tm.Group_no = 1;";
         }
         
         else if(compare == 7)
         {
            sql = "select distinct t.Truck_no, t.Truck_name, t.Truck_Lat, t.Truck_Long, t.Truck_photo, l.Location_Lat, l.Location_Long From Truck_Menu tm, Truck t, Location l where t.Truck_no = tm.Truck_no and l.Location_no = 1 and tm.Group_no = 2;";
         }
         
         else if(compare == 8)
         {
            sql = "select distinct t.Truck_no, t.Truck_name, t.Truck_Lat, t.Truck_Long, t.Truck_photo, l.Location_Lat, l.Location_Long From Truck_Menu tm, Truck t, Location l where t.Truck_no = tm.Truck_no and l.Location_no = 1 and tm.Group_no = 3;";
         }
         
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://food.cj8oyxxrdjqj.ap-northeast-2.rds.amazonaws.com:3306/food","food","1q2w3e4r");         
         ps = con.prepareStatement(sql);
         ps.executeQuery();   
         rs = ps.executeQuery();
         
         
         while(rs.next())                                 // 占쏙옙占쏙옙占싶몌옙 占싼곤옙占쏙옙 占쏙옙쨈占�.
         {
            trus = new Truck(
               rs.getString(1),
               rs.getString(2),
               rs.getString(3),
               rs.getString(4),
               rs.getString(5),
               rs.getString(6),
               rs.getString(7)
            );
            
                  
            tru.add(trus);                              //占쌈쇽옙占쏙옙 占쏙옙占쏙옙큼 占쏙옙占쏙옙 占쌨아온댐옙占쏙옙占쏙옙 list占쏙옙 占쌍억옙占쌔댐옙.
         }
         
      }
      
      catch(Exception e) {
         System.out.printf("占쏙옙占쏙옙占쏙옙占쏙옙\n");
      }
      finally
      {
         if(rs != null)
         {
            rs.close();
         }
         
         if(ps != null)
         {
            ps.close();
         }
         
         if(con != null)
         {
            con.close();
         }
         return tru;
      }
      
   }
   
   @SuppressWarnings("finally")
   @Override
   public ArrayList<Truck2> selectDetail(String title) throws SQLException 
   {   
      PreparedStatement ps = null;                           // PreparedStatement(占쏙옙占썩에 占쏙옙占쏙옙占쏙옙 占쌍는댐옙)
      ResultSet rs = null;
      Connection con = null;
      ArrayList<Truck2> tru2 = new ArrayList<Truck2>();
      Truck2 trus = null;
      try 
      {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://food.cj8oyxxrdjqj.ap-northeast-2.rds.amazonaws.com:3306/food","food","1q2w3e4r");
         String sql = "select t.Truck_name, t.Truck_Lat, t.Truck_Long, t.Truck_intro, t.Truck_photo, tm.Menu_name, tm.Menu_price, tm.Menu_photo from Truck t, Truck_Menu tm where t.Truck_no = tm.Truck_no and t.Truck_no = '"+title+"';";
         ps = con.prepareStatement(sql);
         ps.executeQuery();   
         rs = ps.executeQuery();
         
         
         while(rs.next())                                 // 占쏙옙占쏙옙占싶몌옙 占싼곤옙占쏙옙 占쏙옙쨈占�.
         {
            trus = new Truck2(
               rs.getString(1),
               rs.getString(2),
               rs.getString(3),
               rs.getString(4),
               rs.getString(5),
               rs.getString(6),
               rs.getString(7),
               rs.getString(8)
            );
                  
            tru2.add(trus);                              //占쌈쇽옙占쏙옙 占쏙옙占쏙옙큼 占쏙옙占쏙옙 占쌨아온댐옙占쏙옙占쏙옙 list占쏙옙 占쌍억옙占쌔댐옙.
         }
         
      }
      
      catch(Exception e) {
         System.out.printf("占쏙옙占쏙옙占쏙옙占쏙옙\n");
      }
      finally
      {
         if(rs != null)
         {
            rs.close();
         }
         
         if(ps != null)
         {
            ps.close();
         }
         
         if(con != null)
         {
            con.close();
         }
         return tru2;
      }
      
   }

   @Override
   public int insert(Truck tru) throws SQLException 
   {

      return 0;
   }

}