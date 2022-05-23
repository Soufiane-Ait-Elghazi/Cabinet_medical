<%
 Option Explicit
 Dim nom,con,rec
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
  con.open "SDN"
     nom=Request.form("nom")
        con.execute("exec Ajouter_Specialite 'id','"&nom&"'")
        Response.Redirect "MenuAdmin.asp?id=1"
%>