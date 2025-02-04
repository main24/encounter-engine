# language:ru
Функционал: Как админ я должен иметь возможность
  добавлять команды к списку участников игры
  удалять команды из списка участников

Предыстория:
	Допустим админом создана игра "Игра1"
    И зарегистрирована команда Mushrooms
    И зарегистрирована команда Moorhuhn

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

Сценарий: Админ удаляет команду из списка участников
	Допустим админ добавил команду "Mushrooms" в список участников игры "Игра1"
    И я логинюсь в качестве админа
    Если я захожу в профиль игры "Игра1"
    И иду по ссылке "(отозвать)"
    То не должен видеть "Mushrooms"