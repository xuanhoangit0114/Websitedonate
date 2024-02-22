<%@page import="com.util.SecurityUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.bean.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html  lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="<%=Common.url %>/static/admin1/assets/css/styles.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
  <script src="<%=Common.url %>/static/admin1/assets/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

  <script src="<%=Common.url %>/static/admin1/assets/js/datatables-simple-demo.js"></script>

  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  
   <script src="<%=Common.url %>/static/user/assets/js/jquery.twbsPagination.js"></script>

  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script src="<%=Common.url %>/static/user/assets/js/jquery.twbsPagination.js""></script>
  <style type="text/css">
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
     table {
            border-collapse: collapse;
            width: 100%;
        }

     

        th, td {
            padding: 8px;
            text-align: left;
        }
  
  </style>
</head>

<body class="sb-nav-fixed">
  <nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
  <nav fragment="html_nav" class="sb-topnav navbar navbar-expand  navbar-light bg-ligh"  style="background-color: #e3f2fd;">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="/admin/">QUẢN TRỊ</a>
      <!-- Sidebar Toggle-->
      <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
              class="fas fa-bars"></i></button>
      <!-- Navbar Search-->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
  
      </form>
      <!-- Navbar-->
          <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
              <li class="nav-item dropdown">
                  <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/WebDonation/dang-xuat" role="button" ><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                      <li><a class="dropdown-item" href="#">Settings</a></li>
                      <li><a class="dropdown-item" href="#">Activity Log</a></li>
                      <li>
                          <hr class="dropdown-divider" />
                      </li>
                      <li><a class="dropdown-item" href="/logout">Logout</a></li>
                  </ul>
              </li>
          </ul>
  </nav>
  </nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <div th:fragment="html_menu" id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion"  style="background-color: #e3f2fd;">
          <div class="sb-sidenav-menu">
              <div class="nav">
                 <a class="nav-link"  href="user?page=1&limit=100">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý người dùng
                  </a>
                  <a class="nav-link" href="donate?page=1&limit=100">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý đợt quyên góp
                  </a>
                    <a class="nav-link" href="bill?page=1&limit=100">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý đơn quyên góp
                  </a>
              </div>
          </div>

      </nav>
  </div>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Danh sách đợt quyên góp</h1>
        <div class="card mb-4">
          <div class="card-header">
            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                    data-bs-target="#exampleModalAdd">
              Thêm mới
            </button>
            
       
            <!-- Modal Add-->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form method="post" action="add_donate">
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Mã đợt quyên góp:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="code" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Tên đợt quyên góp:</label>
                          <input type="text" class="form-control"
                                 id="addcost" name="name" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Ngày bắt đầu:</label>
                          <input type="date" class="form-control"
                                 id="addname" name="start" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Ngày kết thúc:</label>
                          <input type="date" class="form-control"
                                 id="addcost" name="end" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tổ chức:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="tochuc" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Số điện thoại:</label>
                          <input type="number" class="form-control"
                                 id="addcost" name="sdt" required>
                        </div>
                        <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Chỉ tiêu (VND):</label>
                              <input type="number" class="form-control"
                                     id="addcost" name="goal" required>
                            </div>
                             <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Banner(link):</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="banner" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">ảnh mô tả(link):</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="image" required>
                            </div>
                        <div class="col-12">
                          <label for="ct_id" class="col-form-label">Nội dung:</label>
                          <textarea name="noidung" class="form-control" cols="50" rows="5">Nhập nội dung</textarea>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm </button>
                      </div>
                    </form>
                  </div>

                </div>
              </div>
            </div>
            <!-- Modal Add-->
          </div>
          <div class="card-body">
            <table id="datatablesSimple">
              <thead>
              <tr style="background-color: gray !important;">
                <th>Mã</th>
                <th>Tên</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>CN/Tổ chức</th>
                <th>Số điện thoại</th>
            
                <th>Tiền đã quyên góp (VND)</th>
                 <th>Chỉ tiêu (VND)</th>
                <th >Trạng thái</th>
                <th style="width: 220px ">Hành động</th>
              </tr>
              </thead>
             
              <tbody>
             
                  <c:forEach var="item" items="${model_d.listResult}">
                <tr>
                  <td>${item.code }  </td>
                  <td>${item.name }   </td>
                  <td>${item.start_date }   </td>
                  <td>${item.end_date }</td>
                  <td>${item.organization_name }</td>
                  <td>${item.phone_number }</td>
                  <td>${item.money } </td>
                  
                   <td><c:if test="${item.goal <=item.money }">
                   <span class="green-text">Đã đạt chỉ tiêu với số tiền</span> </c:if>
                   <c:if test="${item.goal >item.money }">
                   <span class="red-text">Chưa đạt chỉ tiêu với số tiền</span> </c:if>
                   ${item.goal }</td>
                  <td>	<c:if test="${item.status == 4}">
					            <span class="red-text">Đã kết thúc</span>
				             </c:if>
				             <c:if test="${item.status == 2}">
					          	
							 <span class="green-text">Đang quyên góp</span>
					            
				             </c:if>
				             <c:if test="${item.status == 3}">
					          	
							 <span class="orange-text">Đã đóng</span>
					            
				             </c:if>
				              <c:if test="${item.status == 1}">
					          	
							 <span class="blue-text">Mới Tạo</span>
					            
				             </c:if></td>
                  <td style="">
                    <button type="button" style="width: 105px" class="btn btn-primary" data-bs-toggle="modal"
                         onclick="openModal('${item.id}', '${item.code}', '${item.name}', '${item.start_date}', '${item.end_date}', '${item.organization_name}', '${item.goal}', '${item.status}', '${item.phone_number}', '${item.decription}', '${item.money}', '${item.image}', '${item.banner}')">
                      Cập nhật
                    </button>
                   

                 
                      <form  id="deleteForm" action="delete-donate?id=${item.id}" method="post" onsubmit="return confirmDelete()">
                      <input type="hidden" class="form-control" id="id" name="idUser" value="${item.id}">
                      <button  type="submit" style="width: 105px ;margin-top: 7px" class="btn btn-danger" >
                      Xóa
                      </button>
                    </form>    
                      <c:if test="${item.status != 4}">
					        <c:if test="${item.status == 2}">
							 <form style="margin-top: -38px" >
                      <p style=" margin-top: 45px" class="btn btn-success " id="butn_enddonate" onclick="redirect('primary',${item.id})" > Quyên góp</p>
                        </form>
                    </c:if>
                    <form  action="close_donate?id=${item.id}"   method="post" style="margin-top: 5px">
                      <input type="hidden" class="form-control" id="closeDonateButton" name="idbtnclose" >
                      <button type="submit" style="width: 105px;margin-top: -165px;margin-left: 110px" class="btn btn-warning" >
                       Đóng
                      </button>
                    </form>
                  
                     <c:if test="${item.money >= item.goal}">
                    <form  action="end_donate?id=${item.id}"   method="post" style="margin-top: 5px">
                      <input type="hidden" class="form-control" id="butn_enddonate" name="ide">
                      <button type="submit" style="width: 105px;margin-top: -80px" class="btn btn-dark" >
                        Kết Thúc
                      </button>
                    </form>
					   </c:if>           
				      </c:if>
                    
                    <div class="modal fade" th:id="'idModelDel' + ${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Đợt quyên góp : <span th:text="${user.name}"></span>
                            <form method="post">
                              <div class="modal-footer" style="margin-top: 20px">
                                <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="submit" class="btn btn-danger">Xóa</button>

                              </div>
                            </form>
                          </div>

                        </div>
                      </div>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              
                
                <div class="modal fade" 
                
                     id="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabell">Chi Tiết & Cập nhật</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form method="post" action="update_donate">
                          <input type="hidden" name="id">
                              <input type="hidden" name="money">
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Mã đợt quyên góp:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="code" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Tên đợt quyên góp:</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="name" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Ngày bắt đầu:</label>
                              <input type="date" class="form-control"
                                     id="addname" name="start" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Ngày kết thúc:</label>
                              <input type="date" class="form-control"
                                     id="addcost" name="end" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Tổ chức:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="tochuc" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control"
                                     id="addcost" name="sdt" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Chỉ tiêu (VND):</label>
                              <input type="number" class="form-control"
                                     id="addcost" name="goal" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">ảnh mô tả (link):</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="image" required>
                            </div>
                             <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">banner (link):</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="banner" required>
                            </div>
                             <div class="col-6">
                              <label for="ct_id" class="col-form-label">Trạng Thái</label>
                              <select class="form-control" id="ct_id" name="status" required>
                                <option value="1"  selected><span >Mới Tạo</span></option>
                               
                                  <option value="2" ><span >Đang Quyên góp</span></option>
                             
                              </select>
                            </div>
                            <div class="col-12">
                              <label for="ct_id" class="col-form-label">Nội dung:</label>
                              <textarea name="noidung" class="form-control" cols="50" rows="5"></textarea>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                          </div>
                        </form>
                      </div>

                    </div>
                  </div>
                </div>
              </th>
              </tbody>
            </table>
          </div>
       
        </div>
         
      </div>
  
   
   
   
    </main>

    <script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
    <script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
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
<script src="js/JQuery3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
 <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
                 <ul class="pagination" id="pagination"></ul>	
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="limit" name="limit"/>	
                </div>
