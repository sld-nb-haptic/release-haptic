## 4.4 Geometryクラス/Devieクラス/Transducerクラス

### 概要
これらのクラスはAUTD3デバイスを構成する要素の状態等について管理する。  

ユーザプログラムで生成することはなく、現在の状態をControllerクラスが提供する。  

ControllerクラスはGeometryクラスを継承している。  


---

### Geometryクラス : centerメソッド
``` rust
pub fn center(&self) -> OPoint<f32, Const<3>>
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 中心座標[x,y,z] |

戻り値として空間(全AUTD3デバイス)の中心位置を返す。

---

### Geometryクラス : num_devicesメソッド
``` rust
pub fn num_devices(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし|  |
| 戻り値:int| AUTD3デバイスの数 |

・	戻り値としてAUTD3デバイスの数を返す。


---

### Geometryクラス : num_transducersメソッド
``` rust
pub fn num_transducers(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 振動子の数 |

戻り値として全振動子の数を返す。  
個々のAUTD3デバイスの振動子数を取得するには、  
Deviceクラスのnum_transducersメソッドを使用する。


---

### Deviceクラス : axial_directionメソッド
``` rust
pub const fn axial_direction(&self) -> UnitVector3
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし|  |
| 戻り値 | デバイスの軸方向ベクトル |

デバイスの軸方向ベクトル (振動子が向く方向)を返す。


---

### Deviceクラス : centerメソッド
``` rust
pub const fn center(&self) -> Point3
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし|  |
| 戻り値 | 中心座標 |

戻り値として、デバイスの中心位置を返す。  
（Geometryのcenterメソッドは、全てのデバイスを合わせた空間の中心位置を返すが、Deviceのcenterメソッドは、各デバイスの中心位置を返す）

---

### Deviceクラス : idxメソッド
``` rust
pub const fn idx(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 中心座標 |

戻り値として、デバイスのインデックスを表す数値を返す。


---

### Deviceクラス : num_transducersメソッド
``` rust
pub const fn num_transducers(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 振動子の数を取得 |

戻り値として、デバイスの回転ベクトルを返す。


---

### Deviceクラス : rotationメソッド
``` rust
pub const fn rotation(&self) -> UnitQuaternion
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 回転ベクトル |

戻り値として、デバイスの回転ベクトルを返す。


---

### Deviceクラス : x_directionメソッド/ y_directionメソッド
``` rust
pub const fn x_direction(&self) -> UnitVector3
pub const fn y_direction(&self) -> UnitVector3
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | デバイスのX/Y方向ベクトル |

戻り値として、デバイスのX方向ベクトル、又は、Y方向ベクトルを返す。


---

### Transducerクラス : dev_idxメソッド
``` rust
pub const fn dev_idx(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 所属するデバイスのインデックス |

戻り値として、振動子が所属するデバイスのインデックスを返す。


---

### Transducerクラス : idxメソッド
``` rust
pub const fn idx(&self) -> usize
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 振動子のインデックス |

戻り値として、デバイス内の振動子インデックス値を返す。


---

### Transducerクラス : positionメソッド
``` rust
pub const fn position(&self) -> Point3
```
| 引数/戻り値 | 内容 |
| --- | ---  |
| 引数なし |  |
| 戻り値 | 振動子の位置 |

戻り値として、振動子の位置を返す。
