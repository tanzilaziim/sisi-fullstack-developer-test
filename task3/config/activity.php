<?php

function logActivity($conn, $id_user, $deskripsi, $status, $menu_id)
{
    $result = mysqli_query($conn, "SELECT MAX(NO_ACTIVITY) AS nomor FROM USER_ACTIVITY");
    $data = mysqli_fetch_assoc($result);
    $no_activity = ($data["nomor"] ?? 0) + 1;

    $query = mysqli_prepare(
        $conn,
        "INSERT INTO USER_ACTIVITY
        (NO_ACTIVITY, ID_USER, DISCRIPSI, STATUS, MENU_ID, DELETE_MARK, CREATE_BY, CREATE_DATE)
        VALUES (?, ?, ?, ?, ?, '0', ?, NOW())"
    );

    mysqli_stmt_bind_param(
        $query,
        "isssss",
        $no_activity,
        $id_user,
        $deskripsi,
        $status,
        $menu_id,
        $id_user
    );

    mysqli_stmt_execute($query);
}