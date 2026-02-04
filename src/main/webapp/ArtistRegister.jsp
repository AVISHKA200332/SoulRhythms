<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | SoulRythm Music Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    
    <style>
    .input-field {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 0.375rem;
        transition: all 0.3s ease;
    }
</style>
    
    
</head>
<body class="bg-gradient-to-r from-rose-400 to-fuchsia-500 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-2xl p-10 w-full max-w-md animate-fadeIn">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Artist Registration 🎶</h2>

    <form id="registerForm" action="${pageContext.request.contextPath}/artist/register" method="post">

        <% String message = (String) request.getAttribute("message");
           if (message != null) { %>
            <div class="text-green-600 text-sm font-semibold text-center"><%= message %></div>
        <% } %>

        <div>
            <label class="block text-sm font-medium text-gray-700">Username</label>
            <input type="text" name="username" required class="input-field" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Full Name</label>
            <input type="text" name="fullName" required class="input-field" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" required class="input-field" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Phone Number</label>
            <input type="text" name="phone" class="input-field" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Address</label>
            <textarea name="address" class="input-field"></textarea>
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" id="password" required class="input-field" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700">Confirm Password</label>
            <input type="password" name="confirmPassword" id="confirmPassword" required class="input-field" />
        </div>

        <button type="submit" class="w-full bg-pink-600 hover:bg-pink-700 text-white font-semibold py-2 px-4 rounded-md transition transform hover:scale-105 duration-300">
            Register
        </button>
    </form>

    <p class="text-sm text-center mt-6 text-gray-600">Already registered?
        <a href="ArtistLogin.jsp" class="text-pink-600 font-semibold hover:underline">Login here</a>
    </p>
</div>
<script>
    document.getElementById("registerForm").addEventListener("submit", function (e) {
        const pass = document.getElementById("password").value;
        const confirm = document.getElementById("confirmPassword").value;
        if (pass !== confirm) {
            e.preventDefault();
            alert("Passwords do not match!");
        }
    });
</script>

</body>
</html>
