<%@page import="model.gestionBesoin.Unity"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Saisie besoin</title>
        <meta charset="utf-8" />
    </head>
    <body>      
        <h1>Service : Informatique</h1>
        <form action="" type="post" accept-charset="UTF-8">
             <label>Charge de travail et profile</label>
            <p>
                <select name="profile" value="Choisir profile">
                    <option>Devellopeur junior</option>
                    <option>Devellopeur senior</option>
                </select>
                <input type="number" name="number" value="Nombre voulu"/>
                <select name="unity" value="unity">

                    <% if(request.getAttribute("unitys") != null ) {
                        ArrayList<Unity> unitys = (ArrayList<Unity>)request.getAttribute("unitys"); 
                        for(int i = 0; i < unitys.size(); i++) {
                    %>
                    <option value=<%=unitys.get(i).getIdUnity() %>><%=unitys.get(i).getUnity() %></option>
                    <% } } %>
                </select>
            </p>
             <p>
                 <a href="#">
                    <button>??</button>
                 </a>
            </p>
             <p>
                <input type="submit" value="Suivant"/>
            </p>
        </form>
    </body>
</html