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

    <title>Add Question | Quiz App</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
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
                    <div class="mb-2 mr-auto">
                    	<a class="btn btn-success" href="${pageContext.request.contextPath}/admin/questions">Question List</a>
                    </div>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Add New Question</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form action="${pageContext.request.contextPath}/admin/addQuestion" method="post">
                                	<div class="form-group">
                                		<label for="question">Question</label>
                                		<input type="text" id="question" name="question" class="form-control" placeholder="Question" required/>
                                	</div>
                                	<div class="form-group">
                                		<label for="question">Option-1</label>
                                		<input type="text" id="optionA" name="optionA" class="form-control" placeholder="Option A" required/>
                                	</div>
                                	<div class="form-group">
                                		<label for="question">Option-2</label>
                                		<input type="text" id="optionB" name="optionB" class="form-control" placeholder="Option B" required/>
                                	</div>
                                	<div class="form-group">
                                		<label for="question">Option-3</label>
                                		<input type="text" id="optionC" name="optionC" class="form-control" placeholder="Option C" required/>
                                	</div>
                                	<div class="form-group">
                                		<label for="question">Option-4</label>
                                		<input type="text" id="optionD" name="optionD" class="form-control" placeholder="Option D"/>
                                	</div>
                                	<div class="form-group">
                                		<label for="question">Correct Answer</label>
                                		<input type="text" id="correctOption" name="correctOption" class="form-control" placeholder="Correct Answer"/>
                                	</div>
							    	<div class="from-group">
								    	<input type="submit" value="Add Question" class="btn btn-primary">
							    	</div>
							    </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
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

        <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>

    
    
</body>

</html>