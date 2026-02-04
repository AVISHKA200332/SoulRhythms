<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ include file="partials/UserHeader.jsp" %>

<style>
    body {
        background: url('./images/back4.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .content-wrapper {
        background-color: rgba(255, 255, 255, 0.9); /* light overlay for readability */
        border-radius: 20px;
        padding: 2rem;
        max-width: 800px;
        margin: 80px auto;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
</style>
<!-- Dashboard Greeting -->
<div class="bg-white rounded-3xl shadow-xl p-10 max-w-3xl mx-auto text-center mt-10 animate-fadeIn">
    <h2 class="text-4xl font-bold text-gray-800 mb-4">
        Welcome, <%= fullName %>!
    </h2>
</div>

<%@ include file="partials/UserFooter.jsp" %>
