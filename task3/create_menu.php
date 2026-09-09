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

$level = mysqli_query($conn, "SELECT * FROM MENU_LEVEL");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $menu_id = $_POST["menu_id"];
    $id_level = $_POST["id_level"];
    $menu_name = $_POST["menu_name"];
    $menu_link = $_POST["menu_link"];
    $menu_icon = $_POST["menu_icon"];
    $parent_id = $_POST["parent_id"];

    $query = mysqli_prepare(
        $conn,
        "INSERT INTO MENU
        (MENU_ID, ID_LEVEL, MENU_NAME, MENU_LINK, MENU_ICON, PARENT_ID, CREATE_BY, CREATE_DATE, DELETE_MARK)
        VALUES (?, ?, ?, ?, ?, ?, ?, CURDATE(), '0')"
    );

    mysqli_stmt_bind_param(
        $query,
        "sssssss",
        $menu_id,
        $id_level,
        $menu_name,
        $menu_link,
        $menu_icon,
        $parent_id,
        $_SESSION["id_user"]
    );

    try {
        mysqli_stmt_execute($query);

        $message = "Menu berhasil dibuat.";

        logActivity(
            $conn,
            $_SESSION["id_user"],
            "Membuat menu " . $menu_name,
            "SUCCESS",
            "M03"
        );

    } catch (mysqli_sql_exception $e) {
        $message = "Menu gagal dibuat.";

        logActivity(
            $conn,
            $_SESSION["id_user"],
            "Gagal membuat menu " . $menu_name,
            "FAILED",
            "M03"
        );

        logError(
            $conn,
            $_SESSION["id_user"],
            "Menu Management",
            "create_menu.php",
            "Create Menu",
            $e->getLine(),
            $e->getMessage(),
            "MENU_ID=" . $menu_id
        );
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Create Menu</title>
</head>
<body>

<h2>Create Menu</h2>

<p><?= $message ?></p>

<form method="post">
    <label>Menu ID</label><br>
    <input type="text" name="menu_id" required><br><br>

    <label>Level</label><br>
    <select name="id_level" required>
        <?php while ($row = mysqli_fetch_assoc($level)) { ?>
            <option value="<?= $row["ID_LEVEL"] ?>">
                <?= $row["LEVEL"] ?>
            </option>
        <?php } ?>
    </select><br><br>

    <label>Menu Name</label><br>
    <input type="text" name="menu_name" required><br><br>

    <label>Menu Link</label><br>
    <input type="text" name="menu_link"><br><br>

    <label>Menu Icon</label><br>
    <input type="text" name="menu_icon"><br><br>

    <label>Parent ID</label><br>
    <input type="text" name="parent_id"><br><br>

    <button type="submit">Simpan</button>
</form>

<br>

<a href="index.php">Kembali</a>

</body>
</html>