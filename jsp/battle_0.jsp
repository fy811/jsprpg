<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>BATTLE</title>
		<link rel="stylesheet" href="../css/main.css">
	</head>
	
	<body>
		<%
			//必要な情報をセッションから取得
			int p = (Integer)session.getAttribute("p"); //現在のページ番号
			
			int iat = (Integer)session.getAttribute("iat"); //選択した武器の添字
			int p_at_l = (Integer)session.getAttribute("p_at_l"); //攻撃力の最低値
			int p_at_h = (Integer)session.getAttribute("p_at_h"); //攻撃力の最高値
			
			int idf = (Integer)session.getAttribute("idf"); //選択した防具の添字
			int p_df_l = (Integer)session.getAttribute("p_df_l"); //防御力の最低値
			int p_df_h = (Integer)session.getAttribute("p_df_h"); //防御力の最高値
			
			int ien  = (Integer)session.getAttribute("ien"); //選択した敵キャラの添字
			String en_name = (String)session.getAttribute("en_name"); //敵キャラ名
			
			int en_p = (Integer)session.getAttribute("en_p"); //敵の行動パターン
			
			int p_hp = (Integer)session.getAttribute("p_hp"); //プレイヤーの体力
			int en_hp = (Integer)session.getAttribute("en_hp"); //敵の体力
			
			if(p == 0) //一度だけ処理をする
			{
				session.setAttribute("p", 1); //遷移するページ
			}
		%>
		
		<header>
			<img src="../images/title.png" alt="タイトルの画像">
		</header>
		
		<div class="img">
			<div class="eimg">
				<img src="../images/en<%= ien %>.png">
				<br>
				<img src="../images/hp<%= en_hp %>.png">
			</div>
			<div class="pimg">
				<img src="../images/p<%= idf %>.png">
				<img src="../images/ken<%= iat %>.png">
				<img src="../images/hp<%= p_hp %>.png">
			</div>
		</div>
		
		<p>
			<%
				if(en_p == 0) //最初の行動は必ず攻撃になるように設定
				{
			%>
			
			<%= en_name %>は、攻撃しようとしている。
			
			<%
				}
				else
				{
			%>
			
			<%= en_name %>は、防御しようとしている。
			
			<%
				}
			%>
		</p>
		
		<form action = "./battle_1.jsp" method="post">
			<div class="tabmenu">
				<label>
					<input type="radio" name="act" value="0" checked>
					<em>攻撃</em><span>攻撃力：<%= p_at_l %>～<%= p_at_h %></span>
				</label>
				<label>
					<input type="radio" name="act" value="1" >
					<em>防御</em><span>防御力：<%= p_df_l %>～<%= p_df_h %></span>
				</label>
				<label>
					<input type="radio" name="act" value="2" >
					<em>回復</em><span>回復力：1～3</span>
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