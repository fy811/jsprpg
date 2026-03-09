<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>SELECT_WEAPON</title>
		<link rel="stylesheet" href="./css1.css">
	</head>
	
	<body>
		<header>
			<img src="./images/title.png" alt="タイトルの画像">
		</header>
		
		<form action = "./select_armor.jsp" method="post">
			<div class="img">
				<div class="center">
					<img src="./images/ken.png" alt="3つの剣の画像">
				</div>
			</div>
			
			<p>武器を選択してください。</p>
			
			<div class="tabmenu">
				<label>
					<input type="radio" name="iat" value="0" checked>
					<em>木の剣</em>
					<span>攻撃力：3～5<br><br>基本の武器</span>
				</label>
				<label>
					<input type="radio" name="iat" value="1">
					<em>石の剣</em>
					<span>攻撃力：2～6<br><br>攻撃力の幅が少し広がった扱いやすい武器</span>
				</label>
				<label>
					<input type="radio" name="iat" value="2">
					<em>鉄の剣</em>
					<span>攻撃力：1～8<br><br>強い攻撃を出せるが、弱い攻撃も出る武器</span>
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