## 4.10 Planeクラス/PlaneOptionクラス

### 概要
平面波を出力させる。  
（一点ではなく全体に触覚を発生させる）

Gainクラスを継承する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/plane.html

---

### コンストラクタ
#### Focusクラス
| 引数:型| 内容 |
| --- | ---  |
| direction: ArrayLike| 平面波の方向(法線ベクトル) |
| option: PlaneOption| オプション |

---

#### PlaneOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| intensity: Intensity| 出力振幅 |
| phase_offset: Phase| 位相オフセット |
