package mvc.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	//오버라이딩을 위해 메소드 내에서 수행하는 내용이 X
	// -> cmd의 Key 값에 따라 각기 다른 역할을 수행하면서 함수명은 동일하게 execute()로 사용하기 위함
   public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException;
}