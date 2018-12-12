





	
		
	




<script language="JavaScript">
var beforeload = (new Date()).getTime();
var totalTime = 0;
var clientTime = 0;
var serverTime = 0;
var XmlHttpObj1;
function Sign(X) { return X>0 ? "+" : X<0 ? "-" : " " }
function CreateXmlHttpObj1() {
	try {XmlHttpObj1 = new ActiveXObject("Msxml2.XMLHTTP");}
	catch(e) {try{XmlHttpObj1 = new ActiveXObject("Microsoft.XMLHTTP");}
		catch(oc) {XmlHttpObj1 = null;}}
	if(!XmlHttpObj1 && typeof XMLHttpRequest != "undefined") {XmlHttpObj1 = new XMLHttpRequest();}}

function loadingTime() {
	//calculate the current time in afterload
	var afterload = (new Date()).getTime();
	//calculate the seconds
	clientTime = (afterload-beforeload)/1000;
	serverTime =  parseFloat(document.getElementById("serverTime").innerHTML);
	totalTime = (clientTime + serverTime).toFixed(3);
	document.getElementById("loadingtime").innerHTML = "and delivered in " + totalTime + " seconds";
}
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
			if (oldonload) {
				oldonload();
			}
			func();
		}
	}
}
</script>




 
 



    
        

        
        
    

 








 














	



	



	



	



























	





	




	



































	
	
	
		
			
		
	
	
	




















	
	    





 









	
	    





 









	
	    








	



 
 
 


	




 





 

 
	 
 

 
	 
 

 









	
	
    



 




	
















  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  










  
	  
	  
  


	
	
	

	
		
			
		
		
			
		
		
			
				
			
		
	
	

	














<!DOCTYPE html>
<html lang="en">
<head>
	<title>HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013 by Andrew Ho, Justin Reich, Sergiy Nesterko, Daniel Seaton, Tommy Mullaney, Jim Waldo, Isaac Chuang :: SSRN</title>
	
<meta name="description" content="HarvardX and MITx are collaborative institutional efforts between Harvard University and MIT to enhance campus-based education, advance educational research, an">
<meta name="keywords" content=" SSRN, HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013, Andrew Ho, Justin Reich, Sergiy Nesterko, Daniel Seaton, Tommy Mullaney, Jim Waldo, Isaac Chuang">
<meta name="citation_author" content="Ho, Andrew">
<meta name="citation_author" content="Reich, Justin">
<meta name="citation_author" content="Nesterko, Sergiy">
<meta name="citation_author" content="Seaton, Daniel">
<meta name="citation_author" content="Mullaney, Tommy">
<meta name="citation_author" content="Waldo, Jim">
<meta name="citation_author" content="Chuang, Isaac">
<meta name="citation_title" content="HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013">
<meta name="citation_online_date" content="2014/01/22">

<meta name="citation_publication_date" content="2014/01/21">

<meta name="citation_doi" content="10.2139/ssrn.2381263">
<meta name="citation_abstract_html_url" content="https://papers.ssrn.com/abstract=2381263">
<meta name="citation_keywords" content="MOOC, massive open online course, HarvardX, MITx, online learning, distance education, higher education">
<meta name="citation_pdf_url" content="https://papers.ssrn.com/sol3/Delivery.cfm?abstractid=2381263"> 

	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	
	
		
	
    <link rel="stylesheet" href="https://www.ssrn.com/n/react/mendeley/style.bundle.css" />
	
<meta name='free_download_available' content='true'><meta name='free_download_available' content='true'></head>



  

 
	



	



	











	

















<body class="new-layout ">

	
	

	









	




	







	









		

		
		

	
	




	
	


	
	



	
	


	
	
	
	
	
	
		
			
			
		

		
		
	

	

	



	
	
	
	

	<script language="javascript">
		//Language functions
		function changeLanguage1(language, response){

			$.ajax({
				url: '/AltLanguage_ajax.cfm?type=changeLanguage&partid=1&strCode=en',
				cache: false,
				success: function(data) {
					// Update values in cookies
					Set_Cookie('SITEID',language,'-1','/','.ssrn.com','');
					Set_Cookie('SITEID',language,'1000','/','.ssrn.com','');

					// Finally, perform redirection
					if (response == 'reload') {
						window.location.reload();
					}
					else {
						window.location.href=response;
					}
				}
			});
		}

		function Set_Cookie( name, value, expires, path, domain, secure ) {
			// set time, its in milliseconds
			var today = new Date();
			today.setTime( today.getTime() );

			/*
			if the expires variable is set, make the correct
			expires time, the current script below will set
			it for x number of days, to make it for hours,
			delete * 24, for minutes, delete * 60 * 24
			*/
			if ( expires ) {
				expires = expires * 1000 * 60 * 60 * 24;
			}

			var expires_date = new Date( today.getTime() + (expires) );

			document.cookie = name + "=" +escape( value ) +
			( ( expires ) ? ";expires=" + expires_date.toGMTString() : "" ) +
			( ( path ) ? ";path=" + path : "" ) +
			( ( domain ) ? ";domain=" + domain : "" ) +
			( ( secure ) ? ";secure" : "" );
		}


		/*
		* We use this function when the language should be stripped from an object, like a form RADIO
		*/
		function getLanguage ( oObj ) {
			var specialChars = "!@#$^&%*()+=-[]\/{}|:<>?,.";

			// Need to clean up code if object came from Mura site.
			sCode = oObj.value;
			if (sCode.length > 2) {
				for (var i = 0; i < specialChars.length; i++) {
					sCode = sCode.replace(new RegExp("\\" + specialChars[i], 'gi'), '');
				}
				// After cleaning up special chars, we take the first two chars.
				sCode = sCode.substring(0,2).trim();
			}

			return sCode;
		}
	</script>







	









