<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/index'/> ">
                <i class="fab fa-gg mr-2"></i>
                MOLISTAR - ENTERTAINMENT
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
            	<c:choose>
            		<c:when test="${not empty sessionScope.currentUser && sessionScope.currentUser.getIsAdmin() == Boolean.FALSE}">
            			<li class="nav-item">
                    		<a class="nav-link nav-link-1 active" data-toggle="modal" data-target="#exampleModal" aria-current="page" href="">WELCOME | ${sessionScope.currentUser.username} <i class="far fa-grin-tongue-squint"></i></a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="favorites"><i class="fas fa-heart mr-1"></i>My Favorites</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="history"><i class="fas fa-history mr-1"></i>History</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-2" href="logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
                		</li>
            		</c:when >
            		<c:when test="${not empty sessionScope.currentUser && sessionScope.currentUser.getIsAdmin() == Boolean.TRUE}">
            			<li class="nav-item">
                    		<a class="nav-link nav-link-1 active" data-toggle="modal" data-target="#exampleModal" aria-current="page" href="">WELCOME | ${sessionScope.currentUser.username} <i class="far fa-grin-tongue-squint"></i></a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="favorites"><i class="fas fa-heart mr-1"></i>My Favorites</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="history"><i class="fas fa-history mr-1"></i>History</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-2" href="logout"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-2" href="admin"><i class="fas fa-users-cog mr-1"></i>Management</a>
                		</li>
            		</c:when>
            		<c:otherwise>
            			<li class="nav-item">
                    		<a class="nav-link nav-link-1 active" aria-current="page" href="">WELCOME | <i class="fas fa-biohazard"></i></a>
                		</li>
            			<li class="nav-item">
                    		<a class="nav-link nav-link-2" href="login"><i class="fas fa-sign-in-alt mr-1"></i>Login</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="register"><i class="fab fa-modx mr-1"></i>Register</a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link nav-link-3" href="forgotPass"><i class="fab fa-viber mr-1"></i>Forgot Password</a>
                		</li>
            		</c:otherwise>
            	</c:choose>
            </ul>
            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="<c:url value='/templates/user/img/banner3.jpg' /> "/>
        
    </div>
    <!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change password</h5>
					<button type="button" class="close btn-close btn-close-black" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
                		<input type="password" id="currentPass" name="currentPass" class="form-control rounded-0" placeholder="Current password" required />
                		<p id="currentMess" style="color: red">...</p>
                	</div>
                	<div class="form-group">
                		<input type="password" id="newPass" name="newPass" class="form-control rounded-0" placeholder="New password" required />
                		<p id="newMess" style="color: red">...</p>
                	</div>
                	<div class="form-group">
                		<input type="password" id="cfmNewPass" name="cfmnewPass" class="form-control rounded-0" placeholder="Confirm new password" required />
                		<p id="cfmNewMess" style="color: red">...</p>
                	</div>
                	<p style="color: red" id="messageChangePass">...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal"><i class="far fa-window-close mr-1"></i>Close</button>
					<button type="button" class="btn btn-warning" id="changePassBtn"><i class="fab fa-expeditedssl mr-1"></i>Save</button>
				</div>
			</div>
		</div>
	</div>