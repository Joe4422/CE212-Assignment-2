<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="shop.Product" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id='db'
             scope='page'
             class='shop.ShopDB'/>

<%
    Collection<Product> prods = null;
    String searchType = request.getParameter("searchtype");
    if (searchType != null) {
        if (searchType.equals("artist")) {
            String artistName = request.getParameter("name");
            if (artistName != null) {
                try {
                    prods = db.searchArtistName(artistName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (searchType.equals("price")) {
            String lowerBound = request.getParameter("lowerBound");
            if (lowerBound != null) {
                String upperBound = request.getParameter("upperBound");
                if (upperBound != null) {
                    try {
                        prods = db.searchPriceRange((int) (Double.parseDouble(lowerBound) * 100), (int) (Double.parseDouble(upperBound) * 100));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
%>

<html>
    <head>
        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="products.css">
        <style>
            .topbar-button.topbar-search {
                background-color: rgba(255, 255, 255, 0.27);
            }
        </style>
        <script>
            function swap(a) {
                if (a == 0) {
                    document.getElementById("search-artist").style.display = "block";
                    document.getElementById("search-price").style.display = "none";
                    document.getElementById("artist-name").disabled = false;
                    document.getElementById("number-lower").disabled = true;
                    document.getElementById("number-upper").disabled = true;
                } else {
                    document.getElementById("search-artist").style.display = "none";
                    document.getElementById("search-price").style.display = "block";
                    document.getElementById("artist-name").disabled = true;
                    document.getElementById("number-lower").disabled = false;
                    document.getElementById("number-upper").disabled = false;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="topbar.jsp"/>
        <p>Search by:</p>
        <form action="search.jsp" method="get">
            <input id="search-type-artist" onclick="swap(0)" type="radio" name="searchtype" value="artist" checked>
            <label for="search-type-artist">Artist</label>
            <input id="search-type-price-range" onclick="swap(1)" type="radio" name="searchtype" value="price">
            <label for="search-type-price-range">Price Range</label>
            <div id="search-artist">
                <p>Artist Name</p>
                <input id="artist-name" type="text" name="name">
            </div>
            <div id="search-price" style="display:none">
                <p>Lower Bound</p>
                £<input id="number-lower" disabled type="number" step="0.01" min="0.01" name="lowerBound">
                <p>Upper Bound</p>
                £<input id="number-upper" disabled type="number" step="0.01" min="0.01" name="upperBound">
            </div>
            <input type="submit" value="Search">
        </form>
        <% if (prods != null) {
            out.write(Product.generateProductView(prods));
        } %>

    </body>
</html>
