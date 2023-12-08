<%@page import="com.learn.db.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>View Profile | Quiz App</title>

    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
      integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
      crossorigin="anonymous"
    />

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css'>

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
                   
                    
                    <div class="row align-items-end">
                    	<div class="col">
	                    	<h1 class="h3 mb-2 text-gray-800">Profile</h1>
	                    </div>
                    	<div class="col justify-content-end">
							<a href="${pageContext.request.contextPath}/admin/editProfile" class="btn btn-primary mb-3">Edit Profile</a>
						</div>
					</div>
                    <!-- DataTables Example -->
                    <section class="vh-100 gradient-custom-2 bg-primary-subtle">
                        <div class="container py-5 h-100">
                          <div class="row d-flex justify-content-top align-items-top h-100">
                            <div class="col-xl-12 col-xl-10">
                      
                              <div class="card mask-custom bg-primary">
                                <div class="card-body p-4 text-white">
                      
                                  <div class="text-center pt-3 pb-2">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp"
                                      alt="Check" width="60">
                                    <h2 class="my-4">Your Profile</h2>
                                  </div>
                      
                                  <table class="table text-white mb-0">
                        
                                    <tbody>
                 
                                      <tr class="fw-normal">
                                        <th scope="col">First Name</th>
                                        <td class="align-middle">
                                          <span class="ms-2">${user.firstName}</span>
                                        </td>
                                    </tr>
                                        <tr class="fw-normal">
                                            <th scope="col">Last Name</th>
                                            <td class="align-middle">
                                              <span class="ms-2">${user.lastName}</span>
                                            </td>
                                        </tr>
                                        <tr class="fw-normal">
                                            <th scope="col">Email</th>
                                            <td class="align-middle">
                                              <span class="ms-2">${user.emailId}</span>
                                            </td>
                                        </tr>
                                        <tr class="fw-normal">
                                            <th scope="col">Mobile</th>
                                            <td class="align-middle">
                                              <span class="ms-2">${user.mobileNumber}</span>
                                            </td>
                                        </tr>
                                    
                                     
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

</html>