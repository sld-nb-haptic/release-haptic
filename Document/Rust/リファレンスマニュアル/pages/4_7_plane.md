## 4.7 Planeクラス/PlaneOptionクラス

### 概要
平面波を出力させる。  
（一点ではなく全体に触覚を発生させる）

Gainクラスを継承する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/plane.html

---

### コンストラクタ
#### Focusクラス
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
| direction | 平面波の方向(法線ベクトル) |
| option | オプション |

平面波位相制御を生成する。


---

#### PlaneOptionクラス
``` rust
#[repr(C)]pub struct BesselOption {
    pub intensity: Intensity,
    pub phase_offset: Phase,
}
```
| 引数 | 内容 |
| --- | ---  |
| intensity | 出力振幅 |
| phase_offset | 位相オフセット |

正弦波位相制御のオプション値を指定する。
