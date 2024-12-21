<%@ page import="java.sql.*" %>
<%@ page import="stu_info1.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h2>Student List</h2>

    <!-- Link to add a new student -->
    <a href="add_student.jsp">Add New Student</a>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Father's Name</th>
                <th>Mother's Name</th>
                <th>Sex</th>
                <th>Nationality</th>
                <th>Religion</th>
                <th>Blood Group</th>
                <th>Subject</th>
                <th>Admission Date</th>
                <th>Address</th>
                <th>Student ID</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Step 1: Establish a database connection
                Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();

                // Step 2: Execute the query to retrieve all students
                String query = "SELECT * FROM student_info3";
                ResultSet rs = stmt.executeQuery(query);

                // Step 3: Iterate over the result set and display student data
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String dob = rs.getString("dob");
                    String fname = rs.getString("fname");
                    String mname = rs.getString("mname");
                    String sex = rs.getString("sex");
                    String nationality = rs.getString("nationality");
                    String religion = rs.getString("religion");
                    String blood = rs.getString("blood");
                    String subject = rs.getString("subject");
                    String admission = rs.getString("admission");
                    String address = rs.getString("address");
                    String studentid = rs.getString("studentid");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= dob %></td>
                <td><%= fname %></td>
                <td><%= mname %></td>
                <td><%= sex %></td>
                <td><%= nationality %></td>
                <td><%= religion %></td>
                <td><%= blood %></td>
                <td><%= subject %></td>
                <td><%= admission %></td>
                <td><%= address %></td>
                <td><%= studentid %></td>
              
            </tr>
            <%
                }
                // Step 4: Close the resources
                rs.close();
                stmt.close();
                conn.close();
            %>
        </tbody>
    </table>

</body>
</html>