<link rel="stylesheet" type="text/css" href="https://static.ssrn.com/cfincludes/css/custom-bootstrap.min.css?v=297">
<link rel="stylesheet" type="text/css" href="https://static.ssrn.com/cfincludes/css/custom.min.css?v=297">
<link href="https://static.ssrn.com/cfincludes/global_header/dist/style.bundle.css" rel="stylesheet">

<div class="accesibility-link">
	<a id="skip-to-content" title="Skip to content" href="#maincontent">Skip to main content</a>
</div>






<meta name="part_id" content="1">
<meta name="www_server" content="www.ssrn.com">
<meta name="static_server" content="static.ssrn.com">
<meta name="hq_server" content="hq.ssrn.com">
<meta name="papers_server" content="papers.ssrn.com">
<meta name="user_name" content="Public User">
<meta name="is_custom" content="false">
<meta name="own_design" content="false">
<meta name="ab_id" content="">
<meta name="on_behalf" content="False">
<meta name="login_user_id" content="">
<!--GLOBAL HEADER-->
<header id="global-header"></header>




	
	
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">if(typeof jQuery == 'undefined') {
    document.write(unescape("%3Cscript src='https://#strStaticServer#/libraries/JQuery/v1.12.4/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
}</script>


<script>
	function sentEmailValidation(lngLoginID, forwardURL){
		var parameters = {
			"lngLoginID" : lngLoginID,
			"strForwardURL" : forwardURL
		};
		$.ajax({
			type: "POST",
			url: "https://static.ssrn.com/cfc/webServices/loginServices.cfc?method=sentValidationEmailNew",
			data: parameters,
			dataType: "jsonp",
			async: false,
			success: function(data) {
				if(data.RESULT == 1){
					$("#errorMessageLogin").html(data.MESSAGE);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	};
</script>
<script>
$( document ).ready(function() {

	// Show translation notice on footer on load
	var hebrewIsSelected = $('.dropdown-lang option:last-child').is(':selected'),
			$body = $('body'),
			$loginBox = $('.loginBox'),
			$menuMain = $('.menu-main'),
			$profileMenu = $('.profileMenu');

	if (hebrewIsSelected) {
		toggleTranslationNote();
	}

    
    $('#global-header .auth-menu > div > a:first-child').on('click', function() {
        pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'ssrn-header:register'}});
    });

    $('#global-header .auth-menu > div > a:last-child').click(function(e) {
        pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'ssrn-header:sign-in-or-register'}});
    });

    $('#global-header a[href$="/rankings/Ranking_display.cfm?TRN_gID=10"]').on('click', function() {
        pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'rankings-top-papers'}});
    });

    $('#global-header a[href$="/submissions/CreateNewAbstract.cfm"]').on('click', function() {
        pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'ssrn-header:submit-article'}});
    });

	$('#btnMenu').on('click', function() {
		$body.addClass('nav-is-open');
		$menuMain.addClass('open');
	});

	$('.mo-nav-close-btn').on('click', function() {
		$body.removeClass('nav-is-open');
		$(this).closest('.mo-nav').removeClass('open');
	});

	$('.mo-nav-search-btn').on('click', function() {
		$menuMain.find('.menu-search').toggleClass('open');
	});

	
	
	$(document).on('click','#profile', function(e){
		e.preventDefault();
		$body.toggleClass('nav-is-open');
		$profileMenu.toggleClass('open');
	});
	

	/* Cleaning the email text*/
	$('#txtLogin').bind("change keyup input",function() {
		$(".error_show_login").hide();
		$("#txtLogin").removeClass("loginError");
		$("#errorMessageLogin").hide();
	});

	/* Cleaning the password text*/
	$('.password-inp').bind("change keyup input",function() {
		$(".error_show_pass").hide();
		$("#txtPasswordLogin").removeClass("loginError");
		$("#errorMessageLogin").hide();
	});

	/*Function for encrypt*/
	function encrypt(key1, key2, key3){
		var key = btoa(key1 + "|" + key2 + "|" + key3);
		return key;
	};

	
	function validateFields (){
		var emptyLogin = false;
		var emptyPass = false;

		if(document.getElementById("txtLogin") == null || document.getElementById("txtLogin").value == "")
		{
		$("#txtLogin").addClass('loginError');
		$(".error_show_login").show();
		emptyLogin = true;
		}
		if(document.getElementById("txtPasswordLogin") == null || document.getElementById("txtPasswordLogin").value == "" )
		{
			$("#txtPasswordLogin").addClass('loginError');
			$(".error_show_pass").show();
			emptyPass = true;
		}
		if(emptyLogin == true || emptyPass == true){
			return false;
		}
		return true;
	};

	
	$('.password-inp').keypress(function(event) {
		if (event.keyCode == 13 || event.which == 13) {
			event.preventDefault();
			login();
		}
	});

	
	$('#txtLogin').keypress(function(event) {
		if (event.keyCode == 13 || event.which == 13) {
			event.preventDefault();
			login();
		}
	});

	
	$("#signin").click(function() {
		login();
	});

	
	function login(){
		if (validateFields() != false) {
			var user = document.getElementById("txtLogin").value;
			var pass = document.getElementById("txtPasswordLogin").value;
			var remember = $('.remember-me-check').prop('checked');
			var keyUser = encrypt(user, pass, remember);
			var parameters = {
				"key" : keyUser
			};
			$.ajax({
				type: "POST",
				url: "https://static.ssrn.com/cfc/webServices/loginServices.cfc?method=signinService",
				data: parameters,
				dataType: "jsonp",
				async: false,
				success: function(data) {
					if(data.ILOGINRESULT == 0) {
						var lngPartLogedIn = data.USER.PART_ID;
						buildmenu(lngPartLogedIn);
						$("#name-header div.user-name-overflow").text(data.USER.FULLNAME);
						$("#name-mo-header").text(data.USER.FULLNAME);
						$('#profile').show();
						$("#btnSignin").hide();
						$("#btnRegister").hide();
						$loginBox.removeClass('open');
						$body.removeClass('nav-is-open');
						
						pageData.visitor.loginSuccess = "true";
						pageData.visitor.loginStatus = "logged in";
						pageData.visitor.accessType = "ss:registered-user";
						pageData.visitor.userId = data.USER.ENCRYPT_PART_ID;
						pageDataTracker.trackEvent( 'newPage' , pageData);
						
					} else {
						
						pageData.visitor.loginSuccess = "false";
						pageDataTracker.trackEvent( 'newPage' , pageData);
						
						$("#errorMessageLogin").html(data.MESSAGETOSHOW);
						$("#errorMessageLogin").show();
					}
				}
			});
		} else {
			return false;
		};
	};

	
	function buildmenu(lngPartLogedIn){
		$("#personal").attr("href", "https://hq.ssrn.com/Participant.cfm?rectype=edit&partid=" + lngPartLogedIn + "&perinf=y");
		$("#affil").attr("href", "https://hq.ssrn.com/Affiliations/AffiliationList.cfm?partid=" + lngPartLogedIn);
		$("#suscr").attr("href", "https://hq.ssrn.com/Subscriptions.cfm?partId=" + lngPartLogedIn);
		$("#mypapers").attr("href", "https://hq.ssrn.com/submissions/MyPapers.cfm?partid=" + lngPartLogedIn);
	};

	
	$(document).click(function(event) {
		if(!$(event.target).closest('.header-tooltip').length && $(event.target)[0] != $('#btnSignin')[0] && $(event.target)[0] != $('#profile')[0] ) {
			if($('.header-tooltip').is(":visible") && $('.mo-nav-header').is(":hidden")) {
				$body.removeClass('nav-is-open');
				$('.header-tooltip').removeClass('open');
			}
		}

		// Makes the submenu links accesible by keyboard
		$('.has-sub-menu a')
			.focus(function() {
				$(this).parents("li").addClass("focus");
			})
			.blur(function() {
				$(this).parents("li").removeClass("focus");
			});
	});

	// Show translation notice on change
	$('.dropdown-lang').on('change', function() {
		toggleTranslationNote();
	});

	// Accordion functionality on Footer MO
	var $collapseBtn = $('h4[data-toggle="collapse"]'),
			$collapsableContent = $('.collapsable');

	$collapseBtn.on('click', function(){
		var $this = $(this),
				$parent = $this.parent(),
				$thisCollapsable = $parent.find('.collapsable');

		$collapsableContent.slideUp('fast');

		if ( !$thisCollapsable.is(":visible") ) {
			$thisCollapsable.slideDown('fast');
		}
	});

	// Show translation notice on footer
	function toggleTranslationNote() {
		$('.translation-notice').toggle();
	}
});

	//Language function
	function changeLanguage(lang){
        var curretUrl = window.location.href;
        if(curretUrl.indexOf('&lng') != -1) {
            var new_url = curretUrl.substring(0, curretUrl.indexOf('&lng'));
        }else{
            var new_url = window.location.href;
        }
        window.location.href=new_url+'&lng='+lang;
    }
