package food.model.dto;

public class Truck2 
{
	//foreach문에서 사용할 변수이름
	private String truck_name;
	private String truck_lat;
	private String truck_long;
	private String truck_intro;
	private String truck_photo;
	private String menu_name;
	private String menu_price;
	private String menu_photo;
	
	public String getTruck_photo() {
		return truck_photo;
	}
	public void setTruck_photo(String truck_photo) {
		this.truck_photo = truck_photo;
	}
	public String getTruck_name() {
		return truck_name;
	}
	public void setTruck_name(String truck_name) {
		this.truck_name = truck_name;
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
	public String getTruck_intro() {
		return truck_intro;
	}
	public void setTruck_intro(String truck_intro) {
		this.truck_intro = truck_intro;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_photo() {
		return menu_photo;
	}
	public void setMenu_photo(String menu_photo) {
		this.menu_photo = menu_photo;
	}


	
	public Truck2(String truck_name, String truck_lat, String truck_long, String truck_intro, String truck_photo, String menu_name, String menu_price, String menu_photo) 
	{
		super();
		this.truck_name = truck_name;
		this.truck_lat = truck_lat;
		this.truck_long = truck_long;
		this.truck_intro = truck_intro;
		this.truck_photo = truck_photo;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_photo = menu_photo;
	}
}
