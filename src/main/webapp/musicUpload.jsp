<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/partials/UserHeader.jsp" %>

<main class="p-6">

    <!-- Success/Error Messages -->
    <c:if test="${not empty success}">
        <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6 animate-bounce">
            <p>${success}</p>
            <c:remove var="success" scope="session"/>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 animate-pulse">
            <p>${error}</p>
            <c:remove var="error" scope="session"/>
        </div>
    </c:if>

    <!-- Upload or Edit Music Track -->
    <c:if test="${mode == 'create' || mode == 'edit'}">
        <div class="bg-white rounded-3xl shadow p-6 mb-6 transform transition hover:scale-105 max-w-xl mx-auto">
            <h2 class="text-2xl font-semibold mb-4 text-indigo-700">
                <c:choose>
                    <c:when test="${mode == 'create'}">Upload New Music Track</c:when>
                    <c:otherwise>Edit Music Track</c:otherwise>
                </c:choose>
            </h2>

            <form action="${pageContext.request.contextPath}/tracks" method="POST">
                <input type="hidden" name="action" value="${mode == 'create' ? 'create' : 'update'}" />
                <c:if test="${mode == 'edit'}">
                    <input type="hidden" name="id" value="${currentTrack.trackId}" />
                </c:if>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                    <div>
                        <label class="block text-gray-700 mb-2">Title</label>
                        <input type="text" name="title" value="${currentTrack.title}" class="w-full border rounded px-3 py-2" required>
                    </div>
                    <div>
                        <label class="block text-gray-700 mb-2">Artist</label>
                        <input type="text" name="artist" value="${currentTrack.artist}" class="w-full border rounded px-3 py-2" required>
                    </div>
                    <div>
                        <label class="block text-gray-700 mb-2">Genre</label>
                        <input type="text" name="genre" value="${currentTrack.genre}" class="w-full border rounded px-3 py-2" required>
                    </div>
                    <div>
                        <label class="block text-gray-700 mb-2">Price</label>
                        <input type="number" step="0.01" name="price" value="${currentTrack.price}" class="w-full border rounded px-3 py-2" required>
                    </div>
                </div>

                <div class="flex justify-end space-x-3">
                    <a href="${pageContext.request.contextPath}/tracks"
                       class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded">Cancel</a>
                    <button type="submit"
                            class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded">
                        <c:choose>
                            <c:when test="${mode == 'create'}">Upload</c:when>
                            <c:otherwise>Update</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </c:if>

    <!-- View Music Track Details -->
    <c:if test="${mode == 'view'}">
        <div class="bg-white rounded-3xl shadow p-6 mb-6 animate-fade-in max-w-xl mx-auto">
            <h2 class="text-2xl font-semibold mb-4 text-indigo-700">Track Details</h2>
            <div class="space-y-4">
                <p><strong>Title:</strong> ${currentTrack.title}</p>
                <p><strong>Artist:</strong> ${currentTrack.artist}</p>
                <p><strong>Genre:</strong> ${currentTrack.genre}</p>
                <p><strong>Price:</strong> $${currentTrack.price}</p>
            </div>
            <div class="flex justify-end mt-6">
                <a href="${pageContext.request.contextPath}/tracks"
                   class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded">Back to List</a>
            </div>
        </div>
    </c:if>

    <!-- List of Music Tracks -->
    <c:if test="${mode == 'list'}">
        <div class="bg-white rounded-3xl shadow overflow-hidden">
            <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
                <h2 class="text-2xl font-semibold text-gray-800">My Music Library</h2>
                <a href="${pageContext.request.contextPath}/tracks?mode=create"
                   class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-md text-sm font-medium">
                    <i class="fas fa-plus mr-2"></i>Upload New
                </a>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Title</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Artist</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Genre</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Price</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${tracks}" var="track">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">${track.title}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${track.artist}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${track.genre}</td>
                            <td class="px-6 py-4 whitespace-nowrap">$${track.price}</td>
                            <td class="px-6 py-4 whitespace-nowrap space-x-3">
                                <a href="${pageContext.request.contextPath}/tracks?mode=view&id=${track.trackId}" class="text-blue-600 hover:text-blue-900"><i class="fas fa-eye"></i> View</a>
                                <a href="${pageContext.request.contextPath}/tracks?mode=edit&id=${track.trackId}" class="text-yellow-600 hover:text-yellow-900"><i class="fas fa-edit"></i> Edit</a>
                                <form action="${pageContext.request.contextPath}/tracks" method="POST" class="inline">
                                    <input type="hidden" name="action" value="delete"/>
                                    <input type="hidden" name="id" value="${track.trackId}"/>
                                    <button type="submit" class="text-red-600 hover:text-red-900"
                                            onclick="return confirm('Are you sure you want to delete this track?')">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

</main>

<%@ include file="/partials/UserFooter.jsp" %>
