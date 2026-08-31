## 4.13 Squareクラス/SquareOptionクラス

### 概要
矩形波のAM変調を指示する。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation/square.html  


### 生成

#### Squareクラス
``` rust
pub struct Square<S: Into<SamplingMode> + Clone + Copy + Debug> {
    pub freq: S,
    pub option: SquareOption,
}
```
| 引数 | 内容 |
| --- | ---  |
| freq | 周波数 |
| optio | オプション |

矩形波振幅制御を生成する。

出力不可能な周波数を指定した場合、実行時にエラーが発生する。  
into_nearest()メソッドを使用すると出力可能な周波数に最も近い周波数に補正することができる。

```
Square (freq=150.0 * Hz, option=Square ()).into_nearest()
```

---

#### SquareOptionクラス
``` rust
pub struct SquareOption {
    pub low: u8,
    pub high: u8,
    pub duty: f32,
    pub sampling_config: SamplingConfig,
}
```
| 引数 | 内容 |
| --- | ---  |
| low | 低レベル値 |
| high | 高レベル値 |
| duty | デューティー比 |
| sampling_config | サンプリング設定 |

矩形波振幅制御のオプション値を指定する。

