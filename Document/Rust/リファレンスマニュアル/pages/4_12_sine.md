## 4.12 Sineクラス/SineOptionクラス

### 概要
正弦波のAM変調を指示する。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation/sine.html  


### 生成

#### Sineクラス
``` rust
pub struct Sine<S: Into<SamplingMode> + Clone + Copy + Debug> {
    pub freq: S,
    pub option: SineOption,
}
```
| 引数 | 内容 |
| --- | ---  |
| freq | 周波数 |
| option | オプション |

正弦波振幅制御を生成する。


---

#### SineOptionクラス
``` rust
pub struct SineOption {
    pub intensity: u8,
    pub offset: u8,
    pub phase: Angle,
    pub clamp: bool,
    pub sampling_config: SamplingConfig,
}
```
| 引数 | 内容 |
| --- | ---  |
| intensity | 振幅 |
| offset | オフセット(DC成分) |
| phase | 位相オフセット |
| clamp | true時、波形が[0,255]範囲になる様に補正される。false時は、エラーとなる。 |
| sampling_config | サンプリング設定 |

正弦波振幅制御のオプション値を指定する。

---

### Sineクラス : into_nearestメソッド
``` rust
impl Sine<Freq<f32>>
pub const fn into_nearest(self) -> Sine<Nearest>
```
| 引数 | 内容 |
| --- | ---  |
| 戻り値 | 補正されたSine振幅制御 |

出力不可能な周波数を指定した場合、実行時にエラーが発生する。  
into_nearest()メソッドを使用すると出力可能な周波数に最も近い周波数に補正することができる。
``` rust
Sine { freq=150.0 * Hz, option=SineOption() }.into_nearest();
```

出力波形は下記波形となる。  　
```math
\lfloor
\frac{intensity}{2} \times \sin{(2\pi \times freq \times t + phase)} + offset
\rfloor
```
