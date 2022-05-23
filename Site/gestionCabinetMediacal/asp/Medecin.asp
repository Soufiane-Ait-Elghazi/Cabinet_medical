<!DOCTYPE html>
<html lang="en">
<head >
<%
        Dim id ,src,s
        idd= Request.QueryString("id")
        src  = "menuMedecin.asp?id="&idd
        s = "ProfilMedecin.asp?i="&idd
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medecin</title>
     <frameset rows="8%,*" border="0" >
         <frame frameborder="0"   src="header.asp" scrolling="no" style="margin: 0;" border="0"></frame>
         <frameset cols="18%,*">
         <%
          Response.write("<frame frameborder='0'  name='menuMedecin' src='"& src &"' scrolling='no' style='margin: 0;' border='0'></frame>")
         %>
         <%
          Response.write("<frame frameborder='0'  name='centrale' src='"& s &"' style='margin: 0;' border='0'></frame>")
         %>  
         </frameset>
     </frameset>

</head>
</html>