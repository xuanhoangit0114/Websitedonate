<%@page import="com.util.SecurityUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bean.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
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
         <script src="<%=Common.url %>/static/user/assets/js/jquery.twbsPagination.js""></script>
       <style>
    table {
   
    
    }

    th {
    
      padding: 67px;
      text-align: center;
       
    }
     .text-align-right {
      text-align: right;
    }
    td {
   
      padding: 8px;
      text-align: left;
      height: 10px; /* Đặt chiều cao cho ô */
      text-align: center;
    }
     .blue-text {
      color: blue; /* Màu xanh */
    }
       .red-text {
      color: red; /* Màu đỏ */
    }
      .green-text {
      color: green; /* Màu xanh lá mạ*/
    }
     .orange-text {
      color: orange; /* Màu xanh lá mạ*/
    }
    th {
      background-color: #f2f2f2;
    }
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
.container{
background-image : url ('background.jpg') ;
}
.col-14 col-md-2 col-lg-3 {
 width: 100px;
  height: 200px;
}
 .carousel-inner
 {
  width:100%;
  height: 100%;
 }
  .carousel-inner img
 {
  width: 100%;
  height: 540px;
 }
 .d-block w-100 {
   width: 100%;
  height: 540px;
 }</style>
    </head>
<body id="top">

<div id="overlayer"></div>
<div class="loader">
    <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>

