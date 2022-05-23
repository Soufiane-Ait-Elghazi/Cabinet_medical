<%
 Option Explicit
 Dim con,rec,dateR,heure,specialite,medecin,patient
 Set con=Server.createObject("Adodb.Connection")
 Set rec= Server.CreateObject("Adodb.recordset")
  con.open "SDN"
     specialite=Request.form("specialite")
     medecin=Request.form("medecin")
     dateR=Request.form("date")
     heure=Request.form("heure")
     patient=Request.form("patient")


 con.execute("execute Patient_PrRendezVous 'id', '"& medecin &"', '" & patient& "','"&dateR&"', '" & heure & "'")
 Response.Redirect "Profil.asp?i="& patient
%>