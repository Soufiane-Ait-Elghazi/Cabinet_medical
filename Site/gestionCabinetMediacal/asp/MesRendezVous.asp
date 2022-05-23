<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>mes RDVs </title>
    <link rel="stylesheet" href="/css/style2.css">
</head>
<body>
<%
      				    Dim i
        				i =Request.QueryString("i")
						Dim con,rec,encours,Refuse ,Accepte
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
                        Set Accepte = con.Execute("exec Patient_RendezVous '"&i&"'")
                       
%>

    <header class="header"> <h2> Mes <span>Rendez-Vous</span> </2> </header>
      <center>
        <div class="mesRDVs">

            <table>
              <tr>
                <th>SPECIALITE</th>
                <th>MEDECIN</th>
                <th>DATE</th>
                <th>HEURE</th>
                <th>ETAT</th>
              </tr>
            
                <%
                        Do Until Accepte.EOF
                        Response.write("<tr>")
                        For each x in Accepte.fields
                        Response.write("<td>" & x.value & "</td>") 
                        Next
                        Response.write("<td><img src='/images/accept.png' alt=''></td>") 
                        Response.write("</tr>")
                        Accepte.MoveNext
                        Loop 
                %>
            </table>
            </div>
        </center>
            <center>
    <div class="signification">
        <table>
            <tr>
                <td> <img src="/images/accept.png" alt=""></td>
                <td><h4> Rendez-Vous accepté.</h4></td>
                <td> <img src="/images/att.png" alt=""></td>
                <td> <h4> Rendez-Vous est cours de traitement.</h4></td>
                <td> <img src="/images/refuse.png" alt=""></td>
                <td><h4> Rendez-Vous refusé.</h4></td>
            </tr>
        </table> 
    </div>
</center>
</body>
</html>