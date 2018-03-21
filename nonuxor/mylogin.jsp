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
<title>Wain Log in</title>
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
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
<link rel="stylesheet" href="socialAuth/social-button.css" />

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
	  function askEmail(){
	    $('#askDetails').modal('show').find('#myModalLabel').text("Forget Password");
		 $('#askDetails .btn-ok').attr('onclick','sendPasswordMail()');
	  }

	  function sendPasswordMail(){
		 var email = $('#askDetails #email').val();
		   var filterEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		   if(email && filterEmail.test(email))
			{
		     $.get('forgetPassMail.jsp',{email:email},function(data){
			   if(data.indexOf('success') != -1)
				 {
				   $('#validationMessage').text('Your login credential has been sent to your email id.');
	               $('#validation').show();
				 }else if(data.indexOf('norecord') != -1){
				    $('#validationMessage').text('You are not registered with us.');
	               $('#validation').show();
				 }
				$('#askDetails').modal('hide');
		    });
		   }else
			   alert("Please enter valid email address.");
	  }

/**
 * method for auth
 */
function validate() {
	var validationMessage=null;
	var username = $('.username').val();
	var password = $('.password').val();
	if (!username) {
		validationMessage = "Please enter the username.";
	} else if (!password) {
		validationMessage = "Please enter the password.";
	} else {
	     $.ajax({
			async : false,
			type : "POST",
			url : "newauth.jsp",
			data : {
				username : username,
				password : password
			}, 
			success : function(data){
				if (data.indexOf("failure") != -1) {
                validationMessage = "Username or password Incorrect. Please check your email for login credentials.";
				$('#validationMessage').text(validationMessage);
				$('#validation').show();
				}else if (data.indexOf("success") != -1) {
					window.location = 'myindex.jsp';
				}else
					$('#validation').show();
			},
			error : function() {
				validationMessage="Error in change password ajax request.";
			}
		});
	}
	if (validationMessage) {
		$('#validationMessage').text(validationMessage);
		$('#validation').show();
	} else
		$('#validation').hide();				
}
</script>



</head>

<body class="homepage">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NC8LZJ7"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

	<%@ include file="header.jsp"%>
	<section  class="resp-tab-por loginpagenew">
		<div class="container">
			<div class="col-md-12">
				<h2 class="title small txt-color5">Login</h2>

				<div class="col-xs-12">
					<div class="row">
					<%
					String msg = request.getParameter("msg");
					%>					
					<!-- alert -->
					<div class="form-group" id="validation" <%=((msg == null)?"style='display:none'":"")%>>
					<div class="alert alert-<%=msg == null?"danger":"success"%>" role="alert" id="validationMessage">
					<%=((msg == null)?"":msg)%>
					</div>
					</div>
					</div>
				</div>
			</div>
		<!-- alert end -->

		<div class="clearfix" style="clear:both;"></div>

		<div class="col-xs-12 col-sm-6 col-md-5 formcontent">
			<div class="form-group">
					<label for="username" >Username</label>
					<input type="text" class="form-control username" name="username" placeholder="Username" />
			</div>
			<div class="clearfix" style="clear: both;"></div>

			<div class="form-group">
					<label for="password" ">Password</label>
					<input type="password" class="form-control password" name="password" placeholder="Password"/>
				<a href="javascript:void(0)" onclick="askEmail();" class="pull-left linkurls">Forget password</a>
				<a href="register.jsp" class="pull-right linkurls">Don't have an account.</a>
			</div>
			<div class="clearfix" style="clear: both;"></div>

			<div class="col-xs-12 submitfld" >
				<div class="row">
					<button type="submit" class="btn btn-success" onclick="return validate()">Log in</button>
					<!--<a href="." class="btn btn-textlink">Cancel</a>-->
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-sm-6  col-md-5 socialcontent">
			<div class="row" id="social-signup">
				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=f" class="btn  btn-social btn-facebook"> 
				<i class="fa fa-facebook"></i> Sign in with Facebook</a>
				</div>

				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=g" class="btn  btn-social btn-google-plus"> 
				<i class="fa fa-google-plus"></i> Sign in with Google</a>
				</div>

				<div class="">
				<a href="socialAuth/socialAuth.jsp?authType=l" class="btn  btn-social btn-linkedin"> 
				<i class="fa fa-linkedin"></i> Sign in with LinkedIn</a>
				</div>
			</div>
		</div>
		</div>
	</section>

	<div style="clear: both !important;"></div>
		
	<script type="text/javascript" src="js/footer.js"></script>
</body>

</html>
