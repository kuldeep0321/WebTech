<%@page import="java.sql.,java.io.,java.util.*" %>
<%
    String action=request.getParameter("action");
    
    if(action.equals("signup"))
{
    String User=request.getParameter("username");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String phone= (request.getParameter("phone"));
    String Pwd=request.getParameter("pass");
    String email=request.getParameter("email");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        
        Statement st=con.createStatement();
        
        boolean s = st.execute("INSERT INTO `user_data` (`user_name`, `email`, `fname`, `lname`, `password`, "
         + "`phone`) VALUES ('"+User+"', '"+email+"', '"+fname+"', '"+lname+"', '"+Pwd+"','"+phone+"')");
        
        if(!s)
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
}
    
if(action.equals("contectus")){
    String query=request.getParameter("query");
    String username = (String)session.getAttribute("username");
    String subject=request.getParameter("subject");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        
        Statement st=con.createStatement();
        
        boolean s = st.execute("INSERT INTO `query` (`query`, `subject`, `username`) VALUES ('"+query+"', '"+subject+"', '"+username+"')");
        
        if(!s)
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
}

if(action.equals("login")){
    String pass=request.getParameter("pass");
    String user=request.getParameter("username");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st=con.createStatement();
        
        ResultSet rs = st.executeQuery("SELECT * FROM `user_data` WHERE user_name = '"+user+"' AND password = '"+pass+"'");
        
        if(rs.next())
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
    
}



    %>