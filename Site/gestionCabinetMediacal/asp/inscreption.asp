<%
 Option Explicit
 Dim nom,prenom,dateNaissance,telephone,mail,login,password,confPassword,con,rec
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
  con.open "SDN"
    
     nom=Request.form("nom")
     prenom=Request.form("prenom")
     dateNaissance=Request.form("dateNaissance")
     telephone=Request.form("telephone")
     mail=Request.form("mail")
     login=Request.form("login")
     password=Request.form("password")
     confPassword=Request.form("confPassword")
     'Response.Write "Connected OK    "
     if password = confPassword Then
        con.execute("execute Patient_sinscrire 'id', '"& nom &"', '" & prenom & "','"&dateNaissance&"', '" & telephone & "', '" & mail & "','" & login & "','" & password & "'")
        Response.Redirect "authentification.html"
    else 
        Response.Redirect "inscreption.html"
    end if
%>
