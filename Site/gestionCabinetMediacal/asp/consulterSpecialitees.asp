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
    Set rs = con.Execute("select * from TSpecialite")
 %>
</head>
<body>
    
      <center>
        <div class="mesRDVs" id="notification">
            <h3>Specialitees:</h3>
            <table>
                <tr>
                   
                    <th></th>
                    
                </tr>
                <%
             
                Do Until rs.EOF
                 Response.write("<tr>")
                For i = 1 To 1
                  Response.write("<td>"  & rs(i) & "</td>" ) 
                Next
                 Response.write("</tr>")
                 rs.MoveNext
                Loop 
                %>
            </table>
            </div>
        </center>
</body>
</html>