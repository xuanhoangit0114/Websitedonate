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

  <script>
    // Hàm hiển thị SweetAlert
    function showSweetAlert() {
        swal({
            title: 'Donate Thành Công!',
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        });
    }
</script>

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
 <section class="section-hero overlay inner-page bg-image" style="background-image: url('${donate.banner}" id="home-section">
           <div class="container">
      <div class="row">
        <div class="col-md-7">
          <h1 class="text-white font-weight-bold">Chi tiết đợt quyên góp</h1>
          <div class="custom-breadcrumbs">

          </div>
        </div>
      </div>
    </div>
  </section>


  <section class="site-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-5">
            <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Nội dung của đợt quyên góp</h3>
            <span>${donate.decription}</span>
            
             <h4 class="mb-5" > Hình ảnh về đợt quyên góp</h4>
            <img alt="" src="${donate.image}">
          </div>

          <div class="pt-5">
            <h4 class="mb-5" > Danh sách quyên góp mới nhất</h4>
<!--            <h3 class="mb-5" th:text="${userDonationList.size()}+${'  donation'}"> </h3>-->
            <ul class="comment-list">
              <th>
                <li class="comment">
                <c:if test="${size > 0 }">
                 <div class="vcard bio">
                    <img src="data:image/png;base64,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">
                  </div>
                
                <c:forEach var="item" items="${user_donate}" varStatus="loop" begin="${size - 1}" end="${size - 1}">
                                           <i class="bi bi-person-bounding-box"></i>
                 
                  <div class="comment-body">
                    <h3>${item.name}</h3>
                  
                    <div class="meta" style="color: #373b3e !important;"> <p>${item.created} </p></div>
                   
                     <p>${item.money}  VND</p>
                 
                  </div>
                  </c:forEach>
                 <c:forEach var="item" items="${user_donate}" varStatus="loop" begin="${size - 2}" end="${size - 2}">
                                           <i class="bi bi-person-bounding-box"></i>
                 
                  <div class="comment-body">
                    <h3>${item.name}</h3>
                  
                    <div class="meta" style="color: #373b3e !important;"> <p>${item.created} </p></div>
                   
                     <p>${item.money}  VND</p>
                 
                  </div>
                  </c:forEach>
                  
                     <div class="vcard bio">
                    <img src="data:image/png;base64,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">
                  </div>
               </c:if>
                </li>
              </th>

            </ul>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="bg-light p-3 border rounded mb-4">
            <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Thông tin</h3>
            <ul class="list-unstyled pl-3 mb-0">
              <li class="mb-2"><strong class="text-black">Mã đợt quyên góp:</strong> ${donate.code}</li>
              <li class="mb-2"><strong class="text-black">Tên đợt quyên góp:</strong>${donate.name}</li>
              <li class="mb-2"><strong class="text-black">Ngày bắt đầu:</strong>${donate.start_date} </li>
              <li class="mb-2"><strong class="text-black">Ngày kết thúc:</strong>${donate.end_date} </li>
              <li class="mb-2"><strong class="text-black">Cá nhân/Tổ chức:</strong>${donate.organization_name}</li>
              <li class="mb-2"><strong class="text-black">Số điện thoại: </strong>${donate.phone_number}</li>
              <li class="mb-2"><strong class="text-black">Tổng tiền quyên góp nhận được:</strong> ${donate.money}</li>
              <li class="mb-2"><strong class="text-black">Trạng thái:</strong>
              <c:if test="${donate.status == 3}">
					            <span class="red-text">Đã kết thúc</span>
				             </c:if>
				             <c:if test="${donate.status == 2}">
					          	
							 <span class="green-text">Đang quyên góp</span>
					            
				             </c:if>
				             <c:if test="${donate.status == 4}">
					          	
							 <span class="orange-text">Đã đóng</span>
					            
				             </c:if>
				              <c:if test="${donate.status == 1}">
					          	
							 <span class="blue-text">Mới Tạo</span>
					            
				             </c:if>
              </li>

            </ul>
          </div>

          <div class="bg-light p-3 border rounded" >
            <button type="button"  style="color: white" data-toggle="modal" data-target="#exampleModal"  class="btn btn-block btn-primary btn-md">Quyên góp</button>
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
            <h5 class="modal-title" id="exampleModalLabel">Quyên góp</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form method="post" action="donate_success">
            <div class="modal-body">
              <div class="row">

                <div class="col-12">
                  <label for="addname"
                  
                         class="col-form-label">Họ tên:</label>
                  <input type="text" class="form-control"
                         id="addname" name="name" value="<%=SecurityUtils.getPrincipal().getFullName()%> " required>
                  <label for="addname"
                         class="col-form-label">Số tiền quyên góp:</label>
                  <input type="number" class="form-control" placeholder=""
                         id="addname" name="money" required>
                  <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="idUser" value="<%=SecurityUtils.getPrincipal().getId()%> " >
                  <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="id_donate" value="${donate.id }" required>

                  <label for="addname"
                         class="col-form-label">Lời nhắn:</label>
                  <textarea rows="10" cols="3" class="form-control" name="text_send">

                  </textarea>
                   <input type="hidden" class="form-control" name="code" value="${donate.code}">
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary" onclick="showSweetAlert()">Quyên góp</button>
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