<?php
include ("dbconnection.php");
$con=dbconnection();

if(isset($_POST["id"]))
{
    $id=$_POST["id"];
}
else return;
$query="DELETE FROM  `productos` WHERE id_producto='$id'";

$exe=mysqli_query($con,$query);
$arr=[];
if($exe)
{
    $arr["success"]="true";
}
{
    $arr["success"]="false";
}
print(json_encode($arr));
?>