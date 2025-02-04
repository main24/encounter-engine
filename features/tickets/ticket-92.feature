# language: ru

Функционал: Bug: нельзя отредактировать задание, не изменив его код (ticket #92)
            http://daniel-vartanov.lighthouseapp.com/projects/22863-encounter-engine/tickets/92

Предыстория:
  Допустим админом создана игра "Котлованы Бишкека"
  И админ добавляет задание "Общий старт" в игру "Котлованы Бишкека"

  Сценарий: Автор игры редактирует название задания, не изменив код
    Если я захожу в профиль задания "Общий старт"
    И иду по ссылке "Редактировать текст и название задания"
    И я ввожу "Первое задание" в поле "Название"
    И нажимаю "Сохранить"
    То не должен видеть "Ошибка"
    И должен быть перенаправлен в профиль задания "Первое задание"