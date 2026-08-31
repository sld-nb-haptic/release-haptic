# 4. クラス/メソッド詳細
## 4.1 クラス/メソッド一覧

AUTD3用ライブラリで提供されているクラス/メソッド/定数の一覧を下記に示す。

---

### autd3クレート

| クラス | メソッド(空白は定数等) | 概要 |
| --- | --- | --- |
| [Controller](./4_2_controller.md) | open | AUTD3デバイスの接続 |
| | open_with | オプションを指定してのAUTD3デバイス接続 |
| | sender | AUTD3デバイス送信(リンク)取得 |
| | sender_with_sleeper | 待機機構を指定してAUTD3デバイス送信取得 |
| | send | AUTD3デバイスへ送信 |
| | inspect | 検査結果取得 |
| | close | AUTD3デバイスの切断 |
| | firmware_version | AUTD3デバイスのファームウェアバージョン取得 |
| | fpga_state | AUTD3デバイスのfpga状態取得 |
| | into_boxed_link | ボックス化したリンクを取得 |
| | from_boxed_link | ボックス化したリンクからControllerを取得 |
| [AUTD3](./4_3_autd3.md) | | AUTD3デバイス定義 |
| [Geometry](./4_4_geometry.md) | num_devices | 構成内のAUTD3デバイスの数取得 |
| | num_transducers | 構成内の振動子の数取得 |
| | center | 構成内の中心座標取得 |
| | reconfigure | 再構成 |
| [Device](./4_4_geometry.md) | idx | インデックス取得 |
| | num_transducers | 振動子の数取得 |
| | rotation | 回転情報取得 |
| | center | デバイスの中心座標取得 |
| | x_direction | X方向取得 |
| | y_direction | Y方向取得 |
| | axial_direction | 軸方向種痘k |
| [Transducer](./4_4_geometry.md) | idx | インデックス取得 |
| | dev_idx | 所属するAUTD3デバイスのインデックス取得 |
| | position | 位置取得 |
| [Silencer](./4_5_silencer.md) | | 消音制御 |
| [Focus](./4_6_focus.md) | pos | 焦点位置 |
| | option | オプション |
| [FocusOption](./4_6_focus.md) | intensity | 強度 |
| | phase_offset | 位相オフセット |
| [Plane](./4_7_plane.md) | dir | 方向 |
|  | option | オプション |
| [PlaneOption](./4_7_plane.md) | intensity | 強度 |
|  | phase_offset | 位相オフセット |
| [Bessel](./4_8_bessel.md) | apex | ビームの頂点 |
| | dir | ビームの方向 |
| | theta | ビームに垂直な平面と仮想円数側面との角度 |
| | option | オプション |
| [BesselOption](./4_8_bessel.md) | intensity | 強度 |
| | phase_offset | 位相オフセット |
| [FociSTM](./4_9_focistm.md) | | １～8個の単一焦点を生成する時空間変調(STM) |
| [GainSTM](./4_10_gainstm.md) | | 任意のGainを扱う時空間変調(STM) |
| [Null](./4_11_null.md) | | なにも出力しない位相制御|
| [Sine](./4_12_sine.md) | freq | 周波数 |
| | option | オプション |
| | into_nearest | 出力できる最も近い周波数に変換 |
| [SineOption](./4_12_sine.md) | intensity | 強度 |
| | offset | オフセット |
| | phase | 位相 |
| | clamp | クランプ設定 |
| | sampling_config | サンプリング構成 |
| [Square](./4_13_square.md) | freq | 周波数 |
| | option | オプション |
| | into_nearest | 出力できる最も近い周波数に変換 |
| [SquareOption](./4_13_square.md) | low | 変調低値 |
| | high | 変調高値 |
| | duty | デューティ比 |
| | sampling_config | サンプリング構成 |
| [Static](./4_14_static.md) | intensity | 強度 |


<br>

---

### autd3_link_ethercrabクレート

| クラス | メソッド(空白は定数等) | 概要 |
| --- | --- | --- |
| [EtherCrab](./4_15_ethercrab.md) | new | 新規作成 |
| | with_runtime | Tokioランタイムを指定しての新規作成 |
| | open | 接続開始 |
| | close | 接続終了 |
| | alloc_tx_buffer | 送信バッファ確保 |
| | send | データ送信 |
| | receive | メッセージ受信 |
| | is_open | 接続状態取得 |
| | ensure_is_open | 接続状態確認 |
| [EtherCrabOption](./4_15_ethercrab.md) | ifname | ネットワークインターフェース名 |
| | state_check_period | 状態を確認する間隔 |
| | sync0_period | sync0期間 |
| | sync_timeout | 同期タイムアウト値 |
| | sync_tolerance | 同期許容時間 |
