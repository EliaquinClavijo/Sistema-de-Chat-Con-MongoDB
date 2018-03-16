<%-- 
    Document   : VerDescarga
    Created on : 7-feb-2018, 22.12.26
    Author     : User
--%>

<%@page import="java.util.StringTokenizer"%>
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
            StringTokenizer tokens=new StringTokenizer(nomArchivo, ".");
            String str = "";
            while(tokens.hasMoreTokens()){
                
                  str=tokens.nextToken();
            }
            
            if (str.equals("mp3") || str.equals("m4a")  || str.equals("wav")){  
        %>  
            <audio controls>
            <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="audio/m4a"> 
             <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="audio/wav">
            <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="audio/mp3">
          Your browser does not support the audio element.
           </audio>
            <%} 
        else{
            if (str.equals("jpg") || str.equals("png")  || str.equals("gif")){ 
            
            %> 
            <img src="DownloadArchivo.jsp?Name=<%=nomArchivo%>"/>  
            
            <%} 
            else
            {
            if (str.equals("mp4") || str.equals("avi")  || str.equals("mpg")){ 
            
            %> 
            <video width="320" height="240" controls>
                <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="video/mp4">
                <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="video/avi">
                <source src="DownloadArchivo.jsp?Name=<%=nomArchivo%>" type="video/mpg">
              Your browser does not support the video tag.
            </video>
            
            <%} 
        else{
            %>
           
        <a href="DownloadArchivo.jsp?Name=<%=nomArchivo%>" download="<%=nomArchivo%>">
            <p><%=nomArchivo%></p>
        </a>
            <%}}}%>
    </body>
</html>
