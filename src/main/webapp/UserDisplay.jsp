<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: 'Segoe UI', sans-serif;
        display: flex;
        background: #f0f2f5;
        min-height: 100vh;
    }
    
    .container {
        display: flex;
        flex: 1;
    }

    .sidebar {
        width: 250px;
        background: #343a40;
        color: #fff;
        padding: 20px;
        height: 100vh;
        position: fixed;
    }

    .sidebar h2 {
        margin-bottom: 20px;
        font-size: 22px;
        color: #fff;
        text-align: center;
    }

    .sidebar a {
        display: block;
        color: #ddd;
        text-decoration: none;
        margin: 12px 0;
        padding: 12px 15px;
        border-radius: 4px;
        font-size: 16px;
    }

    .sidebar a:hover, .sidebar a.active {
        background: #007bff;
        color: #fff;
    }

    .content-wrapper {
        display: flex;
        flex-direction: column;
        flex: 1;
        margin-left: 270px;
        min-height: 100vh;
        background: #fff;
    }

    .main {
        padding: 30px;
        flex: 1;
    }

    .section {
        display: block;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }

    th {
        background: #f1f1f1;
    }

    form {
        display: inline;
    }

    button {
        padding: 8px 12px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }

    .add-user {
        padding: 8px 16px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 4px;
        font-weight: bold;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .add-user:hover {
        background-color: #218838;
    }

    footer {
        background-color: #2c2c2c;
        color: #fff;
        padding: 20px 30px;
        text-align: center;
        font-size: 14px;
        margin-top: auto;
    }

    footer a {
        color: #ddd;
        margin: 0 10px;
        text-decoration: none;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="getTotUsersServlet">Dashboard</a>
        <a href="UserDisplayServlet">Manage</a>
        <a href="#">Feedback</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content-wrapper">
        <div class="main">
            <div id="users" class="section active">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                    <h2>All Users</h2>
                    <a href="manage.jsp">
                        <button class="add-user">➕ Add User</button>
                    </a>
                </div>

                <table>
                    <tr>
                        <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th>
                    </tr>
                    
                    <c:forEach var="users" items="${allUsers}">
                        <tr>
                            <td>${users.id}</td>
                            <td>${users.name}</td>
                            <td>${users.email}</td>
                            <td>${users.role}</td>
                            <td>
                                <a href="Update.jsp?id=${users.id}&name=${users.name}&email=${users.email}&role=${users.role}">
                                    <button>Update</button>
                                </a>
                                <form action="deleteServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${users.id}">
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <footer>
            <div style="margin-bottom: 10px;">
                🎵 <strong>Music is a language that can talk to our soul</strong>
            </div>
            <div style="margin-bottom: 10px;">
                <a href="getTotUsersServlet">Dashboard</a> |
                <a href="UserDisplayServlet">Manage</a> |
                <a href="#">Feedback</a>
            </div>
            <div style="margin-bottom: 10px;">
                🌐 Follow us:
                <a href="#">🐦 Twitter</a>
                <a href="#">📘 Facebook</a>
                <a href="#">📸 Instagram</a>
            </div>
            <div>
                &copy; 2025 Music Store. All rights reserved.
            </div>
        </footer>
    </div>

</body>
</html>
