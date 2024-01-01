
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий

// Код процедур и функций
Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр ПроцентТренеруПоУпражнению
	Движения.ПроцентТренеруПоУпражнению.Записывать = Истина;
	Для Каждого ТекСтрокаПроцентТренеру из ПроцентТренеру Цикл
		Движение = Движения.ПроцентТренеруПоУпражнению.Добавить();
		Движение.Период = Дата;
		Движение.Упражнение = ТекСтрокаПроцентТренеру.Упражнение;
		Движение.ПроцентТренеру = ТекСтрокаПроцентТренеру.ПроцентТренеру;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти

#Область Инициализация

#КонецОбласти

#КонецЕсли
