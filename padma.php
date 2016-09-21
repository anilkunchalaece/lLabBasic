<?php
echo "Hello Anil";

echo 'moisture Value';
$mois =  $_POST['mois'];

echo 'temp Value';
$temp = $_POST['temp'];

echo 'humidity';
$humi =  $_POST['humi'];

echo 'ldr Value';
$ldr = $_POST['ldr'];

echo $mois;
echo $temp;
echo $humi;
echo $ldr;


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

$sql = "INSERT INTO sensorData(time, ldr, humi,temp,mois)
VALUES ( date('Y/m/d H:i:s'),$ldr,$humi,$temp,$mois)";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>
