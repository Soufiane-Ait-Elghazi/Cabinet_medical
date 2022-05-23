<%
 Option Explicit
 Dim nom,prenom,telephone,email,login,password,confPassword,con,rec,nmsp,rs
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
  con.open "SDN"
 Set nmsp=Request.form("sp")
   Response.Write "this is nmsp "&nmsp
    Set rs = con.execute("select idSpecialite from TSpecialite where nomSpecialite like '"&nmsp&"'")
   Response.Write "this is rs(0) "&rs(0)
     nom=Request.form("nom")
     prenom=Request.form("prenom")
     telephone=Request.form("telephone")
     email=Request.form("email")
     login=Request.form("login")
     password=Request.form("pass1")
     confPassword=Request.form("pass2")
     'Response.Write "Connected OK    "
     if password = confPassword Then
    
        con.execute("execute Ajouter_Medecin 'id', '"& rs(0) &"', '"& nom &"', '" & prenom & "', '" & telephone & "', '" & email & "','" & login & "','" & password & "'")
         Response.Redirect "MenuAdmin.asp?id=1"
       
    else 
        Response.Redirect "MenuAdmin.asp?id=1"
    end if
%>