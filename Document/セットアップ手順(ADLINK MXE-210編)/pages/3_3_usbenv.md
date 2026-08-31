## 3.3 環境セットアップ用USBメディア

### 環境セットアップ用ファイルのダウンロード  
下記より環境セットアップ用ファイル(AUTD3_Setup.zip)を作業用PC内にダウンロードします。  
　[AUTD3_Setup_1.00.zip](/Download/AUTD3_Setup_1.00.zip)  

ダウンロードが始まらない場合、  
表示されたページの「View raw」または「Raw」をクリックしてみてください。  

---

### 環境セットアップ用メディアへの展開(コピー)
上記でダウンロードしたファイルを__<u>展開し、ファイルとフォルダをUSBメディアにコピー</u>__してください。

環境セットアップ用USBメディアの中は下記フォルダ構成となります。
```
USB
│  setup.sh
│
├─base_packages_japanese
│      fonts-noto-cjk-extra_1%3a20230817+repack1-3_all.deb
│      gnome-user-docs-ja_46.0-1ubuntu1_all.deb
│       :
│
├─python_autd3
│      numpy-2.4.2-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
│      pyautd3-38.0.1-py3-none-manylinux1_x86_64.whl
│      pyautd3_link_ethercrab-38.0.1-py3-none-manylinux1_x86_64.whl
│
├─python_packages
│      2to3_3.12.3-0ubuntu2.1_all.deb
│      binutils-common_2.42-4ubuntu2.8_amd64.deb
│       :
│
├─python_sample
│      sample01_single.py
│      sample02_multi.py
│      sample03_move.py
│      sample04_bessel.py
│      sample05_stm.py
│
├─rust_autd3
│      cache.zip
│
├─rust_install
│      rust-1.94.1-x86_64-unknown-linux-gnu.tar.xz
│
├─rust_packages
│      curl_8.5.0-2ubuntu10.8_amd64.deb
│      libcurl3t64-gnutls_8.5.0-2ubuntu10.8_amd64.deb
│       :
│
└─rust_sample
        Sample01_single.rs
        Sample02_multi.rs
        Sample03_move.rs
        Sample04_bessel.rs
        Sample05_stm.rs

```
