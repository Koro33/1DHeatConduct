# Numerical solution of 1-D heat conduction

## 问题叙述

<center>

![problem1](figure/problem1.jpg)

</center>
无限大平壁左侧均匀给定周期性变化的热流波 qτ，右侧给定外侧流体温度恒为 tf。这时左侧面将产生周期性变化的温度波，此温度波与左侧面给定的热流波之间将产生一个相位差 ϕ。

探究此相位差 ϕ 与平板右侧与流体间的对流换热系数 α 间的关系，并对比不同壁厚和材料对关系曲线走势的影响，并给出通过实验测定该相位差从而间接测定对流换热系数的可行性分析。

## 问题分析
这个问题是一个一维非稳态导热问题，左侧给定第二类边界条件，右侧给定第三类边界条件，设材料性质不随温度变化，初始时刻平壁内温度分布为常数。

<div align=center>

![\bg_white \LARGE \left\{\begin{matrix} \frac{\partial \vartheta }{\partial \tau}=\alpha \cdot\frac{\partial ^{2}\vartheta }{\partial x^{2}} \\ -\lambda \left ( \frac{\partial \vartheta}{\partial \tau} \right )_{x=x_{1}}=\dot{q}\left ( \tau \right ) \\ -\lambda \left ( \frac{\partial \vartheta}{\partial \tau} \right )_{x=x_{2}}=\alpha \left ( \vartheta_{U} -\vartheta \right ) \\ \vartheta _{i}^{0}=konst. \end{matrix}\right.](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5CLARGE%20%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%5Cfrac%7B%5Cpartial%20%5Cvartheta%20%7D%7B%5Cpartial%20%5Ctau%7D%3D%5Calpha%20%5Ccdot%5Cfrac%7B%5Cpartial%20%5E%7B2%7D%5Cvartheta%20%7D%7B%5Cpartial%20x%5E%7B2%7D%7D%20%5C%5C%20-%5Clambda%20%5Cleft%20%28%20%5Cfrac%7B%5Cpartial%20%5Cvartheta%7D%7B%5Cpartial%20%5Ctau%7D%20%5Cright%20%29_%7Bx%3Dx_%7B1%7D%7D%3D%5Cdot%7Bq%7D%5Cleft%20%28%20%5Ctau%20%5Cright%20%29%20%5C%5C%20-%5Clambda%20%5Cleft%20%28%20%5Cfrac%7B%5Cpartial%20%5Cvartheta%7D%7B%5Cpartial%20%5Ctau%7D%20%5Cright%20%29_%7Bx%3Dx_%7B2%7D%7D%3D%5Calpha%20%5Cleft%20%28%20%5Cvartheta_%7BU%7D%20-%5Cvartheta%20%5Cright%20%29%20%5C%5C%20%5Cvartheta%20_%7Bi%7D%5E%7B0%7D%3Dkonst.%20%5Cend%7Bmatrix%7D%5Cright.)
</div>


对平壁采用中心差分法进行差分，使用隐式格式(Das implizite Differenzenverfahren von J. Crank und P. Nicolson)






