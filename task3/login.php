<?php

session_start();
require_once "config/database.php";

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $query = mysqli_prepare($conn, "SELECT * FROM `USER` WHERE USERNAME = ?");
    mysqli_stmt_bind_param($query, "s", $username);
    mysqli_stmt_execute($query);

    $result = mysqli_stmt_get_result($query);
    $user = mysqli_fetch_assoc($result);

    if ($user && password_verify($password, $user["PASSWORD"])) {
        $_SESSION["id_user"] = $user["ID_USER"];
        $_SESSION["nama_user"] = $user["NAMA_USER"];
        $_SESSION["username"] = $user["USERNAME"];

        header("Location: index.php");
        exit;
    } else {
        $message = "Username atau password salah.";
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<p><?= $message ?></p>

<form method="post">
    <label>Username</label><br>
    <input type="text" name="username" required><br><br>

    <label>Password</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>

</body>
</html>