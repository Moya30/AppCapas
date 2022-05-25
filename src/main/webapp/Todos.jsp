
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Vista Persona</title>

        <style>

            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            table {
                font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
                font-size: 12px;
                margin: 45px;
                width: 480px;
                text-align: left;
                border-collapse: collapse;
            }

            th {
                font-size: 13px;
                font-weight: normal;
                padding: 8px;
                background: #b9c9fe;
                border-top: 4px solid #aabcfe;
                border-bottom: 1px solid #fff;
                color: #039;
            }

            td {
                padding: 8px;
                background: #e8edff;
                border-bottom: 1px solid #fff;
                color: #669;
                border-top: 1px solid transparent;
            }

            tr:hover td {
                background: #d0dafd;
                color: #339;
            }

        </style>
    </head>
    <body>
        <form method="get" action="exportar.jsp">

            <input type="submit" class="btn btn-warning m-3" value="Generar PDF">
        </form>

        <table border="1px" class="m-3">

            <tr>
                <td>CODIGO </td>  <td>NOMBRES</td>  
            </tr>

            <%
                UsuarioDAO dao = new UsuarioDAO();
                //Usuario u = UsuarioDAO.consultar();
                List<Usuario> datos = new ArrayList<Usuario>();
                datos = dao.consultar();

                for (Usuario p : datos) {
            %>   
            <tr>
                <td> <%=p.getCodiUsua()%>      </td>
                <td> <%=p.getLogiUsua()%> </td>



            </tr>
            <%
                }
            %>
        </table>
        <%

        %>

    </body>

</html>
