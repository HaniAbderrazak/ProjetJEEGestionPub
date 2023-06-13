<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

   
    <title>Dore jQuery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="font/iconsmind-s/css/iconsminds.css" />
    <link rel="stylesheet" href="font/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" href="css/vendor/perfect-scrollbar.css" />
    <link rel="stylesheet" href="css/vendor/baguetteBox.min.css" />
    <link rel="stylesheet" href="css/vendor/component-custom-switch.min.css" />
    <link rel="stylesheet" href="css/main.css" />
</head>
<body id="app-container" class="menu-default show-spinner vertical boxed">
    <nav class="navbar fixed-top">
        <div class="d-flex align-items-center navbar-left">
            <a href="#" class="menu-button d-none d-md-block">
                <svg class="main" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 9 17">
                    <rect x="0.48" y="0.5" width="7" height="1" />
                    <rect x="0.48" y="7.5" width="7" height="1" />
                    <rect x="0.48" y="15.5" width="7" height="1" />
                </svg>
                <svg class="sub" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 17">
                    <rect x="1.56" y="0.5" width="16" height="1" />
                    <rect x="1.56" y="7.5" width="16" height="1" />
                    <rect x="1.56" y="15.5" width="16" height="1" />
                </svg>
            </a>

            <a href="#" class="menu-button-mobile d-xs-block d-sm-block d-md-none">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26 17">
                    <rect x="0.5" y="0.5" width="25" height="1" />
                    <rect x="0.5" y="7.5" width="25" height="1" />
                    <rect x="0.5" y="15.5" width="25" height="1" />
                </svg>
            </a>

            
        </div>

        <a class="navbar-logo" href="/ChatAppJee/home">
            <span class="logo d-none d-xs-block"></span>
            <span class="logo-mobile d-block d-xs-none"></span>
        </a>

        <div class="navbar-right">
            <div class="header-icons d-inline-block align-middle">
                <div class="d-none d-md-inline-block align-text-bottom mr-3">
                    <div class="custom-switch custom-switch-primary-inverse custom-switch-small pl-1" 
                        data-toggle="tooltip" data-placement="left" title="Dark Mode">
                        <input class="custom-switch-input" id="switchDark" type="checkbox" checked>
                        <label class="custom-switch-btn" for="switchDark"></label>
                    </div>
                </div>

                

             

                

            </div>

            <div class="user d-inline-block">
                <button class="btn btn-empty p-0" type="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <span class="name">${user.userName}</span>
                   	 <c:if test="${user.imgUser == null}">
                    <span>
                        <img alt="Profile Picture" src="img/profile-pic-l.jpg" />
                    </span>
                    </c:if>
                     <c:if test="${user.imgUser !=null}">
                    <span>
                        <img alt="Profile Picture" src="${user.imgUser}" />
                    </span>
                    </c:if>
                </button>

                <div class="dropdown-menu dropdown-menu-right mt-3">
                    <a class="dropdown-item" href="/ChatAppJee/ModifUser">Account</a>
                    <a class="dropdown-item" href="/ChatAppJee/Profile">Profile</a>
                    <a class="dropdown-item" href="/ChatAppJee/logout">Sign out</a>
                </div>
            </div>
        </div>
    </nav>
    
<main>
<div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <div class="separator mb-5"></div>
                </div>
            </div>
 <div class="row">
                <div class="col-12 col-md-12 col-xl-10 col-left">
                    <div class="card mb-4">
                        <div class="lightbox">
                            <a href="img/detail-5.jpg">
                                <img alt="detail" src="${pub.image}"
                                    class="responsive border-0 card-img-top mb-3" />
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="mb-5">
                                <h3 class="card-title"> ${pub.titre} </h3>
                                <h6 class="card-title"> ${pub.date}</h6>
                                <h6 class="card-title"> ${auteur.userName}</h6>
                                <p>
                                    ${pub.description}
                                </p>
                                <c:if test="${pub.user.id == user.id}">
                               
                                 <div class="text-zero top-right-button-container">
                    		<a href="/ChatAppJee/ModifierPublication?id=${pub.id}">
                    				   <button type="button" class="btn btn-outline-danger top-right-button mb-1">Modifier</button>
                    		</a>
                    		<a href="/ChatAppJee/SupprimerPublication?id=${pub.id}" onclick="return confirmDelete();">
                           			 <button type="button" class="btn btn-outline-danger top-right-button mb-1" >Delete</button>
                   			</a>
                   			</div>
                                </c:if>
                            </div>
                            
                            </div>

                        </div>
                        
                       
                    </div>
                </div>

               
            
            
</main>
	<script>
		function confirmDelete() {
	  		return confirm("Are you sure you want to delete this item?");
			}
		
	</script>
</body>
    <script src="js/vendor/jquery-3.3.1.min.js"></script>
    <script src="js/vendor/bootstrap.bundle.min.js"></script>
    <script src="js/vendor/perfect-scrollbar.min.js"></script>
    <script src="js/vendor/bootstrap-datepicker.js"></script>
    <script src="js/vendor/baguetteBox.min.js"></script>
    <script src="js/vendor/jquery.barrating.min.js"></script>
    <script src="js/dore.script.js"></script>
    <script src="js/scripts.js"></script>
</html>