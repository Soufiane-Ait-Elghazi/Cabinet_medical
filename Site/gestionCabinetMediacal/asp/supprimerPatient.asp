<%
 Option Explicit
 Dim idPat,con,rec
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 con.open "SDN"
  idPat=Request.QueryString("idPat")
        con.execute("Delete from TPatient where idPatient = '"&idPat&"'")
        Response.Redirect "MenuAdmin.asp?id=1#demo1"
%>