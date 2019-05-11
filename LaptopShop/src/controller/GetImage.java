/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import get.ImageGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Image;

public class GetImage extends HttpServlet {

     private static final long serialVersionUID = 1L;
 
     public GetImage() {
        super();
    } 
 
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
          Image image = new Image();
          Image b = new Image();
         try {
          image = ImageGet.getImageById(Long.parseLong(request.getParameter("id")));
 
          if (image.equals(b)) {
              // Không có dữ liệu ảnh, chuyển hướng tới một ảnh mặc định.
              response.sendRedirect(request.getContextPath() + "/images/co.png");
              return;
          }
        
          // trump.jpg, putin.png
          String imageFileName = image.getImage_File_Name();
          String contentType = this.getServletContext().getMimeType(imageFileName);
          System.out.println("Content Type: "+ contentType);
        
          response.setHeader("Content-Type", contentType);
        
          response.setHeader("Content-Length", String.valueOf(image.getImage_Data().length));
        
          response.setHeader("Content-Disposition", "inline; filename=\"" + image.getImage_File_Name() + "\"");
 
          // Ghi dữ liệu ảnh vào Response.
          response.getOutputStream().write(image.getImage_Data());
 
      } catch (Exception e) {
             Logger.getLogger(GetImage.class.getName()).log(Level.SEVERE, null, e);
      }
    }
 
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      doGet(request, response);
  }

}
