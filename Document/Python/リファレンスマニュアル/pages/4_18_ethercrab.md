## 4.18 EtherCrabクラス/EtherCrabOptionクラス
### 概要
オープンソースのEtherCAT Masterライブラリである「EtherCrab」を用いたリンクを提供する。  

Windows上から使用する場合、
npcapをインストール時に「WinPcap API compatible mode」を指定する必要がある。  

参照： https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/link/ethercrab.html  

---

### コンストラクタ
#### Focusクラス
| 引数:型| 内容 |
| --- | ---  |
| err_handler: Callable[[int, Status], None] | エラー発生時のコールバック関数 |
| option: EtherCrabOption| オプション |

---

#### PlaneOptionクラス
| 引数:型| 内容 |
| --- | ---  |
| ifname: str| ネットワークインターフェース名。Noneの場合、自動的に選択される。 |
| state_check_period: Duration| エラー発生を確認する間隔。 |
| sync0_period: Duration| 同期信号の周期。<br>大量のデバイスを接続し動作が不安定になった場合はこの値を増やすことで安定するが、エラーとならない最小値が望ましい。 |
| sync_tolerance: Duration| 同期許容レベル。<br>初期化時に各デバイスのシステム時間差がこの値以下になるまで待機する。<br>（変更は推奨されない） |
| sync_timeout: Duration| 同期タイムアウト。<br>初期化時に各デバイスのシステム時間差を測定する際にこの時間を超過するとエラーとなる。 |

エラー発生時のコールバック関数を定義し、EtherCrabの第1引数に指定する。  
``` python
def err_handler(idx: int, status: Status) -> None:
    print(f"Device[{idx}]: {status}")
```


LinuxではネットワークインターフェースのRAWパケット使用権限がない場合、デバイス検出に失敗する。  
（root権限で実行するか、下記コマンドの様にPython自体に許可を与える必要がある。
``` sh
sudo setcap cap_net_admin,cap_net_raw=eip /usr/bin/python3.12
```
