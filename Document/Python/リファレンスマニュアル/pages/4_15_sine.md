## 4.15 Sineクラス/SineOptionクラス

### 概要
正弦波のAM変調を指示する。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation/sine.html  

---

### コンストラクタ
#### Sineクラス
| 引数:型| 内容 |
| --- | ---  |
| freq: Freq[T]| 周波数
 |
| option: SineOption| オプション |

---
#### SineOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| intensity: int| 振幅 |
| offset: int| オフセット(DC成分) |
| phase: Angle| 位相オフセット |
| clamp: bool| true時、波形が[0,255]範囲になる様に補正される。false時は、エラーとなる。 |
| sampling_config:<br> SamplingConfig| サンプリング設定 |

出力不可能な周波数を指定した場合、実行時にエラーが発生する。  
into_nearest()メソッドを使用すると出力可能な周波数に最も近い周波数に補正することができる。

出力波形は下記波形となる。  　
```math
\lfloor
\frac{intensity}{2} \times \sin{(2\pi \times freq \times t + phase)} + offset
\rfloor
```
