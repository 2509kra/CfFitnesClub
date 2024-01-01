
#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

// Код процедур и функций


&НаКлиенте
Процедура НоменклатураПриИзменении(Элемент)
	//TODO: Вставить содержимое обработчика
	Объект.СуммаДокумента = ЦенаНоменклатуры(Объект.Номенклатура,Объект.Дата);
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций
&НаСервереБезКонтекста
Функция ЦенаНоменклатуры(Знач Номенклатура, Знач Период)
	Запрос = Новый Запрос;
	Запрос.Текст="ВЫБРАТЬ
		|	ЦеныНоменклатурыСрезПоследних.Цена
		|ИЗ
		|	РегистрСведений.ЦеныНоменклатуры.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК
		|		ЦеныНоменклатурыСрезПоследних";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Запрос.УстановитьПараметр("Период", Период);
	
	РезультатЗапроса = Запрос.Выполнить().Выбрать();
	Если РезультатЗапроса.Следующий() Тогда
			Результат = РезультатЗапроса.Цена;
		Иначе
			Результат = 0 ;
	КонецЕсли;	
	Возврат Результат;
КонецФункции	
#КонецОбласти
