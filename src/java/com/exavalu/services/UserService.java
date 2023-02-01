/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.empweb.utils.JDBCConnectionManager;
import com.exavalu.entities.Employee;
import com.exavalu.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Avijit
 */
public class UserService {

    public static boolean doLogin(String emailAddress, String password) {

        boolean result = false;

        Connection con = JDBCConnectionManager.getMySQLConnection();

        String sql = "Select * from users where emailAddress=? and password=?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                result = true;
            }

            con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;

    }

    public static boolean signUp(User user) {

        boolean result = false;

        Connection con = JDBCConnectionManager.getMySQLConnection();

        String sql = "INSERT INTO users (emailAddress,password,firstName,lastName,status) "
                + "VALUES (?,?,?,?,?)";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmailAddress());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setInt(5, 1);

            int rows = preparedStatement.executeUpdate();

            if (rows == 1) {
                result = true;
            }

            con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;

    }

    public static User getUser(String emailAddress) {
        User user = new User();
        Connection con = JDBCConnectionManager.getMySQLConnection();
        try {

            String sql = "Select * from users where emailAddress=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                con.close();
            }

        } catch (SQLException ex) {

        }

        return user;
    }

    public static ArrayList SearchEmployee(String FirstName, String LastName, String Gender, String Department, String Role) throws SQLException {
        ArrayList empList = new ArrayList<>();

        Connection con = JDBCConnectionManager.getMySQLConnection();
        String sql = "select * from employees e, department d, roles r where e.departmentId=d.departmentId and e.roleId=r.rolesId\n"
                + " having firstName like ?\n"
                + " and lastName like ? \n"
                + " and gender like ? \n"
                + " and departmentName like ? \n"
                + " and rolesName like ?";

        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setString(1, FirstName + "%");
        preparedStatement.setString(2, LastName + "%");
        preparedStatement.setString(3, Gender + "%");
        preparedStatement.setString(4, Department + "%");
        preparedStatement.setString(5, Role + "%");
        System.out.println("Prepared statement = " + preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {

            Employee employee = new Employee();
            employee.setEmployeeId(rs.getString("employeeId"));

            employee.setFirstName(rs.getString("firstName"));
            employee.setLastName(rs.getString("lastName"));
            employee.setAddress(rs.getString("address"));
            employee.setPhone(rs.getString("phone"));
            employee.setGender(rs.getString("gender"));
            employee.setAge(rs.getString("age"));
            employee.setDepartmentName(rs.getString("departmentName"));
            employee.setRoleName(rs.getString("RolesName"));
            employee.setBasicSalary(rs.getString("basicSalary"));
            employee.setCarAllaowance(rs.getString("carAllaowance"));

            empList.add(employee);
        }
//            Iterator itr=empList.iterator();
//            while(itr.hasNext()){
//                Employee e=(Employee)itr.next();
//                System.out.println(e);
//            }

        return empList;
    }

    public static int AddEmployee(String firstName, String lastName, String address, String age, String phone, String gender, String departmentName, String roleName, String basicSalary, String carAllowance) throws SQLException {
        Connection con = JDBCConnectionManager.getMySQLConnection();
        String sql = "INSERT INTO employeedb2.employees(firstName,lastName,phone,address,gender,age,departmentId,roleId,basicSalary,carAllaowance) VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
        int rs = 0;
        System.out.println(rs);
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, age);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, gender);
            preparedStatement.setString(7, departmentName);
            preparedStatement.setString(8, roleName);
            preparedStatement.setString(9, basicSalary);
            preparedStatement.setString(10, carAllowance);
            System.out.println("sql:" + preparedStatement);
            rs = preparedStatement.executeUpdate();
            System.out.println("sql" + preparedStatement);

        } catch (SQLException ex) {

        }
        System.out.println(rs);

        con.close();
        return rs;

    }

}
