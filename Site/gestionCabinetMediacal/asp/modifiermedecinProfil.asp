<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profil</title>
<link rel="stylesheet" href="/css/style2.css">
 
</head>
<body>
<%
      				    Dim i
        				i =Request.QueryString("i")
						Dim con,rec,rs
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
						Set rs = con.Execute("select * from TMedecin where idMedecin = "& i &"")
%>
 
	<center>
		<div class="profil">
			<div class="divform">
				<form action="modifierMedecin.asp" method="post">
					<table>
						<tr>
							<td><label for="fname">Nom :</label></td>
							<%
							 Response.write("<td><input type='text' id='fname' name='nom' value='" & rs(2) & "'></td>") 
							%>
						</tr>
						<tr>
							<td><label for="lname">prenom :</label></td>
							<%
							 Response.write("<td><input type='text' id='lname' name='prenom' value='" & rs(3) & "'></td>") 
							%>
						</tr>
						<tr>
							<td><label for="telephone"> Numéro telephone :</label></td>
							<%
							  Response.write("<td><input type='tel' id='telephone' name='telephone' value='" & rs(4) & "'required></td>") 
							%>
						</tr>
						<tr>
							<td><label for="email">Email : </label></td>
							<%
							  Response.write("<td><input type='email' id='email' name='email' value='" & rs(5) & "'required></td>") 
							%>
						</tr>
						
						<tr>
							<td><label for="login">Login :</label></td>
							<%
							  Response.write("<td><input type='text' id='login' name='login' value='" & rs(6) & "'></td>") 
							%>
						</tr>
						<tr>
							<td><label for="pass1">Mot de passe :</label></td>
							<%
							  Response.write("<td><input type='password' id='pass1' name='pass1' value='" & rs(7) & "'required></td>") 
							%>
						</tr>
						<tr>
							<td><label for="pass2">Confirmer mot de passe :</label></td>
							<%
							  Response.write("<td><input type='password' id='pass2' name='pass2' value='" & rs(7) & "'required></td>") 
							%>
						</tr>
						<tr>
							<%
							  Response.write("<td><input type='hidden' ' name='id' value='" & i & "'required></td>") 
							%>
						</tr>
						<tr>
							<td colspan="2"> <center><input type="submit" value="Modifier" onclick="top.location.reload( true )"></center></td>
				    
				</form>
					</table>
				</form>
				
				
                

			</div>

		</div>
</body>
</html>