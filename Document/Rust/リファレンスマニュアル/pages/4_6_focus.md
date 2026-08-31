## 4.6 Focusクラス/FocusOptionクラス

### 概要
単一焦点を生成する。  
（空間上の一点に触覚を発生させる）

Gainクラスを継承する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/gain/focus.html

---

### 生成

---

#### Focusクラス
``` rust
pub struct Focus {
    pub pos: Point3,
    pub option: FocusOption,
}
```
| 引数:型| 内容 |
| --- | ---  |
| pos | 焦点を発生させる座標 [x,y,z] |
| option | オプション |

単一焦点の位相制御を生成する。


---

#### FocusOptionクラス
``` rust
#[repr(C)]pub struct FocusOption {
    pub intensity: Intensity,
    pub phase_offset: Phase,
}
```
| 引数:型| 内容 |
| --- | ---  |
| intensity | 出力振幅 |
| phase_offset | 位相オフセット |

単一焦点位相制御のオプション値を指定する。
