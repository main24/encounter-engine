# language: ru

Функционал: Золотой код

  Предыстория:
    Допустим админом создана игра "Страна чудес"
    И в игру "Страна чудес" добавлено задание "Замесить и нарубить" со следующими кодами:
      | code1 |
      | code2 |

  Сценарий: Автор добавляет золотой код
    Допустим логинюсь в качестве админа
    И захожу в профиль задания "Замесить и нарубить"
    И иду по ссылке "Добавить ещё один код"
    Если ввожу "code12" в поле "Код"
    И отмечаю галочку "Золотой?"
    И нажимаю "Добавить код"
    То должен быть перенаправлен в профиль задания "Замесить и нарубить"
    И должен увидеть следующее:
      | Золотой код |
      | code12      |
      | Коды        |
      | code1       |
      | code2       |

  Сценарий: Автор удаляет золотой код
    Допустим логинюсь в качестве админа
    И захожу в профиль задания "Замесить и нарубить"
    И иду по ссылке "Добавить ещё один код"
    И ввожу "code12" в поле "Код"
    И отмечаю галочку "Золотой?"
    И нажимаю "Добавить код"
    Если нажимаю на "(удалить)" возле кода "code12"
    То страница перегружается
    И должен увидеть следующее:
      | Коды  |
      | code1 |
      | code2 |
    И не должен видеть "Золотой код"
