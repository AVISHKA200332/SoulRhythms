<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users and Music</title>
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

    .tabs {
        margin-bottom: 20px;
    }

    .tabs button {
        padding: 12px 25px;
        border: none;
        background: #343a40;
        color: #fff;
        margin-right: 10px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
    }

    .tabs button.active {
        background: #007bff;
    }

    .section {
        display: none;
    }

    .section.active {
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
        background: #f9f9f9;
        padding: 25px;
        margin-top: 20px;
        border-radius: 6px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    form input, form select {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    form input[type="submit"] {
        background: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
    }

    form input[type="submit"]:hover {
        background: #0056b3;
    }

    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background: #fff;
        padding: 20px;
        width: 300px;
        border-radius: 6px;
    }

    .close-btn {
        float: right;
        cursor: pointer;
        font-weight: bold;
        color: red;
    }

    footer {
      background-color: #2c2c2c; /* Darker shade for the footer */
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
        <a href="UserDisplayServlet" class="active">Manage</a>
        <a href="#">Feedback</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="content-wrapper">
        <div class="main">
            <h1>Manage Users And Music</h1>

            <div class="tabs">
                <button class="active" onclick="switchTab('users')">Manage Users</button>
                <button onclick="switchTab('music')">Manage Music</button>
            </div>

            <!-- User Section -->
            <div id="users" class="section active">
                <h2>Users</h2>

                <form action="UserInsertServlet" method="POST">
                    <h3>Add New User</h3>
                    <input placeholder="Name" type="text" id="name" name="name" required>
                    <input placeholder="Email" type="email" id="email" name="email" required>
                    <select name="role" required>
                        <option value="">Select Role</option>
                        <option value="Listener">Listener</option>
                        <option value="Artist">Artist</option>
                    </select>
                    <input type="submit" value="Add User">
                </form>
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

    <!-- Edit User Modal -->
    <div class="modal" id="userModal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal('userModal')">&times;</span>
            <h3>Edit User</h3>
            <form>
                <input type="text" value="John Doe">
                <input type="email" value="john@example.com">
                <select>
                    <option>Listener</option>
                    <option>Artist</option>
                </select>
                <input type="submit" value="Save Changes">
            </form>
        </div>
    </div>

<script>
    function switchTab(tab) {
        document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
        document.getElementById(tab).classList.add('active');

        document.querySelectorAll('.tabs button').forEach(b => b.classList.remove('active'));
        event.target.classList.add('active');
    }

    function openModal(id) {
        document.getElementById(id).style.display = 'flex';
    }

    function closeModal(id) {
        document.getElementById(id).style.display = 'none';
    }
</script>
</body>
</html>
