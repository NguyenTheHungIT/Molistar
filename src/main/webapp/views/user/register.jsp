<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTER</title>
    <%@ include file="/common/head.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %>

    <div class="container-fluid tm-mt-60">
        <div class="row tm-mb-50">
            <div class="col-lg-12 col-12 mb-5">
                <h2 class="tm-text-primary mb-5 text-center">Register</h2>
                <div id="register-form" action="register" class="tm-contact-form mx-auto">
                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control rounded-0" placeholder="Username" required />
                        <p id="userMess" style="color: red">...</p>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control rounded-0" placeholder="Password" required />
                        <p id="passMess" style="color: red">...</p>
                    </div>
                    <div class="form-group">
                        <input type="password" name="cfmpassword" id="cfmpassword" class="form-control rounded-0" placeholder="Confirm Password" required />
                        <p id="cfmPassMess" style="color: red">...</p>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="form-control rounded-0" placeholder="Email" required />
                        <p id="emailMess" style="color: red">...</p>
                    </div>
                    
                    <div class="form-group d-md-flex">
                        	<div class="w-50">
                        		<a href="login"><em><u>Login</u></em></a>
                        	</div>
                        	<div class="w-100 text-md-right">
                        		<a href="forgotPass"><em><u>Quên mật khẩu</u></em></a>
                        	</div>
                        </div>
                    
                    <div class="form-group tm-text-right">
                    	<p id="registerMess" style="color: red">...</p>
                        <button type="submit" class="btn btn-primary" id="registerBtn">Register</button>
                    </div>
                </div>                
            </div>
            
        </div>
    </div> <!-- container-fluid, tm-container-content -->

    <%@ include file="/common/footer.jsp" %>
</body>

<script>
$('#cfmPassMess').text('');
$('#userMess').text('');
$('#passMess').text('');
$('#emailMess').text('');
$('#registerMess').text('');
	$('#registerBtn').click(function() {
		
		var username = $('#username').val();
		var password = $('#password').val();
		var cfmpassword = $('#cfmpassword').val();
		var email = $('#email').val();
		var formData = {
				'username' : username,
				'password' : password,
				'email' : email
		};
		
		if(username == ''){
			$('#userMess').text('Tên đăng ký trống.');
			$('#passMess').text('');
			$('#emailMess').text('');
			$('#registerMess').text('');
			$('#cfmPassMess').text('');
			return false;
		}
		if(password == ''){
			$('#passMess').text('Mật khẩu đăng ký trống.');
			$('#userMess').text('');
			$('#emailMess').text('');
			$('#registerMess').text('');
			$('#cfmPassMess').text('');
			return false;
		}
		if(cfmpassword == ''){
			$('#cfmPassMess').text('Nhập lại mật khẩu đăng ký.');
			$('#userMess').text('');
			$('#emailMess').text('');
			$('#passMess').text('');
			$('#registerMess').text('');
			return false;
		}
		if(email == ''){
			$('#emailMess').text('Email đăng ký trống.');
			$('#userMess').text('');
			$('#passMess').text('');
			$('#cfmPassMess').text('');
			$('#registerMess').text('');
			
			return false;
		}
		if(password != cfmpassword){
			$('#cfmPassMess').text('Mật khẩu không khớp.');
			$('#passMess').text('');
			$('#emailMess').text('');
			$('#registerMess').text('');
			$('#userPassMess').text('');
			return false;
		}
	$.ajax({
		url : 'register',
		type : 'POST',
		data : formData
	})
	.then(function(data){
		$('#registerMess').text('Đăng ký tài khoản thành công.');
		$('#userMess').text('');
		$('#passMess').text('');
		$('#emailMess').text('');
		$('#cfmPassMess').text('');
		setTimeout(function() {
			window.location.href='http://localhost:8080/NguyenTheHung/index';
			
		}, 3 *1000);
	
		
	})
	.fail(function(error) {
		$('#registerMess').text('Tên đăng nhập hoặc Email đã được đăng ký.');
		$('#userMess').text('');
		$('#passMess').text('');
		$('#emailMess').text('');
		$('#cfmPassMess').text('');
		
	});	
	});

</script>

</html>