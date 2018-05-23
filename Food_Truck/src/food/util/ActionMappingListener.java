package food.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.ResourceBundle;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import food.controller.Action;



@WebListener
public class ActionMappingListener implements ServletContextListener 
{


    public ActionMappingListener() 
    {
        // TODO Auto-generated constructor stub
    }

    @Override
    public void contextDestroyed(ServletContextEvent arg0)  
    { 
         // TODO Auto-generated method stub
    }

	@Override
    public void contextInitialized(ServletContextEvent event)  
	{
		HashMap<String,Action> map = new HashMap<String, Action>();
    	
        //properties파일읽어서 Map에 저장한 후 map을 application 에 저장한다.
      	ResourceBundle rb = ResourceBundle.getBundle("food.util.actionMapping");			// Bundle 객체를 생성해주어 key값을 통해 해당 value를 얻을 수 있다.
      	Iterator<String> it = rb.keySet().iterator();									// Iterator 모든 컬렉션(Collection)으로 부터 정보를 얻을 수 있는 인터페이스
      	
      	while(it.hasNext())
      	{
      		String key = it.next();
      		String value = rb.getString(key);
      		
      		try
      		{
      		//map에 저장
      		Action action = (Action)Class.forName(value).newInstance();					// Action을 통해  클래스 명을 객체로 만들어 주고 있다.
      		map.put(key, action);														// forName메소드는  jdbc 드라이버를 로딩할때 동적으로 사용하기위해
      																					// 여기서 action에 객체를 담는 이유는 바로 지정된 객체를 action에 넘긴후 사용할려고
      		}
      		
      		catch(Exception e)
      		{
      			e.printStackTrace();
      		}
      	}
      	
      	//application에 저장
      	event.getServletContext().setAttribute("map", map);
    }
	
}
