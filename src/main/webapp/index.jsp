<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SoulRythm Music Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
        }
        .hero-section {
            background: url('images/pick4.jpg') center center/cover no-repeat;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            position: relative;
        }
        .hero-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        .hero-content {
            position: relative;
            z-index: 2;
        }
        .feature-card {
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        footer {
            background-color: #1e1e2f;
            color: white;
            padding: 20px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">SoulRythm Music Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <!-- <li class="nav-item"><a class="nav-link" href="UserRegister.jsp">Register</a></li> -->
                    <li class="nav-item"><a class="nav-link" href="#">Music List</a></li>
                    <li class="nav-item"><a class="nav-link" href="musictracks.jsp">Albums</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1 class="display-4">Discover. Stream. Share.</h1>
            <p class="lead">Your go-to platform for the latest and greatest in music.</p>
            <a href="musictracks.jsp" class="btn btn-primary btn-lg mt-3">Start Listening</a>
        </div>
    </div>

    <!-- Featured Section -->
    <div class="container py-5">
        <h2 class="text-center mb-4">Featured Albums</h2>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card feature-card">
                    <img src="images/sansarini.jpg" class="card-img-top" alt="Top Hits">
                    <div class="card-body text-center">
                        <h5 class="card-title">Top Hits 2025</h5>
                        <p class="card-text">Listen to this week's trending songs across all genres.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card">
                    <img src="images/prathihari.jpg" class="card-img-top" alt="New Artists">
                    <div class="card-body text-center">
                        <h5 class="card-title">New Artists</h5>
                        <p class="card-text">Fresh sounds from rising stars around the world.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card feature-card">
                    <img src="images/pandama.jpg" class="card-img-top" alt="Genres">
                    <div class="card-body text-center">
                        <h5 class="card-title">Explore Genres</h5>
                        <p class="card-text">Dive into pop, hip hop, rock, jazz, EDM, and more.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center">
        &copy; 2025 SoulRythm Music Store. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
