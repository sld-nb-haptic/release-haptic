// ライブラリの使用宣言
use autd3::prelude::*;
use autd3_link_ethercrab::{EtherCrab, EtherCrabOption};

// ------------------------------------------------------------
// メイン関数
fn main() ->Result<(), Box<dyn std::error::Error>> {

    println!( "<時空間変調デモ>" );

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

    // 動作指定
    let center = autd.center() + Vector3::new( 0.0, 0.0, 150.0 * mm );
    let radius = 30.0 * mm;
    let reso = 200;
    let stm = FociSTM {
        foci: (0..reso)
            .map( |i| {
                let theta = 2.0 * PI * i as f32 / reso as f32;
                let p = radius * Vector3::new( theta.cos(), theta.sin(), 0.0 );
                center + p
            })
            .collect::<Vec<_>>(),
        config: 1.0 * Hz
    };

	// 変調なしの変調制御指示を生成
	let m = Static { intensity: 0xFF };
	
	// 位相制御と変調制御を送信(動作開始)
    println!( "動作開始" );
    autd.send( (m, stm) )?;

	// キー入力待ち(終了指示待ち)
	let mut _s = String::new();
	println!( "Enterキー入力で終了" );
	std::io::stdin().read_line( &mut _s )?;

	// デバイスとの接続終了
	autd.close()?;

	// 終了
	Ok( () )
}

