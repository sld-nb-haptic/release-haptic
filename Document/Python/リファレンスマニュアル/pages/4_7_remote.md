## 4.7 Remoteクラス/RemoteOptionクラス

### 概要
リモートサーバ経由でAUTD3デバイスと通信を行う。  
RemoteクラスはLinkクラスを継承する。(Controllerのopenメソッドにて指定する)  

参照：https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/link/remote.html

---

### コンストラクタ

#### Remoteクラス

| 引数:型| 内容 |
| --- | ---  |
| addr: str| 接続先IPアドレス |
| option: RemoteOption| 接続オプション |

---

#### RemoteOptionクラス

| 引数:型| 内容 |
| --- | ---  |
| timeout: Duration| タイムアウト値 |

EtherCrab用のLinkオブジェクトを生成する。

EtherCrabOptionクラスは、EtherCrabクラスのインスタンス生成時に指定する。
	
