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

$users = mysqli_query(
    $conn,
    "SELECT * FROM `USER`
    WHERE DELETE_MARK = '0'
    AND ID_JENIS_USER != 'ADM'"
);

$menus = mysqli_query(
    $conn,
    "SELECT * FROM MENU
    WHERE DELETE_MARK = '0'"
);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_user = $_POST["id_user"];
    $menu_id = $_POST["menu_id"];

    $cek = mysqli_prepare(
        $conn,
        "SELECT NO_SETTING FROM MENU_USER
        WHERE ID_USER = ? AND MENU_ID = ?"
    );

    mysqli_stmt_bind_param(
        $cek,
        "ss",
        $id_user,
        $menu_id
    );

    mysqli_stmt_execute($cek);

    $hasil = mysqli_stmt_get_result($cek);

    if (mysqli_num_rows($hasil) > 0) {
        $message = "User sudah memiliki akses menu tersebut.";

        logActivity(
            $conn,
            $_SESSION["id_user"],
            "Akses menu untuk user " . $id_user . " sudah tersedia",
            "FAILED",
            "M04"
        );
    } else {
        $result = mysqli_query(
            $conn,
            "SELECT MAX(NO_SETTING) AS nomor FROM MENU_USER"
        );

        $data = mysqli_fetch_assoc($result);
        $no_setting = ($data["nomor"] ?? 0) + 1;

        $query = mysqli_prepare(
            $conn,
            "INSERT INTO MENU_USER
            (NO_SETTING, ID_USER, MENU_ID, CREATE_DATE, CREATE_TIME, DELETE_MARK)
            VALUES (?, ?, ?, CURDATE(), NOW(), '0')"
        );

        mysqli_stmt_bind_param(
            $query,
            "iss",
            $no_setting,
            $id_user,
            $menu_id
        );

        try {
            mysqli_stmt_execute($query);

            $message = "Akses menu berhasil diberikan.";

            logActivity(
                $conn,
                $_SESSION["id_user"],
                "Memberikan akses menu " . $menu_id . " kepada user " . $id_user,
                "SUCCESS",
                "M04"
            );

        } catch (mysqli_sql_exception $e) {
            $message = "Akses menu gagal diberikan.";

            logActivity(
                $conn,
                $_SESSION["id_user"],
                "Gagal memberikan akses menu " . $menu_id . " kepada user " . $id_user,
                "FAILED",
                "M04"
            );

            logError(
                $conn,
                $_SESSION["id_user"],
                "Menu Access",
                "menu_access.php",
                "Set Menu Access",
                $e->getLine(),
                $e->getMessage(),
                "ID_USER=" . $id_user . ", MENU_ID=" . $menu_id
            );
        }
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Menu Access</title>
</head>
<body>

<h2>Menu Access</h2>

<p><?= $message ?></p>

<form method="post">

    <label>User</label><br>
    <select name="id_user" required>
        <?php while ($user = mysqli_fetch_assoc($users)) { ?>
            <option value="<?= $user["ID_USER"] ?>">
                <?= $user["NAMA_USER"] ?>
            </option>
        <?php } ?>
    </select><br><br>

    <label>Menu</label><br>
    <select name="menu_id" required>
        <?php while ($menu = mysqli_fetch_assoc($menus)) { ?>
            <option value="<?= $menu["MENU_ID"] ?>">
                <?= $menu["MENU_NAME"] ?>
            </option>
        <?php } ?>
    </select><br><br>

    <button type="submit">Simpan Akses</button>

</form>

<br>

<a href="index.php">Kembali</a>

</body>
</html>