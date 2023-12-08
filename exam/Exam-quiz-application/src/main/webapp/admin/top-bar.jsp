<nav class="navbar navbar-expand navbar-light bg-success topbar mb-4 static-top shadow">   
    <div class="container">
        <a class="navbar-brand text-white text-center mx-auto" href="#">WELCOME TO THE ADMIN PANEL</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon bg-white"> </span>
        </button>
        <!-- Sidebar Toggle (Topbar) -->
<form class="form-inline">
     <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
</button>
</form>
<ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown "> 
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${user.firstName} ${user.lastName}</span>
                    <img class="img-profile rounded-circle"
                        src="${pageContext.request.contextPath}/admin/img/undraw_profile.svg">
                </a>
                    <!-- Dropdown - User Information -->
<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
aria-labelledby="userDropdown">
<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/viewProfile" >
<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
Profile
</a>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/changePassword">
<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
Change Password
</a>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/logout">
<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
Logout
</a>
</div>
</li>
</ul>
</div>
</nav>