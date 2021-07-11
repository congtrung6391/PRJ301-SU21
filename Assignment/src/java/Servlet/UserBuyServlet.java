/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CheckoutDAO;
import DAO.LaptopDAO;
import DAO.UserDAO;
import DTO.ShoppingCartDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khang
 */
@WebServlet(name = "UserBuyServlet", urlPatterns = {"/UserBuyServlet"})
public class UserBuyServlet extends HttpServlet {
    private final String ERROR_PAGE = "Error.jsp";
    private final String FAIL = "/WEB-INF/jsp/user/UserViewCart.jsp";
    private final String SUCCESS = "/WEB-INF/UserCheckOutSuccess.html";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR_PAGE;
        try  {
            boolean valid = true;
            HttpSession session = request.getSession();
            UserDAO userdao = new UserDAO();
            LaptopDAO laptopdao = new LaptopDAO();
            CheckoutDAO checkoutDAO = new CheckoutDAO();
            Map<Integer,Integer> mapCount = new HashMap<>();
            if (session != null){
                UserDTO user = (UserDTO) session.getAttribute("USER");
                List<ShoppingCartDTO> cart = (List<ShoppingCartDTO>) session.getAttribute("cart");
                int orderId = -1;
                if (user != null && cart != null){
                    try {
                        for (ShoppingCartDTO shoppingCartDTO : cart) {
                            String countStr = request.getParameter("txtquantity"+shoppingCartDTO.getLaptop().getId());
                            
                            if (countStr.trim().isEmpty()) {
                                request.setAttribute("ErrorQuantity", "Quantity must be number");
                                url = FAIL;
                            }
                            int count = Integer.parseInt(countStr);
                            
                            mapCount.put(shoppingCartDTO.getLaptop().getId(), count);
                        }
                        String Address = request.getParameter("txtaddress");
                        
                        if (Address.trim().isEmpty()){                          
                            valid = false;         
                        }
                        float totalPrice = 0;
                        int userId = user.getUserId();
                        for (ShoppingCartDTO shoppingCartDTO : cart) {
                            int count = mapCount.get(shoppingCartDTO.getLaptop().getId());
                            
                            totalPrice += shoppingCartDTO.getLaptop().getPrice()*count;
                        }
                        if (valid == true){
                            
                        orderId = checkoutDAO.createOrder(userId, Address, totalPrice);
                        
                        if (orderId != -1 ){
                            for (ShoppingCartDTO shoppingCartDTO : cart) {
                                int count = mapCount.get(shoppingCartDTO.getLaptop().getId());
                                
                                if (count > 0){
                                    boolean check = checkoutDAO.createOrderDetail(orderId, shoppingCartDTO.getLaptop().getId(), count);
                                   
                                }
                                else {
                                    request.setAttribute("Errorquantity", "Quantity must be > 0");
                                    url = FAIL;
                                }
                            }
                            session.removeAttribute("cart");
                            url = SUCCESS;
                            
                        }
                    }
                        else {
                            for (ShoppingCartDTO shoppingCartDTO : cart) {
                                shoppingCartDTO.setQuantity(mapCount.get(shoppingCartDTO.getLaptop().getId()));
                            }
                            session.setAttribute("cart", cart);
                            request.setAttribute("AddressNull", "Please input Address");
                            url = FAIL;
                        }
                        
                        request.setAttribute("totalprice", totalPrice);
                    } catch (NamingException ex) {
                        log ("UserBuyServlet's Naming Exception: " + ex.getMessage());
                    } catch (SQLException ex) {
                        log ("UserBuyServlet's SQL Exception: " + ex.getMessage());
                    } 
                }
            }
        }
        finally{
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
