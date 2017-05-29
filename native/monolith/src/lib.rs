#[macro_use] extern crate rustler;
#[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

use rustler::{NifEnv, NifTerm, NifResult, NifEncoder};

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.Monolith",
    [("add", 2, add)],
    None
}

fn add<'a>(env: NifEnv<'a>, args: &[NifTerm<'a>]) -> NifResult<NifTerm<'a>> {
    println!("1");
    //let test: std::result::Result = args[0].decode();
    let num0: i64 = 55;
    println!("2");
    let num1: i64 = args[0].decode()?;
    println!("3");
    let num2: i64 = args[1].decode()?;
    println!("4");

    Ok((atoms::ok(), num1 + num2).encode(env))
}
