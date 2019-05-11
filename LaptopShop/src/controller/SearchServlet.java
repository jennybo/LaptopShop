/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import adapter.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SearchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        String url = "";
        try{
            switch(command){
                case "searchProductHome":
                    String textSearch = req.getParameter("txtsearch");
                    HttpSession session = req.getSession();
                    session.setAttribute("txtsearch", textSearch);
                    url="/index.jsp";
                    break;
                 case "searchProductManager":
                    String textSearch1 = req.getParameter("txtsearch");
                    HttpSession session1 = req.getSession();
                    session1.setAttribute("txtsearch", textSearch1);
                    url="/admin/manager_product.jsp";
                    break;
            }
        }catch(Exception e){
            req.setAttribute("errorMessage", "Lỗi tìm kiếm!");
        }
         RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    

}