## 4.2 Controllerクラス
### 概要
全AUTD3デバイスに対する操作の指示、及び、現在の状態の提供等を行う。  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/controller.html  

---

### 生成
Controllerインスタンスは、Controllerのopenメソッドにより作成する。  

---

### openメソッド
``` rust
pub fn open<D: Into<Device>, F: IntoIterator<Item = D>>( devices: F, link: L, ) 
        -> Result<Self, AUTDDriverError>
```

| 引数/戻り値 | 内容 |
| --- | --- |
| devices | 構成するAUTD3クラスのリスト |
| link | 使用するリンク |
| 戻り値: Controller | Controllerインスタンス |

AUTD3デバイスとの通信を開始し、戻り値としてControllerインスタンスを返す。

通常、引数devicesにはAUTD3型配列を指定する。

AUTD3デバイスが１台構成の例
``` rust
# デバイスリスト
let devices = [ AUTD3 { 
pos: Point3::origin(),
rot: UnitQuaternion::identity(),}
];

# 使用するリンク
let link = … 

# デバイスへの接続(EtherCrabを使用)
let mut autd = Controller::open( devices, link )?;
```

下記の様に２つのAUTD3デバイスを横に並べて設置し、  
EtherCrabリンクを用いる場合の引数は下記の様になる。  
![controller_open](./image//controller_open.png)  

``` rust
# デバイスへの接続(EtherCrabを使用)
autd = Controller.open(
            [ # AUTD3ボードの指定
                AUTD3(pos=[0.0, 0.0, 0.0], rot=[1, 0, 0, 0]), # １枚目のボードの位置と向き
　　　　　　　　AUTD3( pos=[AUTD3.DEVICE_WIDTH, 0.0, 0.0 ], rot=[1, 0, 0, 0] ) # ２枚目
            ],
            EtherCrab( 
                err_handler=err_handler, # エラー発生時の処理関数指定
                option=EtherCrabOption() # デフォルトオプション
            ) 
        )
```

---

### closeメソッド
``` rust
pub fn close(self) -> Result<(), AUTDDriverError>
```
| 引数/戻り値 | 内容 |
| --- | --- |
| 引数なし |
| 戻り値なし |

AUTD3デバイスとの通信を終了する。

---

### sendメソッド
``` rust
pub fn send<'a, D: Datagram<'a>>( &'a mut self, s: D, ) -> Result<(), AUTDDriverError>
```
| 引数/戻り値 | 内容 |
| --- | --- |
| d | 送信するデータ(指示) |
| 戻り値 | なし |

AUTD3デバイスにデータ(各種指示)を送信する。  

引数には下記のデータ(クラス)を指定する。  
| 送信できるデータ(クラス)| 内容 |
| --- | ---  |
| Bessel| ベッセルビームGain指示 |
| FociSTM| 単一焦点～8焦点までをサポートするSTM指示 |
| Focus| 単焦点Gain指示 |
| GainSTM| 任意GainをサポートするSTM指示 |
| Group| AUTD3デバイスのグループ設定 |
| Null| ゼロ振幅Gain指示 |
| Plane| 平面波Gain指示 |
| Silencer| サイレンサ指示 |
| Uniform| 全振動子への同一位相/振幅指示 |


引数値を2要素タプルにすることにより、二つのデータを同時に送信することができる。
``` rust
// 単一焦点の位相制御指示を生成
let g = Focus {
	pos: autd.center() + Vector3::new( 0., 0., 150.0 * mm ),
	option: FocusOption::default()
};

// Sin波形の変調制御指示を生成
let m = Sine {
	freq: 150 * Hz,
	option: SineOption::default()
};

// 位相制御と変調制御を送信(動作開始)
autd.send( (m, g) )?;
```

---

### firmware_versionメソッド
``` rust
pub fn firmware_version( &mut self, ) -> Result<Vec<FirmwareVersion>, AUTDDriverError>
```
| 引数/戻り値| 内容 |
| --- | ---  |
| 引数なし|  |
| 戻り値| AUTD3デバイス毎のファームウェア情報 |

戻り値としてAUTD3デバイスのファームウェアバージョンのリストを返す。

---

### senderメソッド
``` rust
pub fn sender(&mut self, option: SenderOption) -> Sender<'_, L, StdSleeper>
```
| 引数/戻り値| 内容 |
| --- | ---  |
| option | 送信設定 |
| 戻り値 | Senderインスタンス |

指定された送信設定が適用された送信管理を返す。

送信設定(SenderOption)には、下記を指定する。
| 引数:型| 内容 |
| --- | ---  |
| send_interval | 送信間隔 |
| receive_interval | 受信間隔 |
| timeout | タイムアウト時間 |
| parallel | パラレルモード |

---

### centerメソッド/num_deveicesメソッド/num_transducersメソッド
``` rust
pub fn num_devices(&self) -> usize
pub fn num_transducers(&self) -> usize
pub fn center(&self) -> OPoint<f32, Const<3>>
```
現在のデバイス状態を返す。詳細はGeometryクラスの同名メソッドを参照。

---

### fpga_stateメソッド
``` rust
pub fn fpga_state(&mut self) -> Result<Vec<Option<FPGAState>>, AUTDDriverError>
```
| 引数/戻り値| 内容 |
| --- | ---  |
| なし|  |
| 戻り値 | Senderインスタンス |

AUTD3デバイス(FPGA)の状態を取得する。

このメソッドを呼び出す前に、ReadsFPGAStateを送信し、状態取得を有効化しておく必要がある。
``` rust
　　let mut autd = Controller::open([AUTD3::default()], Nop::new())?;
    autd.send(ReadsFPGAState::new(|_| true))?;
    let states = autd.fpga_state()?;
```
