## 4.16 Squareクラス/SquareOptionクラス

### 概要
矩形波のAM変調を指示する。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation/square.html  

---

### コンストラクタ
#### Squareクラス
| 引数:型| 内容 |
| --- | ---  |
| freq: Freq[T]| 周波数
 |
| option: SquareOption| オプション |

---

#### SquareOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| low : int| 低レベル値 |
| high : int| 高レベル値 |
| duty : float| デューティー比 |
| sampling_config:<br>SamplingConfig| サンプリング設定 |


出力不可能な周波数を指定した場合、実行時にエラーが発生する。  
into_nearest()メソッドを使用すると出力可能な周波数に最も近い周波数に補正することができる。

```
Square (freq=150.0 * Hz, option=Square ()).into_nearest()
```
