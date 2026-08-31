## 2.2 インストール方法

インターネットに接続されている環境にて、下記コマンドにてインストールを行う。

``` sh
　　pip install pyautd3 pyautd3_link_ethercrab
```
または
``` sh
　　python3 -m pip install pyautd3 pyautd3_link_ethercrab
```

オフライン環境でインストールする場合、下記手順にてインストールを行う。  

①　ダウンロード  
インターネットが利用できる環境より、下記をダウンロードする。  

* pyautd3  
　　　ダウンロード先： https://pypi.org/project/pyautd3/#files  
　　　ダウンロードファイル  
　　　　　Windows用	：pyautd3-38.0.1-py3-none-win_amd64.whl  
　　　　　Linux用		：pyautd3-38.0.1-py3-none-manylinux1_x86_64.whl    
　　　　　MacOS用	：pyautd3-38.0.1-py3-none-macosx_11_0_arm64.whl   

* *pyautd3_link_ethercrab  
　　　ダウンロード先：https://pypi.org/project/pyautd3-link-ethercrab/#files
　　　ダウンロードファイル  
　　　　　Windows用	：pyautd3_link_ethercrab-38.0.1-py3-none-win_amd64.whl    
　　　　　Linux用		：pyautd3_link_ethercrab-38.0.1-py3-none-manylinux1_x86_64.whl  
　　　　　MacOS用	：pyautd3_link_ethercrab-38.0.1-py3-none-macosx_11_0_arm64.whl  

* *numpy  
　　　ダウンロード先：https://pypi.org/project/pyautd3-link-ethercrab/#files  
　　　ダウンロードファイル  
　　　　　各環境用をダウンロード  
　　　　　例）Ubuntu24.04-64bit用:numpy-2.4.3-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl  


②	ダウンロードしたファイルをインストール対象PCにコピーし、一つのフォルダ下に格納する  

③	インストール  
下記コマンドでインストールする。  

``` sh
  python3 -m pip install --no-index --find-links=フォルダパス numpy pyautd3 pyautd3_link_ethercrab
```

参考：https://shinolab.github.io/autd3-doc/jp/Users_Manual/getting_started/software.html

