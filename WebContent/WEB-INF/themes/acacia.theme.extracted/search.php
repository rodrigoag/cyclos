<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search results</title>
    <meta charset="utf-8">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">    
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/superfish.js"></script>
        <script type="text/javascript" src="js/jquery.mobilemenu.js"></script>
         
        <script type="text/javascript" src="search/search.js"></script>
        <script type="text/javascript" src="js/jquery.ui.totop.js"></script>
    	<script>
			$(window).load(function(){
			  $().UItoTop({ easingType: 'easeOutQuart' });
			})
		</script>	
  <!--[if lt IE 8]>
      <div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg"border="0"alt=""/></a></div>  
  <![endif]-->
  <!--[if lt IE 9]>
     
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>
<body>
<!--==============================header=================================-->      
    <header>
       <div class="header-block">
         <div class="container">
            <div class="row">
              <div class="span12 clearfix">
                <div class="header-phone">Call Toll-Free: <span>1-800-559-65-80</span></div>
                <div class="header-search clearfix">
                	<ul>
                    	<li><a href="#">Login</a><span>|</span></li>
                        <li><a href="#">Sign up</a></li>
                    </ul>
                	<form id="search-form" action="search.php" method="GET" accept-charset="utf-8" class="navbar-form" >
                        <input type="text" name="s" onBlur="if(this.value=='') this.value=''" onFocus="if(this.value =='' ) this.value=''" value=" "  >
                        <a href="#" onClick="document.getElementById('search-form').submit()" class="btn-small">search</a>
                    </form>
                </div>
              </div>
            </div>
          </div>
       </div>  
       <div class="header-block2"> 
          <div class="container">
            <div class="row">
              <div class="span12 clearfix">
                <h1 class="brand"><a href="index.html"><img src="img/logo.png" alt="callpoint"></a></h1> 
                <div class="navbar navbar_ clearfix">
                  <div class="navbar-inner">                                                 
                    <div class="nav-collapse nav-collapse_ collapse">
                      <ul class="nav sf-menu clearfix">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="index-1.html">About</a></li>
                        <li class="sub-menu"><a href="index-2.html">Services</a>
                        	<ul>
                                <li><a href="#">services list</a></li>
                                <li class="sub-menu"><a href="#">special Services</a>
                                  <ul>
                                    <li><a href="#">monitoring</a></li>
                                    <li><a href="#">Technical Support</a></li>
                                  </ul>  
                                </li>
                                <li><a href="#">new services</a></li>
                                <li><a href="#">integration</a></li>
                          </ul>
                        </li>
                        <li><a href="index-3.html">Blog</a></li>
                        <li><a href="index-4.html">Contacts</a></li>
                      </ul>
                    </div>
                  </div>
                </div> 
             </div> 
          </div>  
         </div>
       </div>    
    </header>
    <!--==============================content=================================-->
    <div id="content">
      <div class="container">
        	<div class="row">
          		<div class="span12">
               		<h3>Search result:</h3>
               		<div id="search-results"></div>
          		</div>
         	</div>      
      </div>
  </div>     
<!--==============================footer=================================-->
  <footer>
      <div class="container">
         <div class="row">
           <div class="span12">
              <div class="clearfix">
                  <ul class="social-icons float2">
                      <li><a href="#"><img src="img/icon-1.png" alt=""></a></li>
                      <li><a href="#"><img src="img/icon-2.png" alt=""></a></li>
                      <li><a href="#"><img src="img/icon-3.png" alt=""></a></li>
                      <li><a href="#"><img src="img/icon-4.png" alt=""></a></li>
                      <li><a href="#"><img src="img/icon-5.png" alt=""></a></li>
                  </ul>
                  <div class="float">
                    <a href="index.html"><img src="img/footer-logo.png" alt=""></a><span><em>&copy; 2013</em> | <a href="index-5.html">privacy Policy</a><br></span>
                  </div>
              </div>
            </div>
         </div>  
      </div>
    </footer>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>