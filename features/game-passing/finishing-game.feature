# language: ru

Функционал: Финиш игры
  Когда команда проходит последний уровень
  Команда должна видеть что она закончила игру
  И на каком месте она оказалась

  Предыстория:
    Допустим сейчас "2009-01-01 00:00"
    И админом создана игра "Котлованы Бишкека"

    Допустим зарегистрирована команда "Mushrooms"
    И админ зарегистрировал команду "Mushrooms" на участие в игре "Котлованы Бишкека"
    И зарегистрирована команда "Корсары"
    И админ зарегистрировал команду "Корсары" на участие в игре "Котлованы Бишкека"
    И в игре "Котлованы Бишкека" следующие задания:
      | Название    | Код      |
      | Общий старт | enstart  |
      | Обед        | enсопог  |
      | Финиш       | enfinish |
    И начало игры "Котлованы Бишкека" назначено на "2009-02-02 15:00"
    А сейчас "2009-02-02 15:01"

    Допустим команда Mushrooms находится на уровне "Финиш" игры "Котлованы Бишкека"
    И команда Корсары находится на уровне "Финиш" игры "Котлованы Бишкека"

  Сценарий: Команда-победитель проходит последний уровень
    Если я логинюсь как Mushrooms
    И захожу в игру "Котлованы Бишкека"
    И ввожу "enfinish" в поле "Код"
    И нажимаю "Отправить!"
    То я должен увидеть "Поздравляем"
    А список победителей должен быть следующим:
      | Место | Команда   |
      | 1     | Mushrooms |

  Сценарий: Вторая команда проходит последний уровень
    Допустим команда Mushrooms закончила игру "Котлованы Бишкека"
    И прошла 1 секунда
    Если я логинюсь как Корсары
    И захожу в игру "Котлованы Бишкека"
    И ввожу "enfinish" в поле "Код"
    И нажимаю "Отправить!"
    То должен увидеть "Поздравляем, вы закончили игру"
    А список победителей должен быть следующим:
      | Место | Команда   |
      | 1     | Mushrooms |
      | 2     | Корсары   |

  Сценарий: Команда просматривает результаты после окончания игры
    Допустим команда Mushrooms закончила игру "Котлованы Бишкека"
    Если я логинюсь как Mushrooms
    И захожу в личный кабинет
    То должен увидеть "Посмотреть результаты"
    Но не должен видеть "Играть!"
    Если я иду по ссылке "Посмотреть результаты"
    То должен увидеть "Поздравляем"

  Сценарий: Одна из команд заврешает игру на следующий день (ticket #85)
    Допустим команда Mushrooms закончила игру "Котлованы Бишкека"
    Если сейчас "2009-02-03 14:55"
    И команда Корсары закончила игру "Котлованы Бишкека"
    То список победителей должен быть следующим:
      | Место | Команда   | Время финиша     |
      | 1     | Mushrooms | 15:01:00         |
      | 2     | Корсары   | 14:55:00 (03.02) |