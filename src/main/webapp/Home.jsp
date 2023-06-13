<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dore jQuery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="font/iconsmind-s/css/iconsminds.css" />
    <link rel="stylesheet" href="font/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" href="css/vendor/perfect-scrollbar.css" />
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

			<form method="post" action="rechercherPublication" id="form1">
            <div class="search" >
                <input placeholder="name Publication" name="NomPublication" id="NomPublication" onkeyup="document.getElementById('form1').submit()" value="${mot}"/>
                <span class="search-icon">
                    <i class="simple-icon-magnifier"></i>
                </span>
            </div>
			</form>
            
        </div>

        <a class="navbar-logo" href="Dashboard.Default.html">
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
                    <div class="mb-2">
                        <h1>Acceuil</h1>
                    <div class="text-zero top-right-button-container">
                    <a href="/ChatAppJee/addPublication">
                            <button type="button" class="btn btn-primary btn-lg top-right-button mr-1">ADD NEW</button>
                   </a>
                    </div>  
                    </div>
                    
                    <div class="separator mb-5"></div>
                </div>
            </div>

            <div class="row">
             <c:forEach var="p" items="${listep}">
                <div class="col-12 col-lg-6 mb-5">
                    <div class="card flex-row listing-card-container">
                        <div class="w-40 position-relative">
                            <a href="/ChatAppJee/pubDetails?id=${p.id}">
                                <img class="card-img-left" src="${p.image}" alt="Card image cap">
                                <!--<span class="badge badge-pill badge-theme-1 position-absolute badge-top-left">NEW</span>-->
                            </a>
                        </div>
                        <div class="w-60 d-flex align-items-center">
                            <div class="card-body">
                                <a href="/ChatAppJee/pubDetails?id=${p.id}">
                                    <h5 class="mb-3 listing-heading ellipsis">title : ${p.titre}</h5>
                                </a>
                               
                                <p class="listing-desc text-muted ellipsis"> 
                                 description : 
                                   ${p.description}
                                   <br> 
                                   categorie : 
                                   ${p.categorie.nom}
                                   <br>
                                    ${p.date} by ${p.user.userName}
                                </p>
                                
                               
                                  
                                
                            </div>
                        </div>
                    </div>
                   
                </div>
				 </c:forEach>
              </div>
           </div>

         


            <div class="row">
                <div class="col-12">
                    <nav class="mt-4 mb-3">
                        <ul class="pagination justify-content-center mb-0">
                        
                            <li class="page-item active">
                                <a class="page-link" href="/ChatAppJee/home?page=1">1</a>
                            </li>
                            <li class="page-item ">
                                <a class="page-link" href="/ChatAppJee/home?page=2">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="/ChatAppJee/home?page=3">3</a>
                            </li>
                          

                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </main>

    <footer class="page-footer">
        <div class="footer-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <p class="mb-0 text-muted">ColoredStrategies 2019</p>
                    </div>
                    <div class="col-sm-6 d-none d-sm-block">
                        <ul class="breadcrumb pt-0 pr-0 float-right">
                            <li class="breadcrumb-item mb-0">
                                <a href="#" class="btn-link">Review</a>
                            </li>
                            <li class="breadcrumb-item mb-0">
                                <a href="#" class="btn-link">Purchase</a>
                            </li>
                            <li class="breadcrumb-item mb-0">
                                <a href="#" class="btn-link">Docs</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <script src="js/vendor/jquery-3.3.1.min.js"></script>
    <script src="js/vendor/bootstrap.bundle.min.js"></script>
    <script src="js/vendor/perfect-scrollbar.min.js"></script>
    <script src="js/vendor/jquery.autoellipsis.js"></script>
    <script src="js/dore.script.js"></script>
    <script src="js/scripts.js"></script>
</body>

</html>