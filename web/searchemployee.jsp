<%@page import="com.exavalu.entities.Role"%>
<%@page import="com.exavalu.entities.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.exavalu.entities.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
           
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Search Employee</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="mt-2 mx-auto">
                <form action="SearchEmployee" method="post" class="d-flex justify-content-center align-items-center gap-4">
                    <table>
                        <tr class="d-flex gap-2">
                            <td>
                                <div class="form-outline">
                                    <input type="search" id="form1" class="form-control"  name="FirstName" placeholder="First Name" />
                                   
                                </div>
                            </td>
                            <td>
                                <div class="form-outline">
                                    <input type="search" id="form2" class="form-control" name="LastName" placeholder="Last Name"/>
                                   
                                </div>
                            </td>
                            <td>
                                <div class="form-outline">

                                    <select name="Gender" class="form-control">
                                        <option value="">select the gender</option>
                                        <option value="male">male</option>
                                        <option value="female">female</option>

                                    </select>
                                   
                                </div>
                            </td>
                            <td>
                                <div class="form-outline">
                                    <!--                                    <input type="search" id="form4" class="form-control" name="Department" />-->
                               
                                <select name="Department" class="form-select" id="departmentId">
                                    <option value="">Select a Department</option>

                                    <c:forEach items="${DeptList}" var="dept">
                                    <option value="${dept.getDepartmentName()}"> ${dept.getDepartmentName()}  </option>
                                    </c:forEach>
                                    
                                </select>
                                
                            </div>
                        </td>
                        <td>
                            <div class="form-outline">
                                
                               
                                <select name="Role" class="form-select" id="roleId">
                                    <option value="">Select a Role</option>
                                  
                                    <c:forEach items="${RoleList}" var="role">
                                    <option value="${role.getRoleName()}"> ${role.getRoleName()} </option>
                                    </c:forEach>
                                </select>
                                
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary align-self-baseline">
                    Search
                </button>
            </form>
        </div>
        

        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">
                            Employee Id
                        </th>
                        <th scope="col">
                            First Name
                        </th>
                        <th scope="col">
                            Last Name
                        </th>
                        <th scope="col">
                            Address
                        </th>
                        <th scope="col">
                            Phone
                        </th>
                        <th scope="col">
                            Gender
                        </th>
                        <th scope="col">
                            Age
                        </th>
                        <th scope="col">
                            Department
                        </th>
                        <th scope="col">
                            Role
                        </th>
                        <th scope="col">
                            Basic Salary
                        </th>
                        <th scope="col">
                            Car Allowance
                        </th>
                        <th scope="col">
                            Action
                        </th>

                    </tr>
                </thead>
                
                <c:forEach items="${EmpList}" var="emp">
                    <tr>
                        <td>
                            ${emp.getEmployeeId()}
                        </td>
                        <td>
                            ${emp.getFirstName()}
                        </td>
                        <td>
                            ${emp.getLastName()}
                        </td>
                        <td>
                            ${emp.getAddress()}
                        </td>
                        <td>
                            ${emp.getPhone()}
                        </td>
                        <td>
                            ${emp.getGender()}
                        </td>
                        <td>
                            ${emp.getAge()}
                        </td>
                        <td>
                            ${emp.getDepartmentName()}
                        </td>
                        <td>
                            ${emp.getRoleName()}
                        </td>
                        <td>
                            ${emp.getBasicSalary()}
                        </td>
                        <td>
                            ${emp.getCarAllaowance()}
                        </td>
                        <td> 

                            <a href=EditEmployee?employeeId=${emp.getEmployeeId()}>
                                Edit
                            </a>

                        </td>
                    </tr>
                </c:forEach>

                

            </table>
        </div>
    </body>
</html>
