<%-- 
AUTOR: Rony Villafuerte Serna
FECHA: 01-06-2014
DESCRIPCION: Pagina encargada de procesar la imagen sacada de la BD.
en la BD.

MODIFICACIONES: 
09-AGO-2017: Se reeemplaza gridFS por gridFSBuket porque getDB sera obsoleto 
            en driver mongo para java
--%>


<%@page import="com.mongodb.client.gridfs.GridFSBuckets"%>
<%@page import="com.mongodb.client.gridfs.GridFSBucket"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="java.io.OutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           
        <%
            String nomArchivo = request.getParameter("Name");
            
            OutputStream salida = response.getOutputStream();
            
            MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
            MongoDatabase baseDatos = miCliente.getDatabase("yptBD");
            GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "misArchivos");
            gridFSBucket.downloadToStream(nomArchivo, salida);
            
            //response.setContentType("image/jpg");
            
           
            salida.flush();
           
            salida.close();
        %>
     
     </body>
</html>
