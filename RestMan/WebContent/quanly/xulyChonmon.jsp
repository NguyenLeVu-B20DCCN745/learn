<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*, model.*, java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>

<%
    // Get combo details from the form
    String comboName = request.getParameter("comboName");

    // Get selected food item IDs from the form
    String[] selectedMonanIds = request.getParameterValues("selectedMonanIds");

    // Validate and process the data
    if (comboName != null && selectedMonanIds != null && selectedMonanIds.length > 0) {
        ComboDAO745 comboDAO = new ComboDAO745();

        // Create a new Combo object
        Combo745 combo = new Combo745();
        combo.setTen(comboName);

        // Create ComboMonan objects and add them to the combo
        for (String monanId : selectedMonanIds) {
            int id = Integer.parseInt(monanId);
            Monan745 monan = new MonanDAO745().getMonan(id);

            ComboMonan745 comboMonan = new ComboMonan745();
            comboMonan.setMonan(monan);

            combo.setDsmon().add(comboMonan);
        }

        // Save the combo to the database
        comboDAO.themCombo(combo);

        // Redirect to a success page or display a success message
        response.sendRedirect("success.jsp");
    } else {
        // Handle invalid data (e.g., redirect to an error page)
        response.sendRedirect("error.jsp");
    }
%>

