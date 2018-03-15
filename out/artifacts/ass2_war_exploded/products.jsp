<%@ page import="shop.Product" %>

<jsp:useBean id='db'
             scope='session'
             class='shop.ShopDB'/>

<html>
    <head>
        <title>My Shop</title>
        <link rel="stylesheet" type="text/css" href="products.css">
        <style>
            .topbar-button.topbar-products {
                background-color: rgba(255, 255, 255, 0.27);
            }
        </style>
    </head>
    <body>
        <jsp:include page="topbar.jsp"/>
        <%= Product.generateProductView(db.getAllProducts()) %>
    </body>
</html>
