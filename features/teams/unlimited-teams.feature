# language: ru

Функционал: Количество команд на игре по умолчанию
  Я, как автор игры
  хочу чтобы по умолчанию на мою игру могло зарегистрироваться неограниченное количество команд,
  что позволит мне быстрее создавать игру

  Предыстория:
    Допустим я зарегистрирован как "Kolobok"


  Сценарий: Автор видит флажок "Ограничить количество команд"
    Допустим я нахожусь на странице "Личный кабинет"
    Если я иду по ссылке "Создать игру >> "
    То должен увидеть "Ограничить"

  Сценарий: Автор создает игру с неограниченным количеством команд
    Допустим я нахожусь на странице "Личный кабинет"
    Если я иду по ссылке "Создать игру >> "
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21 18:01" в поле "Начало игры"
    И ввожу "2020-03-21 18:00" в поле "Крайний срок регистрации"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Максимальное количество команд: Неограничено"

  Сценарий: Автор вводит ограничение на количество команд в игре
    Допустим я нахожусь на странице "Личный кабинет"
    Если я иду по ссылке "Создать игру >> "
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21 18:01" в поле "Начало игры"
    И ввожу "2020-03-21 18:00" в поле "Крайний срок регистрации"
    И отмечаю галочку "Ограничить"
    И ввожу "5" в поле "количество команд"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Максимальное количество команд: 5"

  Сценарий: Автор ограничивает количество команд на игре нулем
    Допустим я нахожусь на странице "Личный кабинет"
    Если я иду по ссылке "Создать игру >> "
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21 18:01" в поле "Начало игры"
    И ввожу "2020-03-21 18:00" в поле "Крайний срок регистрации"
    И отмечаю галочку "Ограничить"
    И ввожу "0" в поле "количество команд"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Максимальное количество команд: Неограничено"


  Сценарий: Автор не вводит ограничений на количество команд, оставляя поле пустым
    Допустим я нахожусь на странице "Личный кабинет"
    Если я иду по ссылке "Создать игру >> "
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21 18:01" в поле "Начало игры"
    И ввожу "2020-03-21 18:00" в поле "Крайний срок регистрации"
    И отмечаю галочку "Ограничить"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Максимальное количество команд: Неограничено"
