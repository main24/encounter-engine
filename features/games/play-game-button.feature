# language: ru

Функционал: Кнопка "Играть!" в личном кабинете и комнате команды если игра уже началась
  Игроки должны откуда-то попадать на страницу текущего уровня чтобы играть в игру.
  Очевидно, кнопка "Играть!" наиболее простой и распространённый вариант.

  Предыстория:
    Допустим сейчас "2009-01-01 00:00"
    И зарегистрирована команда "Mushrooms" под руководством Noel
    И пользователем Nodoxi создана игра "Летний кубок"
    И Nodoxi добавляет задание "Общий старт" в игру "Летний кубок"
    И Nodoxi назначает начало игры "Летний кубок" на "2010-07-01 15:00"

  Сценарий: Игра ещё не началась
    Допустим сейчас "2009-12-12 10:00"
    И я залогинюсь как Noel
    Если я захожу в личный кабинет
    То не должен видеть "Играть!"
    Если я захожу в комнату команды

  Сценарий: Игра началась    
    Допустим сейчас "2010-07-01 15:01"
    И я логинюсь как Noel
    Если захожу в комнату команды
    То должен увидеть "Летний кубок"
    И должен увидеть "Играть!"
    Если я захожу в личный кабинет
    То должен увидеть "Летний кубок"
    И должен увидеть "Играть!"

  Сценарий: Игра началась, но игрок не состоит ни в одной из команд
    Допустим сейчас "2010-07-01 15:01"
    И я залогинен как Nomad
    Если захожу в комнату команды
    То не должен видеть "Летний кубок"
    И не должен видеть "Играть!"
    Если я захожу в личный кабинет
    То не должен видеть "Летний кубок"
    И не должен видеть "Играть!"

  Сценарий: Начались две игры
    Допустим пользователем Iv создана игра "Альтернативный летний кубок"
    И Iv назначает начало игры "Альтернативный летний кубок" на "2010-07-01 14:00"
    Допустим сейчас "2010-07-01 15:01"
    И я логинюсь как Noel
    Если я захожу в личный кабинет
    То должен увидеть "Летний кубок"
    И должен увидеть "Альтернативный летний кубок"

  Сценарий: Автор вместо кнопки "Играть!" видит кнопку "Посмотреть результаты"
    Допустим зарегистрирована команда "Саламандры" под руководством Соломандыр
    И Соломандыр создаёт игру "Первая"
    И Соломандыр назначает начало игры "Первая" на "2009-07-01 14:00"
    И сейчас "2009-07-01 15:01"
    Если я захожу в комнату команды
    То должен увидеть "Первая"
    И должен увидеть "Посмотреть результаты"
    Но не должен видеть "Играть!"