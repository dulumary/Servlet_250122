<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멜롱 - 아이유</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>

<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "https://musicmeta-phinf.pstatic.net/artist/000/112/112579.jpg?type=ff300_300");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/184/184117.jpg?type=r360Fll");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/000/2000240.jpg?type=r360Fll");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/002/559/2559408.jpg?type=r360Fll");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/000/592/592471.jpg?type=r360Fll");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://musicmeta-phinf.pstatic.net/album/003/399/3399860.jpg?type=r360Fll");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
    
    String idString = request.getParameter("id");
   
   String title = request.getParameter("title");
%>

	<div id="wrap">
		<header class="d-flex">
			<div class="logo col-2 d-flex align-items-center">
				<h1 class="text-success">Melong</h1>
			</div>
			<div class="search col-10 d-flex align-items-center">
				<form method="get" action="/jsp/test/test10/detail.jsp" class="col-6">
					<div class="input-group">
					  <input type="text" class="form-control" name="title">
					  <div class="input-group-append">
					    <button class="btn btn-success" type="submit">검색</button>
					  </div>
					</div>
				</form>
			</div>
		</header>
		<nav class="main-menu">
			<ul class="nav font-weight-bold">
				<li class="nav-item"><a class="nav-link text-dark" href="#">멜롱챠트</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">최신음악</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">장르음악</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">멜롱DJ</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="#">뮤직어워드</a></li>
			</ul>
		</nav>
		<section class="contents">
		<% for(Map<String, Object> music:musicList) { 
			
			// id 파라미터가 전달되면, id를 기준으로 일치 조건
			// title 파라미터가 전달되면, title 기준으로 일치조건
			int id = 0;
			if(idString != null) {
				 id = Integer.parseInt(idString);
			}
			
			int musicId = (Integer)music.get("id");
			
			if((id != 0 && musicId == id) || (title != null && title.equals(music.get("title")))) {
			int time = (Integer)music.get("time");
		%>
			<div class="song-info d-flex border border-success p-3">
				<div>
					<img width="200" src="<%= music.get("thumbnail") %>">
				</div>
				<div class="ml-4">
					<div class="display-4"><%= music.get("title") %></div>
					<div class="text-success font-weight-bold"><%= music.get("singer") %></div>
					<div class="small">
						<div>앨범 : <%= music.get("album") %></div>
						<div>재생시간 : <%= time / 60 %> : <%= time % 60 %></div>
						<div>작곡가 : <%= music.get("composer") %></div>
						<div>작사가 : <%= music.get("lyricist") %></div>
					</div>
					
				</div>
			</div>
		<% 
			}
		} %>
			<div class="mt-4">
				<h3>가사</h3>
				<hr>
				<div>가사 정보 없음</div>
			</div>
		</section>
		<footer>
			<hr>
			<div class="text-secondary">Copyright 2025. melong All Rights Reserved.</div>
		</footer>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>