/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author jenny
 */
public class Image {
    private long image_Id;
    private String image_File_Name;
    private byte[] image_Data;

    public Image() {
    }

    public Image(long image_Id, String image_File_Name, byte[] image_Data) {
        this.image_Id = image_Id;
        this.image_File_Name = image_File_Name;
        this.image_Data = image_Data;
    }

    public long getImage_Id() {
        return image_Id;
    }

    public void setImage_Id(long image_Id) {
        this.image_Id = image_Id;
    }

    public String getImage_File_Name() {
        return image_File_Name;
    }

    public void setImage_File_Name(String image_File_Name) {
        this.image_File_Name = image_File_Name;
    }

    public byte[] getImage_Data() {
        return image_Data;
    }

    public void setImage_Data(byte[] image_Data) {
        this.image_Data = image_Data;
    }

    
}
