/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;
import adapter.Constants;
import connect.DBConnect;
import get.ImageGet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Image;
import org.apache.commons.fileupload.FileItem;

@WebServlet("/images")
@MultipartConfig(maxFileSize = 16177215)

public class InsertProductServletx extends HttpServlet {
    // database connection settings
    private static final String UPLOAD_DIRECTORY = "images";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        // gets values of text fields
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String tenSanPham = request.getParameter("tenSanPham");
        long maloai = Long.parseLong(request.getParameter("maloai"));
        long mathuonghieu = Long.parseLong(request.getParameter("mathuonghieu"));
       
        long gia = Long.parseLong(request.getParameter("gia"));
        String mota = request.getParameter("mota");
         
        InputStream inputStream = null;
        InputStream inputStream1 = null;
        InputStream inputStream2 = null;// input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("daidien");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart. getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            
             
            
        }
        Part filePart1 = request.getPart("mattruoc");
        if (filePart1 != null) {
            // prints out some information for debugging
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());
             
            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
        }
        Part filePart2 = request.getPart("matsau");
        if (filePart2 != null) {
            // prints out some information for debugging
            System.out.println(filePart2.getName());
            System.out.println(filePart2.getSize());
            System.out.println(filePart2.getContentType());
             
            // obtains input stream of the upload file
            inputStream2 = filePart2.getInputStream();
        }
        
        
           Connection conn = DBConnect.getConnecttion(); // connection to the database
           
           String message = null;  // message will be sent back to client\
        try {
            // connects to the database
            Connection connection = DBConnect.getConnecttion();
 
            // constructs SQL statement
            String sql = "INSERT INTO product (product_id, category_id, product_name, brand_id, product_image, product_image_forward, product_image_back, product_price, product_description) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
         ps.setLong(1, new Date().getTime());
         ps.setLong(2, maloai); 
         ps.setString(3, tenSanPham);
         ps.setLong(4, mathuonghieu);
            
            ps.setString(5, writeImage(filePart, connection) );
            
            ps.setString(6, writeImage(filePart1, connection) );
            
            ps.setString(7, writeImage(filePart2, connection) );
         ps.setLong(8, gia);
         ps.setString(9, mota);
            // sends the statement to the database server
            int row = ps.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/manager_product.jsp");
            rd.forward(request, response);
        }
    }
    public static String writeImage(Part part, Connection connection) throws SQLException{
        String nameFile = part.getSubmittedFileName();
        try {
            InputStream inputStream = part.getInputStream();
            String sql = "Insert into image(image_File_Name, image_Data)" //
               + " values (?,?) ";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, nameFile);
            pstm.setBlob(2, inputStream);
            pstm.executeUpdate();
        } catch (IOException ex) {
            Logger.getLogger(InsertProductServletx.class.getName()).log(Level.SEVERE, null, ex);
        }
        Image image = ImageGet.getImageById(nameFile);
       // http://localhost:8080/GetImage
        String link = Constants.LINK_ROOT+"/GetImage?id="+image.getImage_Id();
        return link;
    }

}
