<?php
// Подключение к БД  в () 'адрес сервера', 'логин', 'пароль', 'название БД'
    $link = mysqli_connect('localhost', 'root', '', '21_03_2019_polyakova');
    //  Подключаем кодировку
    mysqli_set_charset($link, 'utf8');
?>