<%
 Option Explicit
 Dim idRDV,con,rec,i
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
  con.open "SDN"
    
     idRDV=Request.QueryString("idRDV")
      i=Request.QueryString("id")
     Response.Write(idRDV)

     con.execute("execute Accepte_RDV '"& idRDV &"'")
     Response.Redirect "notification.asp?i="& i
        
 
%>