</script>
<script type="text/javascript" src="https://static.ssrn.com/cfincludes/global_header/dist/app.bundle.js"></script>


	<!-- new css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="https://static.ssrn.com/cfincludes/css/custom.min.css?v=297">

	<!-- new abstract css -->
	<link rel="stylesheet" type="text/css" href="https://static.ssrn.com/cfincludes/css/abstract.min.css?v=297">

	
	

















			

			





			






	




	


	
	





	








	

	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	
	
		
		
		
	

















<div id="genericToastr" class="generic-toastr">
	<div class="toastr-icon">
		<i id="toastrIcon"></i>
	</div>
	<div id="toastrMessage" class="toastr-mesage"></div>
	<div class="toastr-close">
		<i class="icon icon-gizmo-delete" onclick="closeToastr()"></i>
	</div>
	<div class="toastr-link"><a id="toastrLink" href="#"></a></div>
</div>



 



	<div class="container abstract-body" id="maincontent">
		<div class="row">
			<div class="col-sm-8 abstract-main-col">
				
				 









	
	    






 





	
	






	
	







	




	



<div class="abstract-top-buttons ">
	
		
			
			
			
			
				
				
					<a href="Delivery.cfm/SSRN_ID2381263_code1852476.pdf?abstractid=2381263&mirid=1" data-abstract-id="2381263" data-abstract-title="HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013" id="downloadPdf" class="btn-orange btn-view-pdf download-button" title="Download Full-Text Paper">Download This Paper</a>	
				

				
				
					
					
						<a href="Delivery.cfm/SSRN_ID2381263_code1852476.pdf?abstractid=2381263&mirid=1&type=2" data-abstract-title="HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013" id="viewPdf" title="Open Full-Text Paper in Browser" class="btn-blue-outline-third btn-download-pdf">
						Open PDF in Browser
						</a>
					
				
			
			
		
	

	
	
	
	
		
			
		

		
		
			<div class="star-container">
				
					
				
				<a href="#" aria-label="Add to your Library" aria-pressed="false" role="button">
					<i class="icon icon-gizmo-star-outline" data-user-id="1" data-abstract-id="2381263" data-abstract-url="static.ssrn.com" data-abstract-auth="false"></i>
					<span>Add Paper to My Library</span>
				</a>
			</div>
		
	
	 
