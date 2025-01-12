<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            width: 500px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-size: 14px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            margin-top: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add Student</h2>
        <form action="StudentServlet" method="POST">
            <input type="hidden" name="action" value="add"> <!-- action to trigger servlet's add functionality -->

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
            </div>

            <div class="form-group">
                <label for="fname">Father's Name:</label>
                <input type="text" id="fname" name="fname" required>
            </div>

            <div class="form-group">
                <label for="mname">Mother's Name:</label>
                <input type="text" id="mname" name="mname" required>
            </div>

            <div class="form-group">
                <label for="sex">Sex:</label>
                <input type="text" id="sex" name="sex" required>
            </div>

            <div class="form-group">
                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" name="nationality" required>
            </div>

            <div class="form-group">
                <label for="religion">Religion:</label>
                <input type="text" id="religion" name="religion" required>
            </div>

            <div class="form-group">
                <label for="blood">Blood Group:</label>
                <input type="text" id="blood" name="blood" required>
            </div>

            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>
            </div>

            <div class="form-group">
                <label for="admission">Admission Date:</label>
                <input type="date" id="admission" name="admission" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="studentid">Student ID:</label>
                <input type="text" id="studentid" name="studentid" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Add Student">
            </div>
        </form>
    </div>

</body>
</html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <h2>Student List</h2>
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Father's Name</th>
                <th>Mother's Name</th>
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
            <!-- Example of a row, dynamically populated with actual student data -->
            <tr>
                <td>John Doe</td>
                <td>2000-01-01</td>
                <td>Michael Doe</td>
                <td>Mary Doe</td>
                <td>American</td>
                <td>Christian</td>
                <td>O+</td>
                <td>Math</td>
                <td>2020-08-01</td>
                <td>1234 Elm Street</td>
                <td>STU12345</td>
            </tr>
            <!-- More rows can be added here by iterating over student data -->
        </tbody>
    </table>

</body>
</html>