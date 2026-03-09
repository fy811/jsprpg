<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>SELECT_ARMOR</title>
		<link rel="stylesheet" href="../css/main.css">
	</head>
	
	<body>
		<%
			session.setAttribute("iat", Integer.parseInt(request.getParameter("iat")));
		%>
		
		<header>
			<img src="../images/title.png" alt="タイトルの画像">
		</header>
		
		<form action = "./select_monster.jsp" method="post">
			<div class="img">
				<div class="center">
					<img src="../images/tate.png" alt="3つの盾の画像">
				</div>
			</div>
			
			<p>防具を選択してください。</p>
			
			<div class="tabmenu">
				<label>
					<input type="radio" name="idf" value="0" checked>
					<em>木の盾</em><span>防御力：3～5<br><br>基本の防具</span>
				</label>
				<label>
					<input type="radio" name="idf" value="1">
					<em>石の盾</em><span>防御力：2～6<br><br>防御値の幅が少し広がった扱いやすい防具</span>
				</label>
				<label>
					<input type="radio" name="idf" value="2">
					<em>鉄の盾</em><span>防御力：1～7<br><br>強い防御力を持つが、弱い防御値も持つ防具</span>
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