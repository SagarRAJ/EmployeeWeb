/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.empweb.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Avijit
 */
public class PropertyFileReader {

	// I will read values defined in a property file.
	// Property file - this is just a text file that will have all parameters
	// defined for connecting
	// to DB.
	public static PropertyFileReader propertyFileReader = null;

	// in this class we will have static methods to get the connection params

	public String getPropertyValue(String param) {

		String value = null;

		// input = getClass().getResourceAsStream("settings.properties"); // Property
		// file path in classpath

		try {

			String path = PropertyFileReader.class.getClassLoader().getResource("settings.properties").getPath();
			
			System.out.println("File Path: "+path);

			BufferedReader input = new BufferedReader(new FileReader(path));

			Properties prop = new Properties(); 
                        

			prop.load(input); // this will parse the file and will create a hashmap in memory 

			value = prop.getProperty(param); // this will use the param as a key and will the the corresponding value

		} catch (IOException e) {
			
			e.printStackTrace();
		}

		return value;
	}

	private PropertyFileReader() {
		// Private constructor
	}

	public static PropertyFileReader getInstance() {
		if (propertyFileReader == null) {
			propertyFileReader = new PropertyFileReader();
		}
		return propertyFileReader;
	}

	public static void main (String args[])
	{
		PropertyFileReader util = PropertyFileReader.getInstance();
		String user = util.getPropertyValue("user");
		System.out.println("Got user = "+user);
	}

}
