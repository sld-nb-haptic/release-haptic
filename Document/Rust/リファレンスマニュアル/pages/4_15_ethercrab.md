## 4.15 EtherCrabクラス/EtherCrabOptionクラス
### 概要
EtherCrabを用いてAUTD3デバイスと通信を行う。  

EtherCrabクラスはLinkを継承する。(Controllerのopenメソッドにて指定する)

LinuxではネットワークインターフェースのRAWパケット使用権限がない場合、デバイス検出に失敗する。  
この為、sudoコマンドを用いてのroot権限で実行などを行う必要がある。


参照： https://shinolab.github.io/autd3-doc/jp/Users_Manual/API/link/ethercrab.html  

---

### 生成

#### Focusクラス
``` rust
impl<F: Fn(usize, Status) + Send + Sync + 'static> EtherCrab<F>
	  pub fn new(err_handler: F, option: impl Into<EtherCrabOptionFull>) -> Self
```
| 引数 | 内容 |
| --- | ---  |
| err_handler | エラー発生時のコールバック関数 |
| option | オプション |

EtherCrabを用いたLink(通信制御)を生成する。

---

#### PlaneOptionクラス
``` rust
pub struct EtherCrabOption {
    pub ifname: Option<String>,
    pub state_check_period: Duration,
    pub sync0_period: Duration,
    pub sync_tolerance: Duration,
    pub sync_timeout: Duration,
}
```
| 引数 | 内容 |
| --- | ---  |
| ifname | ネットワークインターフェース名。Noneの場合、自動的に選択される。 |
| state_check_period | エラー発生を確認する間隔。 |
| sync0_period | 同期信号の周期。<br>大量のデバイスを接続し動作が不安定になった場合はこの値を増やすことで安定するが、エラーとならない最小値が望ましい。 |
| sync_tolerance | 同期許容レベル。<br>初期化時に各デバイスのシステム時間差がこの値以下になるまで待機する。<br>（変更は推奨されない） |
| sync_timeout | 同期タイムアウト。<br>初期化時に各デバイスのシステム時間差を測定する際にこの時間を超過するとエラーとなる。 |

EtherCrabリンク生成時に通信オプションを指定する。

メソッド default で、デフォルトのオプションを取得できる。
``` rust
fn default() -> Self
```


---

### status(エラーハンドラの引数)

EtherCrabリンクの処理で異常等が発生した場合、  
エラー情報が格納されたStatusを引数として、接続時に指定されたエラーハンドラを呼び出す。  

Statusの値の意味を下記に示す。  

| 値 | 内容 |
| --- | --- |
| Error = 0 | SAFE-OP + ERROR状態となった。 |
| Lost = 1 | AUTD3デバイスがなくなった。 |
| StateChanged = 2 | SAFE-OP状態となった。 |
| Resumed = 4 | 全デバイスがOP状態に復帰した。 |
