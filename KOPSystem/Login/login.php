<?php
session_start();
include('../dbconn/dbconn.php');

//if (isset($_POST['username']) && isset($_POST['password'])) {
  if (isset($_POST['login'])) {  
    /*function validate($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }*/

    $Username = ($_POST['username']);
    $password = ($_POST['password']);
    $sql = "SELECT Admin_Name, Admin_Username, Admin_Password FROM admin WHERE Admin_Username = '$Username' AND Admin_Password = '$password'";
    echo $sql;
    $query = mysqli_query($dbconn, $sql) or die("Error: " . mysqli_error($dbconn));

    if (mysqli_num_rows($query) === 1) {
        $row = mysqli_fetch_assoc($query);
        if ($row['Admin_Username'] === $Username && $row['Admin_Password'] === $password) {

            $_SESSION['username'] = $row['Admin_Username'];
            $_SESSION['password'] = $row['Admin_Username'];
            header('Location: ../Dashboard');
            exit();
        } 
    } else {
        header('Location: ../Login');
        exit();
    }
}
echo "error";

mysqli_close($dbconn);
?>