</div>











	














	
	    







 



	




	







	




































	


				
			</div>
			<div class="col-sm-4 abstract-side-col">
				
				
				
					<div class="share-container">
						Share:
						<ul class="list-unstyled ">
							<li><a class="addthis_button_facebook" aria-label="Share on Facebook" role="button"><i class="icon icon-social-facebook" aria-hidden="true"></i></a></li>
							<li><a class="addthis_button_twitter" aria-label="Share on Twitter" role="button"><i class="icon icon-social-twitter" aria-hidden="true"></i></a></li>
							<li><a class="addthis_button_citeulike" aria-label="Share on CiteULike" role="button"><i class="icon icon-social-citeulike" aria-hidden="true"></i></a></li>
							
							<li><a id="socialEmail" href="#" onClick='window.open("Email_Friend.cfm?abid=2381263","Email_Friend","toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=740,height=600")' aria-label="Share by Email" role="button"><i class="icon icon-gizmo-email" aria-hidden="true"></i></a></li>
							
							<li><a id="permalink" href="#" aria-label="Get Permalink" role="button"><i class="icon icon-gizmo-link" aria-hidden="true"></i></a></li>
						</ul>
					</div>
					<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4fb149d9407dcd4b"></script>
					<script type="text/javascript">
						var paperTitle = "HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013";
						var addthis_share = addthis_share || {};
						addthis_share = {
							url: "https://ssrn.com/abstract=2381263",
							passthrough : {
								twitter: {
									
										text: paperTitle + " @SSRN"
									
								}
							}
						}

						function trackEventSocial(platform){
							pageDataTracker.trackEvent('socialShare', {
								social: {
									sharePlatform : platform
								}
							});
						};

						$('.addthis_button_facebook').click(function(e) {
							trackEventSocial('Facebook');
						});

						$('.addthis_button_twitter').click(function(e) {
							trackEventSocial('Twitter');
						});

						$('.addthis_button_citeulike').click(function(e) {
							trackEventSocial('CiteULike');
						});

						$('#socialEmail').click(function(e) {
							trackEventSocial('Email');
						});

						$('#permalink').click(function(e) {
							trackEventSocial('Permalink');
						});

					</script>
				
				
				
				<div class="permalink-tooltip">
					<div class="tooltip-bg"></div>
					<div class="tooltip-container">
					<div class="permalink-title">Permalink</div>
						<div class="permalink-description">Using the URL or DOI link below will ensure access to this page indefinitely</div>
						<div class="permalink-url">
							<input type="text" id="parmalinkURL" readonly class="permalink-input" value="https://ssrn.com/abstract=2381263">
							<a href="#" id="copyURL" class="btn-blue-outline btn-blue-outline-copy">Copy URL</a>
						</div>
						<div class="permalink-doi">
							<input type="text" id="parmalinkDOI" readonly class="permalink-input" value="https://dx.doi.org/10.2139/ssrn.2381263">
							<a href="#" id="copyDOI" class="btn-blue-outline btn-blue-outline-copy">Copy URL</a>
							</div>
						</div>
				</div>
				
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8 abstract-main-col">
				
				

<div class="box-container box-abstract-main">
	
	
		
	

	
	
		
		
	

	
	
	
	<h1>HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013</h1>
	
	<div class="reference-info">
		
		
