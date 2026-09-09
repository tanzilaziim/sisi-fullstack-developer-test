<?php

session_start();
require_once "config/database.php";

if (!isset($_SESSION["id_user"])) {
    header("Location: login.php");
    exit;
}

$id_user = $_SESSION["id_user"];

if ($_SESSION["id_jenis_user"] == "ADM") {
    $menus = mysqli_query(
        $conn,
        "SELECT * FROM MENU
        WHERE DELETE_MARK = '0'"
    );
} else {
    $query = mysqli_prepare(
        $conn,
        "SELECT MENU.*
        FROM MENU_USER
        JOIN MENU ON MENU_USER.MENU_ID = MENU.MENU_ID
        WHERE MENU_USER.ID_USER = ?
        AND MENU_USER.DELETE_MARK = '0'
        AND MENU.DELETE_MARK = '0'"
    );

    mysqli_stmt_bind_param($query, "s", $id_user);
    mysqli_stmt_execute($query);

    $menus = mysqli_stmt_get_result($query);
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

<h3>Menu</h3>

<?php while ($menu = mysqli_fetch_assoc($menus)) { ?>

    <p>
        <a href="<?= $menu["MENU_LINK"] ?>">
            <?= $menu["MENU_NAME"] ?>
        </a>
    </p>

<?php } ?>

<p>
    <a href="logout.php">Logout</a>
</p>

</body>
</html>