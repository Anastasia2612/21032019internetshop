<?php

function d($array) {
    echo '<pre>';
    print_r($array);
    echo '</pre>';
}

// Функция поиска товаров в каталоге

function getProductsFromCatalog ( $catId, $link, $items ) {  
    
    $items = [];

     // ищем товары в БД с нужным идентификатором категории и цены
    $query = "SELECT * FROM `shop` WHERE `category` = {$catId} ";
    $result_goods = mysqli_query($link, $query);

    if ( mysqli_num_rows($result_goods) ) {
        
        // перебираем объект с товарами и записыаем в массив
        while( $item = mysqli_fetch_assoc($result_goods)) {
            $items[] = $item;
            // array_push($items, $item);
        }
    }
    return $items;
}


?>