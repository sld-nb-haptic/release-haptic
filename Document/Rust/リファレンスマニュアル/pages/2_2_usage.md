## 2.2 使用方法
cargoを用いて各プロジェクトにクレートを追加することで利用できる。

例）
``` sh
$ cargo new --bin sample01					                プロジェクト作成
$ cd sample01							                    プロジェクトフォルダに移動
$ cp ~/Desktop/RustSample/Sample01_single.rs src/main.rs	サンプルコードのコピー
$ cargo add autd3						                    autd3ライブラリ追加 ※
$ cargo add autd3-link-ethercrab				            ethercrabライブラリ追加 ※
$ cargo build							                    ビルド
$ sudo ./target/debug/sample01					            実行
```

※ 入門キットなど、事前にダウンロードされておりインターネットに接続されていない環境では
下記の様に「--offline」オプションを指定する。

``` sh
$ cargo add autd3 --offline					                autd3ライブラリ追加
$ cargo add autd3-link-ethercrab --offline		            ethercrabライブラリ追加
```

入門キットでは下記クレートが事前ダウンロードされており、インターネットに接続することなく使用できる。  
```
autd3
autd3-gain-holo
autd3-link-ethercrab
```
