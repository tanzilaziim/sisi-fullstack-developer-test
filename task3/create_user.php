<?php

session_start();
require_once "config/database.php";
require_once "config/activity.php";
require_once "config/error.php";

if (!isset($_SESSION["id_user"])) {
    header("Location: login.php");
    exit;
}

if ($_SESSION["id_jenis_user"] != "ADM") {
    header("Location: index.php");
    exit;
}

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_user = $_POST["id_user"];
    $nama_user = $_POST["nama_user"];
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_BCRYPT);
    $email = $_POST["email"];
    $no_hp = $_POST["no_hp"];
    $wa = $_POST["wa"];
    $pin = $_POST["pin"];
    $id_jenis_user = $_POST["id_jenis_user"];
    $status_user = $_POST["status_user"];

    $cek = mysqli_prepare(
        $conn,
        "SELECT ID_USER FROM `USER` WHERE ID_USER = ? OR USERNAME = ?"
    );

    mysqli_stmt_bind_param(
        $cek,
        "ss",
        $id_user,
        $username
    );

    mysqli_stmt_execute($cek);

    $hasil_cek = mysqli_stmt_get_result($cek);

    if (mysqli_num_rows($hasil_cek) > 0) {
        $message = "ID User atau Username sudah digunakan.";

        logActivity(
            $conn,
            $_SESSION["id_user"],
            "Gagal membuat user, ID atau username sudah digunakan",
            "FAILED",
            "M02"
        );
    } else {
        $query = mysqli_prepare(
            $conn,
            "INSERT INTO `USER`
            (ID_USER, NAMA_USER, USERNAME, PASSWORD, EMAIL, NO_HP, WA, PIN, ID_JENIS_USER, STATUS_USER, DELETE_MARK, CREATE_BY, CREATE_DATE)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', ?, NOW())"
        );

        mysqli_stmt_bind_param(
            $query,
            "sssssssssss",
            $id_user,
            $nama_user,
            $username,
            $password,
            $email,
            $no_hp,
            $wa,
            $pin,
            $id_jenis_user,
            $status_user,
            $_SESSION["id_user"]
        );

        try {
            mysqli_stmt_execute($query);

            $message = "User berhasil dibuat.";

            logActivity(
                $conn,
                $_SESSION["id_user"],
                "Membuat user " . $id_user,
                "SUCCESS",
                "M02"
            );

        } catch (mysqli_sql_exception $e) {
            $message = "User gagal dibuat.";

            logActivity(
                $conn,
                $_SESSION["id_user"],
                "Gagal membuat user " . $id_user,
                "FAILED",
                "M02"
            );

            logError(
                $conn,
                $_SESSION["id_user"],
                "User Management",
                "create_user.php",
                "Create User",
                $e->getLine(),
                $e->getMessage(),
                "ID_USER=" . $id_user
            );
        }
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
</head>
<body>

<h2>Create User</h2>

<p><?= $message ?></p>

<form method="post">
    <label>ID User</label><br>
    <input type="text" name="id_user" required><br><br>

    <label>Nama User</label><br>
    <input type="text" name="nama_user" required><br><br>

    <label>Username</label><br>
    <input type="text" name="username" required><br><br>

    <label>Password</label><br>
    <input type="password" name="password" required><br><br>

    <label>Email</label><br>
    <input type="email" name="email"><br><br>

    <label>No HP</label><br>
    <input type="text" name="no_hp"><br><br>

    <label>WhatsApp</label><br>
    <input type="text" name="wa"><br><br>

    <label>PIN</label><br>
    <input type="text" name="pin"><br><br>

    <label>Jenis User</label><br>
    <input type="text" name="id_jenis_user"><br><br>

    <label>Status User</label><br>
    <select name="status_user">
        <option value="Aktif">Aktif</option>
        <option value="Tidak Aktif">Tidak Aktif</option>
    </select><br><br>

    <button type="submit">Simpan</button>
</form>

<br>

<a href="index.php">Kembali</a>

</body>
</html>