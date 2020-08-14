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
	
	
	//mysql db�뿉 �젒�냽�븯湲�
	String user="root";
	String user_pass="root";
	//�젙�긽�쟻�씠吏�留�, ssl �삁�쇅媛� 諛쒖깮�븷 �븣�뒗 �븘�옒�� 媛숈씠 ?useSSL=false �쓣 異붽��빐以섏빞�븿.
	String url="jdbc:mysql://localhost:3306/carDb?useSSL=false"; //carDb�뒗 db�씠由�
	
	//DB �젒�냽 硫붿냼�뱶
	public void getCon( ) {
		try{
			//�빐�떦 �뜲�씠�꽣踰좎씠�뒪瑜� �궗�슜�븳�떎怨� �꽑�뼵(�겢�옒�뒪 �벑濡�:mysql�쓣 �궗�슜)
			Class.forName("com.mysql.jdbc.Driver");
			//�빐�떦 �뜲�씠�꽣踰좎씠�뒪�뿉 �젒�냽
			con = DriverManager.getConnection(url, user, user_pass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}
	
	public void insertcar(carBean bbean) {
		try{
			getCon();
			//�젒�냽 �썑 荑쇰━瑜� 以�鍮꾪븯�뿬 荑쇰━瑜� �궗�슜�븷 以�鍮꾪븿[�뀒�씠釉붾챸�씠 booktable�엫]
			String sql = "insert into cartable values(?,?,?,?,?,?,?,?,?)";
			//荑쇰━瑜� �궗�슜�븯�룄濡� �꽕�젙
			PreparedStatement pstmt = con.prepareStatement(sql);
			//?�뿉 留욌뒗 �뜲�씠�꽣瑜� 留듯븨�떆耳쒖쨲
			pstmt.setString(1, bbean.getName());
			pstmt.setString(2, bbean.getCompany());
			pstmt.setString(3, bbean.getCategory());
			pstmt.setInt(4, bbean.getPassengers());
			pstmt.setString(5, bbean.getFuel());
			pstmt.setInt(6, bbean.getCc());
			pstmt.setInt(7, bbean.getPrice());
			pstmt.setString(8, bbean.getImgfile());
			pstmt.setString(9, bbean.getInfo());
	
			pstmt.executeUpdate(); //insert, update, delete�떆 �궗�슜�븿
			//�옄�썝 諛섎궔
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public Vector<carBean> allSlectMember(){
		//由ы꽩 type�쓣 �젙�쓽
		Vector<carBean> vec = new Vector<>();
		//DB �젒�냽
		getCon();
		
		try {
			String sql = "select * from car";//table紐� : car   order by는 정렬  desc내림차순 asc오름차순
			pstmt = con.prepareStatement(sql);
			//ResultSet ���엯�쓽 荑쇰━ �뜲�씠�꽣瑜� 諛쏆쓬
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
				
				//踰≫꽣�뿉 bean �겢�옒�뒪 異붽�
				vec.add(bean);
				
			}
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vec;//4媛쒖쓽 以묓삎李� �뜲�씠�꽣 由ы꽩�븿.
	}
	
	
	
	//以묓삎李� 4���쓽 �옄�룞李⑤�� 由ы꽩�븯�뒗 硫붿냼�뱶
	public Vector<carBean> getSelect4Car(){
		//由ы꽩 type�쓣 �젙�쓽
		Vector<carBean> vec = new Vector<>();
		//DB �젒�냽
		getCon();
		
		try {
			String sql = "select * from car where category='중형' order by no desc";//table紐� : car   order by는 정렬  desc내림차순 asc오름차순
			pstmt = con.prepareStatement(sql);
			//ResultSet ���엯�쓽 荑쇰━ �뜲�씠�꽣瑜� 諛쏆쓬
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
				
				//踰≫꽣�뿉 bean �겢�옒�뒪 異붽�
				vec.add(bean);
				cnt++;
				if (cnt >= 4) break; //諛섎났臾� �깉異�
				
			}
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vec;//4媛쒖쓽 以묓삎李� �뜲�씠�꽣 由ы꽩�븿.
	}
	
	//�꽑�깮�맂 Category�뿉 ���빐 �옄�룞李� 由ъ뒪�듃瑜� ���옣�븯�뿬 �룎�젮二쇰뒗 method
	public Vector<carBean> getCarCategory(String cate){
		//由ы꽩 ���엯�쓣 誘몃━ �꽑�뼵
		Vector<carBean> vec = new Vector<>();
		//�뜲�씠�꽣瑜� �떞�쓣 bean �겢�옒�뒪瑜� �꽑�뼵
		//carBean bean = null;
		//DB�젒�냽
		getCon();
		try {
			//荑쇰━臾� �옉�꽦
			String sql = "select * from car where category=?";
			pstmt = con.prepareStatement(sql);
			//?�꽕�젙�븯湲�
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();
			//諛섎났臾몄쓣 �궗�슜�븯�뿬 bean �떒�쐞濡� vector�뿉 ���옣�븯湲�
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
				
				//踰≫꽣�뿉 bean �겢�옒�뒪 異붽�
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
	
	//紐⑤뱺 李⑤웾�쓣 寃��깋�븯�뒗 method �옉�꽦
	public Vector<carBean> getAllCar(){
		//由ы꽩 ���엯�쓣 誘몃━ �꽑�뼵
				Vector<carBean> vec = new Vector<>();
				//�뜲�씠�꽣瑜� �떞�쓣 bean �겢�옒�뒪瑜� �꽑�뼵
				//carBean bean = null;
				//DB�젒�냽
				getCon();
				try {
					//荑쇰━臾� �옉�꽦
					String sql = "select * from car";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					//諛섎났臾몄쓣 �궗�슜�븯�뿬 bean �떒�쐞濡� vector�뿉 ���옣�븯湲�
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
						
						//踰≫꽣�뿉 bean �겢�옒�뒪 異붽�
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
	
	//�꽑�깮�맂 �븯�굹�쓽 �옄�룞李� �젙蹂대�� �씫�뼱�삤�뒗 method
	public carBean getOneCarData(int no) {
		//由ы꽩�삎�쓣 �꽑�뼵
		carBean bean = new carBean();
		getCon();
		
		try {
			String sql = "select * from car where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			//寃곌낵瑜� rs�뿉 諛쏆쓬
			rs = pstmt.executeQuery();
			//�븯�굹�쓽 �뜲�씠�꽣留� �씫�쑝誘�濡�
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
	
	//�븯�굹�쓽 �삁�빟 �떒�쐞�뿉 ���븳 �삁�빟 �젙蹂대�� ���옣�븯�뒗 method�옉�꽦
	public void insertCarReservation(CarReserveBean rbean) {
		getCon(); //DB�뿰�룞源뚯� �닔�뻾 
		
		try {
			//�삁�빟踰덊샇�뒗(reserveNo)�뒗 auto_increment 紐⑤뱶 �궗�슜�쑝濡� �옄�룞 �깮�꽦
			String sql = "insert into carReserveTable(user_id, no,name,carQty,rentDuration,startDay,applyInsurance,applyBabySeat,totalPrice) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?�뿉 媛� �븷�떦
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
	//�쉶�썝�쓽 �젋�듃移� �삁�빟 �젙蹂대�� �씫�뼱�삤�뒗 method
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
