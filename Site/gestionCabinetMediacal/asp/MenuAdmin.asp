<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace-Admin</title>
    <link rel="stylesheet" href="/css/style4.css">
</head>
<%
      				    Dim id,admin,medecin,n,spe,specia,patient,CAC,nbr,CACG,nbrG
        				id =Request.QueryString("id")
                        CAC =Request.QueryString("CAC")
                        nbrG =Request.QueryString("nbrG")
                        CACG =Request.QueryString("CACG")
                        nbr =Request.QueryString("nbr")
						Dim con,rec,rs,specialite
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
						Set admin = con.Execute("select * from TAdmin where idAdmin = '"& id &"'")
                        Set specialite =  con.Execute("select nomSpecialite from TSpecialite ")
                        Set specia =  con.Execute("select * from TSpecialite ")
                        Set patient =  con.Execute("select * from TPatient ")
                        Set spe =  con.Execute("select nomSpecialite from TSpecialite ")
                        Set medc = con.Execute("select CONCAT(nomMedecin,' ',prenomMedecin) as npM from TMedecin ")
                        Set medecin = con.Execute("select * from TMedecin ")             
%>
<style>
.supprimer {
    text-decoration: none;
    color:navy;
    font-family: Arial;
    font-weight: bold;
    text-transform: lowercase;   
}
</style>
<body>
    <header class="hed">
        <center> <H3>ESPACE <span>ADMIN</span></H3></center>   
        </header>
        <div class="page">
            <div class="add">
                <h3>Ajouter Medecin.</h3>
                <form action="ajouterMedecin.asp" method="post">
                    <table>
                        <tr>
                            <td><label >Spécialité :</label></td>
                            <td> 
                               <select name="sp" id="specialite" required>
                                <%
                                     
                                     Do Until specialite.EOF
                                     For each x in specialite.fields
                                     Response.write("<option value='"& x.value &"'>")
                                     Response.write(""  & x.value & "" ) 
                                     Response.write("</option>")
                                     Next
                                     specialite.MoveNext
                                     Loop 
                                 %>
                             </select>
                            </td>
                        </tr>  
                        <tr>
                            <td><label >Nom : </label></td> <td><input type="text" name="nom" id="nomMed" required></td>
                        </tr>
                        <tr>
                            <td><label >Prenom : </label></td> <td><input type="text" name="prenom" id="prenomMed"required></td>
                        </tr>
                        <tr>
                            <td><label>Telephone : </label></td> <td><input type="text" name="telephone" id="prenomMed"required></td>
                        </tr>
                        <tr>
                            <td><label >Email : </label></td> <td><input type="email" name="email" id="emailM" required></td>
                        </tr>
                        <tr>
                            <td><label>Login : </label></td> <td><input type="text" name="login" id="login"required></td>
                        </tr>
                        <tr>
                            <td><label>Password : </label></td> <td><input type="password" name="pass1" id="pass1"required></td>
                        </tr>
                        <tr>
                            <td><label>Confermation: </label></td> <td><input type="password" name="pass2" id="pass2"required></td>
                        </tr>
                        <tr>
                            <td colspan="2"> <input type="submit" value="AJOUTER " id="ajoute" class="ajout"></td>
                        </tr>
                    </table>
                </form>
            </div>
                <div class="delete">
                <h3>Ajouter Spécialité.</h3>
                <form action="ajouterSpecialite.asp" method="post">
                    <table>
                        <tr><td><label for="">Nom :</label></td> <td><input type="text" name="nom" id="nomSpecialite" required></td></tr>
                        <tr><td colspan="2"><input type="submit" value="AJOUTER" class="ajout" id="ajouterSp"></td></tr>
                    </table>
                </form>
                <br>
                <hr>
               <br>  <hr> <br> <br> 
                <h3>Supprimer Spécialité</h3>
                <form action="supprimerSpecialite.asp" method="post">
                    <table>
                        <tr>
                            <td><label for="">Selectionné une spécialité : </label></td> 
                       </tr>  
                       <tr>
                            <td>
                                <select name="specialite" id="speDelete">
                                      <%
                                            Do Until spe.EOF
                                            For each x in spe.fields
                                            Response.write("<option value='"& x.value&"'>")
                                            Response.write(""  & x.value & "" ) 
                                            Response.write("</option>")
                                             Next
                                            spe.MoveNext
                                            Loop 
                                       %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> <input type="submit"  value="Supprimer" class="efface"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="add">
                   <table>
                       <h3>Consulter</h3>
                       <tr><td><button class="mana"><a href="#demo4"> Consulter Spécialité</a></button></td></tr>
                       <tr><td><button class="mana"><a href="#demo"> Consulter les medecines</a></button></td></tr>
                       <tr><td><button class="mana"><a href="#demo1"> Consulter les patients</a></button></td></tr>
                       <tr><td><button class="mana"><a href="#demo2"> Statistique par jour</a></button></td></tr>
                       <tr><td><button class="mana"><a href="#demo3"> Statistique Globale</a></button></td></tr>
                       <tr><td><br><br></td></tr>
                       <tr><td><br><br></td></tr>
                       <tr><td><br><br></td></tr>
                       <tr><td><button class="mana"><a href="Acceuil.html"> Deconnecté</a></button></td></tr>
                      
                   </table>
            </div>
        </div>
        <div id="demo" class="modal">
            <div class="modal_content">
             <center>   <h3>Liste des medecines :</h3> </center> 
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Spécialité</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Telephone</th>
                        <th>Email</th>
                        <th>Login</th>
                        <th> <center>Action</center>  </th>
                    </tr>
                  <%
             
                Do Until medecin.EOF
                 Response.write("<tr>")
                For i = 0 To 6
                   Response.write("<td>"  & medecin(i) & "</td>" ) 
                Next
                 Response.write("<td ><center><a class='supprimer' href='supprimerMedecin.asp?idMed="& medecin(0) &"'>Supprimer</a></center>")
                 Response.write("</tr>")
                 medecin.MoveNext
                Loop 
                %>
                </table>
          
              <a href="#" class="modal_close">&times;</a>
              <br> <br> <br>
            </div>
        </div>
        <div id="demo1" class="modal">
            <div class="modal_content">
             <center>   <h3>Liste des patients :</h3> </center> 
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Date naissance</th>
                        <th>Telephone</th>
                        <th>Mail</th>
                        <th>Login</th>
                        <th> <center>Action</center>  </th>
                    </tr>
              <%
             
                        Do Until patient.EOF
                        Response.write("<tr>")
                        For i = 0 To 6
                        Response.write("<td>"  & patient(i) & "</td>" ) 
                        Next
                        Response.write("<td ><center><a class='supprimer' href='supprimerPatient.asp?idPat="& patient(0) &"'>Supprimer</a></center>")
                        Response.write("</tr>")
                        patient.MoveNext
                        Loop 
                %>
                </table>
          
              <a href="#" class="modal_close">&times;</a>
              <br> <br> <br>
            </div>
        </div>
        <div id="demo3" class="modal">
            <div class="modal_content">
             <center>   <h3>Statistique Globale :</h3> </center> 
              <div>
                          <form action="afficherCACglobale.asp" method="post">
                              <input type="submit"  value="Afficher">
                          </form>
                      </div>
                <table>
                    <tr>
                        <th>Nombre total des patients</th>
                        <th>CAC</th>
                    </tr>
                  <tr>
                    <%
                      Response.write("<td>"&nbrG&"</td>")
                      Response.write("<td>"&CACG&"DH</td>")
                    %>
                  </tr>
                </table>
          
              <a href="#" class="modal_close">&times;</a>
              <br> <br> <br>
            </div>
        </div>
        <div id="demo2" class="modal">
            <div class="modal_content">
             <center>   <h3> Statistique par jour :</h3> </center> 
                      <div>
                          <form action="afficherCACparjour.asp" method="post">
                              <label for="date">Saisir le jour souhaité :</label>
                              <input type="date" name="date" id="date">
                              <input type="submit"  value="Afficher">
                          </form>
                      </div>
                      <br> <br>
                <table>
                    <tr>
                        <th>Nombre total des patients</th>
                        <th>CAC</th>
                    </tr>
                  <tr>
                  <%
                      Response.write("<td>"&nbr&"</td>")
                      Response.write("<td>"&CAC&"DH</td>")
                    %>
                  </tr>
                </table>
          
              <a href="#" class="modal_close">&times;</a>
              <br> <br>
            </div>
        </div>

        <div id="demo4" class="modal">
            <div class="modal_content">
             <center>   <h3>Liste des medecines :</h3> </center> 
                <table>
                    <tr>
                        <th>ID</th>
                        <th>NOM</th>
                    </tr>
                  <%
             
                Do Until specia.EOF
                 Response.write("<tr>")
                For i = 0 To 1
                  Response.write("<td>"  & specia(i) & "</td>" ) 
                Next
                 Response.write("</tr>")
                 specia.MoveNext
                Loop 
                %>
                </table>
          
              <a href="#" class="modal_close">&times;</a>
              <br> <br> <br>
            </div>
        </div>


