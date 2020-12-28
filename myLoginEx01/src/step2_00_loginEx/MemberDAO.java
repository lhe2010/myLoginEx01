package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/MYLOGINEX1?serverTimezone=UTC";
		String dbId = "root";
		String dbPass = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return conn;
	}
	
	// 1. 회원가입 DAO / 가입시 TRUE 가입거부 FALSE
	public boolean insertMember(MemberDTO mdto) {
		boolean isFirstMember = false;
		
		if(this.memberCheck(mdto.getId(), mdto.getPasswd()) == false) { // 없으면 회원가입 진행
			
			try {
				conn = getConnection();
				
				String sql = "INSERT INTO MEMBER VALUES (?,?,?,NOW())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getId());
				pstmt.setString(2, mdto.getPasswd());
				pstmt.setString(3, mdto.getName());
				pstmt.executeUpdate();
				
				System.out.println("member 테이블의 계정이 추가되었습니다. ");
				System.out.println(mdto.getId() + "/" + mdto.getPasswd() + "/" + mdto.getName());
				
				isFirstMember = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) { e.printStackTrace();}
				try { pstmt.close();} catch (Exception e) {e.printStackTrace();}			
				try { conn.close();} catch (Exception e) {e.printStackTrace();}	
			}
		}
		return isFirstMember;
	}
	
	// 2. 회원탈퇴 DAO
	public boolean deleteMember(String id, String passwd) {
		boolean isDeleted = false;
		
		if(memberCheck(id, passwd)) { // 있으면 지운다.
			try {
				conn = getConnection();
				String sql = "DELETE FROM MEMBER WHERE ID=? AND PASSWD=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, passwd);
				pstmt.executeUpdate();
				
				System.out.println(id + "회원이 탈퇴완료");
				isDeleted = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) { e.printStackTrace();}
				try { pstmt.close();} catch (Exception e) {e.printStackTrace();}			
				try { conn.close();} catch (Exception e) {e.printStackTrace();}	
			}
		} 
		
		return isDeleted;		
	}
	
	// 3. 회원정보수정 DAO
	public boolean updateMember(MemberDTO mdto) {
		
		boolean isUpdated = false;
		
		if(memberCheck(mdto.getId(), mdto.getPasswd())) {
			try {
				conn = getConnection();
				String sql = "UPDATE MEMBER SET NAME=? WHERE ID=? AND PASSWD=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getName());
				pstmt.setString(2, mdto.getId());
				pstmt.setString(3, mdto.getPasswd());
				pstmt.executeUpdate();
				
				isUpdated = true;
				
				System.out.println(mdto.getId() + "회원의 정보가 수정되었다.");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { rs.close(); } catch (Exception e) { e.printStackTrace();}
				try { pstmt.close();} catch (Exception e) {e.printStackTrace();}			
				try { conn.close();} catch (Exception e) {e.printStackTrace();}	
			}
		}
		
		return isUpdated;	
	}
	
	// 4. 인증된 유저 확인 DAO / 있으면 true 없는회원 false
	public boolean memberCheck(String id, String passwd) {
		boolean isValidMember = false;
		
		try {
			conn = getConnection();
			
			String sql = "SELECT * FROM MEMBER WHERE ID=? AND PASSWD=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isValidMember = true;
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { rs.close(); } catch (Exception e) { e.printStackTrace();}
			try { pstmt.close();} catch (Exception e) {e.printStackTrace();}			
			try { conn.close();} catch (Exception e) {e.printStackTrace();}	
		}
		
		return isValidMember;
	}
}
