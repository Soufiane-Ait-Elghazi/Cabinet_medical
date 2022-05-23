<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes fichiers</title>
    <link rel="stylesheet" href="/css/style2.css">
</head>
<%
            Dim i,rdvs
            i =Request.QueryString("i")
						Dim con,rec
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
          set rdvs = con.Execute("select idRendezVous from TRendezVous where idPatient ='"&i&"' and etatRendezvous like 'Accepte'")
%>
<body>
    <header class="header"> <h2> Mes <span>fichiers</span> </2> </header>
      <center>
        <div class="mesFichiers">
            <table>
              <tr>
                <th>Titre</th>
              </tr>
               <%
               n=1
                        Do Until rdvs.EOF
                        Response.write("<tr>")
                        For each x in rdvs.fields
                        url = "fichier.asp?r="& x.value&"&i="&i
                        Response.write("<td><a href='"&url&"' >Fichier de  Rendez-vous "  &n & "</a></td>" ) 
                        n=n+1
                        Next
                         Response.write("</tr>")
                         rdvs.MoveNext
                        Loop 
                 %>
            </table>
            </div>
        </center>
        <center>

</center>
</body>
</html>