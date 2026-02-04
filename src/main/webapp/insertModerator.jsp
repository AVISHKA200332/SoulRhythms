<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert New Music</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #333;
            border-radius: 4px;
            background-color: #2a2a2a;
            color: #e0e0e0;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            background-color: #1db954;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #1ed760;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="<%= request.getContextPath() %>/Index.html">Music Library</a>
            <a href="<%= request.getContextPath() %>/music">Music List</a>
            <a href="<%= request.getContextPath() %>/music/insert" class="active">Insert New Music</a>
        </div>
        <div class="right-links">
            <a href="<%= request.getContextPath() %>/music">Music List</a>
        </div>
    </div>

    <div class="container">
        <h2>Insert New Music</h2>
        <form action="<%= request.getContextPath() %>/music/insert" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="artist">Artist:</label>
                <input type="text" id="artist" name="artist" required>
            </div>
            <div class="form-group">
                <label for="albumID">Album ID (optional):</label>
                <input type="number" id="albumID" name="albumID">
            </div>
            <div class="form-group">
                <input type="submit" value="Add Music">
            </div>
        </form>
    </div>
</body>
</html>