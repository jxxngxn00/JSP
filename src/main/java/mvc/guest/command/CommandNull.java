package mvc.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandNull implements Command{
   private String next;

   public CommandNull( String _next ){
      next = _next;
   }
   
   //오버라이딩
   public String execute( HttpServletRequest request, HttpServletResponse response   ) throws CommandException{
      return next;
   }

}