<%
  int userId = 0;
		try{ userId = Integer.parseInt((String)session.getAttribute("userId"));}catch(Exception e){userId=0;}
		if(userId>0)
		{
			response.sendRedirect("index.jsp");
			return;
		}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="utf-8" />
<title>Wain Sign up</title>
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="socialAuth/social-button.css" />
<link rel="stylesheet" type="text/css" href="minify/rgen_min.css">
<link rel="stylesheet" href="css/swipebox.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/screen.css" />
<link rel="stylesheet" href="assets/gallery/prettyPhoto.css"
	type="text/css" media="screen" title="prettyPhoto main stylesheet"
	charset="utf-8" />
<link rel="stylesheet" href="css/custom.css" />
<link href="css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="/jscript/cl_functions.js"></script>
<script src="js/jquery.min.js"></script>
<script src="minify/rgen_min.js"></script>
<script src="minify/rgen.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.html"></script>
<script src="assets/gallery/jquery.prettyPhoto.js"
	type="text/javascript" charset="utf-8"></script>
<script src="js/sticky.js" type="text/javascript"></script>
<script src="js/options.js" type="text/javascript"></script>
<script src="js/thumbnail-slider.js" type="text/javascript"></script>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NC8LZJ7');</script>
<!-- End Google Tag Manager -->

<style>
	#social-signup .btn-social{
	 margin-top:5px;
	}
	#social-signup{
	 border-top: 1px solid #e5e5e5;
	 margin-bottom:10px;
	}
</style>
	<script>
	  

/**
 * method for auth
 */
function validate() {
	var validationMessage=null;
	var filterEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	var name = $('.name').val();
	var email = $('.email').val();
	if (!name) {
		validationMessage = "Please enter the name.";
	} else if (!email) {
		validationMessage = "Please enter the email.";
	} else if(!filterEmail.test(email)){
		validationMessage = "Please enter valid email.";	  
	}else{
		  return true;
	}
	if (validationMessage){
		$('#validationMessage').text(validationMessage);
		$('#validation').show();
	} else
		$('#validation').hide();	
	return false;
}
</script>
</head>

<body class="homepage">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NC8LZJ7"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

	<%@ include file="myheader.jsp"%>

<section  class="resp-tab-por loginpagenew">
	<div class="container">
		<div class="col-md-12">
			<h2 class="title small txt-color5">Create an account</h2>

			<!-- alert -->
			<div class="form-group" id="validation" style="display: none">
				<div class="alert alert-danger" role="alert" id="validationMessage"></div>
			</div>
		</div>

		<div class="clearfix" style="clear: both;"></div>



		
			
		
			<!-- alert end -->
			<form name="register" id="" style="clear: both;" action="sa.jsp"/>
				<input type="hidden" name="authType" value="DIRECT"/>

				<div class="col-xs-12 col-sm-6 col-md-5 formcontent">
					<div class="form-group">
						<label for="name" class="">Name</label>
						<input type="text" class="form-control name" name="name" placeholder="Name" />
					</div>

					<div class="clearfix" style="clear: both;"></div>
					
					<div class="form-group">
						<label for="email" class="">Email</label>
						<input type="email" class="form-control email" name="email" placeholder="Email" />
					</div>

					<div class="clearfix" style="clear: both;"></div>

					<div class="col-xs-12 submitfld">
						<div class="row">
							<button type="submit" class="btn btn-success" onclick="return validate()">Sign up</button>
						</div>
					</div>
				</div>



				<div class="col-xs-12 col-sm-6  col-md-5 socialcontent">
				<div class="row" id="social-signup">
				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=f" class="btn  btn-social btn-facebook"> 
				<i class="fa fa-facebook"></i> Sign Up with Facebook</a>
				</div>
				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=g" class="btn  btn-social btn-google-plus"> 
				<i class="fa fa-google-plus"></i> Sign Up with Google</a>
				</div>
				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=l" class="btn  btn-social btn-linkedin"> 
				<i class="fa fa-linkedin"></i> Sign Up with LinkedIn</a>
				</div>
				</div> 
			</form>
	</div>
</section>
		
	<script type="text/javascript" src="js/footer.js"></script>
</body>

</html>
