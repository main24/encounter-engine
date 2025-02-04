# language: ru
Функционал: Создание игр
  Для того чтобы стать автором новой игры
  Любой зарегистрированный пользователь должен иметь возможность создавать игры

  Сценарий: Пользователь не видит ссылку "Создать игру" в личном кабинете
    Допустим я зарегистрирован как Iv
    Если я захожу в личный кабинет
    То не должен видеть "Создать игру"

  Сценарий: Админ видит ссылку "Создать игру" в личном кабинете
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    То должен увидеть "Создать игру"

  Сценарий: Админ видит форму создания игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    То должен увидеть "Название"
    И должен увидеть "Описание"
    И должен увидеть кнопку "Создать игру"

  Сценарий: Админ успешно создаёт НЕобщедоступную игру
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И нажимаю "Создать"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Котлованы Бишкека"
    И должен увидеть "Общий старт у ЦУМа"
    И должен увидеть "Необходима регистрация"
    И должен увидеть "Добавить команду"
    И не должен видеть "Все команды могут участвовать в игре"

  Сценарий: Админ успешно создаёт общедоступную игру
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И отмечаю галочку "Доступна для всех?"
    И нажимаю "Создать"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Котлованы Бишкека"
    И должен увидеть "Общий старт у ЦУМа"
    И должен увидеть "Для всех"
    И не должен видеть "Добавить команду"
    И должен увидеть "Все команды могут участвовать в игре"

  Сценарий: Админ не ввёл название игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Прикиньте, игра без названия!" в поле "Описание"
    И нажимаю "Создать игру"
    То должен увидеть "Вы не ввели название"

  Сценарий: Админ не ввёл описание игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Название говорит само за себя" в поле "Название"
    И нажимаю "Создать игру"
    То должен увидеть "Вы не ввели описание"

  Сценарий: Админ ввёл только пробелы в обязательные поля
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "      " в поле "Название"
    И ввожу "      " в поле "Описание"
    И нажимаю "Создать игру"
    То должен увидеть "Вы не ввели название"
    И должен увидеть "Вы не ввели описание"

  Сценарий: Админ пытается дважды создать игру с одним и тем же именем
    Допустим админом создана игра "Котлованы Бишкека"
    И я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Неважно-какое-описание" в поле "Описание"
    И нажимаю "Создать"
    То должен увидеть "Игра с таким названием уже существует"

  Сценарий: Админ вводит корректную дату начала игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21 18:01" в поле "Начало игры"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    То должен увидеть "2020-03-21 18:01"

  Сценарий: Админ не выбрал никакой даты
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "" в поле "Начало игры"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Дата начала игры ещё не назначена"

  Сценарий: Админ вводит некорректную дату начала игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "сёдня в полшистова" в поле "Начало игры"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    И должен увидеть "Дата начала игры ещё не назначена"

  Сценарий: Админ не ввёл время начала игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "2020-03-21" в поле "Начало игры"
    И нажимаю "Создать игру"
    То должен быть перенаправлен в профиль игры "Котлованы Бишкека"
    То должен увидеть "2020-03-21 00:00"

  Сценарий: Админ вводит уже прошедшие дату/время начала игры
    Допустим я логинюсь в качестве админа
    Если я захожу в личный кабинет
    И иду по ссылке "Создать игру"
    И ввожу "Котлованы Бишкека" в поле "Название"
    И ввожу "Общий старт у ЦУМа" в поле "Описание"
    И ввожу "1961-04-12 00:00" в поле "Начало игры"
    И нажимаю "Создать игру"
    То должен увидеть "Вы выбрали дату из прошлого"
