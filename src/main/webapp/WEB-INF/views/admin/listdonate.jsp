<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.bean.Common"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html  lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="<%=Common.url %>/static/admin1/assets/css/styles.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          crossorigin="anonymous"></script>
  <script src="<%=Common.url %>/static/admin1/assets/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script src="<%=Common.url %>/static/user/assets/js/jquery.twbsPagination.js""></script>
      
  <script src="<%=Common.url %>/static/admin1/assets/js/datatables-simple-demo.js"></script>

  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
  
  
  
  <style type="text/css">
   table {
            border-collapse: collapse;
            width: 100%;
        }

     
        th, td {
            padding: 8px;
            text-align: left;
        }
  .search-bar {
            display: flex;
            align-items: center;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }

        /* Style cho ô nhập liệu */
        .search-input {
            flex: 1;
            border: none;
            padding: 10px;
            font-size: 16px;
        }

        /* Style cho nút tìm kiếm */
        .search-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }</style>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
  <nav fragment="html_nav" class="sb-topnav navbar navbar-expand  navbar-light bg-ligh"  style="background-color: #e3f2fd;">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="trang-chu">QUẢN TRỊ</a>
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
        <h1 class="mt-4">Danh sách người dùng</h1>
        <div class="card mb-4">
          <div class="card-header">
         
 
  
  
  
     
  <br/>
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
                    <form method="post"  action="adduser">
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Name:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="fullName" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Email:</label>
                          <input type="email" class="form-control"
                                 id="addcost" name="email" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Số điện thoại:</label>
                          <input type="number" class="form-control"
                                 id="addname" name="phoneNumber" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Địa chỉ:</label>
                          <input type="text" class="form-control"
                                 id="addcost" name="address" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tài khoản:</label>
                          <input type="text" class="form-control"
                                  name="username" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Mật khẩu:</label>
                          <input type="password" class="form-control"
                                 id="addcost" name="password" required>
                        </div>
                        <div class="col-6">
                          <label for="ct_id" class="col-form-label">Vai trò:</label>
                          <select class="form-control" id="ct_id" name="idRole" required>
                            <option value="1" selected>ADMIN</option>
                            <option value="2" selected>USER</option>
                          </select>
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
                <th>Mã Đợt</th>
                <th>Người ủng hộ</th>
                <th>Số Tiền</th>            
                <th>Nội Dung</th>
                <th>Trạng Thái </th>
                 <th >Hành động</th>
                
              </tr>
              </thead>
             
              <tbody>
              <c:forEach var="item" items="${model_bill.listResult}">
                <tr>
                  <td>${item.code }</td>
                  <td > <p >${item.name }</p></td>
                  <td ><p >${item.money } </p></td>
            
                  <td>${item.text }</td>
                  <td><c:if test="${item.status eq 2 }">
                  
                 <p style="color: green"> Đã Xác Nhận </p>
                  </c:if>
                  <c:if test="${item.status eq 1 }">
                 <p style="color: red"> Chờ Xác Nhận </p>
                  </c:if></td>
                
                  <td style="width : 270px">
                    <c:if test="${item.status eq 1 }">            
                    <form action="check_bill?id=${item.id}" method="post" style="margin-left: 0px;margin-top: -38px">
                      <input type="hidden" class="form-control" id="id_donate" name="id_donate" value="${item.id_donate}">
                         <input type="hidden" class="form-control" id="id" name="money" value="${item.money}">
                      <button type="submit" style="width: 170px ;margin-top: 50px" class="btn btn-success" >
                        Xác Nhận
                      </button>
                    </form>
                    </c:if>
                    <c:if test="${item.status eq 2 }">
                    <form  action="un_check_bill?id=${item.id}" method="post">
                      <input type="hidden" class="form-control" id="id_donate" name="id_donate" value="${item.id_donate}">
                       <input type="hidden" class="form-control" id="id" name="money" value="${item.money}">
                      <button type="submit" style="width: 170px ;margin-top: 10px" class="btn btn-danger" >
                       Hủy Xác Nhận
                      </button>
                    </form>
                       </c:if>       
                  </td>
                </tr>
            
                <!-- Modal Update-->
               </c:forEach>
            
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

    <script>
    function search() {
    	
    	 var inputData = document.getElementById('phone_number_find').value;
    	  var encodedInputData = encodeURIComponent(inputData);
    	 window.location.href = 'http://localhost:8080/WebDonation/quan-tri/user?page=1&limit=1&phone_number_find='+inputData ; 
	}
    
  </script>
 <script>
    function confirmDelete() {
        // Sử dụng hộp thoại xác nhận
        var isConfirmed = confirm("Bạn muốn xóa người dùng này ?");

        // Trả về true nếu được xác nhận, false nếu hủy bỏ
        return isConfirmed;
    }
</script>
  <script th:inline="javascript">
    function openModal(id, fullName, email, phoneNumber, address, userName, roleId) {
        // Điền dữ liệu từ backend vào modal
        $('#exampleModal input[name="iduser"]').val(id);
        $('#exampleModal input[name="fullName"]').val(fullName);
        $('#exampleModal input[name="email"]').val(email);
        $('#exampleModal input[name="phoneNumber"]').val(phoneNumber);
        $('#exampleModal input[name="address"]').val(address);
        $('#exampleModal input[name="userName"]').val(userName);
        $('#exampleModal input[name="idUser"]').val(id);
        $('#exampleModal input[name="password"]').val(''); // Có thể điền một giá trị mặc định nếu cần
        $('#exampleModal input[name="status"]').val(''); // Có thể điền một giá trị mặc định nếu cần
        $('#exampleModal select[name="idRole"]').val(roleId);

        // Hiển thị modal
        $('#exampleModal').modal('show');
    }
</script>
<script>
    function updateUser() {
        var formData = $('#updateForm').serialize();

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/WebDonation/quan-tri/update_user',
            data: formData,
            success: function(response) {
                // Xử lý phản hồi từ server (nếu cần)
                console.log(response);
                // Đóng modal sau khi cập nhật thành công
                $('#exampleModal').modal('hide');
            },
            error: function(error) {
                console.error('Error updating user:', error);
            }
        });
    }
</script>
    <footer th:replace="admin/frafgments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
</div>

<script src="<%=Common.url %>/static/admin1/assets/js/JQuery3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="<%=Common.url %>/static/admin1/assets/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="<%=Common.url %>/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>

</html>