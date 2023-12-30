#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

// Код процедур и функций

Процедура Билет(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Билет)
	Макет = ПолучитьМакет("Билет");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ПродажаБилета.Дата,
	|	ПродажаБилета.Номер,
	|	ПродажаБилета.СуммаДокумента,
	|	ПродажаБилета.Упражнение
	|ИЗ
	|	Документ.ПродажаБилета КАК ПродажаБилета
	|ГДЕ
	|	ПродажаБилета.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;
		
		ПараметрыОбласти = Новый Структура;
		ПараметрыОбласти.Вставить("Дата",Формат(Выборка.Дата,"ДЛФ=D;"));
		ПараметрыОбласти.Вставить("Номер",УдалитьЛидирующиеНули(Выборка.номер));
		ОбластьЗаголовок.Параметры.Заполнить(ПараметрыОбласти);
		
		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытий

// Код процедур и функций

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций
Функция УдалитьЛидирующиеНули(Номер)
	НомерБезНулей = Номер;
	Пока СтрНачинаетсяС(НомерБезНулей,"0") Цикл
		НомерБезНулей = Сред(НомерБезНулей,2);
	КонецЦикла;	
	Возврат НомерБезНулей;
КонецФункции	

#КонецОбласти

#КонецЕсли