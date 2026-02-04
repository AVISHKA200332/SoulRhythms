<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Music</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #0d0d0d;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #333;
        }
        .navbar a {
            color: #e0e0e0;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
        }
        .navbar a.active {
            font-weight: bold;
            color: #1db954;
        }
        .navbar .right-links a {
            margin-left: 15px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        h2 {
            color: #1db954;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #2a2a2a;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #333;
        }
        th {
            background-color: #1a1a1a;
            font-weight: bold;
        }
        td input[type="text"],
        td input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #333;
            border-radius: 4px;
            background-color: #333;
            color: #e0e0e0;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #ff5555;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #ff7777;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="<%= request.getContextPath() %>/Index.html">Music Library</a>
            <a href="<%= request.getContextPath() %>/oop/musics.jsp">Music List</a>
            <a href="<%= request.getContextPath() %>/oop/insertMusic.jsp">Insert New Music</a>
            <a href="<%= request.getContextPath() %>/oop/updateMusic.jsp">Update Music</a>
            <a href="#" class="active">Delete Music</a>
        </div>
        <div class="right-links">
            <a href="<%= request.getContextPath() %>/oop/musics.jsp">Music List</a>
        </div>
    </div>

    <div class="container">
        <h2>Delete Music</h2>
        <form action="<%= request.getContextPath() %>/delete/music" method="post">
            <table>
                <tr>
                    <th>Song ID</th>
                    <td><input type="text" name="songID" required></td>
                </tr>
            </table>
            <input type="submit" value="Delete Music">
        </form>
    </div>
</body>
</html>