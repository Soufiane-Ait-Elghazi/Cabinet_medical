<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <%
        Dim con,rec,ConnString,login,password,rs,x
        Set con=Server.createObject("Adodb.Connection")
        Set rec= Server.CreateObject("Adodb.recordset")
        con.open "SDN"
        login=Request.form("login")
        password=Request.form("password") 
        Set rs = con.Execute("SELECT [dbo].testerLoginMedecin('" & login & "','" & password & "' ) AS test")
   %>
   <table>
   <%
        Do Until rs.EOF
        Response.write("<tr>")
        For each x in rs.fields
                if  x.value = 0 Then
                    Response.Redirect "authentificationMedecin.html"
                else
                    Set rs2 = con.Execute("SELECT idMedecin from TMedecin where loginmedecin like '"& login & "'")
                    Response.Redirect "Medecin.asp?id="& rs2(0)
                end if
        Next
            rs.MoveNext
        Loop 
   %>