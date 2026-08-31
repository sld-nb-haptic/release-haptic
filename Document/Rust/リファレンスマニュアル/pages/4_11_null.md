## 4.11 Nullクラス

### 概要
振幅を発生させない。  

Gainクラスを継承する。  

Null()を送信すると振幅が発生しなくなるため、出力が停止した状態となる。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm/gain.html  

---

### 生成
``` rust
pub struct Null;
```
| 引数:型 | 内容 |
| --- | --- |
| なし |

振幅なしの位相制御を生成する。
