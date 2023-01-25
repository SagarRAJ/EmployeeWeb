<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.entities.Employee"%>
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
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <main class="form-signin w-100 m-auto">

            <% Employee emp = (Employee) request.getAttribute("Emp");%>

            <form action="SaveEmployee" method="Post">

                <img class="mb-4" src="images/logo.PNG" alt="" width="300" height="100">
                <h1 class="h3 mb-3 fw-normal">Please edit employee data</h1>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput1" placeholder="ID" name="employeeId" value="<%=emp.getEmployeeId()%>" readonly>
                    <label for="floatingInput1">Employee Id</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput2" placeholder="first name" name="firstName" value="<%=emp.getFirstName()%>">
                    <label for="floatingInput2">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput3" placeholder="last name" name="lastName" value="<%=emp.getLastName()%>">
                    <label for="floatingInput3">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput4" placeholder="address" name="address" value="<%=emp.getAddress()%>">
                    <label for="floatingInput4">Address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput5" placeholder="phone" name="phone" value="<%=emp.getPhone()%>">
                    <label for="floatingInput5">Phone</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput6" placeholder="gender" name="gender" value="<%=emp.getGender()%>">
                    <label for="floatingInput6">Gender</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput7" placeholder="age" name="age" value="<%=emp.getAge()%>">
                    <label for="floatingInput7">Age</label>
                </div>
                <div class="form-floating">
                    <%ArrayList deptList = (ArrayList) request.getAttribute("DeptList");
                        Iterator itr = deptList.iterator();%>
                    <select name="departmentId" class="form-select" id="departmentId">
                        <option value="0" disabled>Select a Department</option>
                        <%
                            while (itr.hasNext()) {
                                Department dept = (Department) itr.next();
                        %>
                        <option<%=(emp.getDepartmentName().equals(dept.getDepartmentName()))? "selected" : ""%> value="<%=dept.getDepartmentId()%>"> <%=dept.getDepartmentName()%>  </option>
                        <% } %>
                    </select>
                </div>

                <div class="form-floating">
                    <%ArrayList roleList = (ArrayList) request.getAttribute("RoleList");
                        itr = roleList.iterator();%>
                    <select name="roleId" class="form-select" id="roleId">
                        <option value="0" disabled>Select a Role</option>
                        <%
                            while (itr.hasNext()) {
                                Role role = (Role) itr.next();
                        %>
                        <option <%=(emp.getRoleName().equals(role.getRoleName()))? "selected" : ""%> value="<%=role.getRoleId()%>"> <%=role.getRoleName()%>  </option>
                        <% }%>
                    </select>
                </div>







                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput8" placeholder="basicSalary" name="basicSalary" value="<%=emp.getBasicSalary()%>">
                    <label for="floatingInput8">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput9" placeholder="carAllaowance" name="carAllaowance" value="<%=emp.getCarAllaowance()%>">
                    <label for="floatingInput9">Car Allowance</label>
                </div>


                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button>

            </form>
        </main>
    </body>
</html>
