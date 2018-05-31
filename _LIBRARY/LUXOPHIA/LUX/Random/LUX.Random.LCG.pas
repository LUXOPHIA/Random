﻿unit LUX.Random.LCG;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG<_TState_>

     IRandomLCG<_TState_:record> = interface( IRandom<_TState_> )
     ['{CB661983-1A3A-4FC1-82AF-988943DF8256}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomLCG<_TState_:record> = class( TRandom<_TState_>, IRandomLCG<_TState_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG32

     TRandomLCG32 = class( TRandomLCG<Int32u> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG48

     TRandomLCG48 = class( TRandomLCG<Int64u> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
       function CalcRand48 :Int64u;
       function CalcRand64 :Int64u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       constructor Create( const Seed_:Int64u ); overload; override;
       ///// メソッド
       function GetRand48 :Int64u;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG64

     TRandomLCG64 = class( TRandomLCG<Int64u> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
       function CalcRand64 :Int64u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.SyncObjs;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomLCG32.CalcNextState;
const
     ///// Numerical Recipes
     A :Int32u = 1664525;
     C :Int32u = 1013904223;
     {
     ///// Borland C/C++
     A :Int32u = 22695477;
     C :Int32u = 1;
     ///// Borland Delphi, Virtual Pascal, Turbo Pascal
     A :Int32u = 134775813;
     C :Int32u = 	1;
     ///// Microsoft Visual/Quick C/C++
     A :Int32u = 214013;
     C :Int32u = 2531011;
     ///// VMS's MTH$RANDOM, old versions of glibc
     A :Int32u = 69069;
     C :Int32u = 1;
     ///// cc65
     A :Int32u = 16843009;
     C :Int32u = 826366247;
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

     _State := A * _State + C;
end;

function TRandomLCG32.CalcRand32 :Int32u;
begin
     Result := _State;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG32.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.GetRandInt32u );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG48

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomLCG48.CalcNextState;
const
     A  :Int64u = 25214903917;
     C  :Int64u = 11;
     M1 :Int64u = 281474976710655{= 2^48-1 };
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

     _State := ( A * _State + C ) and M1;
end;

function TRandomLCG48.CalcRand32 :Int32u;
begin
     Result := CalcRand48 shr 16;
end;

function TRandomLCG48.CalcRand48 :Int64u;
begin
     Result := _State;
end;

function TRandomLCG48.CalcRand64 :Int64u;
begin
     Result := CalcRand48 shr 16;  CalcNextState;

     Result := ( Result shl 32 ) or ( CalcRand48 shr 16 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG48.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.GetRandInt64u );
end;

constructor TRandomLCG48.Create( const Seed_:Int64u );
begin
     inherited Create( Seed_ and $FFFFFFFFFFFF{= 2^48-1 } );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomLCG48.GetRand48 :Int64u;
begin
     _StateCS.Enter;

       Result := CalcRand48;  CalcNextState;

     _StateCS.Leave;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomLCG64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomLCG64.CalcNextState;
const
     A :Int64u = 6364136223846793005;
     C :Int64u = 1442695040888963407;
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

     _State := A * _State + C;
end;

function TRandomLCG64.CalcRand32 :Int32u;
begin
     Result := GetRandInt64u shr 32;
end;

function TRandomLCG64.CalcRand64 :Int64u;
begin
     Result := _State;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomLCG64.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.GetRandInt64u );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■