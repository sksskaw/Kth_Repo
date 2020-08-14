package model;

public class CarReserveBean {
	private int reserveNo; //차량 예약번호
	private String user_id; //예약자의 사용자 id
	private int no;  //DB에 할당된 고유의 no[등록차량의 no(번호)]
	private String name; //차량명
	private int carQty;  //대여 수량
	private int rentDuration; //차량대여기간
	private String startDay; //대여 시작일[Date변수를 쓸수도 있음. 복잡함.]
	private int applyInsurance; //보험가입여부
	private int applyBabySeat; //베이비 시트 사용여부
	private int totalPrice;  //총렌트 비용
	//네비게이션은 모든 차량에 기본 지원하는 것으로 가정하였으므로 포함하지 않음.
	
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCarQty() {
		return carQty;
	}
	public void setCarQty(int carQty) {
		this.carQty = carQty;
	}
	public int getRentDuration() {
		return rentDuration;
	}
	public void setRentDuration(int rentDuration) {
		this.rentDuration = rentDuration;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public int getApplyInsurance() {
		return applyInsurance;
	}
	public void setApplyInsurance(int applyInsurance) {
		this.applyInsurance = applyInsurance;
	}
	public int getApplyBabySeat() {
		return applyBabySeat;
	}
	public void setApplyBabySeat(int applyBabySeat) {
		this.applyBabySeat = applyBabySeat;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
}
