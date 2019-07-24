
class Product {
    constructor(productPic, productPrice, productName) {
        this.pic = productPic ;
        this.price = productPrice ;
        this.name = productName ;
        this.el = document.querySelector('.catalog');
        this.pagBlock = document.querySelector('.number');
    };
    renderCatalogItem() {
        let item = document.createElement('div');
        
        item.classList.add('catalog-item');

        item.innerHTML = `
            <div class="catalog-item-pic" style="background: url(/images/catalog/${this.pic}) center center / contain no-repeat"> </div>
            <div class="catalog-item-name">${this.name} </div>
            <div class="catalog-item-price">${this.price} руб.</div>
        `;
    
        this.el.appendChild(item);

    };


    // Метод очистки каталога
    clearCatalog() {
        this.el.innerHTML = '';
    };
    // Метод включение прелоудера
    preloaderOn() {
        this.el.innerHTML = `<div class= "preloader"></div>`;
    };
    // Метод отключение прелоудера
    preloaderOff() {
        // this.clearCatalog();
        this.el.innerHTML = `<div class="preloader" style="display: none"></div>`;
    };
    // Метод для пагинатора(Пагинатор – это механизм постраничного вывода информации)
    renderPagination( allBlocks, currentPage ) {
        // Номер активного кубика номера страницы
        // Общее кол-во кубиков
        // pagination[
        //     'active' : 1,
        //     'allBlocks' : 4
        // ]

        for (let i = 1; i<=allBlocks; i++) {
            let item = document.createElement('div'); //Создаём элемент
            item.classList.add('number-item'); // Добавляем класс

            if (i==currentPage) {
                item.classList.add('active'); // Добавляем класс active
            }
            item.addEventListener('click', ()=> { //this. будет понятно только при стрелочной функции
                 //  Узнаем значение селекта
                let allSelectsAndValues = document.querySelectorAll('select');
                // ?category=1&size=M&price=1000-3000
                let catValue = `?category=${allSelectsAndValues[0].value}&size=${allSelectsAndValues[1].value}&price=${allSelectsAndValues[2].value}
                `;
                this.renderCatalog(catValue, i);
            });

            item.innerHTML = i; //Вставляем внутрь цифру
        
            this.pagBlock.appendChild(item); // Выводим блок внутрь  div.Number
        }
    };
    // Метод, который будет выводить на экран
    renderCatalog(category, currentPage) {
        // console.log(currentPage); 
        currentPage = `&curPage=${currentPage || 1}`;


        // Короткая запись if else ТЕРНАРНЫЙ ОПЕРАТОР
        let cat = (category !== '') ? category : '?category=1' ;
        // Тоже самое:
        // let cat ;
        // if ( categories !== '') {
        //     cat = categories;
        // } else {
        //     cat = '?categories=1';
        // }

        // Создаем запрос и отправляем
        let xhr =  new XMLHttpRequest();
        xhr.open('GET', `/handlers/catalogHandler.php${cat}${currentPage}`);
        xhr.send();

        this.clearCatalog();
        this.preloaderOn();

        // console.dir(xhr);
        // Проверяем пришли ли данные с сервера
        xhr.addEventListener('load', () => {

            this.preloaderOff();          
            let data = JSON.parse( xhr.responseText);

            // console.log(data);
            // data.pagination.allPages получаем кол-во страниц
            // data.pagination.currentPage получаем текущую страницу

            data.catalogItems.forEach( (value, index) => {

                let catalogItem = new Product(value.pic, value.price, value.name);
                catalogItem.renderCatalogItem();
            });

            this.renderPagination(data.pagination.allPages, data.pagination.currentPage );
        });
    }
}

let cat = window.location.search;
// ?category=2

let newCatalog = new Product();
newCatalog.renderCatalog(cat);

// Делаем выборку товара по категории в селекте
let catSelect = document.querySelectorAll('select');

catSelect.forEach(function( value, index) {

    value.addEventListener('change', function() {
        //  Узнаем значение селекта
        let allSelectsAndValues = document.querySelectorAll('select');
        // ?category=1&size=M&price=1000-3000
        let catValue = `?category=${allSelectsAndValues[0].value}&size=${allSelectsAndValues[1].value}&price=${allSelectsAndValues[2].value}
        `;
        //  Рендерим каталог зановo
        newCatalog.renderCatalog( catValue );
    })

})




