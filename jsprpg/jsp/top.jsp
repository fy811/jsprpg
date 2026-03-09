<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>TOP</title>
		<link rel="stylesheet" href="../css/main.css">
	</head>
	
	<body>
		<%
			if(request.getSession(false) != null) //セッションがあれば破棄
			{
				session.invalidate();
			}
		%>
		
		<header>
			<img src="../images/title.png" alt="タイトルの画像">
		</header>
		
		<form action = "./select_weapon.jsp" method="post">
			<div class="img">
				<div class="ita">
					<img src="../images/itachan.png" alt="いたちゃん（板橋校のマスコットキャラ）の画像">
				</div>
			</div>
			
			<p>JSP RPG へようこそ！いたちゃんだよ！</p>
			
			<div class="tabmenu">
				<label>
					<input type="radio" name="jsp" checked>
					<em>説明</em>
					<span>このゲームはJSPを使って作られたよ。
				また、ゲーム内に出てくる画像はexcelを使って描かれているよ。
				ぜひ楽しんでいってね！
					</span>
				</label>
				<label>
					<input type="radio" name="jsp">
					<em>JSP</em>
					<span>JSPとはHTMLの中にJavaのコードを書くことができる、サーバー上で動くプログラムだよ！</span>
				</label>
				<label>
					<input type="radio" name="jsp">
					<em>HTML</em>
					<span>HTMLとはWebページを作成するための基本的な言語だよ！</span>
				</label>
				<label>
					<input type="radio" name="jsp">
					<em>Java</em>
					<span>Javaとはオブジェクト指向のプログラミング言語だよ！</span>
				</label>
				<input type="submit" value="進む">
			</div>
		</form>
		
		<footer>
			<div class="g">
				<br>
				<a href="../../top/front.html">ゲーム選択へ戻る</a>
			</div>
		</footer>
	</body>
</html>