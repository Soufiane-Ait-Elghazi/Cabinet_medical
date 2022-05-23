<!DOCTYPE html>
<html>
<head>
<style>
body{
    height: 100vh;
    background-color: rgb(10, 163, 163);
}
 .menuPatient ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 245px;
  
}

.menuPatient li a {
  display: block;
  color: #000;
  padding: 15px 16px;
  text-decoration: none;
}
#mesInfo a{
    text-decoration: none;
    color: #000;
}
/* Change the link color on hover */
.menuPatient li a:hover {
  background-color: rgb(218, 238, 232);
  color: rgb(8, 8, 8);
  font-weight: bolder;
}
#mesInfo img{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 5px;
}
#mesInfo{
    width: fit-content;
    
    padding: 15px 45px 0px 45px;
    margin-bottom: 20px;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  color: rgb(12, 11, 11);
  text-align: center;
}

</style>
</head>
<body>
<%
        Dim I,url,rdv,rs,nom,prenom,ntfct,ordnnc ,urla
        Set con=Server.createObject("Adodb.Connection")
        Set rec= Server.CreateObject("Adodb.recordset")
        con.open "SDN"
        I = Request.QueryString("id")
        url  = "modifiermedecinProfil.asp?i="&I
        urla  = "ProfilMedecin.asp?i="&I
        rdv  = "RDVMedecin.asp?i="&I
        ntfct = "notification.asp?i="&I
        ordnnc = "ord2.asp?i="&I
        Set nom = con.Execute("SELECT nomMedecin from TMedecin where idMedecin = "&I&"")
        Set prenom = con.Execute("SELECT prenomMedecin from TMedecin where idMedecin = "&I&"")
         
%>


<div id="mesInfo">
   <center> <img src="/images/medecin.png" alt=""></center>

   <%
    Response.write("<a href='"& urla &"' target='centrale'><h5>"& nom(0) &"   "& prenom(0) &" </h5></a>")
   %>

</div>
<hr>
<div class="menuPatient">
<ul>
  <%
    Response.write("<li><a href='"& url &"' target='centrale'>ModifierProfil</a></li>")
  %>
  <%
    Response.write("<li><a href='"& rdv&"' target='centrale'>Mes Rendez-Vous</a></li>")
  %>
  <%
    Response.write("<li><a href='"& ntfct &"' target='centrale'>Notifacations</a></li>")
  %>
   <%
    Response.write("<li><a href='"& ordnnc &"' target='centrale'>Remplire Ordonnance</a></li>")
  %>
  <li><a href="Acceuil.html" target="_top">Déconnecté</a></li>
</ul>
</div>
<footer class="footer">
    <p>Cabinet Medical en ligne </p>
</footer>
</body>
</html>