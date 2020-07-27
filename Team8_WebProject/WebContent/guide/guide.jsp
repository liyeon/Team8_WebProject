<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="content">
	<h1>이용안내</h1>
	<h2>운영시간</h2>
	<p>매일 10:30~21:00</p><br />
		<ul>
			<li>에이멍은 연중 무휴로 운영됩니다.</li>
			<li>독파크를 제외한 모든 서비스는 100% 예약제로 운영됩니다.</li>
			<li>호텔은 사전예약 시 8시부터 입실이 가능합니다.(사전예약 필수)</li>
			<li>사전입실 시 개인 상담이 어려우니 양해해 주시기 바랍니다.</li>
		</ul>
	<h2>상담문의</h2>
	<p>예약 및 상담시간 08:00 ~ 20:00</p>
		<ul>
			<li>에이멍 1111-2222</li>
		</ul>
	<h2>안내사항</h2>
	<p>이용 시 주의사항</p><br />
		<ul>
			<li>
				1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은  반려견은 입실이 제한됩니다.
				<br>* 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.
			</li>
			<li>
				1살 미만의 반려견인 경우 항체 검사가 필수 입니다.
				<br>(단, 1살 이상 시 재접종 기록 확인)
			</li>
			<li>생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.</li>
			<li>
				펫택시 이용 시, 별도의 예약이 필요합니다.
				<br>(* 픽업 서비스 페이지 참고)
			</li>
		</ul>
	<h2>오시는 길</h2>
	<p>바우라움 위치</p><br />
		<ul>
			<li><i class="far fa-compass"></i>
				서울특별시 강남구 테헤란로 124 삼원타워 (1층 우리은행 건물)
				<br />※ 주차안내 : 평일주차 무료, 주말주차 30분 무료(이후 10분 당 500원)
			</li>
			<li><i class="fas fa-subway"></i>
				지하철 이용 시
				<br /><br />2호선 (강남 1번출구, 역삼 3번출구) , 도보 10분
				<br />신분당선(강남)
			</li>
		</ul>
</div>

<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cdd137b0b885c589d0ff1e9d01738a4"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울 강남구 테헤란로 124 삼원타워 5층', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">Amung</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>