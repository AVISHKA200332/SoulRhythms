<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Music List</title>
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #ffffff;
            font-size: 24px;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            color: #b3b3b3;
            font-size: 14px;
            margin-right: 10px;
        }
        input[type="text"] {
            background-color: #282828;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            padding: 8px;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #1db954;
            border: none;
            border-radius: 20px;
            color: #ffffff;
            padding: 8px 16px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }
        input[type="submit"]:hover {
            background-color: #1ed760;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            color: #b3b3b3;
            font-size: 14px;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            color: #b3b3b3;
            font-weight: normal;
            border-bottom: 1px solid #282828;
        }
        tr:hover {
            background-color: #282828;
        }
        td {
            color: #ffffff;
        }
        a {
            color: #1db954;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            color: #1ed760;
            text-decoration: underline;
        }
        form[action="<%= request.getContextPath() %>/delete/music"] input[type="submit"] {
            background: none;
            border: none;
            color: #1db954;
            font-size: 14px;
            cursor: pointer;
            padding: 0;
        }
        form[action="<%= request.getContextPath() %>/delete/music"] input[type="submit"]:hover {
            color: #1ed760;
            text-decoration: underline;
        }
        .add-new {
            display: inline-block;
            margin-top: 20px;
            background-color: #1db954;
            border-radius: 20px;
            padding: 10px 20px;
            color: #ffffff;
            font-size: 14px;
        }
        .add-new:hover {
            background-color: #1ed760;
            color: #ffffff;
            text-decoration: none;
        }
        .error {
            color: #ff4d4d;
            font-size: 14px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h2>Music List</h2>
    <form action="<%= request.getContextPath() %>/music" method="get">
        <label for="search">Search by Title or Artist:</label>
        <input type="text" id="search" name="search" value="${param.search}">
        <input type="submit" value="Search">
    </form>
    
    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>
    
    <c:choose>
        <c:when test="${empty musics}">
            <p class="error">No music found. Try adding some music or check the database.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Artist</th>
                    <th>Album ID</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="music" items="${musics}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${music.title}</td>
                        <td>${music.artist}</td>
                        <td>${music.albumID != null ? music.albumID : 'N/A'}</td>
                        <td>
                            <a href="<%= request.getContextPath() %>/music/update?songID=${music.songID}">Edit</a> |
                            <form action="<%= request.getContextPath() %>/delete/music" method="post" style="display:inline;">
                                <input type="hidden" name="songID" value="${music.songID}">
                                <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete ${music.title}?');">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    
    <a href="<%= request.getContextPath() %>/music/insert" class="add-new">Add New Music</a>
</body>
</html>