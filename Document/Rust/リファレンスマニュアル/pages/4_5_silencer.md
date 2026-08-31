## 4.5 Silencerクラス

### 概要
振幅変調に伴う可聴音の発生を抑えるSilencer機能の動作を指示する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/silencer.html

---

### defaultメソッド
``` rust
fn default() -> Silencer<FixedCompletionSteps>
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | デフォルト値 |

デフォルトモード(FixedCompletionTime)のSilencerを返す。


---

### disableメソッド
``` rust
impl Silencer<FixedCompletionSteps>
    pub const fn disable() -> Silencer<FixedCompletionSteps>
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 消音効果を解除するSilencer |

Silencer動作を行わないSilencerを返す。
``` rust
let mut autd = Controller.open( 略 )

autd.send( Silencer() )		# Silencer有効

autd.send( Silencer.disable() )	# Silencer無効
```
