
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <title>Employee Management</title>      
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <link href="css/signin.css" rel="stylesheet">  
        <!-- Custom styles for this template -->
    </head>
    <body class="text-center">

        <main class="form-signin w-100 m-auto">
            <form action="Login" method="Post">
                <img class="mb-4" src="images/logo.PNG" alt="" width="300" height="100">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <c:if test="${ErrorMsg!=null}">
                     <div class="alert alert-danger" role="alert">
                         ${ErrorMsg}
                   
                </div>
                </c:if>
                
                <c:if test="${SuccessMsg!=null}">
                    <div class="alert alert-success" role="alert">
                    ${SuccessMsg}
                </div>
                </c:if>
                    
                
               



                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <a href="signup.jsp">New User? Sign Up Here</a>
                <p class="mt-5 mb-3 text-muted">&copy; 2017???2022</p>
            </form>
        </main>
    </body>
</html>
