<?php
function dbconnection()
{
    $con=mysqli_connect("localhost","root","","dbventas");
    return $con;
}
?>