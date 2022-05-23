<%
 Option Explicit
 Dim date,con,rec,rs
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
 con.open "SDN"
  date=Request.form("date")
        Set rs = con.execute("exec Admin_Consl_StatistiquePrJr '"&date&"'")
        Response.Redirect "MenuAdmin.asp?id=1&nbr="&rs(0)&"&CAC="&rs(1)&"#demo2"
%>