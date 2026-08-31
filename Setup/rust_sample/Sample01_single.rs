// AUTD3ライブラリの使用宣言
use autd3::prelude::*;

// EtherCrabライブラリの使用宣言
use autd3_link_ethercrab::{EtherCrab, EtherCrabOption};

// ------------------------------------------------------------
// メイン関数
fn main() ->Result<(), Box<dyn std::error::Error>> {

    println!( "<単一焦点デモ>" );

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

	// 単一焦点の位相制御指示を生成
	let g = Focus {
				pos: autd.center() + Vector3::new( 0., 0., 150.0 * mm ),
				option: FocusOption::default()
			};

	// Sin波形の変調制御指示を生成
	let m = Sine {
				freq: 150 * Hz,
				option: SineOption::default()
			};

	// 位相制御と変調制御を送信(動作開始)
    println!( "動作開始" );
    autd.send( (m, g) )?;

	// キー入力待ち(終了指示待ち)
	let mut _s = String::new();
	println!( "Enterキー入力で終了" );
	std::io::stdin().read_line( &mut _s )?;

	// デバイスとの接続終了
	autd.close()?;

	// 終了
	Ok( () )
}