<p>Ho, A. D., Reich, J., Nesterko, S., Seaton, D. T., Mullaney, T., Waldo, J., & Chuang, I. (2014). HarvardX and MITx: The first year of open online courses (HarvardX and MITx Working Paper No. 1).</p> 

	</div>

	

	
	<p class="note note-list">
		
		
			<span>33 Pages</span>
		
		

		<span>Posted: 22 Jan 2014</span>
		
			&nbsp;
		
		
				
	</p>
	
		<div class="authors">
			
			




	<h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186806 target='_blank' title='View other papers by this author'>Andrew Ho</a></h2><p>Harvard University; Harvard University - Extension School</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1852476 target='_blank' title='View other papers by this author'>Justin Reich</a></h2><p>Massachusetts Institute of Technology (MIT) - Office of Digital Learning</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186766 target='_blank' title='View other papers by this author'>Sergiy Nesterko</a></h2><p>Harvard University - HarvardX</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186757 target='_blank' title='View other papers by this author'>Daniel Seaton</a></h2><p>Institutional Research; Massachusetts Institute of Technology (MIT) - Office of Digital Learning</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186801 target='_blank' title='View other papers by this author'>Tommy Mullaney</a></h2><p>Harvard University - HarvardX</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186764 target='_blank' title='View other papers by this author'>Jim Waldo</a></h2><p>Harvard University; Harvard University - Extension School</p><h2><A HREF=https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186749 target='_blank' title='View other papers by this author'>Isaac Chuang</a></h2><p>Massachusetts Institute of Technology (MIT) - Office of Digital Learning; MIT</p>

		</div>
	
	
	
	
	



	
	
	
	
		
		
	
	
		
			<p>Date Written: January 21, 2014</p>
		
	

	
	
		
		
		
		
		
	

	
	
		
	
	<div class="abstract-text">
		<h3>Abstract</h3>
		<p>HarvardX and MITx are collaborative institutional efforts between Harvard University and MIT to enhance campus-based education, advance educational research, and increase access to online learning opportunities worldwide.  Over the year from the fall of 2012 to the summer of 2013, HarvardX and MITx launched 17 courses on edX, a jointly founded platform for delivering massive open online courses (MOOCs).  In that year, 43,196 registrants earned certificates of completion.  Another 35,937 registrants explored half or more of course content without certification.  An additional 469,702 registrants viewed less than half of the content.  And 292,852 registrants never engaged with the online content.  In total, there were 841,687 registrations from 597,692 unique users across the first year of HarvardX and MITx courses.  This report is a joint effort by institutional units at Harvard and MIT to describe the registrant and course data provided by edX in the context of the diverse efforts and intentions of HarvardX and MITx instructor teams. <P></p>
	</div>
	

	<center>
		
		


	

	
	

		
		

	
	


	</center>

	
	
	
		
	
	
	

	
	
		
		
			
				
			
		
		<p><strong>Keywords:</strong> MOOC, massive open online course, HarvardX, MITx, online learning, distance education, higher education</p>
	
	

		

	
	
	

	
	

	
	




	








	



























    	
	
	
	
   	
	
	
	
	
	            
	

















	



	






	



	





	



    

	


	<p>
		<strong class="hidden-xs hidden-sm">Suggested Citation:</strong>
		<a href="#" class="suggested-citation-btn btn-link visible-xs visible-sm">Suggested Citation<i class="icon icon-gizmo-navigate-right"></i></a>
	</p>

	<div id="selectable" onclick="selectText('selectable')" class="suggested-citation">
		
			Ho,  Andrew and Reich,  Justin and Nesterko,  Sergiy and Seaton,  Daniel and Mullaney,  Tommy and Waldo,  Jim and Chuang,  Isaac, HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013 (January 21, 2014). Ho, A. D., Reich, J., Nesterko, S., Seaton, D. T., Mullaney, T., Waldo, J., & Chuang, I. (2014). HarvardX and MITx: The first year of open online courses (HarvardX and MITx Working Paper No. 1).. Available at SSRN: <a href="https://ssrn.com/abstract=2381263"  target="_blank">https://ssrn.com/abstract=2381263</a> or <a href="https://dx.doi.org/10.2139/ssrn.2381263" class="textlink" target="_blank">http://dx.doi.org/10.2139/ssrn.2381263 </a>
		
	</div>
	

	
	
	

	<a href="#" class="show-contact-btn btn-link" role="button" aria-label="Show contact information">
		<span aria-hidden="true"></span><i class="icon icon-gizmo-navigate-right" aria-hidden="true"></i>
	</a>

	
	<div class="contact-information">
		

	













	
	
	








	
	
		
		
	




	
	
		
		
	



















	

	

	

	

	

	

	

	

	

	

	


	























	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186806" target='_blank'>Andrew Ho</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Harvard University  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>1875 Cambridge Street<br>Cambridge, MA  02138<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Harvard University - Extension School  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>125 Mt Auburn St.<br>Cambridge, MA  02476<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1852476" target='_blank'>Justin Reich (Contact Author)</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Massachusetts Institute of Technology (MIT) - Office of Digital Learning  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>77 Massachusetts Avenue<br>Cambridge, MA  02139<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186766" target='_blank'>Sergiy Nesterko</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				<h4>Harvard University - HarvardX  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>125 Mt Auburn St.<br>Cambridge, MA  02476<br>United States<br></span>
				</p>
				
			

			
				
				<p>
					<span>HOME PAGE: <a href="http://nesterko.com" target="HOMEPAGE" title="http://nesterko.com">http://nesterko.com</a></span>
				</p>
			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186757" target='_blank'>Daniel Seaton</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				<h4>Institutional Research  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>77 Massachusetts Avenue<br>50 Memorial Drive<br>Cambridge, MA  02139-4307<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Massachusetts Institute of Technology (MIT) - Office of Digital Learning  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>77 Massachusetts Avenue<br>Cambridge, MA  02139<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186801" target='_blank'>Tommy Mullaney</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				<h4>Harvard University - HarvardX  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>125 Mt Auburn St.<br>Cambridge, MA  02476<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186764" target='_blank'>Jim Waldo</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				<h4>Harvard University  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>1875 Cambridge Street<br>Cambridge, MA  02138<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Harvard University - Extension School  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>125 Mt Auburn St.<br>Cambridge, MA  02476<br>United States<br>7814420497 (Phone)<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
				
					
						<h3><a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186749" target='_blank'>Isaac Chuang</a></h3>
					
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				
				
				


				<h4>Massachusetts Institute of Technology (MIT) - Office of Digital Learning  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>77 Massachusetts Avenue<br>Cambridge, MA  02139<br>United States<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	

	
	<div class="author">

		

		

		
		
		

		
		
			
		

		
		
		
		

		
		<div class="block-quote">
			
				
			

			
				
				
				
					
					
					
					
				
					
					
					
						
					
				
			

			
				<h4>MIT  ( <a href="javascript:void(0)" onClick="pageDataTracker.trackEvent('conversionDriverClick', {conversionDriver:{name : 'article-page:email'}});window.open('GetAuthorEmail.cfm?abid=2381263&pag=papers','Author_Email','toolbar=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=470')">email</a> )</h4>
			

			
			
				
				
				<p>
					<span>77 Massachusetts Avenue<br>50 Memorial Drive<br>Cambridge, MA  02139-4307<br>United States<br>617 253-1692 (Phone)<br></span>
				</p>
				
			

			

		</div>
		
	</div>
	





	</div>
	

	
	
		
	
	<div id="mendeley-data-widget" data-abstract-id="2381263" data-mendeley-url="https://www.ssrn.com/n/"></div>
	<script type="text/javascript" src="https://www.ssrn.com/n/react/mendeley/app.bundle.js"></script>
	

</div>

				 
				
				 









	
	    






 





	
	






	
	







	






<div class="abstract-top-buttons abstract-bottom-buttons">
	
		
			
			
			
			
				
				
					<a href="Delivery.cfm/SSRN_ID2381263_code1852476.pdf?abstractid=2381263&mirid=1" data-abstract-id="2381263" data-abstract-title="HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013" id="downloadPdf" class="btn-orange btn-view-pdf download-button" title="Download Full-Text Paper">Download This Paper</a>	
				

				
				
					
					
						<a href="Delivery.cfm/SSRN_ID2381263_code1852476.pdf?abstractid=2381263&mirid=1&type=2" data-abstract-title="HarvardX and MITx: The First Year of Open Online Courses, Fall 2012-Summer 2013" id="viewPdf" title="Open Full-Text Paper in Browser" class="btn-blue-outline-third btn-download-pdf">
						Open PDF in Browser
						</a>
					
				
			
			
		
	

	
	
	
	
	 
</div>











	














	
	    







 



	




	







	





































				

			</div>

			<div class="col-sm-4 abstract-side-col">
				
					<div class="row">
						
						








	
	    














	
	    







