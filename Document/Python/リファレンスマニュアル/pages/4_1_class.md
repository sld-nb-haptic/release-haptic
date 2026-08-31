# 4. クラス/メソッド詳細
## 4.1 クラス/メソッド一覧

AUTD3用ライブラリで提供されているクラス/メソッド/定数の一覧を下記に示す。

pyautd3パッケージ

| クラス | メソッド(空白は定数等) | 概要 |
| --- | --- | --- |
| [AUTD3](./4_3_autd3.md) | \_\_init__ | AUTD3デバイス定義 |
| [Bessel](./4_11_bessel.md) | \_\_init__ | ベッセルビームGain指示 |
| [BesselOption](4_11_bessel.md) | \_\_init__ | ベッセルビームGainオプション |
| Clear | \_\_init__	|  |
| [Controller](./4_2_controller.md) | \_\_init__ | 全体の動作管理 |
|  | center | 全振動子の中心座標を取得 |
|  | close | 切断 |
|  | firmware_version | AUTD3デバイスのバージョンを取得 |
|  | fpga_state | FPGA状態を取得 |
|  | geometry | AUTD3デバイスの配置情報を取得 |
|  | link | 使用されるLink指定を取得 |
|  | num_devices | AUTD3デバイスの数を取得 |
|  | num_transducers | 全振動子の数を取得 |
|  | open | 接続 |
|  | open_with_option | オプションを指定しての接続 |
|  | send | AUTD3デバイスへの指示送信 |
|  | sender | 送信時の設定を取得 |
| Custom | \_\_init__ | 自由な音場Gain指示 |
| ControlPoint | \_\_init__ | FociSTMでの焦点座標情報 |
| ControlPoints | \_\_init__ | FociSTMでの焦点座標情報リスト |
| DcSysTime | \_\_init__ | GPIO出力項目SysTimeEqで指定する時間 |
| | sys_time | 時刻の取得 |
| [Device](./4_4_geometry.md) | \_\_init__ | AUTD3デバイス１枚の情報 |
|  | axial_direction | AUTD3デバイスの軸方向ベクトル (振動子が向く方向) |
|  | center | 振動子の中心座標を取得 |
|  | idx | AUTD3デバイスのインデックスを取得 |
|  | num_transducers | AUTD3デバイス内の振動子の数を取得 |
|  | rotation | AUTD3デバイスの回転 |
|  | x_direction | AUTD3デバイスのｘ方向ベクトル |
|  | y_direction | AUTD3デバイスのｙ方向ベクトル |
| Drive | \_\_init__ |   |
| Duration | \_\_init__ | 時間間隔の指定 |
|  | as_micros | μ秒単位での時間間隔を取得 |
|  | as_millis | ミリ秒単位での時間間隔を取得 |
|  | as_nanos | ナノ秒単位での時間間隔を取得 |
|  | as_secs | 秒単位での時間間隔を取得 |
|  | from_micros | μ秒単位での時間間隔指定 |
|  | from_millis | ミリ秒単位での時間間隔指定 |
|  | from_nanos | ナノ秒単位での時間間隔指定 |
|  | from_secs | 秒単位での時間間隔指定 |
| EulerAngles | \_\_init__ | オイラー角の指定 |
|  | XYZ | X-Y-Zオイラー角の指定 |
|  | ZYZ | Z-Y-Zオイラー角の指定 |
| FixedCompletionTime | \_\_init__ | Fixed completion timeモードのSilencer設定 |
| FixedUpdateRate | \_\_init__ | Fixed update rateモードのSilencer設定 |
| [FociSTM](./4_12_focistm.md) | \_\_init__ | 単一焦点～8焦点までをサポートするSTM指示 |
|  | into_nearest | 最近値の取得 |
|  | sampling_config | サンプリング設定の取得 |
| [Focus](./4_9_focus.md) | \_\_init__ | 単焦点Gain指示 |
| [FocusOption](./4_9_focus.md) | \_\_init__ | 単焦点Gainオプション |
| ForceFan | \_\_init__ | 強制ファン動作指示 |
| GainGroup | \_\_init__ | 振動子別指定Gain指示 |
| [GainSTM](./4_13_gainstm.md) | \_\_init__ | 任意GainをサポートするSTM指示 |
|  | into_nearest | 最近値の取得 |
|  | sampling_config | サンプリング設定の取得 |
| [GainSTMMode](./4_13_gainstm.md) |   | GainSTMのデータ転送方式 |
| [GainSTMOption](./4_13_gainstm.md) | \_\_init__ | GainSTMオプション |
| [Geometry](./4_4_geometry.md) | \_\_init__ | AUTD3デバイスの配置情報 |
|  | center | 振動子の中心座標を取得 |
|  | num_devices | AUTD3デバイスの数を取得 |
|  | num_transducers | 全振動子の数を取得 |
|  | reconfigure |  |
| GPIOIn | | GPIO入力ピンの番号 |
| GPIOOut |  | GPIO出力ピンの番号 |
| GPIOOutputs | \_\_init__ | GPIO出力指定指示 |
| GPIOOutputType |  | GPIO出力種別 |
| GPIOOutputType | BaseSignal | 基準信号 (超音波と同じ周波数のDuty比50%矩形波) |
|  | Direct | 指定した値を出力する |
|  | ForceFan | ForceFanフラグがアサートされているかどうか |
|  | IsStmMode | FociSTM/GainSTMが使用されているかどうか |
|  | ModIdx | Modulationのインデックスが指定した値のときにHighになる |
|  | ModSegment | Modulationのセグメント |
|  | PwmOut | 指定した振動子のPWM出力 |
|  | StmIdx | STMのインデックスが指定した値のときにHighになる |
|  | StmSegment | STMのセグメント |
|  | Sync | EtherCAT同期信号 |
|  | SyncDiff | システム時間の補正中にHighになる |
|  | SysTimeEq | 指定したシステム時間の間Highになる |
|  | Thermo | 温度センサーがアサートされているかどうか |
| Group | \_\_init__ | AUTD3デバイスのグループ設定 |
| Intensity | \_\_init__ | 出力音圧指定 |
| Nop | \_\_init__ |  |
| [Null](./4_14_null.md) | \_\_init__ | ゼロ振幅Gain指示 |
| OutputMask | \_\_init__ | 出力マスク指示 |
|  | with_segment | 対象セグメント変更 |
| ParallelMode | \_\_init__ | 並列処理モード（未サポート） |
| Phase | \_\_init__ | 振動子毎の位相補正値 |
|  | radian | 位相補正値の取得 |
| PhaseCorrection | \_\_init__ | 位相補正指示 |
| Plane | \_\_init__ | 平面波Gain指示 |
| PlaneOption | \_\_init__ | 平面波Gainオプション |
| PulseWidth | \_\_init__ | PWMパルス幅指定 |
|  | from_duty | デューティー比で指定 |
|  | pulse_width | パルス幅 |
| PulseWidthEncoder | \_\_init__ | PWMパルス幅変更指示 |
| ReadsFPGAState | \_\_init__ | FPGA状態取得指示 |
| Remote | \_\_init__ | リモート接続Link |
| RemoteOption | \_\_init__ | リモート接続Linkオプション |
| SamplingConfig | \_\_init__ | Modulation/STMのサンプリング設定 |
|  | freq | 周波数を取得 |
|  | into_nearest | 最近値を取得 |
|  | period | 周期を取得 |
| Segment |  | セグメント番号 |
| SenderOption | \_\_init__ | 送信時設定 |
| [Silencer](./4_8_silencer.md) | \_\_init__ | サイレンサ指示 |
|  |  disable | サイレンサ無効 |
| [Sine](./4_15_sine.md) | \_\_init__ | 正弦波変調 |
|  | into_nearest | 最近値を取得 |
|  | sampling_config | サンプリング設定の取得 |
| [SineOption](./4_15_sine.md) | \_\_init__ | 正弦波変調オプション |
| [Square](./4_16_square.md) | \_\_init__ | 矩形波変調 |
|  | into_nearest | 最近値を取得 |
|  | sampling_config | サンプリング設定の取得 |
| [SquareOption](./4_16_square.md) | \_\_init__ | 矩形波変調オプション |
| [Static](./4_17_static.md) | \_\_init__ | 変調なし変調 |
|  | sampling_config |  | サンプリング設定の取得 |
| SwapSegmentFociSTM | \_\_init__ | FociSTMセグメント切り替え指示 |
| SwapSegmentGain | \_\_init__ | Gainセグメント切り替え指示 |
| SwapSegmentGainSTM | \_\_init__ | GainSTMセグメント切り替え指示 |
| SwapSegmentModulation | \_\_init__ | Modulationセグメント切り替え指示 |
| [Transducer](./4_4_geometry.md) | \_\_init__ | 各振動子毎の情報 |
|  | dev_idx | 振動子が属するデバイスのインデックス |
|  | idx | 振動子のローカルインデックス |
|  | position | 振動子の位置 |
| TwinCAT | \_\_init__ | TwinCAT接続Link |
| Uniform | \_\_init__ | 全振動子への同一位相/振幅指示 |
| WithFiniteLoop | \_\_init__ | Modulation及びFociSTM/GainSTMのループ設定指示 |
| WithSegment | \_\_init__ | セグメント指定送信指示 |


pyautd3パッケージ

| クラス | メソッド(空白は定数等) | 概要 |
| --- | --- | --- |
| [EtherCrab](./4_18_ethercrab.md) | \_\_init__ | EtherCrab接続Link |
| [EtherCrabOption](./4_18_ethercrab.md) | \_\_init__ | EtherCrab接続Linkオプション |
| Status | \_\_init__ | エラー発生時の状態 |
