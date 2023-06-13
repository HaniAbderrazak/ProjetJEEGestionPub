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

            <div class="search" data-search-path="Pages.Search.html?q=">
                <input placeholder="Search...">
                <span class="search-icon">
                    <i class="simple-icon-magnifier"></i>
                </span>
            </div>

            
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
                    <span>
                        <img alt="Profile Picture" src="img/profile-pic-l.jpg" />
                    </span>
                </button>

                <div class="dropdown-menu dropdown-menu-right mt-3">
                    <a class="dropdown-item" href="#">Account</a>
                    <a class="dropdown-item" href="#">Features</a>
                    <a class="dropdown-item" href="#">History</a>
                    <a class="dropdown-item" href="#">Support</a>
                    <a class="dropdown-item" href="/ChatAppJee/logout">Sign out</a>
                </div>
            </div>
        </div>
    </nav>
    
<main>
<div class="container-fluid">
          
 <div class="row">
                <div class="col-12 col-md-12 col-xl-10 col-left">
                 <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="mb-4">Add Publication</h3>

                            <form action="addPublication" method="post"   enctype="multipart/form-data">
                               
                                <div class="form-group">
                                    <label for="inputAddress">title</label>
                                    <input type="text" name="title" class="form-control" id="inputAddress"
                                        placeholder="title">
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress2">description</label>
                                    <input type="text" name="desc" class="form-control" id="inputAddress2"
                                        placeholder="">
                                </div>
                                
                                 <div class="form-group ">
                                        <label for="inputState">Categorie</label>
                                        <select  name="idCat" class="form-control">
                                        
                                            <c:forEach var="c" items="${cat}" > 
                                            <option value="${c.id}"> ${c.nom}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                   
                                    
                                     <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01" name="photo" id="photo">
                                    <label class="custom-file-label"  for="inputGroupFile01">Choose image</label>
                                </div>

                                

                                <button  type="submit" class="btn btn-primary btn-block mb-1">Publier</button>
                            </form>
                        </div>
                    </div>
                        
                       
                    </div>
                </div>

                
            
            
</main>
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