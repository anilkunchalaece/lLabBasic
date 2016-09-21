<!DOCTYPE html>

<!DOCTYPE html>
<!--
Author : Kunchala Anil,
Email : anilkunchalaece@gmail.com
Date : 21 October 2016

This code receives the Data From MySQl and Displays it as Webpage as a Table
-->

<html>
<head>
<title> Sensor Data </title>
</head>

<body>
<h2> Sensor Data From padma1Ver2</h2>

<?php

$serverName = "mysql.hostinger.in";
$userName = "u576780510_anil";
$password = "123456";
$db = "u576780510_padma";

//Create Connection
$conn = new mysqli($serverName,$userName,$password,$db);
if($conn ->connect_error){
	die("Connection Failed: ".$conn->connect_error);
	}
echo "Connected successfully";
$retval = mysqli_query($conn,"SELECT * FROM sensorData");

if(!$retval){
	die('Could not get Data : '.mysqli_error());
}
echo "<table style='border : 1px solid black'>";

echo "<tr>
	<td style='border : 1px solid black'>Time Stamp</td>
	<td style='border : 1px solid black'>Moisture</td>
	<td style='border : 1px solid black'>Humidity</td>
	<td style='border : 1px solid black'>Temperature</td>
        <td style='border : 1px solid black'>Light Intensity</td>
</tr>";

while($row = mysqli_fetch_assoc($retval)){
 echo "<tr >
	<td style='border : 1px solid black'>{$row['time']}</td>
	<td style='border : 1px solid black'>{$row['mois']}</td>
	<td style='border : 1px solid black'>{$row['humi']}</td>
	<td style='border : 1px solid black'>{$row['temp']}</td>
        <td style='border : 1px solid black'>{$row['ldr']}</td>
	</tr>";
}
echo "</table>";

echo "Fetched Data Sucessfully";
?>

<footer>
  <p>Done by: Kunchala Anil</p>
  <p>Email : anilkunchalaece@gmail.com</p>
</footer>
</body>
</html>	
