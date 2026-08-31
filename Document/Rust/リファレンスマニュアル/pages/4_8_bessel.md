## 4.8 Besselクラス/BesselOptionクラス

### 概要
ベッセルビームを生成する。  
（Focusの様な一点ではなく、直線状の触覚を発生させる）  

Gainクラスを継承する。  

参照： https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/bessel.html


### 生成

#### Besselクラス
``` rust
pub struct Bessel {
    pub apex: Point3,
    pub dir: UnitVector3,
    pub theta: Angle,
    pub option: BesselOption,
}
```
| 引数 | 内容 |
| --- | ---  |
| apex | ビーム仮想円錐の頂点（振動子面の位置） |
| direction | ビームの方向（触覚を有無直線の向き） |
| option | オプション |

ベッセルビームの位相制御を生成する。


---

#### BesselOptionクラス
``` rust
#[repr(C)]pub struct BesselOption {
    pub intensity: Intensity,
    pub phase_offset: Phase,
}
```
| 引数:型| 内容 |
| --- | ---  |
| intensity: Intensity| 出力振幅 |
| phase_offset: Phase| 位相オフセット |

ベッセルビーム位相制御のオプションを指定する。
