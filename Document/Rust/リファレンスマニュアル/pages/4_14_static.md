## 4.14 Staticクラス

### 概要
AM変調を行わないことを指示する。  

AM変調を行わない場合、焦点位置等の変化がないと触感が発生しない。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/modulation/static.html  

---

### 生成
``` rust
pub struct Static {
    pub intensity: u8,
}
```
| 引数 | 内容 |
| --- | --- |
| intensity | 振幅 |

振幅なしの振幅制御を生成する。
