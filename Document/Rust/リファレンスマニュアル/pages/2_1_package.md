# 2. インストール
## 2.1 クレート一覧及び共通事項

RustからAUTD3デバイスを稼働させるためのクレート(ライブラリ)を下記に示す。  

| クレート名 | 内容 |
| --- | --- |
| autd3 | AUTD3デバイスを制御する基本クレート |
| autd3-gain-holo | 複数焦点に関する機能を提供するクレート |
| autd3-link-twincat | TWinCATを用いてAUTD3デバイスと通信する為のクレート |
| autd3-link-ethercrab | EtherCrabを用いてAUTD3デバイスと通信する為のクレート |
| autd3-link-remote | リモートサーバ又はシミュレータに接続する際に使用するクレート |
| autd3-link-soem | SOMEを用いてAUTD3デバイスと通信する為のクレート |
| autd3-emulator | エミュレータと通信する為のクレート |


「autd3-link-ethercrab」「autd3-link-twincat」等のLink用クレートは、  
対応する通信手段(EtherCrab等)でAUTD3デバイスと通信する際にのみ必要となる。  

「autd3-gain-holo」はGSPAT等の標準には含まれない機能を使用する場合に必要となる。  

入門キットではautd3 / autd3-gain-holo / autd3-link-ethercrabのみ利用可能となっている。  

上記クレートはcrates.ioに登録されており、cargoを用いて使用することができる。  

