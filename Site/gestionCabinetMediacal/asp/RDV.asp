<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Rendez-Vous</title>
    <link rel="stylesheet" href="/css/style2.css">


<%
        Dim con,x,selectedvalue
        Dim n,l,i	
        i =Request.QueryString("i")
        Set con=Server.createObject("Adodb.Connection")
        Set rec= Server.CreateObject("Adodb.recordset")
        con.open "SDN"
        Set rs = con.Execute("select nomSpecialite from TSpecialite")
      
%>

</head>
<body>
    <header class="header"> <h2> Prendre <span>Rendez-Vous</span> </2> </header>
    <center>
        <div class="affirdv" id="affirdv">
            <h3>Votre demande a été prise en compte. Veuillez attendre l’approbation de médecin </h3>
          </div>
    <div class="rdv" id="rdv">
        <h2>Prendre un Rendez-Vous </h2>
         <form action="soumettre.asp" method="POST">
             <table>
                <tr>
                    <td><label for="#specialité">Spécialité Medicale :</label></td>
                <td> 
                <select name="specialite" id="specialite" required>
                        <%
                        n= 1
                        Do Until rs.EOF
                        Response.write("<option value="& n &">")
                        For each x in rs.fields
                        Response.write(""  & x.value & "" ) 
                        Next
                         Response.write("</option>")
                         n = n + 1
                         rs.MoveNext
                        Loop 
                        %>
                 </select>

                </td>
                </tr>
                <tr>
                    <td><label for="medecin">Médecin  :</label></td>
                <td> 
                    <select name="medecin" id="medecin" required>
                
                        <%
                        selectedvalue = request.form("specialite")
                        'Response.write("selected value : ")
                        Response.write selectedvalue
                        Set rs = con.Execute("select nomMedecin , prenomMedecin from TMedecin")
                        n= 1
                        Do Until rs.EOF
                        Response.write("<option value="& n &">")
                        For each x in rs.fields
                        Response.write(" "  & x.value & "" ) 
                        Next
                        Response.write("</option>")
                        n = n + 1
                         rs.MoveNext
                        Loop
                        %>
                 
                       
                    </select>
                </td>
                </tr>
                <tr>
                    <td><label for="date"> Date :</label></td>
                    <td><input type="date" name="date" id="date" required></td>
                </tr>
                <tr>
                    <td><label for="heure"> Heure :</label></td>
                    <td><input type="time" name="heure" id="heure" required></td>
                </tr>
                <tr>
						<%
							  Response.write("<td><input type='hidden' ' name='patient' value='" & i & "'required></td>") 
						%>
				</tr>
               
                <tr>
                    <td colspan="2"><center> 
                    <input type="submit" value="Soumettre" id="smt"> 
                    </center></td>
                </tr>

             </table>
         </form>
   </div>
   
</center>
<script>
     document.getElementById('smt').addEventListener('click', function(){
        document.getElementById('affirdv').style.display="block";
        document.getElementById('rdv').style.display="none";
     })
 </script>
 
</body>
</html>