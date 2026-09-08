<?php

session_start();

if (!isset($_SESSION["id_user"])) {
    header("Location: login.php");
    exit;
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

<h2>Dashboard</h2>

<p>Selamat datang, <?= $_SESSION["nama_user"] ?></p>

<p>
    <a href="create_user.php">Create User</a>
</p>

<p>
    <a href="logout.php">Logout</a>
</p>

</body>
</html>