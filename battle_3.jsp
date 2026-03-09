<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>BATTLE</title>
		<link rel="stylesheet" href="./css1.css">
	</head>
	
	<body>
		<%
			int iat = (Integer)session.getAttribute("iat"); //選択した武器の添字
			
			int idf = (Integer)session.getAttribute("idf"); //選択した防具の添字
			
			int ien  = (Integer)session.getAttribute("ien"); //選択した敵キャラの添字
			String en_name = (String)session.getAttribute("en_name"); //敵キャラ名
			
			int p_hp = (Integer)session.getAttribute("p_hp"); //プレイヤーの体力
			int en_hp = (Integer)session.getAttribute("en_hp"); //敵の体力
			
			session.setAttribute("p", 0);
			session.setAttribute("flg", 1); //敵の防御フラグ
		%>
		
		<header>
			<img src="./images/title.png" alt="タイトルの画像">
		</header>
		
		<div class="img">
			<div class="eimg">
				<img src="./images/en<%= ien %>.png">
				<br>
				<img src="./images/hp<%= en_hp %>.png">
			</div>
			<div class="pimg">
				<img src="./images/p<%= idf %>.png">
				<img src="./images/ken<%= iat %>.png">
				<img src="./images/hp<%= p_hp %>.png">
			</div>
		</div>
		
		<p>
			<%= en_name %>は防御態勢に入った。
		</p>
		
		<form action = "./battle_0.jsp" method="post">
			<div class="tabmenu">
				<label>
					<input type="radio" disabled="disabled" checked>
					<em>&emsp;</em><span></span>
				</label>
				<label>
					<input type="radio" disabled="disabled">
					<em>&emsp;</em><span></span>
				</label>
				<label>
					<input type="radio" disabled="disabled">
					<em>&emsp;</em><span></span>
				</label>
				<label>
					<input type="radio" disabled="disabled">
					<em>&emsp;</em>
					<span></span>
				</label>
				<input type="submit" value="次へ">
			</div>
		</form>
	</body>
</html>