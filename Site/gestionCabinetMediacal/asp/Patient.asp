<!DOCTYPE html>
<html>
<head>
<%
        Dim id,a
        idd= Request.QueryString("id")
        src  = "menu.asp?id="&idd
        a  = "profilPatient.asp?id="&idd
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient</title>
<frameset framespacing="0" cols="19%,*" noresize style="overflow: hidden; border: none;"border='0'>
<%
 Response.write("<frame frameborder='0'  name='menu' src='"& src &"'  scrolling='no' style='margin: 0;'>border='0'")
 %>
 <%
 Response.write("<frame frameborder='0'  name='contenu' src='"& a &"' border='0'>")
 %>
    
</frameset>
</head>
</html>