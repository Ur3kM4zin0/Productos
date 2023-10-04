<?php
include("dbconnection.php");
$con=dbconnection();

if(isset($_POST["id_producto"]))
{
    $id_producto=$_POST["id_producto"];
}
else return;
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
$query="UPDATE `productos` SET `id_imagen`='$id_imagen',`nombre`='$nombre',`descripcion`='$descripcion',`cantidad`='$cantidad',`precio`='$precio'
WHERE `id_producto`='$id_producto'";

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