<?php
$conn = mysqli_connect("localhost", "root", "", "sisfo");

$nik = $_POST["nik"];

$data = mysqli_query($conn, "DELETE FROM  tb_dosen WHERE nik='$nik'");
if($data) {
    echo json_encode([
        'pesan' => 'Sukses'
    ]);
} else {
    echo json_encode([
        'pesan' => 'Gagal'
    ]);
}

?>
