<!DOCTYPE html>
<html>
<head>

 



<style>
body{
    height: 100vh;
    background-image: linear-gradient(to top, #dfe9f3 0%, white 30%);
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
  background-color: rgb(5, 150, 106);
  color: white;
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
        Dim I,url,rdv,rs,nom,prenom,cm,sp,urla
        Set con=Server.createObject("Adodb.Connection")
        Set rec= Server.CreateObject("Adodb.recordset")
        con.open "SDN"
        I = Request.QueryString("id")
        url  = "Profil.asp?i="&I
        urla  = "ProfilPatient.asp?id="&I
        rdv  = "RDV.asp?i="&I
        hstrq = "Historique.asp?i="&I
        mrdv = "MesRendezVous.asp?i="&I
        cm = "consulterMedecins.asp?i="&I
        sp = "consulterSpecialitees.asp?i="&I
        mesfch ="mesFichiers.asp?i="&I
        Set nom = con.Execute("SELECT nomPatient from TPatient where idPatient = "&I&"")
        Set prenom = con.Execute("SELECT prenomPatient from TPatient where idPatient = "&I&"")
         
%>
<div id="mesInfo">
   <center> <img src="/images/compte-utilisateur-1.png" alt=""></center>

<%
 Response.write("<a href='"& urla &"' target='contenu'><h5>"& nom(0) &"   "& prenom(0) &" </h5></a>")
%>
    
</div>
<hr>
<div class="menuPatient">
<ul>
    <%
    Response.write("<li><a href='"& url &"' target='contenu'>Modifier Profil</a></li>")
    %>
    <%
    Response.write("<li><a href='"& rdv &"' target='contenu'>Prendre Rendez-Vous</a></li>")
    %>
    <%
    Response.write("<li><a href='"& mrdv &"' target='contenu'>Mes Rendez-vous</a></li>")
    %>
    <%
    Response.write("<li><a href='"& hstrq &"' target='contenu'>Historique</a></li>")
    %>
    <%
    Response.write("<li><a href='"& mesfch &"' target='contenu'>Mes fichiers</a></li>")
    %>
  <%
    Response.write("<li><a href='"& cm &"' target='contenu'>Consulter Médecins</a></li>")
   %>
   <%
    Response.write("<li><a href='"& sp &"' target='contenu'>Spécialités</a></li>")
   %>
  <li><a href="Acceuil.html" target="_top">Déconnecté</a></li>
</ul>
</div>
<footer class="footer">
    <p>Cabinet Medical en ligne </p>
</footer>
</body>
</html>