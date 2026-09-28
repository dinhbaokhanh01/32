1. pom.xml
Lưu ý: Đối với máy chủ Tomcat 10+ (Jakarta EE 10), sử dụng thư viện JSTL bản jakarta.servlet.jsp.jstl-api phiên bản 3.0.0 và Glassfish implementation.

XML
<project xmlns="[http://maven.apache.org/POM/4.0.0](http://maven.apache.org/POM/4.0.0)" 
         xmlns:xsi="[http://www.w3.org/2001/XMLSchema-instance](http://www.w3.org/2001/XMLSchema-instance)" 
         xsi:schemaLocation="[http://maven.apache.org/POM/4.0.0](http://maven.apache.org/POM/4.0.0) [http://maven.apache.org/maven-v4_0_0.xsd](http://maven.apache.org/maven-v4_0_0.xsd)">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.codegym</groupId>
    <artifactId>jstl-customer-list</artifactId>
    <packaging>war</packaging>
    <version>1.0-SNAPSHOT</version>
    <name>JSTL Customer List Webapp</name>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <!-- Jakarta Servlet API -->
        <dependency>
            <groupId>jakarta.servlet</groupId>
            <artifactId>jakarta.servlet-api</artifactId>
            <version>6.0.0</version>
            <scope>provided</scope>
        </dependency>

        <!-- Jakarta JSP API -->
        <dependency>
            <groupId>jakarta.servlet.jsp</groupId>
            <artifactId>jakarta.servlet.jsp-api</artifactId>
            <version>3.1.1</version>
            <scope>provided</scope>
        </dependency>

        <!-- JSTL Core API (Tomcat 10+) -->
        <dependency>
            <groupId>jakarta.servlet.jsp.jstl</groupId>
            <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
            <version>3.0.0</version>
        </dependency>

        <!-- Glassfish JSTL Implementation -->
        <dependency>
            <groupId>org.glassfish.web</groupId>
            <artifactId>jakarta.servlet.jsp.jstl</artifactId>
            <version>3.0.1</version>
        </dependency>
    </dependencies>

    <build>
        <finalName>jstl-customer-list</finalName>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.4.0</version>
            </plugin>
        </plugins>
    </build>
</project>
2. src/main/java/com/codegym/model/Customer.java
Java
package com.codegym.model;

public class Customer {
    private String name;
    private String dob;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String name, String dob, String address, String image) {
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
3. src/main/webapp/index.jsp
Java
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codegym.model.Customer" %>

<%-- Khai báo thư viện JSTL Core (Chuẩn Jakarta EE cho Tomcat 10+) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    // Khởi tạo danh sách khách hàng giả lập và đưa vào pageContext / request scope
    List<Customer> customerList = new ArrayList<>();
    customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "assets/images/customer1.jpg"));
    customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "assets/images/customer2.jpg"));
    customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "assets/images/customer3.jpg"));
    customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "assets/images/customer1.jpg"));
    customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "assets/images/customer2.jpg"));

    request.setAttribute("customers", customerList);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 40px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #1b2a7a;
            margin-bottom: 25px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #e2e8f0;
            padding: 12px 15px;
            text-align: left;
            vertical-align: middle;
        }
        th {
            background-color: #1b2a7a;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f8fafc;
        }
        .avatar {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>DANH SÁCH KHÁCH HÀNG</h2>
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
                    <th>Ảnh</th>
                </tr>
            </thead>
            <tbody>
                <%-- Sử dụng thẻ JSTL c:forEach để duyệt danh sách --%>
                <c:forEach var="customer" items="${customers}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td><b>${customer.name}</b></td>
                        <td>${customer.dob}</td>
                        <td>${customer.address}</td>
                        <td>
                            <img src="${customer.image}" alt="${customer.name}" class="avatar" 
                                 onerror="this.src='[https://via.placeholder.com/60](https://via.placeholder.com/60)';"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
4. src/main/webapp/WEB-INF/web.xml
XML
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="[https://jakarta.ee/xml/ns/jakartaee](https://jakarta.ee/xml/ns/jakartaee)"
         xmlns:xsi="[http://www.w3.org/2001/XMLSchema-instance](http://www.w3.org/2001/XMLSchema-instance)"
         xsi:schemaLocation="[https://jakarta.ee/xml/ns/jakartaee](https://jakarta.ee/xml/ns/jakartaee) [https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd](https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd)"
         version="6.0">

    <display-name>JSTL Customer List</display-name>

    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>

</web-app>
