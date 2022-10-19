<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FORGOT PASSWORD</title>
    <%@ include file="/common/head.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %>

    <div class="container-fluid tm-mt-60">
        <div class="row tm-mb-50">
            <div class="col-lg-12 col-12 mb-5">
                <h2 class="tm-text-primary mb-5 text-center">Forgot Password</h2>
                <div class="tm-contact-form mx-auto">
                    <div class="form-group">
                        <input type="email" id="email" name="email" class="form-control rounded-0" placeholder="Email" required />
                        
                    </div>
                    <div class="form-group tm-text-right">
                    <p id="resetPass" style="color: blue">...</p>
                    
                    <p style="color: red" id="messageReturn">...</p>
                    <div class="form-group d-md-flex">
                        	<div class="w-50">
                        		<a href="login"><em><u>Login</u></em></a>
                        	</div>
                        </div>
                        <button type="submit" id="sendBtn" class="btn btn-primary">Forgot Pass</button>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- container-fluid, tm-container-content -->

    <%@ include file="/common/footer.jsp" %>
</body>
<script>
$('#messageReturn').text('');
$('#resetPass').text('');
	$('#sendBtn').click(function (){
		$('#messageReturn').text('');
		var email = $('#email').val();
		var formData = {'email': email};
		if(email == ''){
			$('#messageReturn').text('Vui lòng nhập email bạn đã đăng ký.');
			return false;
		}
		$.ajax({
			url: 'forgotPass',
			type: 'POST',
			data: formData
		}).then(function(data){
			setTimeout(function() {
				$('#resetPass').text('Vui lòng đợi.');
				$('#messageReturn').text('');
			},);
			
			setTimeout(function() {
				$('#messageReturn').text('Lấy lại mật khẩu thành công. Vui lòng kiểm tra email.');
				$('#resetPass').text('');
			}, 3*1000);
			
			setTimeout(function() {
				$('#resetPass').text('Đang chuyển về trang login.');
				$('#messageReturn').text('');
			}, 3500);
			
			setTimeout(function() {
				window.location.href = 'http://localhost:8080/NguyenTheHung/login';
			}, 5*1000);
		}).fail(function(error){
			
			$('#messageReturn').text('Email chưa được đăng ký hoặc không chính xác.');
			
		});	
	});
</script>
</html>