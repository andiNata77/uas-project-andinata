<?php
$conn = mysqli_connect("localhost", "root", "", "sisfo");
$query = mysqli_query($conn, "SELECT * FROM tb_dosen");
$data = mysqli_fetch_all($query, MYSQLI_ASSOC);

echo json_encode($data);

?>
