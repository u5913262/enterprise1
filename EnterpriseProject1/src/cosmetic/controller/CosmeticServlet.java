package cosmetic.controller;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CosmeticServlet extends HttpServlet {

    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Deletion
        String id = request.getParameter("id");
        String cmd = request.getParameter("cmd");

        // Insertion
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String category_id = request.getParameter("category_id");
        String image = request.getParameter("image");


        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        // Insertion
        out.println(name+"<br/>");
        out.println(price+"<br/>");
        out.println(description+"<br/>");
        out.println(category_id+"<br/>");
        out.println(image+"<br/>");

        Context envContext = null;
        try {
            envContext = new InitialContext();
            out.println(envContext+"<br>");

            Context initContext = envContext;

            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/cosmetic");
            Connection con = ds.getConnection();


            String sql = "";
            if (cmd != null && cmd.equals("d")) {
                // Delete a product
                sql = "DELETE FROM product WHERE id = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(id));
                stmt.execute();
            } else if (cmd != null && cmd.equals("u")) {
                // Update a product
                sql = "UPDATE product SET name = ?, price = ?, description = ?, category_id = ?, image = ? WHERE id = ?";
                PreparedStatement stmt=con.prepareStatement(sql);
                stmt.setString(1,name);
                stmt.setDouble(2,Double.parseDouble(price));
                stmt.setString(3,description);
                stmt.setInt(4,Integer.parseInt(category_id));
                stmt.setString(5,image);
                stmt.setInt(6,Integer.parseInt(id));
                stmt.execute();

            } else {
                // Insert a new product
                sql = "insert into product (name,price,description,category_id,image)  values (?,?,?,?,?)";
                PreparedStatement stmt=con.prepareStatement(sql);
                stmt.setString(1,name);
                stmt.setDouble(2,Double.parseDouble(price));
                stmt.setString(3,description);
                stmt.setInt(4,Integer.parseInt(category_id));
                stmt.setString(5,image);
                stmt.execute();
            }

            response.sendRedirect("product-show.jsp");

        }  catch (SQLException | NamingException e) {
            e.printStackTrace();
            out.print(e);
        }
    }

    public void destroy() {
        // do nothing.
    }

}
