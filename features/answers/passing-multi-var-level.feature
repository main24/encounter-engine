# language: ru
Функционал: 89 Варианты написания кодов
  Как автор игры
  Я хочу вводить неограниченное количество правильных ответов для одного кода
  Чтобы дать возможность вводить все допустимые варианты. Нпр. Алёна, Алена

  Предыстория:
    Допустим пользователем Avtor создана игра "Найти и выжить"
    И в игре "Найти и выжить" следующие задания:
      | Название       | Код        |
      | Операция Empty | фломастер  |
      | Финиш          | какойтокод |
    И для уровня "Операция Empty" есть следующие коды:
      | Вариант_1       | Вариант_2       |
      | фломастер       | flomaster       |
      | код2уровня      |                 |
    И зарегистрирована команда "Discovery" под руководством Glebov
    И капитан "Glebov" зарегистрировал свою команду на участие в игре "Найти и выжить"
    И игра "Найти и выжить" уже начата
    И команда Discovery находится на уровне "Операция Empty" игры "Найти и выжить"
    Допустим я логинюсь как Glebov
    И захожу в личный кабинет
    И иду по ссылке "Играть!"

  Сценарий: Команда проходит уровень введя первый вариант кода
    Если ввожу код "фломастер"
    То должен увидеть "Код 'фломастер' -- верный"
    И должен увидеть "Правильных кодов введено: 1 из 2"

  Сценарий: Команда проходит уровень введя второй вариант кода
    Если ввожу код "flomaster"
    То должен увидеть "Код 'flomaster' -- верный"
    И должен увидеть "Правильных кодов введено: 1 из 2 "

  Сценарий: Команда пытается ввести неверный код
    Если ввожу код "абра-кадабра"
    То должен увидеть "Код неверный, вы ввели 'абра-кадабра'"
    И должен увидеть "Правильных кодов введено: 0 из 2 "
