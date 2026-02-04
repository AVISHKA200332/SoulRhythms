<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | SoulRythm Music Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        fade: 'fadeIn 0.6s ease-in-out',
                        bounceIn: 'bounceIn 0.6s ease'
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: 0 },
                            '100%': { opacity: 1 }
                        },
                        bounceIn: {
                            '0%': { transform: 'scale(0.8)', opacity: 0 },
                            '60%': { transform: 'scale(1.05)', opacity: 1 },
                            '100%': { transform: 'scale(1)', opacity: 1 }
                        }
                    }
                }
            }
        };
    </script>
</head>
<body class="bg-gradient-to-r from-purple-500 to-indigo-600 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-2xl shadow-2xl p-10 w-full max-w-md animate-bounceIn">
    <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Login as an Artist 🎧</h2>

    <form method="post" action="${pageContext.request.contextPath}/user/login" class="space-y-6" id="loginForm">
        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="text-red-600 text-sm font-semibold text-center animate-fade">
                <%= error %>
            </div>
        <% } %>

        <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="email" id="email" required
                   class="mt-1 block w-full px-4 py-2 rounded-md border border-gray-300 focus:ring-indigo-500 focus:border-indigo-500 transition" />
        </div>

        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="password" id="password" required
                   class="mt-1 block w-full px-4 py-2 rounded-md border border-gray-300 focus:ring-indigo-500 focus:border-indigo-500 transition" />
        </div>

        <button type="submit"
                class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-4 rounded-md transition transform hover:scale-105 duration-300">
            Login
        </button>
    </form>

    <p class="text-sm text-center mt-6 text-gray-600">Don't have an account?
        <a href="ArtistRegister.jsp" class="text-indigo-600 font-semibold hover:underline">Register</a>
    </p>
</div>

<!-- Optional: JavaScript for enter key submission -->
<script>
    document.getElementById("loginForm").addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            this.submit();
        }
    });
</script>

</body>
</html>
