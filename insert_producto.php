<?php
include ("dbconnection.php");
$con=dbconnection();
if(isset($_POST["id_imagen"]))
{
    $id_imagen=$_POST["id_imagen"];
}
else return;
if(isset($_POST["nombre"]))
{
    $nombre=$_POST["nombre"];
}
else return;
if(isset($_POST["descripcion"]))
{
    $descripcion=$_POST["descripcion"];
}
else return;
if(isset($_POST["cantidad"]))
{
    $cantidad=$_POST["cantidad"];
}
else return;
if(isset($_POST["precio"]))
{
    $precio=$_POST["precio"];
}
else return;

$query="INSERT INTO `productos`(`id_imagen`,`nombre`,`descripcion`,`cantidad`,`precio`)
VALUES ('$id_imagen','$nombre','$descripcion','$cantidad','$precio')";
$exe=mysqli_query($con,$query);

$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else
{
    $arr["success"]="false";
}
print(json_encode($arr));
?>