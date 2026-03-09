<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>BATTLE</title>
		<link rel="stylesheet" href="./css1.css">
	</head>
	
	<body>
		<%
			String[] p_at_name = {"木の剣","石の剣","鉄の剣"}; //武器名
			String[] p_df_name = {"木の盾","石の盾","鉄の盾"}; //防具名
			String[] en_name = {"ｽﾗｲﾑ","ﾄﾞﾗｺﾞﾝ","ｲﾀﾁｬﾝ"}; //敵キャラ名
			int[] p_at_l = {3,2,1}; //攻撃力の最低値
			int[] p_at_h = {5,6,8}; //攻撃力の最高値
			int[] p_df_l = {3,2,1}; //防御力の最低値
			int[] p_df_h = {5,6,7}; //防御力の最高値
			int[] en_at_l = {1,3,5}; //敵の攻撃力の最低値
			int[] en_at_h = {5,7,10}; //敵の攻撃力の最高値
			int[] en_hp = {10,10,10}; //敵の体力
			
			int p_hp = 10; //プレイヤーの体力
			
			int iat = (Integer)session.getAttribute("iat"); //選択した武器の添字
			int idf = (Integer)session.getAttribute("idf"); //選択した防具の添字
			int ien = Integer.parseInt(request.getParameter("ien")); //選択した敵キャラの添字
			
			//セッションに各値をセット
			session.setAttribute("p_at_l", p_at_l[iat]);
			session.setAttribute("p_at_h", p_at_h[iat]);
			
			session.setAttribute("p_df_l", p_df_l[idf]);
			session.setAttribute("p_df_h", p_df_h[idf]);
			
			session.setAttribute("ien", ien);
			session.setAttribute("en_at_l", en_at_l[ien]);
			session.setAttribute("en_at_h", en_at_h[ien]);
			session.setAttribute("en_name", en_name[ien]);
			
			session.setAttribute("en_p", 0); //敵の行動パターン(初期値は0。以降は0か1のランダム)
			
			session.setAttribute("p_hp", p_hp);
			session.setAttribute("en_hp", en_hp[ien]);
			
			session.setAttribute("p_at", 0); //処理で使う為の攻撃力
			session.setAttribute("p_df", 0); //処理で使う為の防御力
			session.setAttribute("p_heal", 0); //処理で使う為の回復量
			session.setAttribute("en_at", 0); //処理で使う為の敵攻撃力
			
			session.setAttribute("flg", 0); //敵の防御フラグ
			
			session.setAttribute("p", 0); //battle_start.jspから遷移するページ番号（重複して引き算等の処理をしない為）
		%>
		
		<header>
			<img src="./images/title.png" alt="タイトルの画像">
		</header>
		
		<form action = "./battle_0.jsp" method="post">
			<div class="img">
				<div class="eimg">
					<img src="./images/en<%= ien %>.png">
					<br>
					<img src="./images/hp<%= en_hp[ien] %>.png">
				</div>
				<div class="pimg">
					<img src="./images/p<%= idf %>.png">
					<img src="./images/ken<%= iat %>.png">
					<img src="./images/hp<%= p_hp %>.png">
				</div>
			</div>
			
			<p>
				<%= en_name[ien] %>が現れた。
			</p>
			
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