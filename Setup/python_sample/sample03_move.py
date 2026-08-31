import numpy as np      # 科学技術用パッケージの準備

from pyautd3 import (   # AUTD3パッケージの準備
    AUTD3,                  # 触覚ボードの定義
    Controller,             # 触覚ボード制御
    Focus,                  # 単一焦点を生成するGain
    FocusOption,            # 単一焦点用オプション
    Null,                   # 出力停止Gain
    Silencer,               # 可聴音抑止
    Sine,                   # 正弦波
    SineOption,             # 正弦波オプション
    Hz,                     # 周波数指定
)
from pyautd3_link_ethercrab import EtherCrab, EtherCrabOption, Status # EtherCrab用パッケージの準備
import time             # 時間調整用のパッケージ準備

# デバイスエラー発生時の処理
def err_handler(idx: int, status: Status) -> None:
    # エラー内容の表示
    print( f"Device[{idx}]: {status}" ) 

# デモ開始
print( "<焦点移動デモ>" )

# デバイスへの接続(EtherCrabを使用)
autd = Controller.open(
            [ # AUTD3ボードの指定
                AUTD3(pos=[0.0, 0.0, 0.0], rot=[1, 0, 0, 0]) # １枚目のボードの位置と向き
            ],
            EtherCrab( # EtherCrabでの接続
                err_handler=err_handler, # エラー発生時の処理関数指定
                option=EtherCrabOption() # デフォルトオプション
            ) 
        )

# 可聴音を抑えるための指示
autd.send( Silencer() )

# 正弦波用意(移動中に変更しないため事前に指示)
m = Sine( # Sin振幅
        freq=150 * Hz, # 150Hz
        option=SineOption() ) # デフォルトオプション
autd.send( m ); # 変調制御を指示

# 入力があるまでループ
print( "動作開始" )
loop = True
while loop:

    # -50mmから+50mmまで移動
    for idx in range(-50, 50):

        # 単一焦点設定
        g = Focus(
                pos=autd.center() + np.array( [idx, 0.0, 150.0] ), # 中心から横に-50～+50mmの位置を指定
                option=FocusOption() ) # デフォルトオプション
        autd.send( g ) # 位相制御を指示

        # 時間調整
        time.sleep( 0.01 ) # 0.01秒(10ミリ秒)待機

    # 停止
    autd.send( Null() )

    # 終了確認
    ans = input( "空Enter入力で繰り返し(なにか入力してEnterで終了)" )
    if ans != "":
        break # 空入力でない場合、終了

# デバイスへの接続終了
autd.close()
