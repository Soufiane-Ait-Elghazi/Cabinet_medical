<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mes RDVs </title>
    <link rel="stylesheet" href="/css/style2.css">

 <%
    Dim con,x,selectedvalue
    Dim i	
    i =Request.QueryString("i")
    Set con=Server.createObject("Adodb.Connection")
    Set rec= Server.CreateObject("Adodb.recordset")
    con.open "SDN"
    Set rs = con.Execute("exec Medecin_notifications '"&i&"'")
 %>
</head>
<body>
    
      <center>
        <div class="mesRDVs" id="notification">
            <h3>Nouveaux Rendez-Vous :</h3>
            <table>
                <tr>
                   
                    <th>Nom Patient</th>
                    <th>Prénom Patient</th>
                    <th>Date RDV</th>
                    <th>Heure RDV</th>
                    <th colspan="2"> <center>Action</center></th>
                    
                </tr>
                <%
                 Response.write("<tr>")
                Do Until rs.EOF
                For i = 1 To 4
                  Response.write("<td>"  & rs(i) & "</td>" ) 
                Next
                 Response.write("<td><center><button class='accepte'><a href='accepteRDV.asp?idRDV="& rs(0) &"'>Accepter</a></button></center></td>")
                 Response.write("<td><center><button class='refuse'><a href='refuseRDV.asp?idRDV="& rs(0) &"'>Refuser</a></center></td></button>")
                ' Response.write("<td><center><forme method='post' action='refuse.asp'><input class='refuse' type='submit' value='Refusé'></center></forme></td>")
                 Response.write("</tr>")
                 
                 rs.MoveNext
                Loop 
                %>
            </table>
            </div>
        </center>
</body>
</html>