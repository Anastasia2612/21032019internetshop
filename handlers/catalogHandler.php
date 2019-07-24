<?php

    include($_SERVER['DOCUMENT_ROOT'] . '/config/config.php');
    include($_SERVER['DOCUMENT_ROOT'] . '/modules/function.php');

    $cat = $_GET['category'];
    // Получим дочерние категории 
    $items = [];
    $rows=count('catalogItems[]');
    echo  $rows;
    $itemsOnPage = 3; //кол-во товаров на странице, 
    

   

    // $allPa = $countCatalogItems/$itemsOnPage;
    // echo $allPa;

    $catalog_info =[
       'catalogItems' => [],
       'pagination' => [
           'currentPage' => $_GET['curPage'], //    currentPage - текущая страница
           'allPages' => 1
       ]
    ];

    //Запрос что-то посчитать к БД
    // $query = "SELECT COUNT(`id`) AS `result` WHERE ";

    // preloader, то что отображается пока грузится страница, например при плохом соединении интернета
    sleep(2);   // задержка загрузки  на 3 сек.
    

    // Узнаём родительская или дочерняя категория
    $query = "SELECT `parent_id` FROM `categories` WHERE `id` = $cat";
    $result = mysqli_query($link, $query);
    $result = mysqli_fetch_assoc($result);

    if ( !$result['parent_id'] ) {
        // 0 - true
        //  - false

        $query = "SELECT `id` FROM `categories` WHERE `parent_id` = $cat";
        $result = mysqli_query($link, $query);
                
        $catalog = [];
        while ( $res = mysqli_fetch_assoc($result) ) {

           $catalog[] = ( getProductsFromCatalog($res['id'], $link, $items) );       
        } 

        // d($catalog);

        $newCatalog = [];
        foreach ( $catalog as $key => $value) {
            foreach ( $value as $index => $item) {
                $newCatalog[] = $item ;
            }
        }
        $catalog_info['catalogItems'] = $newCatalog;
        echo json_encode($catalog_info);
    } else {
        $catalog_info['catalogItems'] = getProductsFromCatalog($cat, $link, $items);
        echo json_encode( $catalog_info );      
    }

     

    // $items - массив с данными о каждой строчке
    // Преобразуем  запрос в формат понятный для Js (json_encode($items)) и выводим в консоль
    // echo json_encode($items);
    // $items = [
    //     0=> [
    //         'id' => 1,
    //         'name' => 'футболка',
    //         'price' => '15900'
    //     ], 
    //     1=> [
    //         'id' => 1,
    //         'name' => 'футболка',
    //         'price' => '15900'
    //     ], 
    //     2=> [
    //         'id' => 1,
    //         'name' => 'футболка',
    //         'price' => '15900'
    //     ]
    // ];
?>