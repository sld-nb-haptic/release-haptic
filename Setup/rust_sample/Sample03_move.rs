// ライブラリの使用宣言
use autd3::prelude::*;
use autd3_link_ethercrab::{EtherCrab, EtherCrabOption};

// ------------------------------------------------------------
// メイン関数
fn main() ->Result<(), Box<dyn std::error::Error>> {

    println!( "<焦点移動デモ>" );

	// デバイスへの接続
	println!( "デバイス接続" );
	let devices = [AUTD3 {
			pos: Point3::origin(),
			rot: UnitQuaternion::identity(),
		}];
	let link = EtherCrab::new(
			|idx, status| {
				eprintln!( "Device[{}]: {}", idx, status );
			},
			EtherCrabOption::default()
		); 
	let mut autd = Controller::open( devices, link )?;

	// 可聴音を抑えるための指示
	autd.send( Silencer::default() )?;

	// Sin波形変調制御指示の指示(移動中は変更しないため事前に指示)
	let m = Sine {
				freq: 150 * Hz,
				option: SineOption::default()
			};
	autd.send( m )?;

    // 入力あるまでループ
    println!( "動作開始" );
    loop {
        
        // -50mmから+50mmまで移動
        for idx in -50..=50 {
        
            // 移動する位置に単一商店設定
            let g = Focus {
                pos: autd.center() + Vector3::new( idx as f32, 0.0, 150.0 * mm ),
                option: FocusOption::default()
            };
            autd.send( g )?;
            
            // 時間調整
            std::thread::sleep( std::time::Duration::from_millis( 10 ) );
        }
        
        // 停止
        autd.send( Null {} )?;
        
        // 終了確認
        let mut _s = String::new();
        println!( "空Enter入力で繰り返し(なにか入力してEnterで終了)" );
        std::io::stdin().read_line( &mut _s )?;
        if ! _s.trim().is_empty() {
            break;
        }
    }

	// デバイスとの接続終了
	autd.close()?;

	// 終了
	Ok( () )
}

