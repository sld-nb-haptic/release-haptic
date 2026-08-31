// AUTD3ライブラリの使用宣言
use autd3::prelude::*;

// EtherCrabライブラリの使用宣言
use autd3_link_ethercrab::{EtherCrab, EtherCrabOption};

// ------------------------------------------------------------
// メイン関数
fn main() ->Result<(), Box<dyn std::error::Error>> {

    println!( "<ベッセルビームデモ>" );

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

	// ベッセルビームの位相制御指示を生成
	let g = Bessel {
				apex: autd.center(),
				dir: UnitVector3::new_normalize( Vector3::new(0.0, 0.0, 1.0) ),
				theta: 13.0 / 180.0 * std::f32::consts::PI * rad,
				option: BesselOption {
				    intensity: Intensity::MAX, 
				    phase_offset: Phase::ZERO,
				}
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

