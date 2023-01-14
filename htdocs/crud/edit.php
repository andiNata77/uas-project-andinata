<?php
$conn = mysqli_connect("localhost", "root", "", "sisfo");

$id = $_POST["id"];
$nik = $_POST["nik"];
$nama = $_POST["nama"];
$gender = $_POST["gender"];
$status_dosen = $_POST["status_dosen"];
$mata_kuliah = $_POST["mata_kuliah"];
$gambar = $_POST["gambar"];

$data = mysqli_query($conn, "UPDATE  tb_dosen SET nik='$nik',nama='$nama',gender='$gender',status_dosen='$status_dosen',mata_kuliah='$mata_kuliah', gambar='$gambar' WHERE id='$id'");
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
