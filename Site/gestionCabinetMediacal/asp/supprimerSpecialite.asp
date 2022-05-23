<%
 Option Explicit
 Dim nom,con,rec,rs
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 con.open "SDN"
  nom=Request.form("specialite")
  Set rs = con.execute("select idSpecialite from TSpecialite where nomSpecialite like '"&nom&"'")
     
        con.execute("Delete from TSpecialite where idSpecialite like '"&rs(0)&"'")
        Response.Redirect "MenuAdmin.asp?id=1"
%>