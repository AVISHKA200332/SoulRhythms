<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      background: #f0f2f5;
    }
    .container {
      display: flex;
      flex: 1;
    }
    .sidebar {
      width: 240px;
      background: #343a40;
      color: #fff;
      padding: 20px;
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
    h1 {
      margin-bottom: 20px;
      color: #4A00E0;
    }
    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }
    .card {
      background: #fff;
      padding: 20px;
      border-left: 6px solid #8E2DE2;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
      border-radius: 8px;
    }
    .card h3 {
      font-size: 24px;
      color: #4A00E0;
    }
    .card p {
      color: #666;
    }
    .btn-manage {
      background: linear-gradient(to right, #8E2DE2, #4A00E0);
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
      transition: opacity 0.3s;
    }
    .btn-manage:hover {
      opacity: 0.9;
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
  <div class="container">
    <div class="sidebar">
      <h2>Admin Panel</h2>
      <a href="getTotUsersServlet" class="active">Dashboard</a>
      <a href="UserDisplayServlet">Manage</a>
      <a href="#">Feedback</a>
      <a href="login.jsp">Logout</a>
    </div>

    <div class="main">
      <h1>Welcome, Avishka</h1>

      <div class="cards">
        <div class="card">
          <h3><%= request.getAttribute("allUsers") %></h3>
   		 <p>Total Users</p>
        </div>
      </div>

      <button class="btn-manage" onclick="location.href='manage.jsp'">
        Go to Manage Page
      </button>
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
</body>
</html>
