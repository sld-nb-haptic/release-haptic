## 4.10 GainSTMクラス/GainSTMOptionクラス

### 概要
任意のGainを扱う時空間変調(STM)を指示する。  

単一焦点(Focus)だけでなく様々なGain(BesselやPlane等)を一定時間毎に繰り返す触感を発生させる。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm/gain.html  


### 生成

### GainSTMクラス
``` rust
pub struct GainSTM<T, C> {
    pub gains: T,
    pub config: C,
    pub option: GainSTMOption,
}
```
| 引数 | 内容 |
| --- | ---  |
| gains | Gainのリスト |
| config | 周期またはサンプリング設定 |
| option | オプション |

複数GainのSTMを生成する。


---

#### GainSTMOptionクラス
``` rust
#[repr(C)]pub struct GainSTMOption {
    pub mode: GainSTMMode,
}
```
| 引数 | 内容 |
| --- | ---  |
| mode | GainSTMモード指定 |


GainSTMでは位相と振幅のデータを事前に送っておく必要があり、  
送信に時間がかかることで遅延が発生する可能性がある。  
この為、データ送信時間を短縮させるためのGainSTMモードを指定できる。  

GainSTMモードには、下記の何れかを指定できる。  
| GainSTMモード | 内容 |
| --- | ---  |
| PhaseIntensityFull | 振幅/位相データをすべて送信 |
| PhaseFull | 位相データのみを送信 |
| PhaseHalf | 位相を4bitに圧縮して送信 |
