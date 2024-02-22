<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bean.Common"%>
<%@page import="com.util.SecurityUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
    <title>Donation website &mdash; Website Donation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />
    <link rel="shortcut icon" href="ftco-32x32.png">
    
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/custom-bs.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/fonts/icomoon/style.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/fonts/line-icons/style.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/animate.min.css">
  
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=Common.url %>/static/user/assets/css/style.css">
    
    <script src="<%=Common.url %>/static/user/assets/js/jquery.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/isotope.pkgd.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/stickyfill.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/jquery.fancybox.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/jquery.easing.1.3.js"></script>

    <script src="<%=Common.url %>/static/user/assets/js/jquery.waypoints.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/jquery.animateNumber.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/owl.carousel.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/bootstrap-select.min.js"></script>
    <script src="<%=Common.url %>/static/user/assets/js/custom.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <style type="text/css">
      .site-footer {
    display: flex;
    justify-content: center;
    align-items: center;
}

.fb-share-button-container {
    text-align: center;
}

.fb-share-button {
    /* Điều chỉnh kích thước của button */
    transform: scale(1.5); /* Có thể điều chỉnh tỷ lệ theo ý muốn */
}
  </style>
</head>
<body id="top">

<div id="overlayer"></div>
<div class="loader">
  <div class="spinner-border text-primary" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>
<div th:if="${msg}" class="toast" data-delay="1000" style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">

 

</div>

<div class="site-wrap">

  <div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close mt-3">
        <span class="icon-close2 js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div> <!-- .site-mobile-menu -->


  <!-- NAVBAR -->
  <header class="site-navbar mt-3">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="site-logo col-6"><a href="/">Website Quyên Góp</a></div>

      
 <p style="margin-left: 1050px"  class="btn btn-primary " onclick="redirect('third')" >Trang chủ</p>
       

      </div>
    </div>
  </header>
  </header>

  <!-- HOME -->
 


  <section class="site-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-5">
           
          </div>

         
        </div>
       <div class="col-lg-6 ">
  <div class="bg-light p-3 border rounded mb-4">
    <h3 class="text-primary mt-3 h5 pl-3 mb-3">Thông tin của bạn</h3>
    <ul class="list-unstyled pl-3 mb-0">
      <li class="mb-2"><strong class="text-black">ID:</strong> ${user.id}</li>
      <li class="mb-2"><strong class="text-black">Tên :</strong>${user.full_name}</li>
      <li class="mb-2"><strong class="text-black">Số điện thoại:</strong>${user.phone_number} </li>
      <li class="mb-2"><strong class="text-black">Email:</strong>${user.email}</li>
      <li class="mb-2"><strong class="text-black">Tài khoản:</strong>${user.userName}</li>
        <li class="mb-2"><strong class="text-black">Địa chỉ:</strong>${user.address}</li>
    </ul>
  </div>

  <div class="bg-light p-3 border rounded">
    <button type="button" style="color: white" data-toggle="modal" data-target="#exampleModal" class="btn btn-block btn-primary btn-md">Thay đổi thông tin</button>
  </div>
</div>
      </div>
    </div>
    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Thông tin</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form method="post" action="update_userdetails">
            <div class="modal-body">
              <div class="row">

                <div class="col-12">
                  <label for="addname"
                  
                         class="col-form-label">Họ tên:</label>
                  <input type="text" class="form-control"
                         id="addname" name="fullname"   minlength="8"  value="${user.full_name} " required>
                  <label for="addname"
                         class="col-form-label">Tài khoản:</label>
                  <input type="text" class="form-control" placeholder=""
                         id="addname" name="username"   minlength="8"   value="${user.userName}" required >
                  <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="idUser"    minlength="8"  value="${user.id}" >
                         <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="idRole"    minlength="8"  value="${user.role_id} " >
                       <label for="addname"
                         class="col-form-label">Mật khẩu mới (bỏ qua để giữ mật khẩu cũ):</label>    
                  <input type="text" class="form-control" placeholder="Mật khẩu được mã hóa để bảo mật"
                         id="addname" name="password"  >
                      


                  <label for="addname"
                         class="col-form-label">Địa chỉ:</label>    
                  <input type="text" class="form-control" placeholder=""
                         id="addname" name="address"    minlength="8"  value="${user.address }" required>
                  <label for="addname"
                         class="col-form-label">email:</label>    
                  <input type="text" class="form-control" placeholder=""
                         id="addname" name="email"   minlength="8"  value="${user.email }" required>
                 
                
                         <label for="addname"
                         class="col-form-label">số điện thoại:</label>    
                  <input type="text" class="form-control" placeholder=""
                         id="addname" name="phone_number"   minlength="8"  value="${user.phone_number }" required>
                 
                
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary" onclick="validatePassword()">Thực hiện</button>
              </div>
            </div>
          </form>


        </div>
      </div>
    </div>
  </section>

<footer th:replace="public/fragments :: footer" class="site-footer">
 <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0&appId=YOUR_APP_ID" nonce="NONCE_VALUE"></script>
    
    <!-- Button chia sẻ -->
    <div class="fb-share-button" data-href="https://momo.vn/cong-dong/gay-quy-thuc-hien-chuong-trinh-truyen-thong-phong-chong-tinh-vinh-long?fbclid=IwAR04fndbI5pS2Xy82wRPkdQOCVsSZpYYnmJERmmMA9C51OQN4WPDQfUiFz4" data-layout="button_count" data-size="small">
        <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fyour-website-url.com%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a>
    </div>
 
  </footer>
 <script type="text/javascript">
 function redirect(type,id) {
     if (type === 'primary') {
       // Điều hướng khi nhấp vào nút chính
       window.location.href = 'http://localhost:8080/WebDonation/donate?id='+ id;
     } else if (type === 'secondary') {
       // Điều hướng khi nhấp vào nút phụ
       window.location.href = 'http://localhost:8080/WebDonation/dang-nhap';
     }
     else if (type === 'third') {
         // Điều hướng khi nhấp vào nút phụ
         window.location.href = 'http://localhost:8080/WebDonation/trang-chu?page=1&limit=5';
       }
   }</script>
   
   
 
</div>

</body>
</html>