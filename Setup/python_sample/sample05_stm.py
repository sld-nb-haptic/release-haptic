import numpy as np      # 科学技術用パッケージの準備

from pyautd3 import (   # AUTD3パッケージの準備
    AUTD3,                  # 触覚ボードの定義
    Controller,             # 触覚ボード制御
    FociSTM,                # Focus制御STM
    Silencer,               # 可聴音抑止
    Static,                 #
    Hz,                     # 周波数指定
)
from pyautd3_link_ethercrab import EtherCrab, EtherCrabOption, Status # EtherCrab用パッケージの準備

# デバイスエラー発生時の処理
def err_handler(idx: int, status: Status) -> None:
    # エラー内容の表示
    print( f"Device[{idx}]: {status}" ) 


# デモ開始
print( "<時空間変調デモ>" )

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

# 動作指定
radius = 30.0   # 動きの半径
reso = 200      # 動きの分解能
center = autd.center() + np.array([0.0, 0.0, 150.0]) # 動きの中心位置
stm = FociSTM(
        foci=(center + radius * np.array([np.cos(theta), np.sin(theta), 0]) 
            for theta in ( 2.0 * np.pi * i / reso for i in range(reso)) # 分解能に合わせて角度決定
        ),
        config=1.0 * Hz,
    )
m = Static()
print( "動作開始" )
autd.send( (m,stm) ) # 位相制御と振幅制御を指示

# キー入力待ち(終了指示待ち)
print( "Enterキー入力で終了" )
_= input()

# デバイスへの接続終了
autd.close()