<div class="box-container box-registration-call-out">
	<h2 class="section-title">Register to save articles to<br>your library</h2>
	<dl class="stats row">
		<a href="https://hq.ssrn.com/login/pubsigninjoin.cfm" class="btn-orange" title="Register">Register</a>
	</dl>
</div>

					</div>
				
				<div class="row">
					
					




	













	
	
	
	










<div class="box-container box-paper-statics">
	<h2 class="section-title">Paper statistics</h2>
	<dl class="stats row">
		
		
			 
			<div class="stat col-lg-6">
				<div class="lbl">Downloads</div>
				<div class="number" title="">    11,580</div>
			</div>
			
		

		
		 
		<div class="stat col-lg-6">
			<div title="SSRN compiles rankings of Papers in our system
based on a number of measures,
such as downloads and citations.
To be ranked, a paper must be a publicly available
scholarly full-text paper on SSRN.
Privately available papers
are not considered in these rankings."
			class="lbl">rank</div>
			
			<div class="number" title="">      288</div>
		</div>
		
		
		
			<div class="stat col-lg-6">
				<div class="lbl">Abstract Views</div>
				<div class="number" title="">    42,383</div>
			</div>
			<div class="stat plumx col-lg-6">
				<div class="lbl">PlumX</div>
				<div class="hidden-xs">
					<a href="https://plu.mx/ssrn/a/?ssrn_id=2381263" class="plumx-plum-print-popup" data-popup="left" data-hide-when-empty="false" data-site="ssrn" data-hide-usage="true" data-badge="false"></a>
				</div>
				<div class="visible-xs">
					<a href="https://plu.mx/ssrn/a/?ssrn_id=2381263" class="plumx-plum-print-popup" data-popup="right" data-hide-when-empty="false" data-site="ssrn" data-hide-usage="true" data-badge="false"></a>
				</div>
				
			</div>
		
		
	</dl>
	
		
	
</div>

				</div>
				
				
					<div class="row">
						




	
		<div class="box-container box-related-journals">
			<h2 class="section-title">Related eJournals</h2>
			<ul class="quick-links">
				
					
					

					

					
						
						

						<li class="related-journal">
							<p><a href="https://papers.ssrn.com/sol3/JELJOUR_Results.cfm?form_name=journalBrowse&journal_id=1999080">Innovation Educator: Courses, Cases & Teaching eJournal</a></p>
							<div class="rj-btn-container">
								<a onclick="trackEventsArticle('https://hq.ssrn.com/jourInvite.cfm?jourid=CASE_1999080&abid=2381263', 'related-journal');" href="javascript:void(0);" class="btn-orange btn-follow">Follow</a>
								<i class="icon icon-gizmo-information" aria-hidden="true"></i>

								<div class="related-journals-tooltip">
									<div class="tooltip-bg"></div>
									<i class="icon icon-gizmo-delete" aria-label="Close Tooltip" role="button"></i>
									<div class="tooltip-container">
										<h4 class="rj-title">Innovation Educator: Courses, Cases & Teaching eJournal</h4>
										<p class="rj-description">
											Subscribe to this fee journal for more curated articles on this topic
										</p>
										<div class="rj-statistics">
											<div class="rj-followers">
												<div class="rjs-title">
													FOLLOWERS
												</div>
												<div class="rjs-description">
													      240
												</div>
											</div>
											<div class="rj-papers">
												<div class="rjs-title">
													PAPERS
												</div>
												<div class="rjs-description">
													     2,072
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</li>
					

					

					
				
			</ul>
			
		</div>
	

