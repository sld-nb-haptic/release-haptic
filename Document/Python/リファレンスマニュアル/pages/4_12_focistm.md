## 4.12 FociSTMクラス

### 概要
１～8個の単一焦点を生成する時空間変調(STM)を指示する。  

Focus相当の単一焦点の座標リストをあらかじめ指定しておき、  
指定した周波数で順次焦点を発生させる。（リストで指定した座標での焦点発生を繰り返す）  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm.html  
　　　https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/stm/focus.html  

---

### コンストラクタ
| 引数:型| 内容 |
| --- | ---  |
| foci: ( <br>Iterable[ArrayLike] \| <br>Iterable[ControlPoint] \|<br> Iterable[ControlPoints]) | 焦点のリスト |
| config: SamplingConfig \|<br> Freq[float] \|<br> Duration | 周期またはサンプリング設定 |

複数の焦点を発生する場合は、ControlPointsで各焦点毎の焦点リストを指定する。


