# matlabs
**Лаборная работа №2. Тип: вариант 1. Условия: вариант 16.**

Для построения аналитического решения пользуемся [Wolfram Mathematica](http://www.wolfram.com/mathematica/) и ["analytic.nb"](analytic.nb).

##Условие задачи

Исходное уравнение:
```
u_tt = u_xx - 24x + 12t - 2
```
Начальные условия:
```
u(0, t) = 3t^3 - 2t^2 + 3t + 2
u(x, 0) = 3x^3 - x^2 - 3x + 2               
u_t(x, 0) = 3x^2 - x + 3
```
                 
Аналитическое решение: 
```
u(x,t) = 2 + 3*t^3 - 3*x - x^2 + 3*x^3 - t^2*(2 + 3*x) + t*(3 - x + 3*x^2)
```

##Программа
Запуск программы осуществляется с помощью файла ["t071602.m"](t071602.m). В результате чего появляются следующие окна:
* Поверхности точного и приближённого решений
* Линии уровня точного и приближённого решений
* Линии уровня абсолютной и относительной погрешности
* Анимация решения
