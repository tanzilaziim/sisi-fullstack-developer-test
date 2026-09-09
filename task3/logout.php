<?php

session_start();

require_once "config/database.php";
require_once "config/activity.php";

if (isset($_SESSION["id_user"])) {
    logActivity(
        $conn,
        $_SESSION["id_user"],
        "Logout dari aplikasi",
        "SUCCESS",
        null
    );
}

session_destroy();

header("Location: login.php");
exit;