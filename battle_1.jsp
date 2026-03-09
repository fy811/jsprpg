<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>BATTLE</title>
		<link rel="stylesheet" href="./css1.css">
	</head>
	
	<body>
		<%
			int p = (Integer)session.getAttribute("p"); //現在のページ番号
			
			int iat = (Integer)session.getAttribute("iat"); //選択した武器の添字
			int p_at_l = (Integer)session.getAttribute("p_at_l"); //攻撃力の最低値
			int p_at_h = (Integer)session.getAttribute("p_at_h"); //攻撃力の最高値
			
			int idf = (Integer)session.getAttribute("idf"); //選択した防具の添字
			int p_df_l = (Integer)session.getAttribute("p_df_l"); //防御力の最低値
			int p_df_h = (Integer)session.getAttribute("p_df_h"); //防御力の最高値
			
			int ien  = (Integer)session.getAttribute("ien"); //選択した敵キャラの添字
			int en_at_l = (Integer)session.getAttribute("en_at_l"); //敵の攻撃力の最低値
			int en_at_h = (Integer)session.getAttribute("en_at_h"); //敵の攻撃力の最高値
			String en_name = (String)session.getAttribute("en_name"); //敵キャラ名
			
			int en_p = (Integer)session.getAttribute("en_p"); //敵の行動パターン
			
			int p_hp = (Integer)session.getAttribute("p_hp"); //プレイヤーの体力
			int en_hp = (Integer)session.getAttribute("en_hp"); //敵の体力
			
			int act = Integer.parseInt(request.getParameter("act")); //プレイヤーが選択した行動
			
			int p_at = (Integer)session.getAttribute("p_at"); //再ロード用プレイヤー攻撃力
			int p_df = (Integer)session.getAttribute("p_df"); //再ロード用プレイヤー防御力
			int p_heal = (Integer)session.getAttribute("p_heal"); //再ロード用プレイヤー回復力
			int en_at = (Integer)session.getAttribute("en_at"); //再ロード用敵攻撃力
			
			int flg = (Integer)session.getAttribute("flg"); //敵の防御選択用フラグ
			
			if(p == 1) //一度だけ処理を行う
			{
				p_at = (int)(Math.random() * (p_at_h - p_at_l + 1)) + p_at_l; //攻撃力を最低値～最高値からランダムに決定
				p_df = (int)(Math.random() * (p_df_h - p_df_l + 1)) + p_df_l; //防御力を最低値～最高値からランダムに決定
				p_heal = (int)(Math.random() * 3) + 1; //回復量を最低値～最高値からランダムに決定
				en_at = (int)(Math.random() * (en_at_h - en_at_l + 1))+ en_at_l; //敵攻撃力を最低値～最高値からランダムに決定
				
				session.setAttribute("p_df", 0); //防御値をリセット
				
				if(flg == 1) //敵が防御の選択をしていた時
				{
					p_at = 1; //プレイヤーの攻撃力を1に
					session.setAttribute("flg", 0);
				}
				
				if(act == 0) //プレイヤーが攻撃を選択した時
				{
					en_hp = en_hp - p_at; //敵体力の計算
					
					if(en_hp <= 0) //HPバーの画像を体力(0～10の整数)で管理している為、負値になった場合に0にする
					{
						en_hp = 0;
					}
				}
				else if(act == 1) //プレイヤーが防御を選択した時
				{
					session.setAttribute("p_df", p_df); //防御値をセット
				}
				else //プレイヤーが回復を選択した時
				{
					p_hp = p_hp + p_heal; //プレイヤー体力の計算
					
					if(p_hp >= 11) //HPの上限は10なので、超えた場合10にする。
					{
						p_hp = 10;
					}
				}
				
				//どのページに移動するかの決定
				p = 2; //敵の行動パターンが0ならページ2へ（敵が攻撃してくる）
				
				if(en_p == 1) //敵の行動パターンが1ならページ3へ（敵が防御してくる）
				{
					p = 3;
				}
				
				if(en_hp == 0) //敵の体力が0ならページ5へ（プレイヤー勝利）
				{
					p = 5;
				}
				
				en_p = (int)(Math.random() * 1.5); //敵の行動パターンの再抽選（攻撃 : 防御 = 2 : 1）
				
				//変更する（した）情報を更新
				session.setAttribute("p_at", p_at); //プレイヤー攻撃力
				session.setAttribute("p_heal", p_heal); //プレイヤー回復力
				session.setAttribute("p_hp", p_hp); //プレイヤー体力
				session.setAttribute("en_hp", en_hp); //敵体力
				session.setAttribute("en_p", en_p); //敵行動パターン
				session.setAttribute("en_at", en_at); //敵攻撃力
				session.setAttribute("p", p); //遷移するページ
			}
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
			<%
				if(act == 0) //プレイヤーが攻撃を選択した時
				{
			%>
			
			ﾌﾟﾚｲﾔｰの攻撃。<%= en_name %>に<%= p_at %>のﾀﾞﾒｰｼﾞ。
			
			<%
				}
				else if(act == 1) //プレイヤーが防御を選択した時
				{
			%>
			
			ﾌﾟﾚｲﾔｰの防御態勢。<%= p_df %>の防御値を得た。
			
			<%
				}
				else //プレイヤーが回復を選択した時
				{
			%>
			
			ﾌﾟﾚｲﾔｰは回復魔法を唱えた。HPが<%= p_heal %>回復。
			
			<%
				}
			%>
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