Функционал: Профиль игры
  Чтобы все пользователи могли получить информацию об игре
  Нужно выводить её на отдельной странице

  Сценарий: Создана игра
    Допустим я зарегистрирован как Iv
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И нажимаю "Создать"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"

  Сценарий: Пользователь видит название и описание игры в её профиле
    Дано: Создана игра
    Допустим я зарегистрирован как Aldor
    Если я захожу в профиль игры "Котлованы Бишкека"
    То должен увидеть "Котлованы Бишкека"
    И должен увидеть "Общий старт у ЦУМа"
    И ещё должен увидеть "Автор - Iv"

  Сценарий: Гость получает доступ к профилю игры
    Дано: Создана игра
    Допустим я не залогинен
    Если я захожу в профиль игры "Котлованы Бишкека"
    То должен увидеть "Котлованы Бишкека"