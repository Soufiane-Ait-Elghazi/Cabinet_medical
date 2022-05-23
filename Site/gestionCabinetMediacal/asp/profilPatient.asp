<title>Profil</title>
<link rel="stylesheet" href="/css/style2.css">
	<style>
        body{
background-image: url(backMedecin.jpg);
background-size: 100%;
background-repeat: no-repeat;
        }
     .profilMed{
     margin-top: 15%;
     margin-left: 80px;
      width: 80%;
	  padding: 20px 30px;
      border-radius: 7px;
	  background-color:#dbdfe9;
      opacity: 0.9;
       font-display: inherit;
       display: flex;
       float: left;
       grid-gap: 10px;
     }
     
     .menuP{
      width: 25%;
      padding: 20px 20px;
	  margin-top: 8px;
      margin-bottom: 8px;
      color: rgb(14, 0, 0);
      font-size: large;
      font-family: 'Times New Roman', Times, serif;
      display: flex;
       float: left;
	  border: 1px solid rgb(12, 0, 0);
	  border-radius: 8px;
	  
      box-sizing: border-box;
     }
     .menuP img{
         width: 100px;
         height: 100px;
         border-radius: 50%;
         margin-bottom: 10px;

     }
     .menuP button{
         width: 140px;
         height: 40px;
         margin-bottom: 10px;
         color: rgb(12, 0, 0);
         cursor: pointer;
         border: 0;
         border-radius: 7px;
         font-size: 15px;
         font-family: 'Times New Roman', Times, serif;
         background-color: #4de79a;
     }

     .profilMed button:active{
        background-color: #4de79a;
         opacity: 0.8;
         color: rgb(12, 0, 0);
     }
     .ecran, .edit ,.pwrd{
      width: 100%;
      padding: 12px 20px;
	  margin-top: 8px;
      margin-bottom: 8px;
      color: rgb(12, 0, 0);
      font-size: large;
      font-family: 'Times New Roman', Times, serif;
      display: flex;
      float: left;
	  border: 1px solid rgb(12, 0, 0);
	  border-radius: 4px;
	  cursor: pointer;
      box-sizing: border-box;
     }
     .pwrd , .edit{
         display: none;
     }
     .ecran table, .edit table, .pwrd table{
    width: 100%;
    
   }
   .ecran table tr td{
      padding : 20px 20px 20px 20px;
    
   }
    .ecran table tr td:first-child, .edit table tr td:first-child .pwrd table tr td:first-child{
    width: 30%;
    }

    .edit input, .edit button ,.pwrd input,.pwrd button{
	width: 100%;
    padding: 12px 20px;
	margin: 7px 0;
	color: rgb(12, 0, 0);
    font-size: large;
    font-family: 'Times New Roman', Times, serif;
	margin: 4px 0;
	border: none;
    display: inline-block;
	border: 1px solid rgb(12, 0, 0);
	border-radius: 4px;
	cursor: pointer;
    box-sizing: border-box;
}
  .edit a, .pwrd a {
      text-decoration: none;
      color: rgb(12, 0, 0);
    font-size: large;
    font-family: 'Times New Roman', Times, serif;
  }
 .edit input[type="submit"], .edit button ,.pwrd input[type="submit"], .pwrd button{
	width: 120px;
	cursor: pointer;
    color: rgb(12, 0, 0);
    font-weight: lighter;
}

.edit input[type=submit]:hover,.edit button:hover ,.pwrd input[type="submit"]:hover, .pwrd button:hover{
	background-color: #007dfe;
}
    </style>
	
 
</head>
<body>
<%
      				    Dim i
        				i =Request.QueryString("id")
						Dim con,rec,rs
						Set con=Server.createObject("Adodb.Connection")
						Set rec= Server.CreateObject("Adodb.recordset")
						con.open "SDN"
						Set rs = con.Execute("select * from TPatient where idPatient = "& i &"")
%>
 
	<header class="header">
		<h2>Profil <span>Patient</span> </h2>
	</header>

<center>
        <div class="profilMed">
                       <div class="menuP">
                        <center> 
                          <img src="/images/compte-utilisateur-1.png" alt="">
                           <%
							           Response.write("<h5>" & rs(1) & " " & rs(2) & "<h5/>") 
						    %>
                        </center>
                      </div>
                        <div class="ecran" id="ecran">
                            <table>
                                <tr>
                                    <th>Nom :</th> 
                                     <%
							           Response.write("<td>" & rs(1) & "</td>") 
							          %>
                                </tr>
                                <tr>
                                    <th>Prenom :</th>
                                    <%
							           Response.write("<td>" & rs(2) & "</td>") 
							         %>
                                     
                                </tr>
                                <tr>
                                    <th>Date de Naissance:</th> 
                                     <%
							           Response.write("<td>" & rs(3) & "</td>") 
							          %>
                                </tr>
                                <tr>
                                    <th>Telephone:</th>
                                    <%
							           Response.write("<td>" & rs(4) & "</td>") 
							        %>
                                </tr>
                                 <tr>
                                    <th>Email :</th> 
                                     <%
							           Response.write("<td>" & rs(5) & "</td>") 
							          %>
                                    
                                </tr>
                                  <tr>
                                    <th>login :</th> 
                                     <%
							           Response.write("<td>" & rs(6) & "</td>") 
							          %>
                                    
                                </tr>
                               
                                
                            </table>
                        </div>
        </div>
     </center>








    </body>
</html>