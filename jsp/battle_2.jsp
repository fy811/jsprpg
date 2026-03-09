<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>BATTLE</title>
		<link rel="stylesheet" href="../css/main.css">
	</head>
	
	<body>
		<%
			int p = (Integer)session.getAttribute("p"); //現在のページ番号
			
			int iat = (Integer)session.getAttribute("iat"); //選択した武器の添字
			
			int idf = (Integer)session.getAttribute("idf"); //選択した防具の添字
			
			int ien  = (Integer)session.getAttribute("ien"); //選択した敵キャラの添字
			String en_name = (String)session.getAttribute("en_name"); //敵キャラ名
			
			int p_hp = (Integer)session.getAttribute("p_hp"); //プレイヤーの体力
			int en_hp = (Integer)session.getAttribute("en_hp"); //敵の体力
			
			int p_df = (Integer)session.getAttribute("p_df"); //再ロード用プレイヤー防御力
			int en_at = (Integer)session.getAttribute("en_at"); //再ロード用敵攻撃力
			
			if(p == 2) //一度だけ処理を行う
			{
				en_at = en_at - p_df; //敵の攻撃力 - プレイヤーの防御力
				
				if(en_at < 0) //敵の攻撃力が負値になった場合0にする
				{
					en_at = 0;
				}
				
				//どのページに移動するかの決定
				p = 0; //初期はページ0へ（プレイヤーの行動選択）
				
				p_hp = p_hp - en_at; //プレイヤーの体力の計算
				
				if(p_hp <= 0) //HPバーの画像を体力(0～10の整数)で管理している為、負値になった場合に0にする
				{
					p_hp = 0;
					p = 4; //プレイヤーの体力が負値の場合ページ4へ（プレイヤー敗北）
				}
				
				
				//変更する（した）情報を更新
				session.setAttribute("p_hp", p_hp);
				session.setAttribute("p", p);
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
			<%= en_name %>の攻撃。ﾌﾟﾚｲﾔｰに<%= en_at %>のﾀﾞﾒｰｼﾞ。
		</p>
		
		<form action = "./battle_<%= p %>.jsp" method="post">
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