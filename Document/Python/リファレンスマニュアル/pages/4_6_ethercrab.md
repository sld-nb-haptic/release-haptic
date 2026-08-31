## 4.6 EtherCrabクラス/EtherCrabOptionクラス

### 概要
EtherCrabを用いてAUTD3デバイスと通信を行う。  
EtherCrabクラスはLinkクラスを継承する。(Controllerのopenメソッドにて指定する)  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/link/ethercrab.html  

---

### コンストラクタ

#### EtherCrabクラス

| 引数:型| 内容 |
| --- | ---  |
| err_handler:
 Callable[
[int, Status], 
None ]| エラーハンドラ |
| option: EtherCrabOption| 接続オプション |

---

#### EtherCrabOptionクラス

| 引数:型| 内容 |
| --- | ---  |
| ifname: str| ネットワークインターフェース名 |
| state_check_period: 
Duration| エラーが出ているかどうかを確認する間隔 |
| sync0_period: Duration| 同期信号の周期 |
| sync_tolerance: Duration| 同期許容レベル
初期化時、各デバイスのシステム時間差がこの値以下になるまで待機する |
| sync_timeout: Duration| 同期タイムアウト値 |

EtherCrab用のLinkオブジェクトを生成する。  
EtherCrabOptionクラスは、EtherCrabクラスのインスタンス生成時に指定する。
 

EtherCrabをWindows上で使用する場合、
Npcapを「WinPcap API compatible Mode」でインストールしておく必要がある。
　　Npcap　：　https://npcap.com/


EtherCrabをLinux上で使用する場合、
下記コマンドにてpythonにNICの使用権原を付与しておく必要がある。  
``` sh
　　sudo setcap cap_net_admin,cap_net_raw=eip pythonのパス
　　　　例）Ubuntu 24.04 の場合
　　　　　　sudo setcap cap_net_admin,cap_net_raw=eip /usr/bin/python3.12
```

EtherCrabをMacOSで使用する場合、  
下記コマンドにて管理者権限を付与しておく必要がある。
``` sh
　　sudo chmod +r /dev/bpf*
```

---

### Status
EtherCrabリンクの処理で異常等が発生した場合、  
エラー情報が格納されたStatusを引数として、接続時に指定されたエラーハンドラが呼び出される。
