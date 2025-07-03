import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO books (title, author, quantity) VALUES (?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setInt(3, quantity);
            int status = ps.executeUpdate();
            con.close();

            response.sendRedirect("view_books.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
