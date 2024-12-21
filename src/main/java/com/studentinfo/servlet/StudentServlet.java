package com.studentinfo.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import stu_info1.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import com.studentinfo.utility.DatabaseConnection;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addStudent(request, response);
        } else if ("update".equals(action)) {
            updateStudent(request, response);
        } else if ("view".equals(action)) {
            viewStudent(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }
    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String sex = request.getParameter("sex");
        String nationality = request.getParameter("nationality");
        String religion = request.getParameter("religion");
        String blood = request.getParameter("blood");
        String subject = request.getParameter("subject");
        String admission = request.getParameter("admission");
        String address = request.getParameter("address");
        String studentid = request.getParameter("studentid");

        try (Connection conn = stu_info1.DatabaseConnection.getConnection()) {
            String query = "INSERT INTO student_info3 (name, dob, fname, mname, sex, nationality, religion, blood, subject, admission, address, studentid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, name);
                stmt.setString(2, dob);
                stmt.setString(3, fname);
                stmt.setString(4, mname);
                stmt.setString(5, sex);
                stmt.setString(6, nationality);
                stmt.setString(7, religion);
                stmt.setString(8, blood);
                stmt.setString(9, subject);
                stmt.setString(10, admission);
                stmt.setString(11, address);
                stmt.setString(12, studentid);
                stmt.executeUpdate();  
                response.sendRedirect("student_list.jsp");  
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding student.");
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String sex = request.getParameter("sex");
        String nationality = request.getParameter("nationality");
        String religion = request.getParameter("religion");
        String blood = request.getParameter("blood");
        String subject = request.getParameter("subject");
        String admission = request.getParameter("admission");
        String address = request.getParameter("address");
        String studentid = request.getParameter("studentid");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "UPDATE student_info3 SET name=?, dob=?, fname=?, mname=?, sex=?, nationality=?, religion=?, blood=?, subject=?, admission=?, address=?, studentid=? WHERE id=?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, name);
                stmt.setString(2, dob);
                stmt.setString(3, fname);
                stmt.setString(4, mname);
                stmt.setString(5, sex);
                stmt.setString(6, nationality);
                stmt.setString(7, religion);
                stmt.setString(8, blood);
                stmt.setString(9, subject);
                stmt.setString(10, admission);
                stmt.setString(11, address);
                stmt.setString(12, studentid);
                stmt.setInt(13, Integer.parseInt(id));
                stmt.executeUpdate();
                response.sendRedirect("student_list.jsp"); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating student.");
        }
    }

    // Method to view a student
    private void viewStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM student_info3 WHERE id=?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, Integer.parseInt(id));
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("student", rs);
                        request.getRequestDispatcher("view_student.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("student_list.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching student.");
        }
    }
}

