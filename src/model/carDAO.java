package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class carDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//mysql db에 접속하기
	String user="root";
	String user_pass="378044";
	//정상적이지만, ssl 예외가 발생할 때는 아래와 같이 ?useSSL=false 을 추가해줘야함.
	String url="jdbc:mysql://localhost:3306/carDb?useSSL=false"; //carDb는 db이름
	
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
	
	public void insertcar(carBean bbean) {
		try{
			getCon();
			String sql = "insert into cartable values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bbean.getName());
			pstmt.setString(2, bbean.getCompany());
			pstmt.setString(3, bbean.getCategory());
			pstmt.setInt(4, bbean.getPassengers());
			pstmt.setString(5, bbean.getFuel());
			pstmt.setInt(6, bbean.getCc());
			pstmt.setInt(7, bbean.getPrice());
			pstmt.setString(8, bbean.getImgfile());
			pstmt.setString(9, bbean.getInfo());
	
			pstmt.executeUpdate();
			//쿼리 실행
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public Vector<carBean> allSlectMember(){
		//등록된 차량 리스트
		Vector<carBean> vec = new Vector<>();
		//DB 접속
		getCon();
		
		try {
			String sql = "select * from car";
			pstmt = con.prepareStatement(sql);
			//ResultSet 쿼리결과
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				carBean bean = new carBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCompany(rs.getString(3));
				bean.setCategory(rs.getString(4));
				bean.setPassengers(rs.getInt(5));
				bean.setFuel(rs.getString(6));
				bean.setCc(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				bean.setImgfile(rs.getString(9));
				bean.setInfo(rs.getString(10));
				
				vec.add(bean);
				
			}
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vec;
	}
	
	
	
	//가장 HOT한 자동차 추천
	public Vector<carBean> getSelect4Car(){
		Vector<carBean> vec = new Vector<>();
		getCon();
		
		try {
			String sql = "select * from car where category='중형' order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int cnt=0;
			
			while (rs.next()) {
				carBean bean = new carBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCompany(rs.getString(3));
				bean.setCategory(rs.getString(4));
				bean.setPassengers(rs.getInt(5));
				bean.setFuel(rs.getString(6));
				bean.setCc(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				bean.setImgfile(rs.getString(9));
				bean.setInfo(rs.getString(10));
				
				vec.add(bean);
				cnt++;
				if (cnt >= 4) break; //상위 4개의 레코드만 선택
				
			}
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vec;
	}
	
	//차량 검색하기 선택된 카테고리에 따라 해당 차량 가져오기
	public Vector<carBean> getCarCategory(String cate){
		Vector<carBean> vec = new Vector<>();
		//carBean bean = null;
		getCon();
		try {
			String sql = "select * from car where category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				carBean bean = new carBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCompany(rs.getString(3));
				bean.setCategory(rs.getString(4));
				bean.setPassengers(rs.getInt(5));
				bean.setFuel(rs.getString(6));
				bean.setCc(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				bean.setImgfile(rs.getString(9));
				bean.setInfo(rs.getString(10));
				
				vec.add(bean);				
			}
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return vec;		
	}
	
	//모든차량보기
	public Vector<carBean> getAllCar(){
				Vector<carBean> vec = new Vector<>();
				//carBean bean = null;
				getCon();
				try {
					String sql = "select * from car";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						carBean bean = new carBean();
						bean.setNo(rs.getInt(1));
						bean.setName(rs.getString(2));
						bean.setCompany(rs.getString(3));
						bean.setCategory(rs.getString(4));
						bean.setPassengers(rs.getInt(5));
						bean.setFuel(rs.getString(6));
						bean.setCc(rs.getInt(7));
						bean.setPrice(rs.getInt(8));
						bean.setImgfile(rs.getString(9));
						bean.setInfo(rs.getString(10));

						vec.add(bean);				
					}
					pstmt.close();
					con.close();
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return vec;		
		
	}
	
	//차량정보 읽어오기
	public carBean getOneCarData(int no) {
		//由ы꽩�삎�쓣 �꽑�뼵
		carBean bean = new carBean();
		getCon();
		
		try {
			String sql = "select * from car where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCompany(rs.getString(3));
				bean.setCategory(rs.getString(4));
				bean.setPassengers(rs.getInt(5));
				bean.setFuel(rs.getString(6));
				bean.setCc(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				bean.setImgfile(rs.getString(9));
				bean.setInfo(rs.getString(10));
			}
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	//예약정보 테이블에 입력
	public void insertCarReservation(CarReserveBean rbean) {
		getCon();
		
		try {
			String sql = "insert into carReserveTable(user_id, no,name,carQty,rentDuration,startDay,applyInsurance,applyBabySeat,totalPrice) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,rbean.getUser_id());
			pstmt.setInt(2, rbean.getNo());
			pstmt.setString(3,rbean.getName());
			pstmt.setInt(4, rbean.getCarQty());
			pstmt.setInt(5, rbean.getRentDuration());
			pstmt.setString(6, rbean.getStartDay());
			pstmt.setInt(7, rbean.getApplyInsurance());
			pstmt.setInt(8, rbean.getApplyBabySeat());
			pstmt.setInt(9, rbean.getTotalPrice());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//예약 확인하기
	public Vector<CarReserveBean> getAllReservation(String userId){
		Vector<CarReserveBean> vec = new Vector<>();//由ы꽩 ���엯
				
		getCon();
		//2媛쒖쓽 �뀒�씠釉붿뿉�꽌 �룞�떆�뿉 �씫�뒗 諛⑸쾿 �냼媛�
		// �몢 �뀒�씠釉붿뿉�꽌 議곌굔�쓣 留뚯“�떆�궎�뒗 �궡�슜�쓣 紐⑤몢 �씫�쓬.
		//String sql="select * from car natural join carReserveTable"
		//          + "where now() < to_date(startDay, 'yyyy-MM-dd') and user_id=?";
		try {
			//�쁽�옱 �궇吏쒕낫�떎 �씠�썑�쓽 寃껋쓣 寃��깋
			//�궇吏쒕뒗 '2019-07-01' 臾몄옄�뿴濡� �씤�떇�룄 �릺硫�, 臾몄옄�뿴濡� ���옣�릺硫� 鍮꾧탳媛� 媛��뒫�븿. curdate() ['2019-06-10']�삤�뒛 �궇吏쒕�� �쓽誘명븿.
			//select * from carReserveTable where '2019-06-08' < startDay; //�씠寃껊룄 �쑀�슚�븿.(sql workbench�뿉�꽌 �닔�뻾�빐 蹂� 寃�)
			
			String sql = "select * from carReserveTable where user_id=? and (startDay >= curdate())";
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CarReserveBean rbean = new CarReserveBean();
				rbean.setReserveNo(rs.getInt(1));
				rbean.setUser_id(rs.getString(2));
				rbean.setNo(rs.getInt(3)); //李⑤웾DB�벑濡앸쾲�샇
				rbean.setName(rs.getString(4)); //李⑤웾�씠由�
				rbean.setCarQty(rs.getInt(5));
				rbean.setRentDuration(rs.getInt(6));
				rbean.setStartDay(rs.getString(7));
				rbean.setApplyInsurance(rs.getInt(8));
				rbean.setApplyBabySeat(rs.getInt(9));
				rbean.setTotalPrice(rs.getInt(10));
				
				vec.add(rbean);
			}
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vec;
	}
	//�삁�빟 痍⑥냼(�궘�젣) 硫붿냼�뱶 �젙�쓽
	public void carReserveCancel(int reserveNo) {
		getCon();
		
		try {
			String sql = "delete from carReserveTable where reserveNo=?";
			
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setInt(1, reserveNo);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void insertOneCarRegistration(carBean bean) {
		getCon();
		
		try {
			//예약번호는(reserveNo)는 auto_increment 모드 사용으로 자동 생성
			String sql = "insert into car(name, company,category,passengers,fuel,cc,price,imgfile,info) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?에 값 할당
			pstmt.setString(1,bean.getName());
			pstmt.setString(2, bean.getCompany());
			pstmt.setString(3,bean.getCategory());
			pstmt.setInt(4, bean.getPassengers());
			pstmt.setString(5, bean.getFuel());
			pstmt.setInt(6, bean.getCc());
			pstmt.setInt(7, bean.getPrice());
			pstmt.setString(8, bean.getImgfile());
			pstmt.setString(9, bean.getInfo());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//

}
