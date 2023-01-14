<?php
$conn = mysqli_connect("localhost", "root", "", "sisfo");

$nik = $_POST["nik"];
$nama = $_POST["nama"];
$gender = $_POST["gender"];
$status_dosen = $_POST["status_dosen"];
$mata_kuliah = $_POST["mata_kuliah"];
$gambar = $_FILES["gambar"]['name'];

$gambarPath = 'images/' . $gambar;
$tmp_name = $_FILES['gambar']['tmp_name'];

move_uploaded_file($tmp_name, $gambarPath);

$data = mysqli_query($conn, "INSERT INTO tb_dosen set nik='$nik',nama='$nama',gender='$gender',status_dosen='$status_dosen',mata_kuliah='$mata_kuliah', gambar='$gambar'");
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
