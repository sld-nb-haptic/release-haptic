# 6. その他
## 6.1 独自プログラムの作成と実行
Ubuntu標準のテキストエディタでサンプルコードの修正や独自プログラムの編集を行えます。  
ソースファイルを編集/保存し、サンプルプログラムと同様のコマンドで実行することができます。


新規にプログラムを生成し、実行するときの手順を下記に示します。  
(デスクトップ上にプロジェクトを作成する場合の手順となります)

``` sh
$ cargo new --bin <your-project-name>           プロジェクト作成
$ cd <your-project-name>						プロジェクトフォルダに移動

    ~/Desktop/<your-project-name>/src/main.rs をエディタ等で編集　

$ cargo add autd3 --offline					    autd3ライブラリ追加
$ cargo add autd3-link-ethercrab --offline		ethercrabライブラリ追加

    GSPAT等の機能を使用する場合は、下記でライブラリを追加
$ cargo add autd3-gain-holo

$ cargo build							        ビルド
$ sudo ./target/debug/<your-project-name>       実行
```
