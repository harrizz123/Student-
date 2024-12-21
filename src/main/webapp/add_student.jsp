<%@ page import="java.sql.*" %>
<%@ page import="stu_info1.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h2>Add New Student</h2>

    <!-- Form to add a new student -->
    <form action="add_student.jsp" method="POST">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required><br><br>

        <label for="fname">Father's Name:</label>
        <input type="text" id="fname" name="fname" required><br><br>

        <label for="mname">Mother's Name:</label>
        <input type="text" id="mname" name="mname" required><br><br>

        <label for="sex">Sex:</label>
        <select id="sex" name="sex" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label for="nationality">Nationality:</label>
        <input type="text" id="nationality" name="nationality" required><br><br>

        <label for="religion">Religion:</label>
        <input type="text" id="religion" name="religion" required><br><br>

        <label for="blood">Blood Group:</label>
        <input type="text" id="blood" name="blood" required><br><br>

        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required><br><br>

        <label for="admission">Admission Date:</label>
        <input type="date" id="admission" name="admission" required><br><br>

        <label for="address">Address:</label>
        <textarea id="address" name="address" required></textarea><br><br>

        <label for="studentid">Student ID:</label>
        <input type="text" id="studentid" name="studentid" required><br><br>

        <input type="submit" value="Add Student">
    </form>

    <br><br>
    <!-- Link to go back to the student list page -->
    <a href="student_list.jsp">Back to Student List</a>

    <%
        // Handling form submission and inserting data into the database
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Get form data
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

            // Insert data into the database
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = DatabaseConnection.getConnection();
                String query = "INSERT INTO student_info3 (name, dob, fname, mname, sex, nationality, religion, blood, subject, admission, address, studentid) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(query);
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

                // Execute the insert query
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<p>Student added successfully!</p>");
                }
            } catch (SQLException e) {
                out.println("<p>Error adding student: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        }
    %>

</body>
</html>
