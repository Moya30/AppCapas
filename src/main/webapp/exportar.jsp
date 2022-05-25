<%@page import="java.io.File"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Section"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Chapter"%>
<%@page import="com.itextpdf.text.Anchor"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.FileSystemNotFoundException"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dto.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Generar PDF</title>
    </head>
    <body>


        <%

            String listadoALUMNO = " ";
            List<Usuario> list = new ArrayList<>();

            list = UsuarioDAO.consultar();

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            System.out.println("yyyy/MM/dd HH:mm:ss-> " + dtf.format(LocalDateTime.now()));

            Document document = new Document();
            String destino = "reporte.pdf";
            PdfWriter.getInstance(document, new FileOutputStream(destino));
            document.open();
            Phrase titulo = new Phrase(" ========================================================= ");
            document.add(titulo);
            Phrase titulo2 = new Phrase("\n");
            document.add(titulo2);
            Phrase p = new Phrase(" Fecha:  " + dtf.format(LocalDateTime.now()));
            document.add(p);

            PdfPTable table = new PdfPTable(1);
            PdfPCell cell = new PdfPCell(new Phrase("Listado de nombres"));
            cell.setColspan(1);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);
            if (list == null) {
                out.println("no se encontro el usuario");
            } else {

                for (int i = 0; i < list.size(); i++) {
                    //out.print(" usuario: "+list.get(i).getLogiUsua());
                    listadoALUMNO = listadoALUMNO + list.get(i).getLogiUsua() + " ";

                    cell = new PdfPCell(new Phrase(list.get(i).getLogiUsua()));
                    cell.setRowspan(1);
                    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
                    table.addCell(cell);
                }

            }

            document.add(table);
            document.close();

            out.println("creado pdf");
            try {
                Desktop.getDesktop().open(new File("reporte.pdf"));

            } catch (Exception e) {
            }

        %>
        <form method="get" action="Todos.jsp">

            <input type="submit" class="btn btn-warning m-3" value="Volver">
        </form>
    </body>


</html>