<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Login</title>
    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

body{
    font-family: 'Poppins', sans-serif;
    background: url('img/bg.jpg') center center fixed;
           
            background-size: cover;  
            background-repeat: no-repeat;  
            background-color: #f0f0f0;
            color: #333;
            position: relative;
}

/*------------ Login container ------------*/

.box-area{
    width: 930px;
}

/*------------ Right box ------------*/

.right-box{
    padding: 40px 30px 40px 40px;
}

/*------------ Custom Placeholder ------------*/

::placeholder{
    font-size: 16px;
}

.rounded-4{
    border-radius: 20px;
}
.rounded-5{
    border-radius: 30px;
}

@keyframes slideRight {
        from {
            opacity: 0;
            transform: translateX(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    /* Apply the animation to the sliding paragraph */
    .sliding-paragraph {
        animation: slideRight 2s ease-in-out;
    }

/*------------ For small screens------------*/

@media only screen and (max-width: 768px){

     .box-area{
        margin: 0 10px;

     }
     .left-box{
        height: 100px;
        overflow: hidden;
     }
     .right-box{
        padding: 20px;
     }

}
   </style>

    <!-- Custom fonts for this template-->
   <!--  <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">  
</head>
<body>
<!----------------------- Main Container -------------------------->
     <div class="container d-flex justify-content-center align-items-center min-vh-100">
    <!----------------------- Login Container -------------------------->
       <div class="row border rounded-5 p-3 bg-white shadow box-area">
    <!--------------------------- Left Box ----------------------------->
       <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #103cbe;">
           <div class="featured-image mb-3">
            <img src="img/1.jpg" class="img-fluid" style="width: 200px;">
           </div>
           <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Be Verified</p>
           <small class="text-white text-wrap text-center" style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Join experienced Designers on this platform.</small>
       </div> 

    <!-------------------- ------ Right Box ---------------------------->

    <div class="col-md-6 right-box">
    <div class="row align-items-center">
        <div class="header-text mb-4">
            <h2 class ="mb-3" style="font-family: 'Algerian', sans-serif; font-size: 2.5rem; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">HELLO, ADMIN</h2>
            <p class="sliding-paragraph" style="font-family: 'Arial',font-size: 1.5rem">We are happy to have you back!</p>
        </div>
        <form class="user" action="${pageContext.request.contextPath}/admin/login" method="post">
        <div class="input-group mb-3">
            <input name ="username" type="text" class="form-control form-control-lg rounded-pill bg-light text-dark fs-6" id="username" 
                placeholder="Email Address" required>
        </div>
        <div class="input-group mb-5">
            <input name ="password" type="password" class="form-control form-control-lg rounded-pill bg-light text-dark fs-6" id="password" placeholder="Password" required
                placeholder="Password">
        </div>

        <div class="input-group mb-3">
            <button class="btn btn-lg btn-primary w-100 fs-6">Login</button>
        </div>
    </form>
</div>
        </div>
        
    </div>
</div>
</div>

    

    <!-- Bootstrap core JavaScript-->
    <!-- <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!--     Core plugin JavaScript
    <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    Custom scripts for all pages
    <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>