<script>
$(document).ready(function(){
	if(navigator.appName == "Netscape" && navigator.appVersion.indexOf('Edge') > -1){
		$('.related-journals-tooltip').css('top','32px');
	}
	if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1){
		$('.related-journals-tooltip').css('right','5px');
	}
});
</script>
					</div>

					<div class="row">
						
						





	











	
	

	
	

	
	

	
	

	
	

	
	

	
	

	
	























	
		<div class="box-container box-recommended-papers">
			<h2 class="section-title">Recommended Papers</h2>
			<ul class="list-recommended-papers">
				
				
					<li>
						
						

						
						
						<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2350964&rec=1&srcabs=2381263&alg=1&pos=1" target="_blank">The MOOC Phenomenon: Who Takes Massive Open Online Courses and Why?</a></p>
						
							<p>By
								
								
									
									<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2152284" target="_blank" title="View other papers by this author">Gayle Christensen</a>, 
									
								
									
									<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2152288" target="_blank" title="View other papers by this author">Andrew Steinmetz</a>, ...
									
								
							</p>
						

						
						
						
					</li>
				
					<li>
						
						

						
						
						<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1968579&rec=1&srcabs=2381263&alg=1&pos=2" target="_blank">A Brief Introduction to the Basics of Game Theory</a></p>
						
							<p>By
								
								
									
									<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=161894" target="_blank" title="View other papers by this author">Matthew O. Jackson</a>
									
								
							</p>
						

						
						
						
					</li>
				
					<li>
						
						

						
						
						<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2586847&rec=1&srcabs=2381263&alg=1&pos=3" target="_blank">HarvardX and MITx: Two Years of Open Online Courses Fall 2012-Summer 2014</a></p>
						
							<p>By
								
								
									
									<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186806" target="_blank" title="View other papers by this author">Andrew Ho</a>, 
									
								
									
									<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186749" target="_blank" title="View other papers by this author">Isaac Chuang</a>, ...
									
								
							</p>
						

						
						
						
					</li>
				
				<div class="more">
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1926431&rec=1&srcabs=2381263&alg=1&pos=4" target="_blank">Six Provocations for Big Data</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1210838" target="_blank" title="View other papers by this author"><!>danah <!>boyd</a>
										 and 
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1713766" target="_blank" title="View other papers by this author">Kate Crawford</a>
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2117396&rec=1&srcabs=2381263&alg=1&pos=5" target="_blank">Why Do Good People Sometimes Do Bad Things?: 52 Reflections on Ethics at Work</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=346994" target="_blank" title="View other papers by this author">Muel Kaptein</a>
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2414478&rec=1&srcabs=2381263&alg=1&pos=6" target="_blank">Making Experience Count: The Role of Reflection in Individual Learning</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=988582" target="_blank" title="View other papers by this author">Giada Di Stefano</a>, 
										
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=366941" target="_blank" title="View other papers by this author">Francesca Gino</a>, ...
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=998565&rec=1&srcabs=2381263&alg=1&pos=7" target="_blank">'I've Got Nothing to Hide' and Other Misunderstandings of Privacy</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=249137" target="_blank" title="View other papers by this author">Daniel J. Solove</a>
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2382246&rec=1&srcabs=2381263&alg=1&pos=8" target="_blank">Heroesx: The Ancient Greek Hero: Spring 2013 Course Report</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1852476" target="_blank" title="View other papers by this author">Justin Reich</a>, 
										
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186792" target="_blank" title="View other papers by this author">Jeff Emanuel</a>, ...
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=274973&rec=1&srcabs=2381263&alg=1&pos=9" target="_blank">Company Valuation Methods</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=12696" target="_blank" title="View other papers by this author">Pablo Fernandez</a>
										
									
								</p>
							

							
							
						</li>
					
						<li>
							
							

							
							
							<p><a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2382248&rec=1&srcabs=2381263&alg=1&pos=10" target="_blank">ER22x: JusticeX - Spring 2013 Course Report</a></p>
							
								<p>By
									
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=1852476" target="_blank" title="View other papers by this author">Justin Reich</a>, 
										
									
										
										<a href="https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=2186766" target="_blank" title="View other papers by this author">Sergiy Nesterko</a>, ...
										
									
								</p>
							

							
							
						</li>
					
				</div>
			</ul>
			
				<a href="#" onclick="" class="view-more" aria-label="view-more" role="button"> <i class="icon icon-gizmo-navigate-right" aria-hidden="true"></i></a>
			
		</div>
	


	<script language="javascript">
		var times = 0; //  track the number of times the MORE link has been clicked (to avoid fraud)

		// Track Recommendations appearances
		function trackAppearances ()	{
			times++; // to avoid fraud - we only track these the first time the additional recommendations are shown
			var ab_id_source = '2381263';
			var list_of_ab_id_target = '1926431,2117396,2414478,998565,2382246,274973,2382248,';
			var initial_limit = '3';
			var algorithm = '1';
			var fraud = '0';

			if (times == 1) {
				$.ajax({
					url: 'TrackRecommendationsAppearances.cfm?ab_id_source=' + ab_id_source + '&list_of_ab_id_target=' + list_of_ab_id_target + '&initial_limit=' + initial_limit + '&algorithm=' + algorithm + '&fraud=' + fraud,
					cache: false,
					success: function(data) {
					}
				});
			}
		}
	</script>

					</div>
				
			</div>

			<div class="feedback-tab-container">
				<div class="feedback-tab" role="button" tabindex="0">
					<span>Feedback</span>
					<i class="icon icon-gizmo-comment" aria-hidden="true"></i>
				</div>
			</div>
			

<div id="feedbackModule" class="modal-wrapper">
	<div class="modal-custom feedback">
		<i class="icon-gizmo-delete modal-close" aria-label="Close modal" title="Close modal" role="button" tabindex="0"></i>
		<div class="feedback-title">Feedback to SSRN</div>
		<form name="formSuggestions" role="suggestions">
			<div class="feedback-description">
				<label for="txtFeedback">
					<span class="feedback-label">Feedback</span>
					<span class="feedback-required">&nbsp;(required)</span>
				</label>
				<textarea id="txtFeedback" name="txtFeedback" maxlength="1000" placeholder="(1,000 Characters Max)" required></textarea>
			</div>
			<div class="feedback-email">
				<label for="txtEmail">
					<span class="feedback-label">Email</span>
					<span class="feedback-required">&nbsp;(required)</span>
				</label>
				<input type="email" id="txtEmail" name="txtEmail" value="" required>
			</div>
			<button class="btn-orange btn-add-to-cart feedback-submit">
				Submit
				<i class="icon-gizmo-navigate-right" aria-hidden="true"></i>
			</button>
		</form>
		<div class="modal-divider"></div>
		<div class="feedback-information">If you need immediate assistance, call 877-SSRNHelp (877 777 6435) in the United States, or +1 585 442 8170 outside of the United States, 8:30AM to 6:00PM U.S. Eastern, Monday - Friday.</div>
	</div>
</div>

<script language="javascript" type="text/javascript">
	
		var strServer = "papers.ssrn.com";
		var strSugPageName = "/sol3/papers.cfm";
		var strIP = "177.193.67.38";
		var strFullUrl = "papers%2Essrn%2Ecom%2Fsol3%2Fpapers%2Ecfm%3Fabstract%5Fid%3D2381263";
		var sEmail = "";
	
</script>


		</div>
	</div>

	
	

	




	
	





  
  

	
	
		
	


	
	
		
			
			
		
	
		
	
		
			
				
			
			
		
	
		
	
		
	
		
			
				
			
			
		
	
		
			
				
			
			
		
	
		
	
		
	
		
			
				
			
			
		
	
		
			
				
			
			
		
	
		
	
		
			
				
			
			
		
	
		
	


	
	
	






	
	
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">



	<!-- includes piwik Trakcer -->
	


	 


<!-- Piwik -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://piwik.ssrn.com/" : "http://piwik.ssrn.com/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 7);





	piwikTracker.setCustomVariable(1, "User", "Unknown","visit");
	piwikTracker.trackPageView();
	piwikTracker.enableLinkTracking();

} catch( err ) {}
</script><noscript><p><img src="https://piwik.ssrn.com/piwik.php?idsite=7" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->

	<!--Includesss footer -->










