<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> mySalaryList = null;
mySalaryList = (List<Map<String, Object>>) request.getAttribute("mySalary");
Map<String, Object> mySalary = mySalaryList.get(1);
int sal_no = 0;
int sal_date = 0;
int sal_base = 0;
int sal_incentive = 0;
int sal_position = 0;
int sal_tech = 0;
int sal_etc = 0;
int sal_meal = 0;
int sal_commu = 0;
int sal_payment = 0;
int sal_nation_pension = 0;
int sal_health = 0;
int sal_industrial_insurance = 0;
int sal_employ_insurance = 0;
int sal_income_tax = 0;
int sal_local_tax = 0;
int sal_deduction_etc = 0;
int sal_deductions = 0;
int sal_total = 0;
if (mySalary != null) {
	if(mySalary.get("SAL_NO") != null) sal_no = Integer.parseInt(mySalary.get("SAL_NO").toString());
	if(mySalary.get("SAL_BASE") != null) sal_base = Integer.parseInt(mySalary.get("SAL_BASE").toString());
	if(mySalary.get("SAL_INCENTIVE") != null) sal_incentive = Integer.parseInt(mySalary.get("SAL_INCENTIVE").toString());
	if(mySalary.get("SAL_POSITION") != null)sal_position = Integer.parseInt(mySalary.get("SAL_POSITION").toString());
	if(mySalary.get("SAL_TECH") != null)sal_tech = Integer.parseInt(mySalary.get("SAL_TECH").toString());
	if(mySalary.get("SAL_ETC") != null)sal_etc = Integer.parseInt(mySalary.get("SAL_ETC").toString());
	if(mySalary.get("SAL_MEAL") != null)sal_meal = Integer.parseInt(mySalary.get("SAL_MEAL").toString());
	if(mySalary.get("SAL_COMMU") != null)sal_commu = Integer.parseInt(mySalary.get("SAL_COMMU").toString());
	if(mySalary.get("SAL_PAYMENT") != null)sal_payment = Integer.parseInt(mySalary.get("SAL_PAYMENT").toString());
	if(mySalary.get("SAL_NATION_PENSION") != null)sal_nation_pension = Integer.parseInt(mySalary.get("SAL_NATION_PENSION").toString());
	if(mySalary.get("SAL_HEALTH") != null)sal_health = Integer.parseInt(mySalary.get("SAL_HEALTH").toString());
	if(mySalary.get("SAL_INDUSTRIAL_INSURANCE") != null)sal_industrial_insurance = Integer.parseInt(mySalary.get("SAL_INDUSTRIAL_INSURANCE").toString());
	if(mySalary.get("SAL_EMPLOY_INSURANCE") != null)sal_employ_insurance = Integer.parseInt(mySalary.get("SAL_EMPLOY_INSURANCE").toString());
	if(mySalary.get("SAL_INCOME_TAX") != null)sal_income_tax = Integer.parseInt(mySalary.get("SAL_INCOME_TAX").toString());
	if(mySalary.get("SAL_LOCAL_TAX") != null)sal_local_tax = Integer.parseInt(mySalary.get("SAL_LOCAL_TAX").toString());
	if(mySalary.get("SAL_DEDUCTION_ETC") != null)sal_deduction_etc = Integer.parseInt(mySalary.get("SAL_DEDUCTION_ETC").toString());
	if(mySalary.get("SAL_DEDUCTIONS") != null)sal_deductions = Integer.parseInt(mySalary.get("SAL_DEDUCTIONS").toString());
	if(mySalary.get("SAL_TOTAL") != null)sal_total = Integer.parseInt(mySalary.get("SAL_TOTAL").toString());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script type="text/javascript">
$.ajax({
	  type:"post",
	  //type:"get"
	  data:{"project_type":typeTarget,"project_startline":startTarget
		  ,"project_deadline":endTarget,"project_name":nameTarget},
	  url: "/projecthistory/getProjectListProc.src1",
	  //data:{"dept":개발부} getparameter("dept")
	  dataType:"json",
        success:function(data){
      	  searchResult(data);
	       },
        error:function(e){
      	  let x = e.responseXML;
      	  alert("fail ===> "+e)
        }
}); 

function searchMySalary() {
	$('#input-group').submit();
};
</script>
<title>MyPage - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
	<nav id="topNav"></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"></div>
		<div id="layoutSidenav_content">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title"
						style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>내 급여 조회</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="container">
							<div class="col">
								<div style="text-align: right; padding: 5px;">
									<!-- <button class="btn btn-success" id="getYearSalary" onclick="openPopup()">연간  급여 조회</button> -->
									<button class="btn btn-success" id="retirementCalc"
										data-toggle="modal" data-target="#mod_addEmp">퇴직금 계산기</button>
								</div>
								<div class="row">
									
									<div class="row"></div>
									<div class="col-lg-12">
										<br>
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 50%">
												<h5>급여 상세 내역</h5>
											</span> <select class="form-control" name="year"
												id="yearSearch">
												<option selected>2021</option>
											</select> <select class="form-control" name="month"
												id="monthSearch">
												<option selected>06</option>
											</select>
											<button class="btn btn-light" onclick="javascript:searchMySalary()">검색</button>
										</div>
										<table class="table table-bordered table-hover table-striped"
											id="testTable" id="table" data-toggle="table"
											data-height="650" data-search="true" data-show-columns="true"
											data-method="post" data-pagination="true"
											data-url="./member.json">
											<thead>
												<tr class="thead-dark">
													<th><h6>지급항목</h6></th>
													<th><h6>지급액</h6></th>
													<th><h6>공제항목</h6></th>
													<th><h6>공제액</h6></th>
												</tr>
											</thead>
											<tbody id="monthSalary-tbody">
												<tr>
													<th>기본급</th>
													<th><%=sal_base%></th>
													<th>국민연금</th>
													<th><%=sal_nation_pension%></th>
												</tr>
												<tr>
													<th>성과금</th>
													<th><%=sal_incentive%></th>
													<th>건강보험</th>
													<th><%=sal_health%></th>
												</tr>
												<tr>
													<th>직책수당</th>
													<th><%=sal_position%></th>
													<th>산재보험</th>
													<th><%=sal_industrial_insurance%></th>
												</tr>
												<tr>
													<th>기술수당</th>
													<th><%=sal_tech%></th>
													<th>고용보험</th>
													<th><%=sal_employ_insurance%></th>
												</tr>
												<tr>
													<th>식비</th>
													<th><%=sal_meal%></th>
													<th>소득세</th>
													<th><%=sal_income_tax%></th>
												</tr>
												<tr>
													<th>통신비</th>
													<th><%=sal_commu%></th>
													<th>지방세</th>
													<th><%=sal_local_tax%></th>
												</tr>
												<tr>
													<th>기타수당</th>
													<th><%=sal_etc%></th>
													<th>기타공제</th>
													<th><%=sal_deduction_etc%></th>
												</tr>
												<tr>
													<th>지급액</th>
													<th><%=sal_payment%></th>
													<th>공제액</th>
													<th><%=sal_deductions%></th>
												</tr>
												<tr>
													<th colspan="3">총지급액</th>
													<th><%=sal_total%></th>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
								<!-- 컨텐츠 들어갈내용 끝   -->
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!---------------- 사원검색 Modal 시작 --------------------------------------->
	<div class="modal fade" id="mod_addEmp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">퇴직금 계산기</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"
								style="display: inline-block; width: 40%">입사날짜</span> <input
								type="text" class="form-control" id="emp_hiredte" value="" readonly>
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"
								style="display: inline-block; width: 40%">희망 퇴직날짜</span> <input
								type="date" class="form-control" id="emp_retiredate" value="">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"
								style="display: inline-block; width: 40%">3개월 평균 급여</span> <input
								type="text" class="form-control" id="averageSalary" value="" readonly>
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"
								style="display: inline-block; width: 40%">재직일</span> <input
								type="text" class="form-control" id="workDay" value="" readonly>
						</div>
						<br>
						<h6>예상퇴직금은 직근 3개월 급여 평균 X 재직일수 / 365입니다</h6>
						<h6>퇴직급여 지급기간은 퇴직일 다음달 10일 일괄 지급합니다</h6>
						<br>
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1"
								style="display: inline-block; width: 40%">예상 퇴직금</span> <input
								type="text" class="form-control" id="retirementPay" value="" readonly>
						</div>
						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="calculateSalary()">계산</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
function openPopup(){
	window.open("getYearSalary.jsp", "window_name", "width=1000, height=1000");
}
    var _width = '1050';
    var _height = '1000';
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2);
/* 	window.open('getYearSalary.jsp', 'window_name', 'width=' + _width
				+ ', height=' + _height + ', left=' + _left ); */
    var popupX = (window.screen.width / 2) - (200 / 2);
 // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
 var popupY= (window.screen.height /2) - (300 / 2);
 // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
 
 function calculateSalary(){
	 
 }
</script>
	<!----------------사원검색 Modal 끝 ----------------------------------------------->
	<!-- 슬라이드바 사용할때 필요 -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav.js"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common/js/sideNav.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script src="../common/scripts.js"></script>
</body>
</html>