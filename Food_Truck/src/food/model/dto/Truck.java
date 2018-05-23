package food.model.dto;

public class Truck 
{
   private String truck_no;
   private String truck_name;
   private String truck_lat;
   private String truck_long;
   private String truck_photo;
   private String location_lat;
   private String location_long; 
   
   public String getTruck_name() {
      return truck_name;
   }
   public void setTruck_name(String truck_name) {
      this.truck_name = truck_name;
   }
   public String getTruck_no() {
      return truck_no;
   }
   public void setTruck_no(String truck_no) {
      this.truck_no = truck_no;
   }
   public String getTruck_photo() {
      return truck_photo;
   }
   public void setTruck_photo(String truck_photo) {
      this.truck_photo = truck_photo;
   }
   public String getLocation_lat() {
      return location_lat;
   }
   public void setLocation_lat(String location_lat) {
      this.location_lat = location_lat;
   }
   public String getLocation_long() {
      return location_long;
   }
   public void setLocation_long(String location_long) {
      this.location_long = location_long;
   }   
   public String getTruck_lat() {
      return truck_lat;
   }
   public void setTruck_lat(String truck_lat) {
      this.truck_lat = truck_lat;
   }
   public String getTruck_long() {
      return truck_long;
   }
   public void setTruck_long(String truck_long) {
      this.truck_long = truck_long;
   }

   public Truck(String truck_no, String truck_name, String truck_lat, String truck_long, String truck_photo, String location_lat, String location_long) 
   {
      super();
      this.truck_no = truck_no;
      this.truck_name = truck_name;
      this.truck_lat = truck_lat;
      this.truck_long = truck_long;
      this.truck_photo = truck_photo;
      this.location_lat = location_lat;
      this.location_long = location_long;
      
   }
}