<!--FOOTER-->

<nav class="footer-integration footer-redesigned ">
	<div class="container">
		<div class="row">
			
				<div class="footer-col">
					<a href="https://hq.ssrn.com/submissions/CreateNewAbstract.cfm" class="btn-blue-outline-third submit-paper-btn">
						Submit a Paper
						<i class="icon icon-gizmo-navigate-right" aria-hidden="true"></i>
					</a>
					<a class="section-508-link" href="https://www.ssrn.com/en/index.cfm/section-508/">Section 508 Text Only Pages</a>
				</div>
			
			<div class="footer-col">
				<h4 data-toggle="collapse">SSRN Quick Links <i class="icon-gizmo-navigate-down" aria-hidden="true"></i></h4>
				<ul class="footer-links collapsable">
					<li><a href="https://ssrnsolutions.com/" target="_blank">SSRN Solutions</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/rps/">Research Paper Series</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/conferences/">Conference Papers</a></li>
					<li><a href="https://papers.ssrn.com/sol3/DisplayPipPublishers.cfm">Partners in Publishing</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/Announcements-Jobs/">Jobs &amp; Announcements</a></li>
					<li><a target="_blank" href="https://communications.elsevier.com/webApp/els_doubleOptInWA?do=0&srv=els_SSRN&sid=153&uif=0&uvis=3">Newsletter Sign Up</a></li>
				</ul>
			</div>
			<div class="footer-col">
				<h4 data-toggle="collapse">SSRN Rankings <i class="icon-gizmo-navigate-down" aria-hidden="true"></i></h4>
				<ul class="footer-links collapsable">
					<li><a href="https://hq.ssrn.com/rankings/Ranking_display.cfm?TRN_gID=10">Top Papers</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/top-authors/">Top Authors</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/top-organizations/">Top Organizations</a></li>
				</ul>
			</div>
			<div class="footer-col">
				<h4 data-toggle="collapse">About SSRN <i class="icon-gizmo-navigate-down" aria-hidden="true"></i></h4>
				<ul class="footer-links collapsable">
					<li><a href="https://www.ssrn.com/en/index.cfm/ssrns-objectives/">SSRN Objectives</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/network-directors/">Network Directors</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/presidents-letter/">Presidential Letter</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/recent-announcements/">Announcements</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/contactus/">Contact us</a></li>
					<li><a href="https://www.ssrn.com/en/index.cfm/ssrn-faq/">FAQs</a></li>
				</ul>
			</div>
			
		</div>
		<ul class="footer-social-links">
			<li><a target="_blank" href="https://www.facebook.com/SSRNcommunity/" aria-label="Facebook" role="link"><i class="icon icon-social-facebook" aria-hidden="true"></i></a></li>
			<li><a target="_blank" href="https://www.linkedin.com/company/493409?trk=tyah&trkInfo=clickedVertical%3Acompany%2CentityType%3AentityHistoryName%2CclickedEntityId%3Acompany_493409%2Cidx%3A0" aria-label="Linkedin" role="link"><i class="icon icon-social-linkedin" aria-hidden="true"></i></a></li>
			<li><a target="_blank" href="https://twitter.com/SSRN" aria-label="Twitter" role="link"><i class="icon icon-social-twitter" aria-hidden="true"></i></a></li>
			<li style="display:none;"><a target="_blank" href="javascript:void(0);" role="button"><i class="icon icon-social-googleplus" aria-hidden="true"></i></a></li>
		</ul>
		<div class="footer-elsevier">
			<div class="footer-left">
				<a class="logo-elsevier" target="_blank" href="https://www.elsevier.com/"></a>
			</div>
			<div class="footer-left">
				<div class="footer-links">
					<a href="https://www.ssrn.com/en/index.cfm/dmca-notice-policy/">Copyright</a>
					<a href="https://www.ssrn.com/en/index.cfm/terms-of-use/">Terms and Conditions</a>
					<a href="https://www.elsevier.com/legal/privacy-policy" target="_blank">Privacy Policy</a>
				</div>
				<div class="footer-text">
					<p>We use cookies to help provide and enhance our service and tailor content.<br/>By continuing, you agree to the use of cookies. To learn more, visit <a href="https://www.ssrn.com/en/index.cfm/ssrn-faq/#cookies">our Cookies page</a>.
					<span class="icon-gizmo-lightning alwaysshowme">
						<span class="tooltip top" role="tooltip">
							<span class="tooltip-arrow"></span>
							<span class="tooltip-inner">This page was processed by aws-apollo4 in <span id="serverTime">  0.328</span> seconds <span id="loadingtime"></span></span>
						</span>
					</span>
					</p>
				</div>
			</div>
			<div class="footer-right">
				<a class="logo-relx" target="_blank" href="http://www.relx.com/"></a>
			</div>
		</div>
	</div>
</nav>
<!--END FOOTER-->




	


	





	<a href="https://papers.ssrn.com/sol3/updateInformationLog.cfm?process=true"><img src="header/pixel.gif" border="0" alt=" " width="1" height="1"></a>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js?v=297"></script>
	<script src="https://static.ssrn.com/cfincludes/generic-toastr/generic-toastr.js?v=297"></script>
	<script src="https://static.ssrn.com/cfincludes/copy2clipboard/copy2clipboard.js?v=297"></script>
	<script src="https://static.ssrn.com/cfincludes/feedback-module/feedback-module.js?v=297"></script>
	<script src="https://papers.ssrn.com/sol3/Scripts/versions-groups.js?v=297"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js?v=297" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="Scripts/papers.js?v=297" type="text/javascript"></script>
	<script type="text/javascript" src="//d39af2mgp1pqhg.cloudfront.net/widget-popup.js?v=297"></script>
</body>










	




	

</html>
