<?php
include ("dbconnection.php");
$con=dbconnection();

$query="SELECT `id_producto`,`id_imagen`,`nombre`,`descripcion`,`cantidad`,`precio` FROM `productos`";
$exe=mysqli_query($con,$query);

$arr=[];
while($row=mysqli_fetch_array($exe))
{
    $arr[]=$row;
}
print(json_encode($arr));
?>
