<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%
    String resultado = request.getParameter("txtCodigo");
    Usuario u = UsuarioDAO.buscar(resultado);
    if (u == null) {
        out.print("No existe");

    } else {
        out.print(u.getLogiUsua());
        out.print("\n");
        out.print(u.getCodiUsua());
    }


%>