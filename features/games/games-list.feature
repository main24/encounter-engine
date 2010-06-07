# language: ru

Функционал: Списки игр
  Чтобы найти нужную игру
  Пользователю проще всего обратиться к спискам
  Должны быть как список всех игр, так и список игр пользователя

  Предыстория:
    Допустим пользователем Noel создана игра "Розовые сопли"
    Допустим пользователем Iv создана игра "Котлованы Бишкека"

  Сценарий: Пользователь видит ссылку на список своих игр в личном кабинете
    Допустим я логинюсь как Iv
    Если я захожу в личный кабинет
    То должен увидеть "Мои игры"

  Сценарий: В своём личном кабинете пользователь видит список своих игр
    Допустим я логинюсь как Iv
    Если я захожу в личный кабинет    
    То должен увидеть "Котлованы Бишкека"
#    И не должен видеть "Розовые сопли"

  Сценарий: Пользователь видит ссылку на список всех игр на главной странице
    Допустим я логинюсь как Iv
    Если я захожу на главную страницу
    То должен увидеть "Список игр"

  Сценарий: Гость видит ссылку на список всех игр на главной странице
    Допустим я не залогинен
    Если я захожу на главную страницу
    То должен увидеть "Список игр"

  Сценарий: Перейдя по ссылке "Список игр" гость видит список вообще всех игр в системе
    Допустим я не залогинен
    Если я захожу на главную страницу
    И иду по ссылке "Список игр"
    То должен увидеть "Котлованы Бишкека"
    И должен увидеть "Розовые сопли"