<div class="toast" data-delay="1000" style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">

    <script>
        // swal({
        //     title: 'Donate Successfully!',
        //     /* text: 'Redirecting...', */
        //     icon: 'success',
        //     timer: 3000,
        //     buttons: true,
        //     type: 'success'
        // })
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
     
   
					   <security:authorize access = "isAnonymous()">
						 <p style="margin-left: 1150px"  class="btn btn-primary " onclick="redirect('secondary')" >Đăng nhập</p>
				</security:authorize>       	
					
		
					    <security:authorize access = "isAuthenticated()">
					<li style="margin-left: 1050px"  class="nav-item"><a class="nav-link" href="user?id=<%=SecurityUtils.getPrincipal().getId()%>">Xin chào <%=SecurityUtils.getPrincipal().getFullName()%></a></li>
				 <p style="margin-left: 1150px"  class="btn btn-primary " onclick="redirect('third')" >Đăng xuất</p>
				</security:authorize>     		            
	            
        <div class="container-fluid">
            <div class="row align-items-center">
              <div class="site-logo col-6"><a href="trang-chu?page=1&limit=5">Website Quyên Góp</a></div>
      
            </div>
          </div>
    </header>

    <!-- HOME -->
       
       
	
	   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	 
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner">
    	 
    <div class="carousel-item ">
    <c:forEach items="${model_donate.listResult}" var="o" begin="0" end="0">
      <img class="d-block w-100" src="${o.banner }" alt="First slide" >
     </c:forEach>
    </div>
     
    <div class="carousel-item ">
    <c:forEach items="${model_donate.listResult}" var="o" begin="1" end="1">
      <img class="d-block w-100" src="${o.banner }" alt="Second slide" > </c:forEach>
    </div>
   
   
    <div class="carousel-item active">
      <c:forEach items="${model_donate.listResult}" var="o" begin="2" end="2">
      <img class="d-block w-100" src="${o.banner }" alt="Third slide" >
      </c:forEach>
    </div>
    
  </div>
  
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a> 
</div> 
       
       
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h1 class="text-white font-weight-bold">Danh sách các đợt quyên góp</h1>

                </div>
            </div>
        </div>

    <section class="site-section">
        <div class="container">
  
            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2" >Các đợt quyên góp</h2>
                </div>
            </div>
            <label for="fruit">Hiển thị đợt ưu tiên:</label>
    <select id="sort" name="sort">
        <option value="ASC">Đang quên góp</option>
        <option value="DESC">Các đợt khác</option>
       
    </select>
    <form action="<c:url value='/trang-chu?page=${model_donate.page}&limit=${model_donate.limit}'/>" id="formSubmit" method="get">
				
            <ul class="job-listings mb-5">
              
                    <li style="margin-bottom: 20px" class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
                        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                  
                            <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px;width: 250px">
                        
                                                     <table id="eventTable">
  								 <tr>
    									<th>Tên Sự Kiện</th>
   									    <th>Trạng Thái</th>
  										<th>Ngày Bắt Đầu</th>
  										<th>Ngày Kết Thúc</th>
  										<th>Người Đại Diện</th>
  										<th>Hành Động</th>
 										 </tr>
 										    <c:forEach var="item" items="${model_donate.listResult}">
  								<tr style="height:10px">
   								  <td> <h2>${item.name}</h2></td>
 								  <td> 	<c:if test="${item.status == 3}">
					            <span class="red-text">Đã kết thúc</span>
				             </c:if>
				             <c:if test="${item.status == 2}">
					          	
							 <span class="green-text">Đang quyên góp</span>
					            
				             </c:if>
				             <c:if test="${item.status == 4}">
					          	
							 <span class="orange-text">Đã đóng</span>
					            
				             </c:if>
				              <c:if test="${item.status == 1}">
					          	
							 <span class="blue-text">Mới Tạo</span>
					            
				             </c:if></td>
    							  <td><strong >${item.start_date}</strong></td>
    							  <td> <strong >${item.end_date}</strong></td>
    							  <td> <span class="icon-room"></span> <span ></span>${item.organization_name}<br>   <strong >${item.phone_number} </strong><br></td>
    							  <td> 
                                 
                                   <c:if test="${item.status == 2}">
					          	
						        	 <br> 
						        	 
						        	 	
					   <security:authorize access = "isAnonymous()">
						 <p style="margin-top: 1px" class="btn btn-primary " onclick="need_login()" > Quyên góp</p>
				</security:authorize> 
				    <security:authorize access = "isAuthenticated()">
					 <p style="margin-top: 1px" class="btn btn-primary " onclick="redirect('primary',${item.id})" > Quyên góp</p>
				</security:authorize>     		            
	             
						        	
					            
				            		 </c:if>
                                 
                               
                               </td>
  								</tr>
 		                        </c:forEach>
  <!-- Thêm hàng và dữ liệu nếu cần -->
                           </table>
                        
                          
                            </div> 
                         
                        
                        
                        </div>

                    </li>
                    <!-- Modal -->
                    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button  onclick="openForm()" type="submit" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Quyên góp</button>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="openForm()">
                                      
                                        
                                    </button>
                                </div>
                              


                            </div>
                        </div>
                    </div>
               
            
          

          
                <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
                 <ul class="pagination" id="pagination"></ul>	
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="limit" name="limit"/>	
                </div>
           
    <script>
    
                var totalPages = ${model_donate.totalPage};
    			var currentPage = ${model_donate.page};
    			$(function () {
    		        window.pagObj = $('#pagination').twbsPagination({
    		            totalPages: totalPages,
    		            visiblePages: 5,
    		            startPage: currentPage,
    		            onPageClick: function (event, page) {
    		            	if (currentPage != page) {
    		            		$('#limit').val(5);
    							$('#page').val(page);
    							$('#formSubmit').submit();
    						}
    		            }
    		        });
    		    });
                

                </script>
                
                <script>
        document.getElementById('sort').addEventListener('change', function() {
            sortTable();
        });

        function sortTable() {
            var table = document.getElementById('eventTable');
            var rows = Array.from(table.rows).slice(1); // Exclude header row

            var sortOrder = document.getElementById('sort').value;

            rows.sort(function(a, b) {
                var aValue = getStatusValue(a.cells[1].textContent);
                var bValue = getStatusValue(b.cells[1].textContent);

                if (sortOrder === 'ASC') {
                    return aValue - bValue;
                } else {
                    return bValue - aValue;
                }
            });

            // Clear existing table rows
            while (table.rows.length > 1) {
                table.deleteRow(1);
            }

            // Append sorted rows
            rows.forEach(function(row) {
                table.appendChild(row);
            });
        }

        function getStatusValue(statusText) {
            if (statusText.includes('Đang quyên góp')) {
                return 0;
            } else {
                return 1;
            }
        }
    </script>
                 <script>
               
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
          window.location.href = 'http://localhost:8080/WebDonation/dang-xuat';
        }
    }
    function need_login(){  
   	 var result = confirm("Bạn cần đăng nhập để thao tác !");
   	 if (result == true) {
   		 window.location.href='http://localhost:8080/WebDonation/dang-nhap';
   		}
   	  }  </script>
   	    <script>
   		let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  const slides = document.getElementsByClassName("slide");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) { slideIndex = 1 }
  slides[slideIndex - 1].style.display = "block";
  setTimeout(showSlides, 2000); // Thay đổi slide mỗi 2 giây
}
</script>
  
  
          </ul>     
         </form>
    </section>

</div>
   

</body>
      
  <footer th:replace="public/fragments :: footer" class="site-footer">
 <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0&appId=YOUR_APP_ID" nonce="NONCE_VALUE"></script>
    
    <!-- Button chia sẻ -->
    <div class="fb-share-button" data-href="https://momo.vn/cong-dong/gay-quy-thuc-hien-chuong-trinh-truyen-thong-phong-chong-tinh-vinh-long?fbclid=IwAR2g-2Zo6ka2R5-QBbDxlazy_ud4AwgBvt4GjCqCgAzCxoDCipvgufjuN7I" data-layout="button_count" data-size="small">
        <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fyour-website-url.com%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a>
    </div>
 
  </footer>
</html>