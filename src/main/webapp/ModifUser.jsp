<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <title>Dore jQuery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="font/iconsmind-s/css/iconsminds.css" />
    <link rel="stylesheet" href="font/simple-line-icons/css/simple-line-icons.css" />

    <link rel="stylesheet" href="css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" href="css/vendor/component-custom-switch.min.css" />
    <link rel="stylesheet" href="css/vendor/perfect-scrollbar.css" />
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

                    <div class="mb-2">
                        <h1>${user.userName}</h1>
                        
                        
                    </div>


                    <ul class="nav nav-tabs separator-tabs ml-0 mb-5" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="first-tab" data-toggle="tab" href="#first" role="tab"
                                aria-controls="first" aria-selected="true">Account</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                    <form method="post" action="ModifUser"  enctype="multipart/form-data">
                        <div class="tab-pane show active" id="first" role="tabpanel" aria-labelledby="first-tab">
                            <div class="row">
                                <div class="col-12 col-lg-10 col-xl-6 mx-auto">
                                    <div class="card mb-4" >
                                       
                                           
                                        
                                       <input type="file" id="file-input" name="photo" id="photo" style="display: none;" onchange="previewImage(this);">
										<img src="${user.imgUser}" alt="Detail Picture" class="card-img-top"   >
                                         <div class="position-absolute card-top-buttons" >
                                         <span class="btn btn-outline-white icon-button ">
                                                <i  class="simple-icon-pencil" onclick="document.getElementById('file-input').click();" ></i>
                                            </span>
                                            </div>
                                <div class="card-body">
                                   <label class="form-group has-float-label mb-4 col-12">
                                   <span >Name</span>
                                    <input class="form-control " name="username" value="${user.userName}"/>
                                    
                                </label>
                                <br>
                                <label class="form-group has-float-label mb-3 col-12">
                                    <span>E-mail</span>
                                    <input class="form-control lg" name="email" value="${user.email}"/>
                                    
                                </label>
                                <br>
                                <label class="form-group has-float-label mb-4 col-12">
                                     <span>Password</span>
                                     <div class="input-group-append">
                                    <input class="form-control" id="password" type="password" value="${user.password}" name="password" placeholder="" />
                                  
                                   <span class="input-group-text">
    							  <i class="glyph-icon simple-icon-eye" aria-hidden="true"></i>
    							</span>
    							</div>
                                </label>
                        		<input type="hidden" name="id" value="${user.id}"  class="form-control "> 
                                <div class="d-flex justify-content-end align-items-center ">
                                    <button class="btn btn-primary btn-lg btn-shadow mb-4" type="submit">UPDATE</button>
                                </div>
                                
                                 <div class="d-flex justify-content-end align-items-center ">
                                    <a href="SupprimerUser?id=${user.id}" onclick="return confirmDelete();"
                                    class="btn btn-danger btn-lg btn-shadow" >Delete Account</a>
                                </div>
                                                                                          
                                      </div>
                                    </div>
                                    
                                    
                                   
                                </div>
                                 </div>
                           
                          
                       

                       </div>
                       </form>
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
    <script>
function previewImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.querySelector('.card-img-top').src = e.target.result;
      // Send the selected file to the server for processing
      var formData = new FormData();
      formData.append('image', input.files[0]);
      fetch('/upload', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        // Update the user's image URL with the new image URL returned by the server
        document.querySelector('.card-img-top').src = data.imageUrl;
      })
      .catch(error => console.error(error));
    }
    reader.readAsDataURL(input.files[0]); // read the selected file as a data URL
  }
}
document.addEventListener("DOMContentLoaded", function() {
	  var eyeIcon = document.querySelector(".simple-icon-eye");
	  var passwordInput = document.getElementById("password");

	  eyeIcon.addEventListener("click", function() {
	    if (passwordInput.type === "password") {
	      passwordInput.type = "text";
	    } else {
	      passwordInput.type = "password";
	    }
	  });
	});
function confirmDelete() {
		return confirm("Are you sure you want to delete this item?");
	}
</script>

    

    <script src="js/vendor/jquery-3.3.1.min.js"></script>
    <script src="js/vendor/bootstrap.bundle.min.js"></script>
    <script src="js/vendor/perfect-scrollbar.min.js"></script>
    <script src="js/vendor/progressbar.min.js"></script>
    <script src="js/vendor/jquery.autoellipsis.js"></script>
    <script src="js/dore.script.js"></script>
    <script src="js/scripts.js"></script>
</body>

</html>