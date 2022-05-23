<%
 Option Explicit
 Dim con,rec,id ,nom,prenom,dateNaissance,login,email,telephone, pass1,pass2
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 
   con.open "SDN"
    id =Request.form("id")
    nom=Request.form("nom")
    prenom=Request.form("prenom")
    telephone=Request.form("telephone")
    dateNaissance=Request.form("dateNaissance")
    login=Request.form("login")
    email=Request.form("email")
    pass1=Request.form("pass1")
    pass2=Request.form("pass2")
   
   
     if  pass1 = pass2 Then
                
                con.execute("exec Patient_Modefier_Compte '"&id&"', '"& nom &"', '" & prenom & "','"&dateNaissance&"', '" & telephone & "', '" & email & "','" & login & "','" & pass1 & "'")
                ' Response.Redirect "Profil.asp?i="& id

     else
                
                Response.Redirect "Profil.asp?i="& id
     end if
   
%>