<%@page import="java.io.File"%>
<%@page import="java.util.Vector"%>
<%@page import="model.carBean"%>
<%@page import="model.carDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	
<%  
	request.setCharacterEncoding("utf-8");
	//프로젝트가 만들어지는 폴더를 저장할 이름 변수
	String realfolder="";
	//실제 만들어질 폴더명을 설정
	String savefolder = "/images";
	
	String encType = "utf-8";
	int maxSize = 1024*1024*10; //최대 10MB 파일 처리 가능
	
	//프로젝트의 실제 경로값을 읽어와 경로를 지정하는 코드
	ServletContext context = getServletContext();
	realfolder = context.getRealPath(savefolder);
	
	try{
		//클라이언트로부터 넘어온 데이터를 제장해주는 객체
		MultipartRequest multi = new MultipartRequest(request, realfolder, 
					maxSize, encType,
					new DefaultFileRenamePolicy()); //겹칠시 파일이름 자동 변경
					//파일 덮어 쓰기를 원할 경우에는 
					//,	new DefaultFileRenamePolicy() 부분을 삭제하면 됨
		//현재는 한개의 파일만을 다루고 있음.
		Enumeration onefile = multi.getFileNames();
		String file1 = (String)onefile.nextElement();
		String filename1 = multi.getFilesystemName(file1); //저장된 실제파일 이름
		
		//carUploadForm으로부터 전달받은 파라미터 
		String name = multi.getParameter("name");
		String company = multi.getParameter("company");
		String category = multi.getParameter("category");
		int passengers = Integer.parseInt(multi.getParameter("passengers"));
		String fuel = multi.getParameter("fuel");
		int cc = Integer.parseInt(multi.getParameter("cc"));
		int price = Integer.parseInt(multi.getParameter("price")); //렌트비
		String imgfile = filename1; //실제 저장된 파일 이름을 db에 저장
		String info = multi.getParameter("info");
		//위에서 작업한 것은 carBean에 담음.
		
		carBean cbean = new carBean();
		cbean.setName(name);
		cbean.setCompany(company);
		cbean.setCategory(category);
		cbean.setPassengers(passengers);
		cbean.setFuel(fuel);
		cbean.setCc(cc);
		cbean.setPrice(price);
		cbean.setImgfile(imgfile);
		cbean.setInfo(info);
		
		//carDb에 저장해야 함.
		carDAO cdao = new carDAO();
		cdao.insertOneCarRegistration(cbean); 
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<div align="center" style="width:1200px; height:500px;">
<h2>자동차 등록을 완료하였습니다.</h2>
<a href="index.jsp">메인으로 가기</a><br><br>
<h3>여러분의 필요에 맞게 적절히 수정하여 사용하시기 바랍니다.</h3>
<%
	carDAO vdao = new carDAO();
	Vector<carBean> vec = vdao.allSlectMember();
%>
<table align="center" border="1">
<caption>등록된 차량 리스트</caption>
	<%
		for(int i=0; i<vec.size(); i++) {
			carBean bean = vec.get(i);//벡터에 담긴 빈클래스를 하나씩 추출함
	%>
        <tr>
            <th></th>
            <th>name</th>
            <th>author</th>
            <th>category</th>	
            <th>keyword</th>
            <th>fuel</th>
            <th>cc</th>
			<th>price</th>
			<th>info</th>
			<th>image</th>
        </tr>
        <tr>
            <th><%=bean.getNo() %></th>
            <td><%=bean.getName() %></td>
            <td><%=bean.getCompany() %></td>
            <td><%=bean.getCategory() %></td>
		 	<td><%=bean.getPassengers() %></td>
			<td><%=bean.getFuel() %></td>
			<td><%=bean.getCc() %></td>
			<td><%=bean.getPrice() %></td>
			<td><%=bean.getInfo() %></td>
			<td width="100"><img src="images/<%=bean.getImgfile() %>" width="80"></td>
        </tr>
	<%
	
		} %>	 

</table>
</div>
</body>
</html>