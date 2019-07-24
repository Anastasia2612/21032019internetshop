<?php

    include($_SERVER['DOCUMENT_ROOT'] . '/config/config.php');


    // Запрос к БД, чтобы найти все категории где `parent_id`= 0 

    $query= "SELECT * FROM `categories` WHERE `parent_id`= 0 ";
    $result = mysqli_query($link, $query);
    $links = '';
    while ($res = mysqli_fetch_assoc($result)) {
        $links  .= '<div><a href="/catalog/catalog.php?category='.$res['id'].'">'.$res['name'].'</a></div>';
    }

    // Формируем в цикле ссылку для каждой строчки, найденой в БД


?>

<header>
    <div class = "nav">
        <a href=""><img src="/images/icons/logo.jpg" alt=""></a>
            <?=$links?>
            <div>  <a href="">новинки</a>  </div>
            <div>  <a href="">о нас</a>  </div>
        <div class = "nav_right">
            <img src="/images/icons/account.png" alt="">
            <div class = "user">
                 Привет
                <a><i>(Выйти)</i></a>
            </div>
            <a class = "user_basket"><img src="/images/icons/bascet.png" alt=""></a>
        </div>

   </div>
</header>