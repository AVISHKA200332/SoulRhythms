<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - SoulRythm Music Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        .register-hero {
            background: url('images/pick4.jpg') center center/cover no-repeat;
            height: 100vh;
            position: relative;
            color: white;
        }
        .register-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        .register-content {
            position: relative;
            z-index: 2;
            padding-top: 100px;
        }
        .role-card {
            border-radius: 15px;
            background: white;
            padding: 30px 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .role-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        .role-icon {
            width: 80px;
            margin-bottom: 10px;
        }
        .role-label {
            font-weight: bold;
            color: #212529;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">SoulRythm Music Store</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

<!-- Role Selection Hero Section -->
<div class="register-hero">
    <div class="register-overlay"></div>
    <div class="container register-content text-white">
        <h2 class="text-center mb-5">Select Your Role to Register</h2>
        <div class="row justify-content-center g-4">

            <!-- User -->
            <div class="col-md-3">
                <a href="userinsert.jsp" class="text-decoration-none">
                    <div class="role-card">
                        <img src="icons/user.png" alt="User" class="role-icon">
                        <div class="role-label">User</div>
                    </div>
                </a>
            </div>

            <!-- Admin -->
            <div class="col-md-3">
                <a href="#" class="text-decoration-none">
                    <div class="role-card">
                        <img src="icons/admin.png" alt="Admin" class="role-icon">
                        <div class="role-label">Admin</div>
                    </div>
                </a>
            </div>

            <!-- Moderator -->
            <div class="col-md-3">
                <a href="#" class="text-decoration-none">
                    <div class="role-card">
                        <img src="icons/moderator.png" alt="Moderator" class="role-icon">
                        <div class="role-label">Moderator</div>
                    </div>
                </a>
            </div>

            <!-- Artist -->
            <div class="col-md-3">
                <a href="ArtistRegister.jsp" class="text-decoration-none">
                    <div class="role-card">
                        <img src="icons/artist.jpg" alt="Artist" class="role-icon">
                        <div class="role-label">Artist</div>
                    </div>
                </a>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