<script>
			function send() {
                var pass1 =document.getElementById('pass1').value;
                var pass2 =document.getElementById('pass2').value;
                if(pass1 == pass2){
                    alert("test")
                    var login =document.getElementById('login').value;
                    
                    var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@";
                    var string_length = 10;
                    var randomstring = '';
                    for (var i = 0; i < string_length; i++) {
                        var rnum = Math.floor(Math.random() * chars.length);
                        randomstring += chars.substring(rnum, rnum + 1);
                    }
                    var recepteur = document.getElementById('emailM').value;
                    emailjs.send("service_q6vldua", "template_bv1ov9i", {
                        from_name : "CABINET MEDICAL ",
                        to_name : "Monsieur/Madame",
                        message : "Votre login est  :  "+login+"   Votre mot de passe est : "+ pass1,
                        
                        email_to : recepteur,
                    });
                }
                else{
                    alert("ighelt")
                }
			}
			document.getElementById('ajoute').addEventListener('click',function(e) {send();})
</script>
		<!-- using java script to send email-->
        <!-- Ce script est utilisé pour envoyer le login et le mot de passe au nouveau médecin une fois que l’administrateur l’a ajouté-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
			(function() {
				emailjs.init("user_xymR7wLXMVbdlJ0lHCStY");
			})();
</script>

<script>
			function ajouterSp() {
                alert("la specialite est bien ajouter !!")
			}
			document.getElementById('ajouterSp').addEventListener('click',function(e) {ajouterSp();})
</script>
</body>

</html>