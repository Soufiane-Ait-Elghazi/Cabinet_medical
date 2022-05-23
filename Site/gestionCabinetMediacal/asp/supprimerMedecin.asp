<%
 Option Explicit
 Dim idMed,con,rec
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 con.open "SDN"
  idMed=Request.QueryString("idMed")
        con.execute("Delete from TMedecin where idMedecin = '"&idMed&"'")
        Response.Redirect "MenuAdmin.asp?id=1#demo"
%>