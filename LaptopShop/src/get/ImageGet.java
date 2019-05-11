/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import connect.DBConnect;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Image;

/**
 *
 * @author jenny
 */
public class ImageGet {
    private static Connection connection = DBConnect.getConnecttion();
    public static Image getImageById(Long id) throws SQLException{
      String sql = "SELECT * FROM image WHERE image_Id = ? ";
      PreparedStatement pstm = connection.prepareStatement(sql);
      pstm.setLong(1, id);
      ResultSet rs = pstm.executeQuery();
      if (rs.next()) {
          byte[] imageData = rs.getBytes("Image_Data");
          String imageFileName = rs.getString("Image_File_Name");
          Image image = new Image(id, imageFileName, imageData);
          return image;
      }
      return null;
    }
    public static void writeToDB(Image image) throws SQLException, IOException {
 
       String sql = "Insert into image" //
               + " values (?,?,?) ";
       PreparedStatement pstm = connection.prepareStatement(sql);
 
       Long id = image.getImage_Id();
       pstm.setLong(1, id);
       pstm.setString(2, image.getImage_File_Name());
       InputStream inputStream = null;
       inputStream.read(image.getImage_Data());
       pstm.setBlob(3, inputStream);
       pstm.executeUpdate();
   }
    public static Image getImageById(String id) throws SQLException{
      String sql = "SELECT * FROM image WHERE image_File_Name = ? ";
      PreparedStatement pstm = connection.prepareStatement(sql);
      pstm.setString(1, id);
      ResultSet rs = pstm.executeQuery();
      if (rs.next()) {
          byte[] imageData = rs.getBytes("image_Data");
          Long id1 =rs.getLong("image_Id");
          Image image = new Image(id1,id, imageData);
          return image;
      }
      return null;
    }
}
