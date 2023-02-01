
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
            <form action="SignUp" method="Post">
                <img class="mb-4" src="images/logo.PNG" alt="" width="300" height="100">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="alert alert-danger" role="alert">
                    ${ErrorMsg}
                </div>


                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="emailAddress">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPassword" placeholder="first name" name="firstName">
                    <label for="floatingPassword">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPassword" placeholder="last name" name="lastName">
                    <label for="floatingPassword">Last Name</label>
                </div>

                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>

            </form>
        </main>
    </body>
</html>
