# language: ru

Функционал: Как админ я должен иметь возможность добавлять и удалять коды в процессе игры

  Предыстория:
    Допустим сейчас "2010-01-02 09:00"
    И админом создана игра "Сокровище нации"
    И ещё в игру "Сокровище нации" добавлено задание "Общий старт" с кодом "tr0000"
    И в игру "Сокровище нации" добавлено задание "Сокровищница масонов" со следующими кодами:
      | tr1111 |
      | tr1122 |
      | tr1133 |
    И ещё в игру "Сокровище нации" добавлено задание "Финишная прямая" с кодом "tr1841"
    И начало игры "Сокровище нации" назначено на "2010-05-02 15:00"
    И зарегистрирована команда "Mushrooms"
    И админ зарегистрировал команду "Mushrooms" на участие в игре "Сокровище нации"

    Допустим сейчас "2010-05-02 15:01"
    И команда Mushrooms находится на уровне "Сокровищница масонов" игры "Сокровище нации"
    И я логинюсь как Mushrooms
    И захожу в игру "Сокровище нации"

  Сценарий: Админ добавляет еще один код по ходу игры.
    Допустим я логинюсь в качестве админа
    И захожу в профиль игры "Сокровище нации"
    И иду по ссылке "Сокровищница масонов"
    Если иду по ссылке "Добавить ещё один код"
    И ввожу "tr4444" в поле "Код"
    И нажимаю "Добавить код"
    То должен увидеть "Коды (4)"
    И должен увидеть "tr4444"

  Сценарий: Админ удаляет один код по ходу игры.
    Допустим я логинюсь в качестве админа
    И захожу в профиль игры "Сокровище нации"
    И иду по ссылке "Сокровищница масонов"
    Если иду по ссылке "(удалить)"
    И должен увидеть "Коды (2)"
    И не должен видеть "tr1111"

  Сценарий: Админ добавляет еще один код по ходу игры. Команда заканчивает игру введя оставшиеся коды
    Допустим админ добавляет код "tr4444" в задание "Сокровищница масонов" игры "Сокровище нации"
    И я логинюсь как Mushrooms
    #Команда видит количество правильных кодов и количество оставшихся кодов
    Если я захожу в игру "Сокровище нации"
    То должен увидеть "Правильных кодов введено: 0 из 4"
    #Команда заканчивает игру введя оставшиеся коды.
    Если я захожу в игру "Сокровище нации"
    И ввожу код "tr1111"
    И ввожу код "tr1133"
    И ввожу код "tr1122"
    И ввожу код "tr4444"
    То должен увидеть "Финишная прямая"

  Сценарий: Команда вводит верный код, админ удаляет один код. Команда заканчивает игру введя оставшиеся коды
    Допустим я ввожу код "tr1122"
    И админ удаляет код "tr1111" в задании "Сокровищница масонов" игры "Сокровище нации"
    И логинюсь как Mushrooms
    #Команда видит количество правильных кодов и количество оставшихся кодов
    Если я захожу в игру "Сокровище нации"
    То должен увидеть "Правильных кодов введено: 1 из 2"

    #Команда заканчивает игру введя оставшиеся коды.
    Если я ввожу код "tr1133"
    То должен увидеть "Финишная прямая"

  Сценарий: Команда вводит верный код, админ добавляет один код. Команда заканчивает игру введя оставшиеся коды.
    Допустим я ввожу код "tr1122"
    И админ добавляет код "tr4444" в задание "Сокровищница масонов" игры "Сокровище нации"
    И логинюсь как Mushrooms
    #Команда видит количество правильных кодов и количество оставшихся кодов
    Если захожу в игру "Сокровище нации"
    То должен увидеть "Правильных кодов введено: 1 из 4"

    #Команда заканчивает игру введя оставшиеся коды
    Если захожу в игру "Сокровище нации"
    И я ввожу код "tr1111"
    И ввожу код "tr1133"
    И ввожу код "tr4444"
    То должен увидеть "Финишная прямая"

  Сценарий: Команда вводит верный код, админ удаляет этот код. Команда видит количество правильно введенных кодов. Команда заканчивает введя оставшиеся коды
    Допустим я ввожу код "tr1111"
    И админ удаляет код "tr1111" в задании "Сокровищница масонов" игры "Сокровище нации"
    И логинюсь как Mushrooms
    #Команда видит количество правильных кодов и количество оставшихся кодов
    Если захожу в игру "Сокровище нации"
    То должен увидеть "Правильных кодов введено: 0 из 2"

    #Команда заканчивает игру введя оставшиеся коды.
    Если захожу в игру "Сокровище нации"
    И я ввожу код "tr1122"
    И ввожу код "tr1133"
    То должен увидеть "Финишная прямая"