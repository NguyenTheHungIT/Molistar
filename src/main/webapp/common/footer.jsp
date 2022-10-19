<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title"><i class="fab fa-gg mr-1"></i>MOLISTAR - ENTERTAINMENT</h3>
                    <p>Molistar Entertainment <a rel="sponsored" href=""></a> is a website that allows you to watch interesting and funny video clips. You can register your own account to easily favorite and save the video clips you want. We are looking forward to giving you this exciting experience, so please subscribe and follow us. Have a nice day watching movies. Thanks very much.</p>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title"><i class="fas fa-biohazard mr-1"></i>BY NGUYEN THE HUNG</h3>
                    <ul class="tm-footer-links pl-0">
                        <li><a href="#"><i class="fas fa-user-edit mr-1"></i>Name : Nguyen The Hung(Yellow)</a></li>
                        <li><a href="#"><i class="fas fa-home mr-1"></i>Address : Quang Hoa, Ba Don Town, Quang Binh Province</a></li>
                        <li><a href="#"><i class="fas fa-envelope mr-1"></i>Email : hungntpd04759@fpt.edu.vn</a></li>
                        <li><a href="#"><i class="fas fa-phone-square-alt mr-1"></i>Number Phone : 0813302348</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
                        <li class="mb-2"><a href="https://www.facebook.com/hung.nt.2011"><i class="fab fa-facebook"></i></a></li>
                        <li class="mb-2"><a href="https://m.me/hung.nt.2011"><i class="fab fa-facebook-messenger"></i></a></li>
                        <li class="mb-2"><a href="https://www.instagram.com/thez.hungw_/"><i class="fab fa-instagram"></i></a></li>
                        <li class="mb-2"><a href="https://www.tiktok.com/@thez.hungw_"><i class="fab fa-tiktok"></i></a></li>
                    </ul>
                    <a href="#" class="tm-text-gray text-right d-block mb-2">Terms of Use</a>
                    <a href="#" class="tm-text-gray text-right d-block">Privacy Policy</a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-7 col-12 px-5 mb-3">
                    Copyright 2022 &copy; by Molistar Entertainment. All rights reserved.
                </div>
                <div class="col-lg-4 col-md-5 col-12 px-5 text-right">
                    Designed by <a href="https://www.facebook.com/hung.nt.2011" class="tm-text-gray" rel="sponsored" target="_parent">Nguyen The Hung<i class="fab fa-gg ml-1"></i></a>
                </div>
            </div>
        </div>
</footer>
	<script src="<c:url value='/templates/user/js/plugins.js' />"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>
    <script>
    $('#newMess').text('');
    $('#cfmNewMess').text('');
    $('#currentMess').text('');
    $('#messageChangePass').text('');
	$('#changePassBtn').click(function (){
		
		var currentPass = $('#currentPass').val();
		var newPass = $('#newPass').val();
		var cfmNewPass = $('#cfmNewPass').val();
		var formData = {'currentPass': currentPass,
						'newPass': newPass };
		if(currentPass == ''){
			$('#currentMess').text('Vui lòng nhập mật khẩu hiện tại.');
			$('#newMess').text('');
		    $('#cfmNewMess').text('');
		    $('#messageChangePass').text('');
			return false;
		}
		if(newPass == ''){
			$('#newMess').text('Vui lòng nhập mật khẩu mới.');
			$('#currentMess').text('');
		    $('#cfmNewMess').text('');
		    $('#messageChangePass').text('');
			return false;
		}
		if(cfmNewPass == ''){
			$('#cfmNewMess').text('Vui lòng nhập lại mật khẩu mới.');
			$('#currentMess').text('');
		    $('#newMess').text('');
		    $('#messageChangePass').text('');
			return false;
		}
		if(newPass != cfmNewPass){
			$('#cfmNewMess').text('Mật khẩu mới không khớp.');
			$('#currentMess').text('');
		    $('#newMess').text('');
		    $('#messageChangePass').text('');
			return false;
		}
		$.ajax({
			url: 'changePass',
			type: 'POST',
			data: formData
		}).then(function(data){
			$('#messageChangePass').text('Mật khẩu của bạn đã được thay đổi.');
			$('#newMess').text('');
			$('#cfmNewMess').text('');
			$('#currentMess').text('');
			setTimeout(function() {
				window.location.href='http://localhost:8080/NguyenTheHung/index';
				
			}, 2*1000);
		}).fail(function(error){
			$('#currentMess').text('Mật khẩu hiện tại không đúng');
			$('#newMess').text('');
			$('#cfmNewMess').text('');
			$('#messageChangePass').text('');
			
		});	
	});
	</script>