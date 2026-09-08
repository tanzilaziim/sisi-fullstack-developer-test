<?php

$host = "localhost";
$user = "root";
$password = "";
$database = "sisi_test";

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

// echo "Koneksi database berhasil";