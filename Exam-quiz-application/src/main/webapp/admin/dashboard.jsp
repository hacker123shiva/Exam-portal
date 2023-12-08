<%@page import="com.learn.db.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard | Quiz App</title>
    
     <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />
    

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>

   <style>
        body{margin-top:20px;
background:#eee;
}	
#page-wrapper {
    padding: 15px 25px;
} 

</style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="side-bar.jsp" />
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="top-bar.jsp" />
                <!-- End of Topbar -->


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">Dashboard</h1>

    <!-- Content Row -->
    <div class="row">
        <div class="col-lg-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="fa fa-users fa-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">Total Quizes</p>
                        </div>
                        <!-- <div class="h5 mb-0 font-weight-bold text-gray-800">${totalQuiz}</div> -->
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer announcement-bottom">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="h5 mb-0 font-weight-bold text-gray-800 text-right">${totalQuiz}</div>
                            </div>
                            <div class="col-xs-6 text-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="fa fa-check fa-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">Total Questions</p>
                        
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer announcement-bottom">
                        <div class="row">
                            <div class="col-xs-6 ">
                                <div class="h5 mb-0 font-weight-bold text-gray-800 text-right">${totalQuestion}</div>
                            </div>
                            <div class="col-xs-6 text-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!-- <div class="col-lg-3">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">Total Categories</p>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer announcement-bottom">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${totalCategories}</div>
                            </div>
                            <div class="col-xs-6 text-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div> -->
        <div class="col-lg-4">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-6 text-right">
                            <p class="announcement-heading">Total Users</p>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer announcement-bottom">
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="h5 mb-0 font-weight-bold text-gray-800 text-right">${totalUser}</div>
                            </div>
                            <div class="col-xs-6 text-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    <!-- Content Row -->

    <!-- Add your styles and further customization here -->

</div>
<!-- /.container-fluid -->

                    <!-- Content Row -->
                    <!-- DataTales Example -->
                    <section class="vh-100 gradient-custom-2 bg-primary-subtle">
                        <div class="container py-5 h-100">
                          <div class="row d-flex justify-content-top align-items-top h-100">
                            <div class="col-xl-12 col-xl-10">
                      
                              <div class="card mask-custom bg-primary">
                                <div class="card-body p-4 text-white">
                      
                                  <div class="text-center pt-3 pb-2">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp"
                                      alt="Check" width="60">
                                    <h2 class="my-4">Quiz List</h2>
                                  </div>
                      
                                  <table class="table text-white mb-0">
                                    <thead>
                                      <tr>
                                        <th scope="col">Serial No.</th>
                                        <th scope="col">Quiz Title</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Actions</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="quiz" items="${quizList}" varStatus="counter">
                                      <tr class="fw-normal">
                                        <td>
                                          <span class="ms-2">${counter.count}</span>
                                        </td>
                                        <td class="align-middle">
                                          <span><a href="${pageContext.request.contextPath}/admin/viewQuiz/${quiz.id}">${quiz.title}</a></td></span>
                                        </td>
                                        <td class="align-middle">
                                            <span class="ms-2">${quiz.category}</span>
                                        </td>
                                        <td class="align-middle">
                                            <a href="${pageContext.request.contextPath}/admin/editQuiz/${quiz.id}"><i class="fas fa-check fa-lg text-success me-3"></i></a>
                                            <a href="${pageContext.request.contextPath}/admin/deleteQuiz/${quiz.id}"><i class="fas fa-trash-alt fa-lg text-warning"></i></a>
                                        </td>
                                      </tr>
                                    </c:forEach>
                                     
                                    </tbody>
                                  </table>
                      
                      
                                </div>
                              </div>
                      
                            </div>
                          </div>
                        </div>
                      </section>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="bg-body-tertiary text-center sticky-bottom">
                <!-- Grid container -->
                <div class="container p-4 pb-0">
                  <!-- Section: Social media -->
                  <section class="mb-4">
                    <!-- Facebook -->
                    <a
                    data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #3b5998;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-facebook-f"></i
                    ></a>
              
                    <!-- Twitter -->
                    <a
                      data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #55acee;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-twitter"></i
                    ></a>
              
                    <!-- Google -->
                    <a
                      data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #dd4b39;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-google"></i
                    ></a>
              
                    <!-- Instagram -->
                    <a
                      data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #ac2bac;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-instagram"></i
                    ></a>
              
                    <!-- Linkedin -->
                    <a
                      data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #0082ca;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-linkedin-in"></i
                    ></a>
                    <!-- Github -->
                    <a
                      data-mdb-ripple-init
                      class="btn text-white btn-floating m-1"
                      style="background-color: #333333;"
                      href="#!"
                      role="button"
                      ><i class="fab fa-github"></i
                    ></a>
                  </section>
                  <!-- Section: Social media -->
                </div>
                <!-- Grid container -->
              
                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                  © 2023 Copyright:
                  <a class="text-body" href="#">QUIZ WEBSITE</a>
                </div>
                <!-- Copyright -->
              </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã—</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js'></script>
</body>
</body>

</html>