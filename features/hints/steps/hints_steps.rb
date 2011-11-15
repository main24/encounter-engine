Given %r(на уровне "(.*)" следующие подсказки:$)i do |level_name, hints_table|
  level = Level.find_by_name(level_name)

  hints_table.hashes.each do |hash|
    text = hash['Текст']
    delay = hash['Через'].match(/(\d+) минут.?/)[1]
    Given %{админ добавил подсказку "#{text}" через #{delay} минут на уровне "#{level_name}"}
  end
end

Given %r(админ добавил подсказку "(.*)" через (\d+) минут на уровне "(.*)")i do |hint_text, hint_delay, level_name|
  Given %{я логинюсь в качестве админа}
  Given %{захожу в профиль задания "#{level_name}"}
  When %{я иду по ссылке "Добавить подсказку"}
  When %{ввожу "#{hint_text}" в поле "Текст"}
  When %{ввожу "#{hint_delay}" в поле "Через"}
  When %{нажимаю "Добавить"}
  Then %{должен быть перенаправлен в профиль задания "#{level_name}"}
  Then %{должен увидеть "#{hint_text}"}
  Then %{должен увидеть "#{hint_delay}"}
end

Given /^нажимаю на "([^\"]*)" возле подсказки "([^\"]*)"$/ do |button_name, code|
  hint = Hint.find_by_text(code)
  within "#hint-#{hint.id}" do |scope|
    scope.click_link button_name
  end
end