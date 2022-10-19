<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<!--
App Name: Molister - Entertainment
Author: Nguyen The Hung - PD04759 - FPT Polytechnic Da Nang
Contact: hungntpd04759@fpt.edu.vn or hn26424@gmail.com
Facebook: https://www.facebook.com/hung.nt.2011
Number Phone: 0813.302.348 or 0898.191.416
-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGUYEN THE HUNG | MOLISTAR ENTERTAINMENT</title>
    <%@ include file="/common/head.jsp" %>
</head>
<body>
	<%@ include file="/common/header.jsp" %>
    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
                <i class="fab fa-youtube mr-2"></i>List Videos
            </h2>
            <div class="col-6 d-flex justify-content-end align-items-center">
                <form action="" class="tm-text-primary">
                Page <input type="text" value="${currentPage}" size="1" class="tm-input-paging tm-text-primary" disabled> of <input type="text" value="${maxPage}" size="2" class="tm-input-paging tm-text-primary" disabled>
                </form>
            </div>
        </div>
        <div class="row tm-mb-90 tm-gallery">
       		<c:forEach items="${videos}" var="video">
        		<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                	<h5 class="tm-text-secondary" style="white-space: nowrap; overflow: hidden;">
                		<i class="fab fa-youtube-square mr-1"></i> ${video.title}
                	</h5>
                	<figure class="effect-ming tm-video-item">
                	<img src="${video.poster}"  class="img-fluid">
                    	<figcaption class="d-flex align-items-center justify-content-center">
                        	<h2>${video.href} </h2>
                        	<a href="<c:url value='/video?action=watch&id=${video.href} '/> ">View more</a>
                    	</figcaption>
                	</figure>
                	<div class="d-flex justify-content-between tm-text-gray">
                    	<span >${video.shares} <i class="fas fa-share mr-1"></i>shares</span>
                    	<span >${video.views} <i class="fas fa-street-view mr-1"></i>views</span>
                	</div>
            	</div>
        	</c:forEach>
        </div> <!-- row -->
        <div class="row tm-mb-90">
            <div class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
            	<c:if test="${currentPage == 1}">
            		<a href="" class="btn btn-primary tm-btn-prev mb-2 disabled"><i class="fas fa-angle-left mr-2"></i>Previous</a>
            	</c:if>
                <c:if test="${currentPage > 1}">
                	<a href="index?page=${currentPage - 1}" class="btn btn-primary tm-btn-prev mb-2 "><i class="fas fa-angle-left mr-2"></i>Previous</a>
                </c:if>
                <div class="tm-paging d-flex">
                	<c:forEach varStatus="i" begin="1" end="${maxPage}">
                		<a href="index?page=${i.index}" class="tm-paging-link ${currentPage == i.index ? 'active' : ''}">${i.index}</a>
                	</c:forEach>
                </div>
                <c:if test="${currentPage == maxPage}">
            		<a href="" class="btn btn-primary tm-btn-next mb-2 disabled">Next Page<i class="fas fa-angle-double-right ml-2"></i></a>
            	</c:if>
                <c:if test="${currentPage < maxPage}">
                	<a href="index?page=${currentPage + 1}" class="btn btn-primary tm-btn-next mb-2 ">Next Page<i class="fas fa-angle-double-right ml-2"></i></a>
                </c:if>
            </div>            
        </div>
    </div> <!-- container-fluid, tm-container-content -->

    <%@ include file="/common/footer.jsp" %>
</body>
</html>