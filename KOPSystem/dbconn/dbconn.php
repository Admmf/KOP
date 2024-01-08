<?php
/* php& mysqldb connection file */
$user = "root"; //mysqlusername
$pass = ""; //mysqlpassword
$server = "localhost"; //server name or ipaddress
$dbname= "kopsystem"; //your db name
$dbconn = mysqli_connect($server,$user,$pass,$dbname);

if(!$dbconn) {
    die("Connection Failed:".mysqli_connect_error());
}

?>