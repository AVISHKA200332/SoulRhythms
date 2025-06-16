<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login - Music Store</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #141e30, #243b55);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      padding: 20px;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
      width: 100%;
      max-width: 420px;
      text-align: center;
      color: #fff;
    }

    .login-container h2 {
      margin-bottom: 25px;
      color: #fff;
      font-size: 28px;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }

    label {
      display: block;
      margin-bottom: 6px;
      color: #ddd;
      font-weight: 500;
    }

    input[type="text"],
    input[type="password"],
    select {
      width: 100%;
      padding: 12px;
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 10px;
      color: #fff;
      font-size: 15px;
      transition: all 0.3s ease;
    }

    input::placeholder, select {
      color: #ccc;
    }

    input:focus, select:focus {
      border-color: #8E2DE2;
      outline: none;
      background-color: rgba(255, 255, 255, 0.2);
    }

    .btn-login {
      background: linear-gradient(to right, #8E2DE2, #4A00E0);
      color: white;
      padding: 12px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      transition: transform 0.2s ease, opacity 0.3s ease;
    }

    .btn-login:hover {
      opacity: 0.9;
      transform: scale(1.02);
    }

    .error {
      color: #ff8080;
      font-size: 13px;
      margin-top: 4px;
    }

    .signup {
      margin-top: 20px;
      font-size: 14px;
    }

    .signup a {
      color: #8E2DE2;
      text-decoration: none;
      font-weight: bold;
    }

    .signup a:hover {
      text-decoration: underline;
    }

    .footer-text {
      margin-top: 25px;
      font-size: 13px;
      color: #ccc;
    }
  </style>

  <script>
  function validateForm() {
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    let valid = true;

    document.getElementById('emailError').textContent = '';
    document.getElementById('passwordError').textContent = '';

    if (!emailPattern.test(email)) {
      document.getElementById('emailError').textContent = 'Please enter a valid email.';
      valid = false;
    }

    if (password.length < 6) {
      document.getElementById('passwordError').textContent = 'Password must be at least 6 characters.';
      valid = false;
    }

    return valid;
  }
</script>

</head>
<body>
  <div class="login-container">
    <h2>🎵 Login to Music Store</h2>
    <form action="AdminLoginServlet" method="post" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="role">Select Role</label>
        <select id="role" name="role" required>
          <option value="">-- Select Role --</option>
          <option value="User">User</option>
          <option value="Admin">Admin</option>
          <option value="Moderator">Moderator</option>
          <option value="Artist">Artist</option>
        </select>
        <div id="roleError" class="error"></div>
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <input type="text" id="email" name="email" placeholder="you@example.com" required />
        <div id="emailError" class="error"></div>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="••••••••" required />
        <div id="passwordError" class="error"></div>
      </div>

      <button type="submit" class="btn-login">Login</button>
    </form>

    <div class="signup">
      Don't have an account? <a href="RoleSelectRegister.jsp">Sign up here</a>
    </div>

    <div class="footer-text">
      &copy; 2025 Music Store. All rights reserved.
    </div>
  </div>
</body>
</html>
