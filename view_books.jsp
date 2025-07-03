<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Books</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <h2>Books Available</h2>

    <div class="nav">
        <a href="index.html">Home</a>
        <a href="add_book.html">Add Book</a>
    </div>

    <table border="1">
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Quantity</th>
        </tr>

        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "your_password");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM books");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getInt("quantity") %></td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </table>

</body>
</html>
