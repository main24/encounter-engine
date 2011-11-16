# language:ru
Функционал: Как админ я должен иметь возможность добавлять команды к списку участников игры

Предыстория:
	Допустим админом создана игра "Игра1"
    И зарегистрирована команда Mushrooms
    И зарегистрирована команда Moorhuhn

Сценарий: Видимость ссылки "Добавить команду" для гостя
    Допустим я не залогинен
	И я иду по ссылке "Список игр"
	То должен увидеть "Игра1"
	Если я иду по ссылке "(просмотреть)"
	То должен увидеть "Участвуют команды:"
	И не должен видеть "Добавить команду"

Сценарий: Видимость ссылки "Добавить команду" для простого пользователя
    Допустим я залогинен как Fred
    И я захожу в личный кабинет
    То должен увидеть "Игра1"
    Если я иду по ссылке "Описание"
    То должен увидеть "Участвуют команды:"
    И не должен видеть "Добавить команду"

Сценарий: Админ попадает в меню добавления команды в список участников
	Допустим я логинюсь в качестве админа
	И я захожу в личный кабинет
	И захожу в профиль игры "Игра1"
	Если я иду по ссылке "Добавить команду"
	То должен увидеть "Пригласить команду"

Сценарий: Админ удачно добавляет команду в список участников
	Допустим я логинюсь в качестве админа
	И я захожу в личный кабинет
	И захожу в профиль игры "Игра1"
	И иду по ссылке "Добавить команду"
    Если я ввожу "Mushrooms" в поле "Пригласить команду"
    И нажимаю "Пригласить"
    То должен быть перенаправлен в профиль игры "Игра1"
    То должен увидеть "Участвуют команды:"
	И должен увидеть "Mushrooms"

Сценарий: Админ пытается добавить несуществующую команду в список участников
	Допустим я логинюсь в качестве админа
	И я захожу в личный кабинет
	И захожу в профиль игры "Игра1"
	И иду по ссылке "Добавить команду"
    Если я ввожу "Nonexisted_team" в поле "Пригласить команду"
    И нажимаю "Пригласить"
    То должен увидеть "Вы не указали команду"

    Если я иду по ссылке "(отменить)"
    То должен увидеть "Участвуют команды:"
	И не должен видеть "Nonexisted_team"