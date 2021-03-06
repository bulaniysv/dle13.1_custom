<li><svg class="linkenso-icon"><use xlink:href="#icon-{image}"></use></svg> {link}</li>

{*
	Пример вставки
	{include file='engine/modules/linkenso.php?post_id={news-id}&links=3&scan=all_cat&anchor=title&title=name'}

	Параметры модуля, передаваемые через из tpl при вставке:
	* post_id       - обязательный параметр с id текущей новости, должен иметь значение {news-id}
	* links         - общее количество ссылок, выводимых модулем

	* date          - опция для отображения свежих или предыдущих постов
	* возможны 2 варианта настройки:
	old         - в ссылках будут выведены предыдущие новости
	new         - в ссылках будут выведены свежие новости

	* ring          - закольцевать ли ссылки
	* возможны 2 варианта настройки:
	yes         - ссылки будут закольцованы, т.к. в блоке "свежих" статей  в последних новостях будут отображены самые первые новости
	no          - ссылки не будут закольцованы, если не будет найдено свежих или предыдущих ссылок, модуль ничего не выведет

	* scan          - глубина сканирования категорий для вывода ссылок
	* возможны 3 варианта сканирования:
	all_cat     - в модуле будут выводиться ссылки на новости из всех категорий
	same_cat    - в модуле будут выводиться ссылки на новости из той же категории, что и текущая
	global_cat  - в модуле будут выводиться ссылки на новости из самой корневой категории для текущей новости
	* параметры same_cat и global_cat не имеет смысла указывать при включенном параметре "Включить поддержку мультикатегорий на сайте"

	* anchor        - принцип вывода анкора ссылки
	* возможны 2 варианта анкора:
	name        - в ссылках будут выведены заголовки новостей
	title       - в ссылках будут выведены title новостей

	* title         - принцип вывода атрибута title ссылки
	* возможны 2 варианта title:
	title       - в title будут выведены title новостей
	name        - в title будут выведены заголовки новостей
	empty       - title останется пустым

	* image         - принцип вывода изображения из новости
	* возможны 3 варианта изображения:
	full_story  - 1-е изображение из полной новости
	short_story - 1-е изображение из краткой новости
	'доп. поле' - название дополнительного поля, в котором находится адрес изображения

	* limit         - количество символов, до которого нужно обрезать полное и краткое опиание статьи при отображении

	* Шаблоны, используемые модулем
	* linkenso.tpl - дефолтный шаблон вывода статьи из списка, поддерживает следующие теги:
	{link}          - выводит ссылку на статью согласно настройкам модуля
	{link-url}      - выводит чистый URL статьи согласно настройкам модуля
	{anchor}        - выводит содержимое анкора согласно настройкам модуля
	{title}         - выводит содержимое title ссылки согласно настройкам модуля
	{short-story}   - выводит краткое содержимое статьи, очщенное от html обрезанное согласно настройкам модуля
	{full-story}    - выводит полное содержимое статьи, очщенное от html обрезанное согласно настройкам модуля
	{image}         - выводит путь (src) до изображения согласно настройкам модуля
	[link][/link]   - блок тегов, между которыми можно разместить любой контент и использовает его в качестве ссылки

	{link-category} - Выводит сылки на все категории, через запятую, к которым принадлежит новость.
	{category}      - Выводит название категории, к которой принадлежит новость.
	{category-icon} - Выводит все иконки категорий, к которым относится новость (если новость принадлежит к 5ти категориям - будет выведено 5 иконок). В папку linkenso текущего шаблона сайта необходимо положить катинку с именем noicon.png
	{category-url}  - Выводит полный URL на категорию, которой принадлежит данная новость.

	[show_image][/show_image] - блок тегов, в которые можно обернуть тег {image}. Содержимое данного блока тегов будет отображаться только в том случае, если будет показано изображение
	[not_show_image][/not_show_image] - блок тегов, в которые можно обернуть тег {image} или любой другой текст. Содержимое данного блока тегов будет отображаться только в том случае, если картинки в новости нет

	*}