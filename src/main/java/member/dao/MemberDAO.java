package member.dao;
import java.sql.*;

public class MemberDAO {
		
	private MemberDAO() throws Exception{
		//1. 드라이버 로딩
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("드라이버로딩 성공");
	}

	/* Singleton pattern */
	/* 객체를 단 한번만 생성함 */
	static MemberDAO memberDAO = null;
	public static MemberDAO getInstance() throws Exception{
		if(memberDAO==null) memberDAO = new MemberDAO();
		return memberDAO;
	}
	
	public void insert(MemberVO vo) throws Exception{
	//변수 선언
		Connection con=null;
	try {
	//2. 연결객체 얻어오기
		String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe"; 
		String user = "scott";
		String pass = "tiger";
		
		con = DriverManager.getConnection(url, user, pass);
		System.out.println("연결 성공");
	//3. sql 문장 작성
		String sql = "INSERT INTO form(realname, nickname, email, age) VALUES (?,?,?,?)";
		
	//4. 전송객체 얻어오기 (?에 값 지정 -- preparestatement 사용)
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vo.getRealname());
		ps.setString(2, vo.getNickname());
		ps.setString(3, vo.getEmail());
		ps.setInt(4, vo.getAge());
		
	//5. 전송
		ps.executeUpdate();
	//6. 닫기
	}finally {
		con.close();
	}
	}
	
}
