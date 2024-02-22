<%@page import="com.bean.Common"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Trang Đăng Nhập</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  
    <link rel="stylesheet" href="<%=Common.url %>/static/admin1/assets/css/styles.css" type="text/css"> 
   
    
       <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng Ký</h3></div>
                            <div class="card-body">
                                <form action="acction-dang-ki" method='POST'>
                                
                               
                         <p class="text-danger"> ${mess}</p>
                 <p class="text-danger"> ${mess1}</p>
                  <p class="text-danger"> ${mess2}</p>
                   <p class="text-success"> ${mess3}</p>
                    <p class="text-danger"> ${mess4}</p>
			
			
				
					
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="username" type="text" placeholder="Tên đăng nhập" minlength="8" required />
                                        <label for="inputEmail">Tên Đăng Nhập</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="password" type="password" placeholder="Password" minlength="8" required />
                                        <label for="inputPassword">Mật khẩu</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control"  name="passwordre" type="password" placeholder="Tên đăng nhập"  minlength="8" required/>
                                        <label for="inputEmail">Nhập lại mật khẩu</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="address" type="text" placeholder="Password" minlength="8" required/>
                                        <label for="inputPassword">Địa chỉ</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control"  name="fullname" type="text" placeholder="Tên đăng nhập" minlength="8" required/>
                                        <label for="inputEmail">Họ Tên</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control"  name="number_phone" type="text" placeholder="Số điện thoại" minlength="8" required/>
                                        <label for="inputEmail">Số điện thoại</label>
                                    </div>
                
					
			

                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                       <p   class="btn btn-primary " onclick="redirect('primary')" >Quay lại</p>
                                        <button class="btn btn-primary" type="submit" style="margin-left: 300px !important;">Đăng Kí</button>
                                     
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%=Common.url %>/static/admin1/assets/js/scripts.js"></script>
                 <script>
    function redirect(type) {
      if (type === 'primary') {
        // Điều hướng khi nhấp vào nút chính
        window.location.href = 'http://localhost:8080/WebDonation/dang-nhap';
      } 
    }
   
  </script>
</body>
</html>