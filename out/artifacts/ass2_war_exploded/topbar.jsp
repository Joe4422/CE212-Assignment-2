<%@ page import="shop.Product" %>
<jsp:useBean id='db'
             scope='session'
             class='shop.ShopDB'/>
<style>
    body, html {
        font-family: sans-serif;
        margin-top: 40px;
    }
    .topbar-group {
        position:fixed;
        top:0;
        left:0;
        width: 100%;
        background-color: #3b709a;
        margin: 0;
        user-select: none;
        box-shadow: 0 -25px 15px 30px darkgray;
    }

    .topbar-button {
        height: 40px;
        background-color: transparent;
        color:white;
        border: 0;
        transition: all .5s;
        padding-left: 16px;
        padding-right: 16px;
    }

    .topbar-button:hover {
        background-color: rgba(255, 255, 255, 0.27);
        cursor: pointer;
    }

    .topbar-button.topbar-current-product {
        background-color: rgba(255, 255, 255, 0.27);
    }

    #search-button {
        color:transparent;
        height: 40px;
        background-image: url("images/search.png");
        background-repeat: no-repeat;
        background-position: center;
    }

    .topbar-title {
        font-size:20px;
        margin-right:20px;
        margin-left:20px;
        color: #ff7e00;
    }
</style>
<nav class="topbar-group" style="font-size:0">
    <a class="topbar-title">My Store</a>
    <button class="topbar-button topbar-products" onclick="location.href = 'products.jsp'">Products</button>
    <%
        String pid = request.getParameter("pid");
        Product product = db.getProduct(pid);
        // out.println("pid = " + pid);
        if (product == null) {
            // do something sensible!!!
            out.println(product);
        } else {
    %>
        <button class="topbar-button topbar-current-product"><%= product.title %></button>
    <% } %>
    <button class="topbar-button topbar-basket" onclick="location.href = 'basket.jsp'">Basket</button>
    <button class="topbar-button topbar-search" onclick="location.href = 'search.jsp'" id="search-button">S</button>
</nav>