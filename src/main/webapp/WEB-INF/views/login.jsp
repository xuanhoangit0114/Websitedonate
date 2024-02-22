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
    <meta charset="utf-8" />
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
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng nhập</h3></div>
                            <div class="card-body">
                                <form action="j_spring_security_check" method='POST'>
                                    <div class="form-floating mb-3">
                                        <input  minlength="4"  class="form-control" id="inputEmail" name="j_username" type="text" placeholder="Tên đăng nhập" required />
                                        <label for="inputEmail">Tên Đăng Nhập</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input   minlength="6"  class="form-control" id="inputPassword" name="j_password" type="password" placeholder="Password" required/>
                                        <label for="inputPassword">Mật khẩu</label>
                                    </div>
                                   <c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">	
							bạn chưa có tài khoản hoặc bị khóa tài khoản
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">	
							you Not authorize
					</div>
				</c:if>
				         <c:if test="${requestScope.true_know eq 'a'}">
					<div class="alert alert-success">	
							Đăng kí thành công
					</div>
				</c:if>
                         <c:if test="${requestScope.true_know eq 'b'}">
					<div class="alert alert-danger">	
							Đăng kí thất bại
					</div>
				</c:if>
			

                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                       <p   class="btn btn-primary " onclick="redirect('primary')" >Quay lại</p>
                                       <p   class="btn btn-primary " onclick="redirect('second')" style="margin-left: 20px !important;" >Đăng kí</p>
                                        <button class="btn btn-primary" type="submit" style="margin-left: 160px !important;">Đăng nhập</button>
                                     
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
        window.location.href = 'http://localhost:8080/WebDonation/trang-chu?page=1&limit=5';
      } 
      else if (type === 'second') {
          // Điều hướng khi nhấp vào nút chính
          window.location.href = 'http://localhost:8080/WebDonation/dang-ki';
        } 
    }
  </script>
</body>
</html>