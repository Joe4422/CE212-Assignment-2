package shop;

import java.util.Collection;

public class Product {
    public String PID;
    public String artist;
    public String title;
    public String description;
    public int price;
    public String thumbnail;
    public String fullimage;

    public Product(
            String PID, String artist, String title,
            String description, int price, String thumbnail, String fullimage) {
        this.PID = PID;
        this.artist = artist;
        this.title = title;
        this.description = description;
        this.price = price;
        this.thumbnail = thumbnail;
        this.fullimage = fullimage;
    }

    public String toString() {
        return title + "\t " + price;
    }

    public String getFormattedPrice() {
        return getFormattedPrice(this.price);
    }

    public static String getFormattedPrice(Integer price) {
        String productPrice = Integer.toString(price);
        if (productPrice.length() == 1) productPrice = "0.0" + productPrice;
        else if (productPrice.length() == 2) productPrice = "0." + productPrice;
        else productPrice = productPrice.substring(0, productPrice.length() - 2) + "." + productPrice.substring(productPrice.length() - 2);
        productPrice = "&pound" + productPrice;
        return productPrice;
    }

    public static String generateProductView(Collection<Product> prods) {
        String s = "";
        if (prods.size() == 0) {
            s = "No products found.";
        }
        for (Product prod : prods) {
            s += "<div class=\"product-container\" onclick=\"location.href=\'viewProduct.jsp?pid=" + prod.PID + "\'\">\n";
            s +=    "<div>\n";
            s +=        "<p class=\"product-title\">" + prod.title + "</p>\n";
            s +=        "<p class=\"product-author\">by "+ prod.artist +"</p>\n";
            s +=    "</div>\n";
            s +=    "<div class=\"product-image-container\"><img class=\"product-image\" src=\"" + prod.thumbnail + "\"/></div>\n";
            s +=    "<div class=\"product-price\">" + prod.getFormattedPrice() + "</div>\n";
            s += "</div>\n";
        }
        return s;
    }

}
