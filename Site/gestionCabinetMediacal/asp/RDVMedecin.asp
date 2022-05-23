<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mes RDVs </title>
    <link rel="stylesheet" href="/css/style2.css">

    <style>
        .mesRDVs th{
            background-color: rgb(8, 146, 135);
        }
    </style>
</head>
<body>
<%
      		  Dim i
        		i =Request.QueryString("i")
						Dim con,rec,encours,Refuse ,Accepte
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
            Set Accepte = con.Execute("exec Medecin_MRendezVous '"&i&"'")
                       
%>
    
      <center>
        <div class="mesRDVs" id="notification">
            <h3>Liste des Rendez-Vous :</h3>
            <table>
                <tr>
                    <th>Nom Patient</th>
                    <th>Prenom pation </th>
                    <th>Date RDV</th>
                    <th>Heure RDV</th>
                    
                </tr>
              
              <%
                        Do Until Accepte.EOF
                        Response.write("<tr>")
                        For each x in Accepte.fields
                        Response.write("<td>" & x.value & "</td>") 
                        Next
                        Response.write("</tr>")
                        Accepte.MoveNext
                        Loop 
                %>
            </table>
            </div>
        </center>
</body>
</html>