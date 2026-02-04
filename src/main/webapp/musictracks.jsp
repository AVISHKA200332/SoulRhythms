<%@ page import="java.util.*, java.math.BigDecimal" %>
<%@ page import="model.MusicTrack" %>
<%@ page import="services.MusicTrackService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<MusicTrack> trackList = new ArrayList<>();
    try {
        MusicTrackService service = new MusicTrackService();
        trackList = service.getAllTracks(); // ✅ Fetches ALL tracks
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Music Tracks</title>
    <style>
    body {
        background: url('./images/back4.jpg') no-repeat center center fixed;
        background-size: cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        background-color: #121212;
        color: #fff;
    }

    .content-wrapper {
        background-color: rgba(255, 255, 255, 0.9); /* light overlay for readability */
        border-radius: 20px;
        padding: 2rem;
        max-width: 800px;
        margin: 80px auto;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
   }

    header {
        background-color: #1DB954;
        padding: 20px 0;
        text-align: center;
    }

    header h1 {
        margin: 0;
        color: white;
        font-size: 36px;
        letter-spacing: 1px;
    }

    h2 {
        text-align: center;
        color: #1DB954;
        margin-top: 30px;
    }

    .search-box {
        max-width: 400px;
        margin: 20px auto;
        text-align: center;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 30px;
        border: none;
        outline: none;
        background-color: #282828;
        color: #fff;
    }

    table {
        width: 90%;
        margin: 30px auto;
        border-collapse: collapse;
        background-color: #181818;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        border-radius: 12px;
        overflow: hidden;
    }

    th, td {
        padding: 16px;
        text-align: left;
    }

    th {
        background-color: #1DB954;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #202020;
    }

    tr:hover {
        background-color: #333;
        transition: 0.3s ease;
    }

    .no-results {
        text-align: center;
        color: #bbb;
        margin-top: 20px;
    }

    footer {
        background-color: #181818;
        text-align: center;
        padding: 16px 0;
        margin-top: 40px;
        border-top: 1px solid #333;
    }

    footer p {
        color: #777;
        font-size: 14px;
    }
</style>

    <script>
        function filterTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const table = document.getElementById("tracksTable");
            const rows = table.getElementsByTagName("tr");

            let visible = false;

            for (let i = 1; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName("td");
                let rowText = "";
                for (let j = 0; j < cells.length; j++) {
                    rowText += cells[j].textContent.toLowerCase() + " ";
                }
                const match = rowText.includes(filter);
                rows[i].style.display = match ? "" : "none";
                if (match) visible = true;
            }

            document.getElementById("noResults").style.display = visible ? "none" : "block";
        }
    </script>
</head>
<body>
<header style="background-color: #4CAF50; padding: 20px 0; text-align: center;">
    <h1 style="margin: 0; color: white; font-size: 32px;">SoulRhythms Music Store</h1>
</header>

<h2>🎵 All Music Tracks</h2>

<div class="search-box">
    <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by title, artist, or genre...">
</div>

<% if (trackList != null && !trackList.isEmpty()) { %>
    <table id="tracksTable">
        <tr>
            <th>Title</th>
            <th>Artist</th>
            <th>Genre</th>
            <th>Price</th>
        </tr>
        <% for (MusicTrack track : trackList) { %>
        <tr>
            <td><%= track.getTitle() %></td>
            <td><%= track.getArtist() %></td>
            <td><%= track.getGenre() %></td>
            <td>$<%= track.getPrice() %></td>
        </tr>
        <% } %>
    </table>
    <div id="noResults" class="no-results" style="display:none;">No matching tracks found.</div>
<% } else { %>
    <p class="no-results">No tracks found.</p>
<% } %>

<footer style="background-color: #1DB954; text-align: center; padding: 16px 0; margin-top: 40px; border-top: 1px solid #ddd;">
    <p style="color: #666; font-size: 14px;">&copy; 2025 SoulRhythms Music Store. All rights reserved.</p>
</footer>

</body>
</html> 