package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO1 {
	
	//접속은 반복적이므로, 별도의 메소드를 작성해줌
		//db 접속을 책임지는 메소드
		//mysql db에 접속하기
		String user="root";
		String user_pass="root";
		//정상적이지만, ssl 예외가 발생할 때는 아래와 같이 ?useSSL=false 을 추가해줘야함.
		String url="jdbc:mysql://localhost:3306/carDb?allowPublicKeyRetrieval=true&useSSL=false"; //carDb는 db이름
		
		Connection con = null; //데이터베이스에 접속하도록 설정
		PreparedStatement pstmt; //DB 쿼리를 실행시켜주는 객체
		ResultSet rs; //쿼리 결과를 리턴받아 저장해주는 객체
		
		//DB에 접근할 수 있도록 도와주는 메소드
		public void getCon( ) {
			try{
				//해당 데이터베이스를 사용한다고 선언(클래스 등록:mysql을 사용)
				Class.forName("com.mysql.jdbc.Driver");
				//해당 데이터베이스에 접속
				con = DriverManager.getConnection(url, user, user_pass);
				
			} catch (Exception e) {
				e.printStackTrace();
			}		
			
		}
		
		
		//새로운 멤버를 저장하는 클래스
		public void insertMember(MemberBean bean) {
			//DB와 접속을 수행함.
			getCon();
			
					
			try {
				//쿼리문 작성[8개의 field를 가짐]
				//user_id, user_password, user_name, user_gender, user_email, user_phone, user_hobby, user_impress[필드명]
				String sql = "insert into member1 values (?,?,?,?,?,?,?,?)";
				//쿼리 실행 객체
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bean.getUser_id());
				pstmt.setString(2, bean.getUser_password());
				pstmt.setString(3, bean.getUser_name());
				pstmt.setString(4, bean.getUser_gender());
				pstmt.setString(5, bean.getUser_email());
				pstmt.setString(6, bean.getUser_phone());
				pstmt.setString(7, bean.getUser_hobby());
				pstmt.setString(8, bean.getUser_impress());
				
				//쿼리 실행
				pstmt.executeUpdate();
									
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
			    // Always make sure result sets and statements are closed,
			    // and the connection is returned to the pool
			    if (pstmt != null) {
			      try { pstmt.close(); } catch (SQLException e) { ; }
			      pstmt = null;
			    }
			    if (con != null) {
			      try { con.close(); } catch (SQLException e) { ; }
			      con = null;
			    }
			}
		}
		
		///로그인 성공을 테스트함.[패스워드를 리턴함]
		public MemberBean loginQuery(String id) {
			//리턴할 데이터 선언
			MemberBean bean = new MemberBean();
			
			//DB와 접속을 수행함.
			getCon();
			
			try {
				String user_id = id;
				String sql = "select * from member1 where user_id=?";
				//쿼리 실행 객체
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, user_id);
				//쿼리 실행
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					bean.setUser_id(rs.getString(1));
					bean.setUser_password(rs.getString(2));
					bean.setUser_name(rs.getString(3));
					bean.setUser_gender(rs.getString(4));
					bean.setUser_email(rs.getString(5));
					bean.setUser_phone(rs.getString(6));
					bean.setUser_hobby(rs.getString(7));
					bean.setUser_impress(rs.getString(8));
				}
				
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			//로그인 대상자의 값을 리턴함
			return bean;
		}
		
		//새로운 멤버를 저장하는 클래스
				public void insertOneMember(MemberBean bean) {
					//DB와 접속을 수행함.
					getCon();
					
							
					try {
						//쿼리문 작성[8개의 field를 가짐]
						//user_id, user_password, user_name, user_gender, user_email, user_phone, user_hobby, user_impress[필드명]
						String sql = "insert into member1 values (?,?,?,?,?,?,?,?)";
						//쿼리 실행 객체
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, bean.getUser_id());
						pstmt.setString(2, bean.getUser_password());
						pstmt.setString(3, bean.getUser_name());
						pstmt.setString(4, bean.getUser_gender());
						pstmt.setString(5, bean.getUser_email());
						pstmt.setString(6, bean.getUser_phone());
						pstmt.setString(7, bean.getUser_hobby());
						pstmt.setString(8, bean.getUser_impress());
						
						//쿼리 실행
						pstmt.executeUpdate();
											
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
					    // Always make sure result sets and statements are closed,
					    // and the connection is returned to the pool
					    if (pstmt != null) {
					      try { pstmt.close(); } catch (SQLException e) { ; }
					      pstmt = null;
					    }
					    if (con != null) {
					      try { con.close(); } catch (SQLException e) { ; }
					      con = null;
					    }
					}
				}
				
				///한 구성원의 회원 정보를 수정함.
				public void modifyOneMember(MemberBean bean) {
					
					//DB와 접속을 수행함.
					getCon();
					
					try {
						
						//[예시]UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt‘ WHERE CustomerID = 1;
						//패스워드(널을입력하지 않는다 가정), 이메일, 전화번호 및 취미의 재설정만 가능
						String  sql = "UPDATE member1 SET user_password=?, user_email=?, user_phone=?, user_hobby=? where user_id=?";
						//쿼리 실행 객체
						pstmt = con.prepareStatement(sql);
					
						pstmt.setString(1, bean.getUser_password());
						pstmt.setString(2, bean.getUser_email());
						pstmt.setString(3, bean.getUser_phone());
						pstmt.setString(4, bean.getUser_hobby());
						pstmt.setString(5, bean.getUser_id());
						//쿼리 실행
						pstmt.executeUpdate();
						
						con.close();
						
					}catch(Exception e) {
						e.printStackTrace();
					}
					
				}

		//		

}
