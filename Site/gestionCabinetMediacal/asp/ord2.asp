<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
    <style>
		.sauv{
		color:white;
		background-color:#357bfd;
		}
        table{
         background:white;
         width: 80%; 
        
         
        }
        td{
            
            width: fit-content;
            text-align: center;
            padding: 10px 20px;
        }
        td input, td select{
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        td textarea {
width: 100%;
}
td img{
    width: 120px;
    height: 60px;
}
   td table{
       margin-bottom: 10px;
       width: 100%;
   }
   td button{
            appearance: button;
            backface-visibility: hidden;
            background-color: #405cf5;
            border-radius: 6px;
            border-width: 0;
            box-shadow: rgba(50, 50, 93, .1) 0 0 0 1px inset,rgba(50, 50, 93, .1) 0 2px 5px 0,rgba(0, 0, 0, .07) 0 1px 1px 0;
            box-sizing: border-box;
            color: #fff;
            cursor: pointer;
            font-family: -apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif;
            font-size: 100%;
            height: 20px;
            line-height: 1.15;
            margin: 12px 0 12px;
            outline: none;
            overflow: hidden;
            padding: 2px 25px;
            position: relative;
            text-align: center;
            text-transform: none;
            transform: translateZ(0);
            transition: all .2s,box-shadow .08s ease-in;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: fit-content;
   }
  td button:last-child{
      height: 44px;
  }


  a {
     text-decoration: none !important;
     color: white;
       }


       .modal {
visibility: hidden;
opacity: 0;
position: absolute;
top: 0; right: 0;
bottom: 0; left: 0;
display: flex;
align-items: center;
justify-content: center;
background: rgba(77, 77, 77, .7);
transition: all .4s;
}

.modal:target {
visibility: visible;
opacity: 1;
}

.modal_content {
border-radius: 4px;
position: relative;
width: 500px;
max-width: 90%;
background: white;
padding: 1.5em 2em;
}

.modal_close {
position: absolute;
top: 10px;
right: 10px;
color: grey;
text-decoration: none;}
  
    </style>
</head>
<%
      				    Dim i,patients,date , diagnostics,symptomes,maladies,medecaments
        				i =Request.QueryString("i")
						Dim con,rec,medecin
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
                        set medecin = con.Execute("select Concat(nomMedecin,' ', prenomMedecin) as t from TMedecin where idMedecin ='"&i&"'")
                        set patients= con.Execute("exec Medecin_MsPatients_aujourdhui "& i &"")
                        set date = con.execute("SELECT CAST( GETDATE() AS Date ) ;")
                        set diagnostics = con.execute("select nomDiagnostic from TDiagnostic")
                        set symptomes = con.execute("select nomSymptome from TSymptome")
                        set maladies = con.execute("select nomMaladie from TMaladie")
                        set medecaments = con.execute("select nomMedicamment from TMedicamment")

%>
<body>
    <center>
        <div id="ordonance">
    <table>
        <form action="ordonnance.asp" method="post">
        <tr> <th colspan="3"> <Strong>--Ordonance--</Strong></th></tr>
        <tr>
            <td>
             <h5>Médecin :</h5>
              <%
				Response.write("<p id='nomMed'>"&medecin(0)&"</p>") 
			  %>
            </td>
            <td>
                 <h5><bold>Patient :</bold></h5>
                <p id="patient">
                 <select name="idPatient" id="nomPatient">
                        <%
                            n= 1
                            Do Until patients.EOF
                            For each x in patients.fields
                            Response.write("<option value='"& x.value &"'>")
                            Response.write(""  & x.value & "") 
                            Response.write("</option>")
                            Next
                            n = n + 1
                            patients.MoveNext
                            Loop 
                        %>
                  </select>
                </p>
            </td>
            <td>
                     <%
				         Response.write("<p id='date'> Date :"&date(0)&"</p>") 
			          %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label for="diagnostic"><bold> Sélectionne les diagnostics :</bold></label>
                <select name="diagnostic" id="diagnostic"  noresize >
                     <%
                            n= 1
                            Do Until diagnostics.EOF
                            For each x in diagnostics.fields
                            Response.write("<option value="&  n & ">")
                            Response.write(""  & x.value & "" ) 
                            Response.write("</option>")
                            Next
                            n = n + 1
                            diagnostics.MoveNext
                            Loop 
                        %> 
                </select>
                <br>
                <label for="symptome"> <bold>Sélectionne les symptomes:</bold></label>
                <select name="symptome" id="symptome" multiple  size="10" >
                   <%
                            n= 1
                            Do Until symptomes.EOF
                            Response.write("<option value="& n &">")
                            For each x in symptomes.fields
                            Response.write(""  & x.value & "" ) 
                            Response.write("</option>")
                            Next
                            n = n + 1
                            symptomes.MoveNext
                            Loop 
                     %>  
                </select>
                <br>
                <label for="maladie"> <bold>Sélectionne les maladies:</bold></label>
                <select name="maladie" id="maladie"  noresize >
                    <%
                         
                            Do Until maladies.EOF
                            For each x in maladies.fields
                            Response.write("<option value='"& x.value &"'>")
                            Response.write(""  & x.value & "" ) 
                            Response.write("</option>")
                            Next
                            maladies.MoveNext
                            Loop 
                     %>
                </select>
                <br>
                <label for="medecament"> <bold>Sélectionne les médecaments:</bold></label>
                <select name="medecament" id="medecament" multiple noresize >
                     <%
                            n= 1
                            Do Until medecaments.EOF
                            Response.write("<option value="& n &">")
                            For each x in medecaments.fields
                            Response.write(""  & x.value & "" ) 
                            Response.write("</option>")
                            Next
                            n = n + 1
                            medecaments.MoveNext
                            Loop 
                     %>
                </select>
            </td>
            <td>
               <bold> Déscription :</bold>
                <br>
                <textarea name="description" id="description" cols="30" rows="30" noresize></textarea>
                <br>
                Prix :
                <br>
                <input type='number' name="prix" id="prix" step="50" min="50" max="1000"  required></input>
            </td>
        </tr>
        <tr>
							<%
							  Response.write("<td><input type='hidden' ' name='idM' value='" & i & "'required></td>") 
							%>
		</tr>

        <tr>
            <td colspan="2"> <input type="submit" value="Sauvegardé" class="sauv" onclick="alert('Ordonnance est bien sauvgarder !!')"></td>
            <td><img src="/images/signature.png" alt=""></td>
        </tr>
        </form>
    </table>
</div>
</center>

 <div id="demo1" class="modal">
            <div class="modal_content">
            
            
             <center><p><strong>Ordonnance est bien sauvgarder !! </strong></P></center>
              <a href="#" class="modal_close">&times;</a>
              <br> <br> <br>
            </div>
 </div>



</body>
</html>