<%@ page import="javax.servlet.http.HttpSession" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/user/login");
        return;
    }

    String fullName = (String) session.getAttribute("fullName");
%>

<!-- Header Layout -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | SoulRhythms Music Store</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        fadeIn: 'fadeIn 0.5s ease-in-out',
                        slideUp: 'slideUp 0.5s ease-out'
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: 0 },
                            '100%': { opacity: 1 }
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(20px)', opacity: 0 },
                            '100%': { transform: 'translateY(0)', opacity: 1 }
                        }
                    }
                }
            }
        };
    </script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

<!-- Navbar -->
<nav class="bg-indigo-700 text-white px-6 py-4 shadow-md">
    <div class="max-w-7xl mx-auto flex justify-between items-center">
        <h1 class="text-2xl font-bold" >SoulRhythms Music Store</h1>
        <div class="flex items-center space-x-4">
            <span>Hello, <%= fullName %>!</span>
            <a href="${pageContext.request.contextPath}/tracks"
               class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded text-white font-semibold transition duration-200 ease-in-out">
                Music Tracks
            </a>
            <a href="${pageContext.request.contextPath}/user/index.jsp"
               class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded text-white font-semibold transition duration-200 ease-in-out">
                Logout
            </a>
        </div>
    </div>
</nav>
