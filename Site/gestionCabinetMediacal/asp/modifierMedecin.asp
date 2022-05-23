<%
 Option Explicit
 Dim con,rec,id ,nom,prenom,login,email,telephone, pass1,pass2
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 
   con.open "SDN"
    id =Request.form("id")
    nom=Request.form("nom")
    prenom=Request.form("prenom")
    telephone=Request.form("telephone")
    email=Request.form("email")
    login=Request.form("login")
    pass1=Request.form("pass1")
    pass2=Request.form("pass2")
   
    if  pass1 = pass2 Then
      con.execute("exec Medecin_Modefier_Compte '"&id&"', '"& nom &"', '" & prenom & "', '" & telephone & "', '" & email & "','" & login & "','" & pass1 & "'")
     ' Response.Redirect "medecinProfil.asp?i="& id
    else
                
                Response.Redirect "medecinProfil.asp?i="& id
     end if
   
%>