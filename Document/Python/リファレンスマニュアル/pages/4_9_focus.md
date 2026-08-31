## 4.9 Focusクラス/FocusOptionクラス

### 概要
単一焦点を生成する。  
（空間上の一点に触覚を発生させる）

Gainクラスを継承する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/focus.html

---

### コンストラクタ
#### Focusクラス
| 引数:型| 内容 |
| --- | ---  |
| pos: ArrayLike| 焦点を発生させる座標 [x,y,z] |
| option: FocusOption| オプション |

---

#### FocusOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| intensity: Intensity| 出力振幅 |
| phase_offset: Phase| 位相オフセット |
