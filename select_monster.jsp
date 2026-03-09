<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>SELECT_MONSTER</title>
		<link rel="stylesheet" href="./css1.css">
	</head>
	
	<body>
		<%
			session.setAttribute("idf", Integer.parseInt(request.getParameter("idf")));
		%>
		
		<header>
			<img src="./images/title.png" alt="タイトルの画像">
		</header>
		
		<form action = "./battle_start.jsp" method="post">
			<div class="img">
				<div class="center">
					<img src="./images/en4.png" alt="スライムのシルエットの画像">
				</div>
			</div>
			
			<p>戦う敵を選択してください。</p>
			
			<div class="tabmenu">
				<label>
					<input type="radio" name="ien" value="0" checked>
					<em>ｽﾗｲﾑ</em><span>HP：10<br><br>攻撃力：1～5</span>
				</label>
				<label>
					<input type="radio" name="ien" value="1">
					<em>ﾄﾞﾗｺﾞﾝ</em><span>HP：10<br><br>攻撃力：3～7</span>
				</label>
				<label>
					<input type="radio" name="ien" value="2">
					<em>???</em><span>HP：10<br><br>攻撃力：5～10</span>
				</label>
				<label>
					<input type="radio" disabled="disabled">
					<em>&emsp;</em>
					<span></span>
				</label>
				<input type="submit" value="決定">
			</div>
		</form>
	</body>
</html>