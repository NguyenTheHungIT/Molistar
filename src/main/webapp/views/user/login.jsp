<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <%@ include file="/common/head.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %>

    <div class="container-fluid tm-mt-60">
        <div class="row tm-mb-50">
            <div class="col-lg-12 col-12 mb-5">
                <h2 class="tm-text-primary mb-5 text-center">Login</h2>
                <div class="tm-contact-form mx-auto">
                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control rounded-0" placeholder="Username" required />
                        <p id="userMess" style="color: red">...</p>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control rounded-0" placeholder="Password" required />
                        <p id="passMess" style="color: red">...</p>
                    </div>
                    <div class="form-group d-md-flex">
                        	<div class="w-50">
                        		<a href="register"><em><u>Đăng ký</u></em></a>
                        	</div>
                        	<div class="w-100 text-md-right">
                        		<a href="forgotPass"><em><u>Quên mật khẩu</u></em></a>
                        	</div>
                        </div>
                    <div class="form-group tm-text-right">
                    <p id="loginMess" style="color: red">...</p>
                        <button type="submit" class="btn btn-primary" id="loginBtn">Login</button>
                        
                    </div>
                </div>                
            </div>
            
        </div>
    </div> <!-- container-fluid, tm-container-content -->

    <%@ include file="/common/footer.jsp" %>
</body>
<script>
$('#loginMess').text('');

$('#userMess').text('');

$('#passMess').text('');
	$('#loginBtn').click(function() {
		
		var username = $('#username').val();
		var password = $('#password').val();
		var formData = {
				'username' : username,
				'password' : password
				
		};
		
		if(username == ''){
			$('#userMess').text('Tên đăng nhập trống.');
			$('#passMess').text('');
			return false;
		}
		if(password == ''){
			$('#passMess').text('Mật khẩu đăng nhập trống.');
			$('#userMess').text('');
			return false;
		}
	$.ajax({
		url : 'login',
		type : 'POST',
		data : formData
	})
	.then(function(data){
		$('#loginMess').text('Đăng nhập tài khoản thành công.');
		$('#userMess').text('');
		$('#passMess').text('');
		setTimeout(function() {
			window.location.href='http://localhost:8080/NguyenTheHung/index';
			
		}, 3 *1000);
	
		
	})
	.fail(function(error) {
		$('#loginMess').text('Tên tài khoản hoặc mật khẩu đăng nhập sai.');
		$('#userMess').text('');
		$('#passMess').text('');
		
	});	
	});

</script>
</html>