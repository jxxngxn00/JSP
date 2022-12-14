package mvc.guest.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.command.Command;
import mvc.guest.command.CommandDelete;
import mvc.guest.command.CommandException;
import mvc.guest.command.CommandInput;
import mvc.guest.command.CommandList;
import mvc.guest.command.CommandNull;

/**
 * Servlet implementation class GuestControl
 */
public class GuestControl extends HttpServlet {
   
   private HashMap commandMap;
   private String   jspDir = "/05_mvc_class/2_mvcGuest/";
   private String  error = "error.jsp";
   

    public GuestControl() {
        super();       
      initCommand();
   }
    
    /* 여기부터 */
   private void initCommand(){
      commandMap = new HashMap();
      
      // Key 값에 따라 객체 생성해서 HashMap에 담아둠
      // 페이지 이동시 Controller에 어떤 Key값을 입력하느냐에 따라 객체에서 DB와 연동되는 Dao의 함수 실행
      commandMap.put("main-page",   new CommandNull("main.jsp") ); // 괄호안은 키와 값
      commandMap.put("list-page",   new CommandList("listMessage.jsp") );  
      commandMap.put("input-form", new CommandNull("insertMessage.jsp"));
      commandMap.put("input-do", new CommandInput("saveMessage.jsp"));
      commandMap.put("delete-form", new CommandNull("deleteMessage.jsp"));
      commandMap.put("delete-do", new CommandDelete("deleteConfirm.jsp")); // 삭제ㄴ
      
   }

   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      processRequest(request, response);
   }

   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      processRequest(request, response);
   }
   

   private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");

      String nextPage = "";
      String cmdKey   = request.getParameter("cmd");
      if( cmdKey == null ){
         cmdKey = "main-page"; //기본값 설정
      }

      
      Command cmd = null;

      try{
         
         if( commandMap.containsKey( cmdKey ) ){
            cmd = (Command)commandMap.get( cmdKey);
         }else{
            throw new CommandException("지정할 명령어가 존재하지 않음");
         }

         nextPage = cmd.execute( request, response  );

      }catch( CommandException e ){
         request.setAttribute("javax.servlet.jsp.jspException", e );
         nextPage = error;
         System.out.println("오류 : " + e.getMessage() );
      }

      RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
      reqDp.forward( request, response );
      
   }

}