# sympy

## 概述

> 计算机代数系统（CAS）是一种数学软件，能够以类似于数学家和科学家的传统手动计算方式来处理数学表达式。

> sympy是一个Python的科学计算库，用一套强大的符号计算体系完成诸如多项式求值、求极限、解方程、求积分、微分方程、级数展开、矩阵运算等问题。

## 安装

```bash
pip install sympy
```

## Rational值

sympy具有用于处理有理数的`Rational`

```python
from sympy import *

r1 = Rational(1/10)
r2 = Rational(1/10)
r3 = Rational(1/10)

val1 = (r1 + r2 + r3) * 3
print(val1.evalf())

val2 = (1/10 + 1/10 + 1/10) * 3
print(val2)

```

## pprint

`pprint()`用于在控制台上漂亮地打印输出。LaTex可以达到最佳效果，例如在`Jupyter`中

```py
from sympy import *

init_printing(use_unicode=True)

x = Symbol('x')

a = sqrt(2)
pprint(a)
print(a)

print('----------')

c = (exp(x) ** 2) / 2
pprint(c)
print(c)

```

## 表达式

化简

```python
import sympy as sp
sp.init_printing()

f = (x**2 - x - 6) / (x**2 - 3*x)
sp.simplify(f)
```

展开

```python
import sympy as sp
sp.init_printing()

f = (x+1)**3 * (x-2)**2
sp.expand(f)
```

因式

```python
import sympy as sp
sp.init_printing()

f = 3*x**4 - 36*x**3 + 99*x**2 - 6*x -144
sp.factor(f)
```

## 解方程

用`solve()`或`solveset()`求解方程

```python
from sympy import *

x = Symbol('x')
sol = solve(x**2 - x, x)
print(sol)

```

`solve()`的第一个参数是公式，第二个参数是我们需要解决的符号

```py
from sympy import *

x = Symbol('x')
sol = solveset(x**2 - 1, x, Interval(0, 100))
print(sol)
```

`solveset()`的第三个参数可以指定间隔

```python
import sympy as sp
sp.init_printing()

y = sp.Eq(x**3+15*x**2, 3*x-10)
z = sp.solve(y, x)
z
```

方程组

```python
import sympy as sp
sp.init_printing()

x,y,z = sp.symbols('x,y,z')
eq1 = sp.Eq(x+y+z, 0)
eq2 = sp.Eq(2*x-y-z, 10)
eq3 = sp.Eq(y+2*z, 5)
sp.solve([eq1, eq2, eq3], [x, y, z])
```

微分方程

```python
import sympy as sp
sp.init_printing()

f = sp.Function('f')
y = sp.dsolve(sp.Derivative(f(x), x)-x*sp.cos(x), f(x))
y
```

## 极限

```python
from sympy import *
from sympy.abc import x

l1 = limit(1/x, x, oo)
print(l1)

l2 = limit(1/x, x, 0)
print(l2)
```

## 求导

```python
import sympy as sp
sp.init_printing()

y = (sp.sin(x))**2 * sp.exp(2*x)
z = sp.diff(y, x)
z.subs(x, 3.3)
```

## 积分

```python
import sympy as sp
sp.init_printing()

f = x**2 * sp.sin(x**2)
g = sp.integrate(f, (x, 0, 5))
```

## 绘图

sympy包含用于绘图的模块，它基于Matplotlib构建

绘制`1/x`的图像

```python
import sympy
from sympy.abc import x
from sympy.plotting import plot

plot(1/x)

```

## 参考资料

[https://geek-docs.com/python/python-tutorial/python-sympy.html](https://geek-docs.com/python/python-tutorial/python-sympy.html)

[Sympy教程 | 半小时学会Python符号计算，求导积分都不用手算了！](https://www.bilibili.com/video/BV1QC4y1s7t2)