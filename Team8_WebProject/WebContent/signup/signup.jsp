<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//사람
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email01")+"@"+request.getParameter("email02");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String profile = request.getParameter("profile");
	if(profile.equals("null")){
		profile=null;
	}
	
	//강아지
	String dname = request.getParameter("dname");
	int dage = Integer.parseInt(request.getParameter("dage"));
	String breed = request.getParameter("breed");
	String weight = request.getParameter("weight");
	String neutral = request.getParameter("neutral");
	String gender = request.getParameter("gender");
	String memo = request.getParameter("memo");
	
	MemberDto dto = new MemberDto();
	//사람
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setProfile(profile);
	//강아지
	dto.setMember_id(id);
	dto.setDname(dname);
	dto.setDage(dage);
	dto.setBreed(breed);
	dto.setWeight(weight);
	dto.setNeutral(neutral);
	dto.setGender(gender);
	dto.setMemo(memo);
	
	boolean isSuccess1 = MemberDao.getInstance().insertHuman(dto);
	boolean isSuccess2 = MemberDao.getInstance().insertDog(dto);
	
	MemberDto dto2 = MemberDao.getInstance().getData(id);
%>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="content">

	<div class="icon-wrap">
		<% if(isSuccess1 && isSuccess2){%>
		<i class="fas fa-lock-open"></i>
		<p class="form-span m20">
			<strong>THANKS</strong>
		</p>
		<p class="form-span m20">
			<%=dto.getName() %>님 회원가입이 완료되었습니다.
		</p>
		<div class="center">
			<table class="table-wrap" style="width : auto!important;">
				<colgroup>
					<col />
					<col width="117px;" />
					<col />
				</colgroup>
				<tr>
					<td rowspan="3" class="bbn">
						<div class="profile-img">
							<%if(dto2.getProfile()==null || dto2.getProfile().equals("null")){ %>
								<img id="profileImage" src="${pageContext.request.contextPath }/include/img/icon_user.png"/>
							<%}else{ %>
								<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile() %>"/>
							<%} %>
               			</div>
					</td>
					<th>아이디</th>
					<td><%=dto.getId() %></td>
				</tr>
				<tr>
					<th>성함</th>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="bbn"><%=dto.getEmail() %></td>
				</tr>
			</table>
		</div>
		<a href="../index.jsp" class="btn-default mt20">GO HOME</a>
		<% }else{%>
		<i class="fas fa-lock"></i>
		<p class="form-span m20">
			<strong>회원가입을 실패했습니다.</strong>
		</p>
		<a href="../index.jsp" class="btn-default">GO HOME</a>
		<% }%>
	</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
