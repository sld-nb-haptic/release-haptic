## 4.8 Silencerクラス

### 概要
振幅変調に伴う可聴音の発生を抑えるSilencer機能の動作を指示する。

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/silencer.html

---

### コンストラクタ

| 引数:型| 内容 |
| --- | ---  |
| config: T
T: (FixedCompletionSteps, 
FixedCompletionTime, 
FixedUpdateRate)| モード指定。
省略時は FixedCompletionSteps |

引数には以下の何れかを指定できる。

| Silencerモード指定| 内容 |
| --- | ---  |
| FixedCompletionSteps( <br> intensity : c_uint16,<br> phase : c_uint16,<br> strict : ctypes.c_bool )  |  |
| FixedCompletionTime( <br> intensity : c_uint16,<br> phase : c_uint16,<br> strict : ctypes.c_bool ) | 位相/振幅変化が完了するまで時間がすべての振動子で同一のモード |
| FixedUpdateRate( <br> intensity : c_uint16,<br> phase : c_uint16 ) | 位相/振幅変化速度がすべての振動子で同一のモード |

---

### disableメソッド(@staticmethod)
・	Silencer動作を無効にする。

``` python
autd = Controller.open( 略 )

autd.send( Silencer() )		# Silencer有効

autd.send( Silencer.disable() )	# Silencer無効

```
