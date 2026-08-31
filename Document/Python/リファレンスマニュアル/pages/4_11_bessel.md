## 4.11 Besselクラス/BesselOptionクラス

### 概要
ベッセルビームを生成する。  
（Focusの様な一点ではなく、直線状の触覚を発生させる）  

Gainクラスを継承する。  

参照： https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/bessel.html

---

### コンストラクタ

#### Besselクラス
| 引数:型| 内容 |
| --- | ---  |
| apex: ArrayLike| ビーム仮想円錐の頂点（振動子面の位置） |
| direction: ArrayLike| ビームの方向（触覚を有無直線の向き） |
| option: PlaneOption| オプション |

---

#### BesselOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| intensity: Intensity| 出力振幅 |
| phase_offset: Phase| 位相オフセット |
