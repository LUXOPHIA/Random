﻿unit LUX.Random.LCG;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG

     IRandomLCG = interface( IRandom )
     ['{CB661983-1A3A-4FC1-82AF-988943DF8256}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomLCG = class( TRandom, IRandomLCG )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG32

     TRandomLCG32 = class( TRandomLCG )
     private
     protected
       _Seed :UInt32;
     public
       constructor Create; overload; override;
       constructor Create( const Seed_:UInt32 ); overload;
       ///// メソッド
       function GetRand32 :UInt32;
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG48

     TRandomLCG48 = class( TRandomLCG )
     private
     protected
       _Seed :UInt64;
     public
       constructor Create; overload; override;
       constructor Create( const Seed_:UInt64 ); overload;
       ///// メソッド
       function GetRand32 :UInt64;
       function GetRand48 :UInt64;
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG64

     TRandomLCG64 = class( TRandomLCG )
     private
     protected
       _Seed :UInt64;
     public
       constructor Create; overload; override;
       constructor Create( const Seed_:UInt64 ); overload;
       ///// メソッド
       function GetRand32 :UInt64;
       function GetRand64 :UInt64;
       function Value :Double; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG32.Create;
begin
     inherited;

     _Seed := GetGlobalSeed32;
end;

constructor TRandomLCG32.Create( const Seed_:UInt32 );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomLCG32.GetRand32 :UInt32;
const
     ///// Numerical Recipes
     A :UInt32 = 1664525;
     C :UInt32 = 1013904223;
     {
     ///// Borland C/C++
     A :UInt64 = 22695477;
     C :UInt64 = 1;
     ///// Borland Delphi, Virtual Pascal, Turbo Pascal
     A :UInt64 = 134775813;
     C :UInt64 = 	1;
     ///// Microsoft Visual/Quick C/C++
     A :UInt64 = 214013;
     C :UInt64 = 2531011;
     ///// VMS's MTH$RANDOM, old versions of glibc
     A :UInt64 = 69069;
     C :UInt64 = 1;
     ///// cc65
     A :UInt64 = 16843009;
     C :UInt64 = 826366247;
     }
begin
     //          48              32              16               0
     //           |               |               |               |
     // A   =     |                           110010110011000001101 = 1664525
     // C   =     |               |  111100011011101111001101011111 = 1013904223
     // M   =                     100000000000000000000000000000000 = 4294967296 = 2^32
     // M-1 =     |               |11111111111111111111111111111111 = 4294967295 = 2^32-1
     //           |               |               |               |

     //          48              32              16               0
     //           |               |               |               |
     // S   =     |               |11111111111111111111111111111111 = 4294967295 = 2^32-1
     // * A = 11001011001100000110011111111111001101001100111110011 = 7149080436709875
     // + C = 11001011001100000110100111100010101011000110101010010 = 7149081450614098
     // % M =     |               |00111100010101011000110101010010 = 1012239698
     //           |               |               |               |

     //          48              32              16               0
     //           |               |               |               |
     // S   =     |               |11111111111111111111111111111111 = 4294967295 = 2^32-1
     // * A = 11001011001100000110011111111111001101001100111110011 = 7149080436709875
     // % M =     |               |11111111111001101001100111110011 = 4293302771
     // + C =     |               100111100010101011000110101010010 = 5307206994
     // % M =     |               |00111100010101011000110101010010 = 1012239698
     //           |               |               |               |

     _Seed := A * _Seed + C;

     Result := _Seed;
end;

//------------------------------------------------------------------------------

function TRandomLCG32.Value :Double;
begin
     Result := GetRand32 / 4294967296.0{= 2^32 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG48

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG48.Create;
begin
     inherited;

     _Seed := GetGlobalSeed64 and 281474976710655{= 2^48-1 };
end;

constructor TRandomLCG48.Create( const Seed_:UInt64 );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomLCG48.GetRand32 :UInt64;
begin
     Result := GetRand48 shr 16;
end;

function TRandomLCG48.GetRand48 :UInt64;
const
     A  :UInt64 = 25214903917;
     C  :UInt64 = 11;
     M1 :UInt64 = 281474976710655{= 2^48-1 };
begin
     //        96              64              48              32              16               0
     //         |               |               |               |               |               |
     // A   =   |               |               |             10111011110111011001110011001101101 = 25214903917
     // C   =   |               |               |               |               |            1011 = 11
     // M   =   |               |               1000000000000000000000000000000000000000000000000 = 281474976710656 = 2^48
     // M-1 =   |               |               |111111111111111111111111111111111111111111111111 = 281474976710655 = 2^48-1
     //         |               |               |               |               |               |

     //        96              64              48              32              16               0
     //         |               |               |               |               |               |
     // S   =   |               |               |111111111111111111111111111111111111111111111111 = 281474976710655 = 2^48-1
     // * A = 10111011110111011001110011001101100111111111111101000100001000100110001100110010011 = 7097364492798978535135635
     // + C = 10111011110111011001110011001101100111111111111101000100001000100110001100110011110 = 7097364492798978535135646
     // % M =   |               |               |111111111111101000100001000100110001100110011110 = 281449761806750
     //         |               |               |               |               |               |

     //        96              64              48              32              16               0
     //         |               |               |               |               |               |
     // S   =   |               |               |111111111111111111111111111111111111111111111111 = 281474976710655 = 2^48-1
     // * A = 10111011110111011001110011001101100111111111111101000100001000100110001100110010011 = 7097364492798978535135635
     // % M =   |               |               |111111111111101000100001000100110001100110010011 = 281449761806739
     // + C =   |               |               |111111111111101000100001000100110001100110011110 = 281449761806750
     // % M =   |               |               |111111111111101000100001000100110001100110011110 = 281449761806750
     //         |               |               |               |               |               |

     _Seed := ( A * _Seed + C ) and M1;

     Result := _Seed;
end;

//------------------------------------------------------------------------------

function TRandomLCG48.Value :Double;
begin
     Result := GetRand48 / 281474976710656.0{= 2^48 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG64.Create;
begin
     inherited;

     _Seed := GetGlobalSeed64;
end;

constructor TRandomLCG64.Create( const Seed_:UInt64 );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomLCG64.GetRand32 :UInt64;
begin
     Result := GetRand64 shr 32;
end;

function TRandomLCG64.GetRand64 :UInt64;
const
     A :UInt64 = 6364136223846793005;
     C :UInt64 = 1442695040888963407;
begin
     //                   128             112              96              64              48              32              16               0
     //                     |               |               |               |               |               |               |               |
     // A   =               |               |               |               | 101100001010001111101000010110101001100100101010111111100101101 = 6364136223846793005
     // C   =               |               |               |               |   1010000000101011110110111111011110111011001111000000101001111 = 1442695040888963407
     // M   =               |               |               |               10000000000000000000000000000000000000000000000000000000000000000 = 18446744073709551616 = 2^64
     // M-1 =               |               |               |               |1111111111111111111111111111111111111111111111111111111111111111 = 18446744073709551615 = 2^64-1
     //                     |               |               |               |               |               |               |               |

     //                   128             112              96              64              48              32              16               0
     //                     |               |               |               |               |               |               |               |
     // S   =               |               |               |               |1111111111111111111111111111111111111111111111111111111111111111 = 18446744073709551615 = 2^64-1
     // * A = 1011000010100011111010000101101010011001001010101111111001011001010011110101110000010111101001010110011011010101000000011010011 = 117397592171526113260752102854268453075
     // + C = 1011000010100011111010000101101010011001001010101111111001011001011101110110011100001110101000110101010110100100000001000100010 = 117397592171526113262194797895157416482
     // % M =               |               |               |               |1011101110110011100001110101000110101010110100100000001000100010 = 13525302890751722018
     //                     |               |               |               |               |               |               |               |

     //                   128             112              96              64              48              32              16               0
     //                     |               |               |               |               |               |               |               |
     // S   =               |               |               |               |1111111111111111111111111111111111111111111111111111111111111111 = 18446744073709551615 = 2^64-1
     // * A = 1011000010100011111010000101101010011001001010101111111001011001010011110101110000010111101001010110011011010101000000011010011 = 117397592171526113260752102854268453075
     // % M =               |               |               |               |1010011110101110000010111101001010110011011010101000000011010011 = 12082607849862758611
     // + C =               |               |               |               |1011101110110011100001110101000110101010110100100000001000100010 = 13525302890751722018
     // % M =               |               |               |               |1011101110110011100001110101000110101010110100100000001000100010 = 13525302890751722018
     //                     |               |               |               |               |               |               |               |

     _Seed := A * _Seed + C;

     Result := _Seed;
end;

//------------------------------------------------------------------------------

function TRandomLCG64.Value :Double;
begin

     Result := GetRand64 / 18446744073709551616.0{= 2^64 };
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■