</body>

 <script>
    function reloadPage(selectedPage) {
      // Lấy giá trị đã chọn từ thẻ select và thực hiện reload trang
       var selectedItemsPerPage = document.getElementById('itemsPerPage').value;
       if (!selectedItemsPerPage) {
           alert('Vui lòng nhập số trang.');
           return;
         }
       else {
    	   window.location.href = 'http://localhost:8080/WebDonation/quan-tri/donate?page='+selectedItemsPerPage+'&limit=' + selectedPage; 
       }
      
    }
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
  </script>
   <script>
    function confirmDelete() {
        // Sử dụng hộp thoại xác nhận
        var isConfirmed = confirm("Bạn muốn xóa đợt quyên góp này ?");

        // Trả về true nếu được xác nhận, false nếu hủy bỏ
        return isConfirmed;
    }
</script>
  <script >
    function openModal(id, code, name, start_date, end_date, organization_name, goal,status,phone_number,decription,money,image,banner) {
        // Điền dữ liệu từ backend vào modal
        $('#exampleModalLabel input[name="id"]').val(id);
        $('#exampleModalLabel input[name="code"]').val(code);
        $('#exampleModalLabel input[name="name"]').val(name);
        $('#exampleModalLabel input[name="start"]').val(start_date);
        $('#exampleModalLabel input[name="end"]').val(end_date);
        $('#exampleModalLabel input[name="tochuc"]').val(organization_name);
        $('#exampleModalLabel input[name="goal"]').val(goal);
        $('#exampleModalLabel input[name="status"]').val(status);
        $('#exampleModalLabel input[name="sdt"]').val(phone_number);
        $('#exampleModalLabel textarea[name="noidung"]').val(decription);
        $('#exampleModalLabel input[name="money"]').val(money);
        $('#exampleModalLabel input[name="image"]').val(image);
        $('#exampleModalLabel input[name="banner"]').val(banner);
        
        
        // Hiển thị modal
        $('#exampleModalLabel').modal('show');
    }
 
</script>

</html>