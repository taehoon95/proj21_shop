<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<link rel="stylesheet"
	href="/proj21_shop/resources/review/css/reviewForm.css" />
<link rel="stylesheet" href="/proj21_shop/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		var contextPath = "${contextPath}";
		var memberId = "${memberId}";
		var proNum = "${proNum}";
		
		$.get(contextPath + "/api/detailreview/" + memberId + "/"+ proNum, 
		function(json){
			var notice = [ '별로에요', '보통이에요', '그냥 그래요', '맘에 들어요', '아주 좋아요' ];
			$(".stars .fa").click(
					function() {
						$(this).addClass("active");
						$(this).prevAll().addClass("active");
						$(this).nextAll().removeClass("active");
						var starRate = $(this).index() + 1;
						
						$('.print').html(
								'<img src="images/star-lv' +starRate + '.png">'
										+ notice[starRate - 1]);
						
						/* 리뷰 등록 */
						 $('.review').on("click", '[id=insert]', function(e){
						 	  var newReview = {	proNum : json[0].proName.proNum , memberId : memberId, reviewContent : $('#reviewContent').val(),
						 						reviewImagefilename1 : $('#imgButton1').val().replace(/C:\\fakepath\\/i, ''), reviewImagefilename2 : $('#imgButton2').val().replace(/C:\\fakepath\\/i, ''), reviewStar : starRate};
						 	  console.log($('#imgButton1').val());
						 	  /* alert("data > " + newReview.proNum); */
						 	  $.ajax({
						 		  url : contextPath + "/api/myreview/",
						 		  type : "POST",
						 		  contentType: "application/json; charset=utf-8",
						 		  datatype : "json",
						 		  cache : false,
						 		  data : JSON.stringify(newReview),
						 		  success : function(res){
						 			  alert("리뷰작성이 완료되었습니다.");
						 			   window.location.href = contextPath + "/board?memberId=" + memberId;
						 		  }
						 		  
						 	  });
						})
						
						/* 리뷰 수정*/
						$('.review').on("click", '[id=modify]', function(e){
							e.preventDefault();
							var data = {reviewNum : json[0].reviewNum, reviewContent : $('#reviewContent').val(),
									reviewImagefilename1 : $('#imgButton1').val().replace(/C:\\fakepath\\/i, ''), reviewImagefilename2 : $('#imgButton2').val().replace(/C:\\fakepath\\/i, ''), reviewStar : starRate
									};
							
							/* alert("data > " + data.reviewNum); */
							$.ajax({
								url : contextPath + "/api/myreview/"+ data.reviewNum,
								type : 'Patch',
								contentType : "application/json;charset=utf-8",
								datatype : "json",
								cache : false,
								data : JSON.stringify(data),
								success : function(data){
									alert("등록을 완료했습니다.");
									window.location.href = contextPath + "/board?memberId=" + memberId;
									
								},error:function(request, data, status, error) {
								 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
									window.location.href = contextPath + "/board?memberId=" + memberId;
									}

								
							})
							
							
						});
						
			})
			
			/* 리뷰  수정 */
			$('.review').on("click", '[id=modify]', function(e){
							e.preventDefault();
							var starRate = json[0].reviewStar;	//별점을 선택하지 않았을 때 원래 있던 별점으로 세팅
							var data = {reviewNum : json[0].reviewNum, reviewContent : $('#reviewContent').val(),
									reviewImagefilename1 : $('#imgButton1').val().replace(/C:\\fakepath\\/i, ''), reviewImagefilename2 : $('#imgButton2').val().replace(/C:\\fakepath\\/i, ''), reviewStar : starRate
									};
							
							/* alert("data > " + data.reviewNum); */
							$.ajax({
								url : contextPath + "/api/myreview/"+ data.reviewNum,
								type : 'Patch',
								contentType : "application/json;charset=utf-8",
								datatype : "json",
								cache : false,
								data : JSON.stringify(data),
								success : function(data){
									alert("등록을 완료했습니다.");
									window.location.href = contextPath + "/board?memberId=" + memberId;
									
								},error:function(request, data, status, error) {
								 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
									window.location.href = contextPath + "/board?memberId=" + memberId;
									}

								
							})
							
							
						});
			
			
			console.log(json.length);
			console.log(memberId);
			
			/* 사이즈 화면에 띄우기 */
			for(i = 0; i < json.length; i++){
				var proSize = ["none","XS","S","M","L","XL"];
			}
			/* 별점 세팅하기 */
			for(i = 1; i < json[0].reviewStar+1; i++){
				$('.s'+i).addClass('active');
				$('.print').html('<img src="images/star-lv' +i + '.png">' + notice[i-1]);
				
			}
			
			/* 컬러 화면에 띄우기 */
	 		var proColor = "";
			switch(json[0].proName.proColor){
				case 1:	proColor = "white";
						break;
				case 2:	proColor = "ivory";
						break;
				case 3:	proColor = "gray";
						break;
				case 4:	proColor = "pink";
						break;
				case 5:	proColor = "yellow";
						break;
				case 6:	proColor = "mint";
						break;
				case 7:	proColor = "green";
						break;
				case 8:	proColor = "purple";
						break;
				case 9:	proColor = "navy";
						break;
				case 11: proColor = "black";
						break;
				case 12: proColor = "brown";
						break;
				case 13: proColor = "orange";
						break;
				case 14: proColor = "blue";
						break;
				case 15: proColor = "red";
						break;
				case 16: proColor = "beige";
						break;
			}
			
			var sCont = "";
				sCont += "<img src='/resources/product/images/" + json[0].proName.proImgfileName + "' width = '70' height= '70'>" 
				sCont += "<ul>"
				sCont += "<li>" + json[0].proName.proName + "</li>"
				sCont += "<li>" + proColor +"</li>" 
				sCont += "<li>" + proSize[json[0].proName.proSize] +"</li>" 
				sCont += "</ul>"
				
				$("#load").append(sCont);
			
			/* 원래 작성된 리뷰이면 화면에 기존에 작성된 후기내용 세팅 */
			var sConts ="";
				if(json[0].reviewContent == undefined){
					sConts += "<textarea id='reviewContent' cols='45' rows='10' placeholder='상품에 대한 평가를 20자 이상 작성해 주세요'></textarea><br>";	
				}else{
					sConts += "<textarea id='reviewContent' cols='45' rows='10' placeholder='상품에 대한 평가를 20자 이상 작성해 주세요'>"+json[0].reviewContent+"</textarea><br>";
				}
				
				sConts += "<div class='file'>";

				sConts += "<input type='file' id='imgButton1' name='imgButton1' value="+json[0].reviewImagefilename1+"/>";
				sConts += "<input type='file' id='imgButton2' name='imgButton2' value="+json[0].reviewImagefilename2+"/>";

				sConts += "</div><br>";
				
				/* 이미 작성된 리뷰라면 수정 버튼 나오게 하고 새로 작성되는 리뷰라면 등록 버튼 나오게 하기 */
				if(json[0].reviewContent == undefined){
				sConts += "<button id='insert'>등록</button>";
				sConts += "<input type='button' value='취소' onclick='history.go(-1)' id='insert'>";
				}else{
				sConts += "<button id='modify'>수정</button>";
				sConts += "<input type='button' value='취소' onclick='history.go(-1)' id='modify'>";
				}
				
				sConts += "<div class='bigPictureWrapper'>";
				sConts += "<div class='bigPicture'";
				sConts += "</div>"
				sConts += "</div>"
		
				$("#review").prepend(sConts);
				
				/* 이미지 업로드 */
				$("input[name='imgButton1']").on("change", function(e){
					
					let formData = new FormData();
					let fileInput = $('input[name="imgButton1"]');
					let fileList = fileInput[0].files;
					let fileObj = fileList[0];
					
					if(!fileCheck(fileObj.name, fileObj.size)){
						return false;
					}
						
					formData.append("uploadFile", fileObj);
					
					$.ajax({
						url: contextPath + '/api/myreview/uploadImage',
						processData : false,
						contentType : false,
						data : formData,
						type : 'POST',
						dataType : 'json'
					});
					
					
					/*  alert("통과"); */ 
					
					console.log("fileList : "+fileList);
					console.log("fileObj : " + fileObj);
					console.log("fileType(MimeType) : " + fileObj.type); 
					
				
					function fileCheck(fileName, fileSize){
						
						/* var, method related with attachFile */
						let regex = new RegExp("(.*?)\.(jpg|png)$");
						let maxSize = 1048576; //1MB	
						

						if(fileSize >= maxSize){
							alert("파일 사이즈 초과");
							return false;
						}
							  
						if(!regex.test(fileName)){
							alert("해당 종류의 파일은 업로드할 수 없습니다.");
							return false;
						}
						
						return true;		
						
					}
					
					
				})
				
				/* 이미지 업로드 */
				$("input[name='imgButton2']").on("change", function(e){
					
					let formData = new FormData();
					let fileInput = $('input[name="imgButton2"]');
					let fileList = fileInput[0].files;
					let fileObj = fileList[0];
					
					if(!fileCheck(fileObj.name, fileObj.size)){
						return false;
					}
						
					formData.append("uploadFile", fileObj);
					
					$.ajax({
						url: contextPath + '/api/myreview/uploadImage',
						processData : false,
						contentType : false,
						data : formData,
						type : 'POST',
						dataType : 'json'
					});
					
					
					 /* alert("통과"); */ 
					
					console.log("fileList : "+fileList);
					console.log("fileObj : " + fileObj);
					console.log("fileType(MimeType) : " + fileObj.type); 
					
				
					function fileCheck(fileName, fileSize){
						
						/* var, method related with attachFile */
						let regex = new RegExp("(.*?)\.(jpg|png)$");
						let maxSize = 1048576; //1MB	
						

						if(fileSize >= maxSize){
							alert("파일 사이즈 초과");
							return false;
						}
							  
						if(!regex.test(fileName)){
							alert("해당 종류의 파일은 업로드할 수 없습니다.");
							return false;
						}
						
						return true;		
						
					}
					
					
				})
				
		})
		
	
		
			
	});
</script>
</head>
<body>
	<div class = "container">
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/include/topbody.jsp"></jsp:include>
	<h2>스타일 후기 작성</h2>
	<div class='asd' id = "load"></div>
	<div class="bsd">
		<div class="star-rating">
			<div class="stars">
				<i class="s1 fa fa-star"></i>
				<i class="s2 fa fa-star"></i>
				<i class="s3 fa fa-star"></i>
				<i class="s4 fa fa-star"></i>
				<i class="s5 fa fa-star"></i>
			</div>
			<div class="print">별점을 매겨주세요</div>
		</div>
	</div>
		<br>
			<div class="review" id="review"></div>
		<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
	</div>
</body>
</html>