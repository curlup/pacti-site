#coding:utf8
import os


XSL_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "xsl"))
XML_root = os.path.normpath(os.path.join(os.path.dirname(__file__), "../xml"))
apply_xsl = True

graphs_names = (u'Светофор', u'Frontik 95')

data = ( 
(u"Среднее по всем проектам",	87,  125,  91,  90,  93), 
(u"Главная", 			108, 126, 109, 110, 114),

(u"Поиск вакансий",		95 , 122,  97,  99, 107),
(u"Вакасия",			94 , 124,  96,  98, 106),
(u"Работодатель",		115, 123, 116, 117, 121),
(u"Отклики под соискателем",	152, 153, 154, 155, 274),

(u"Просмотр резюме",		267, 170, 171, 172, 275),
(u"Поиск резюме",		375, 376, 377, 378, 379),
(u"Расширенный поиск резюме",	381, 382, 383, 384, 385),
(u"Список вакансий под работодателем",
				371, 370, 369, 368, 372),
(u"Отклики под работодателем",	254, 266, 264, 262, 252),
(u"Отобранные под работодателем",
				386, 387, 388, 389, 390),

)

data = ( 
(u"Среднее по всем проектам",	87,  90), 
(u"Главная", 			108, 110),

(u"Поиск вакансий",		95 , 99),
(u"Вакансия",			94 , 98),
(u"Работодатель",		115, 117),
(u"Отклики под соискателем",	152, 155),

(u"Просмотр резюме",		267, 172),
(u"Поиск резюме",		375, 378),
(u"Расширенный поиск резюме",	381, 384),
(u"Список вакансий под работодателем",
				371, 368),
(u"Отклики под работодателем",	254, 262),
(u"Отобранные под работодателем",
				386, 389),

)

pactid = {}