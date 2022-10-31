package temp;

import java.sql.*;

public class EmpDao {
	private EmpDao() throws Exception{
		//1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버로딩 성공");
	}
	
	/* Singleton pattern */
	/* 객체를 단 한번만 생성함 */
	static EmpDao empDAO = null;
	public static EmpDao getInstance() throws Exception{
		if(empDAO==null) empDAO = new EmpDao();
		return empDAO;
	}
	
	public void insert(EmpVO vo) throws Exception{
		//변수선언
		Connection con = null;
		try {
			//2. 연격객체 얻어오기
			// 선아언니 DB에 입력
			String url = "jdbc:oracle:thin:@192.168.0.36:1521:xe"; 
			String user = "scott";
			String pass = "tiger";

			con = DriverManager.getConnection(url, user, pass);
			System.out.println("연결 성공");

			//3. sql 문장 작성 (emp 테이블에 insert)
			String sql = "INSERT INTO emp(empno, ename, deptno, job, sal) VALUES ( ?,?,?,?,? )";

			//4. 전송객체 얻어오기( + ?에 값 지정)
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getEmpno());
			ps.setString(2, vo.getEname());
			ps.setInt(3, vo.getDeptno());
			ps.setString(4, vo.getJob());
			ps.setInt(5, vo.getSal());

			//5. 전송
			ps.executeUpdate();
		} finally {
			//6. 닫기
			con.close();
		}
	}
}
