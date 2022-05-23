<%
 Option Explicit
 Dim date,con,rec,rs
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 con.open "SDN"
  date=Request.form("date")
        Set rs = con.execute("exec Admin_Consl_StatistiqueGlobal")
        Response.Redirect "MenuAdmin.asp?id=1&nbrG="&rs(0)&"&CACG="&rs(1)&"#demo3"
%>