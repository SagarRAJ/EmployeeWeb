<%@page import="com.exavalu.entities.Employee"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${User==null}">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>





<!doctype html>
<html lang="en">
    <head>        
        <title>Employee Management Web Application</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="menu.jsp"></jsp:include>


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
