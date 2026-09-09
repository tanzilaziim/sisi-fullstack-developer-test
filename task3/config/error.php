<?php

function logError($conn, $id_user, $modules, $controller, $function, $line, $message, $param)
{
    $result = mysqli_query($conn, "SELECT MAX(ERROR_ID) AS nomor FROM I_ERROR_APPLICATION");
    $data = mysqli_fetch_assoc($result);
    $error_id = ($data["nomor"] ?? 0) + 1;

    $error_date = date("d");
    $create_date = date("Y-m-d");

    $query = mysqli_prepare(
        $conn,
        "INSERT INTO I_ERROR_APPLICATION
        (ERROR_ID, ID_USER, ERROR_DATE, MODULES, CONTROLLER, `FUNCTION`, ERROR_LINE, ERROR_MESSAGE, STATUS, PARAM, CREATE_DATE, CREATE_TIME, DELETE_MARK)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'ERROR', ?, ?, NOW(), '0')"
    );

    mysqli_stmt_bind_param(
        $query,
        "isssssssss",
        $error_id,
        $id_user,
        $error_date,
        $modules,
        $controller,
        $function,
        $line,
        $message,
        $param,
        $create_date
    );

    mysqli_stmt_execute($query);
}