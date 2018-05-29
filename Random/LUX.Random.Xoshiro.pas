unit LUX.Random.Xoshiro;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOS<_TState_>

     IRandomXOS<_TState_:record> = interface( IRandom<_TState_> )
     ['{FDD69CB5-D221-4FDD-89C9-BB3CF352BD74}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomXOS<_TState_:record> = class( TRandom<_TState_>, IRandomXOS<_TState_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS<_TState_>

     IRandom32XOS<_TState_:record> = interface( IRandomXOS<_TState_> )
     ['{17D5D4B8-C9FE-4671-BEF4-16E6E7AA512C}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandom32XOS<_TState_:record> = class( TRandomXOS<_TState_>, IRandom32XOS<_TState_> )
     private
     protected
       ///// メソッド
       function Rot( const X_:Int32u; const K_:Int32s ) :Int32u; overload; inline;
     public
       ///// メソッド
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS<_TState_>

     IRandom64XOS<_TState_:record> = interface( IRandomXOS<_TState_> )
     ['{8A73E446-332B-45AE-B78C-43696454A409}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandom64XOS<_TState_:record> = class( TRandomXOS<_TState_>, IRandom64XOS<_TState_> )
     private
     protected
       ///// メソッド
       function Rot( const X_:Int64u; const K_:Int64s ) :Int64u; overload; inline;
     public
       ///// メソッド
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64

     TRandom32XOS64 = class( TRandom32XOS<TInt32u2D> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const SeedX_,SeedY_:Int32u ); overload;
       ///// メソッド
       procedure NextState; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

     TRandom32XOS64s = class( TRandom32XOS64 )
     private
     protected
     public
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

     TRandom32XOS64ss = class( TRandom32XOS64 )
     private
     protected
     public
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

     TRandom32XOS128 = class( TRandom32XOS<TInt32u4D> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const SeedX_,SeedY_,SeedZ_,SeedW_:Int32u ); overload;
       ///// メソッド
       procedure NextState; override;
       procedure NextState64;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

     TRandom32XOS128p = class( TRandom32XOS128 )
     private
     protected
     public
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

     TRandom32XOS128ss = class( TRandom32XOS128 )
     private
     protected
     public
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

     TRandom64XOS128 = class( TRandom64XOS<TInt64u2D> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const SeedX_,SeedY_:Int64u ); overload;
       ///// メソッド
       procedure NextState; override;
       procedure NextState64;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

     TRandom64XOS128p = class( TRandom64XOS128 )
     private
     protected
     public
       ///// メソッド
       function GetRand64 :Int64u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

     TRandom64XOS128ss = class( TRandom64XOS128 )
     private
     protected
     public
       ///// メソッド
       function GetRand64 :Int64u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

     IRandom64XOS256 = interface( IRandom64XOS<TInt64u4D> )
     ['{3D863AF1-3DF8-46A2-BD16-09C34EFB8D36}']
     {protected}
     {public}
       ///// メソッド
       procedure NextState128;
     end;

     //-------------------------------------------------------------------------

     TRandom64XOS256 = class( TRandom64XOS<TInt64u4D>, IRandom64XOS256 )
     protected class var
       _Random :IRandom64XOS256;
     private
     protected
     public
       class constructor Create;
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       ///// メソッド
       procedure NextState; override;
       procedure NextState128;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

     TRandom64XOS256p = class( TRandom64XOS256 )
     private
     protected
     public
       ///// メソッド
       function GetRand64 :Int64u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

     TRandom64XOS256ss = class( TRandom64XOS256 )
     private
     protected
     public
       ///// メソッド
       function GetRand64 :Int64u; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.SyncObjs;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS<_TState_>.Rot( const X_:Int32u; const K_:Int32s ) :Int32u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 32 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS<_TState_>.Value :Double;
begin
     Result := GetRand32 / 4294967296.0{= 2^32 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS<_TState_>.Rot( const X_:Int64u; const K_:Int64s ) :Int64u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 64 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS<_TState_>.Value :Double;
begin
     Result := GetRand64 / 18446744073709551616.0{= 2^64 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS64.Create;
begin
     Create( GetTime32,
             GetTime32 );
end;

constructor TRandom32XOS64.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32,
             Random_.GetRand32 );
end;

constructor TRandom32XOS64.Create( const SeedX_,SeedY_:Int32u );
begin
     inherited Create;

     _State.X := SeedX_;
     _State.Y := SeedY_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS64.NextState;
var
   S :TInt32u2D;
begin
     S := _State;

     S.Y := S.Y xor S.X;

     _State.X := Rot( S.X, 26 ) xor S.Y xor ( S.Y shl 9 );  // a, b
     _State.Y := Rot( S.Y, 13 );                            // c
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoroshiro64star.c }

function TRandom32XOS64s.GetRand32 :Int32u;
begin
	   Result := _State.X * $9E3779BB;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoroshiro64starstar.c }

function TRandom32XOS64ss.GetRand32 :Int32u;
begin
	   Result := Rot( _State.X * $9E3779BB, 5 ) * 5;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS128.Create;
begin
     Create( GetTime32,
             GetTime32,
             GetTime32,
             GetTime32 );
end;

constructor TRandom32XOS128.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32,
             Random_.GetRand32,
             Random_.GetRand32,
             Random_.GetRand32 );
end;

constructor TRandom32XOS128.Create( const SeedX_,SeedY_,SeedZ_,SeedW_:Int32u );
begin
     inherited Create;

     _State.X := SeedX_;
     _State.Y := SeedY_;
     _State.Z := SeedZ_;
     _State.W := SeedW_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS128.NextState;
var
   T :Int32u;
begin
     T := _State.Y shl 9;

     _State.Z := _State.Z xor _State.X;
     _State.W := _State.W xor _State.Y;
     _State.Y := _State.Y xor _State.Z;
     _State.X := _State.X xor _State.W;

     _State.Z := _State.Z xor T;

     _State.W := Rot( _State.W, 11 );
end;

//------------------------------------------------------------------------------

procedure TRandom32XOS128.NextState64;
const
     JUMP :array [ 0..4-1 ] of Int32u = ( $8764000b, $f542d2d3, $6fa035c3, $77f2db5b );
var
   S :TInt32u4D;
   I, B :Int32s;
begin
     S := TInt32u4D.Create( 0, 0, 0, 0 );

     for I := 0 to 4-1 do
     begin
          for B := 0 to 32 - 1 do
          begin
               if JUMP[ I ] and ( 1 shl B ) = 1 then
               begin
                    S.X := S.X xor _State.X;
                    S.Y := S.Y xor _State.Y;
                    S.Z := S.Z xor _State.Z;
                    S.W := S.W xor _State.W;
               end;

               GetRand32;
          end;
     end;

     _State := S;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

function TRandom32XOS128p.GetRand32 :UInt32;
begin
     Result := _State.X + _State.W;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

function TRandom32XOS128ss.GetRand32 :UInt32;
begin
     Result := Rot( _State.X * 5, 7 ) * 9;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS128.Create;
begin
     Create( GetTime64,
             GetTime64 );
end;

constructor TRandom64XOS128.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand64,
             Random_.GetRand64 );
end;

constructor TRandom64XOS128.Create( const SeedX_,SeedY_:Int64u );
begin
     inherited Create;

     _State.X := SeedX_;
     _State.Y := SeedY_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS128.NextState;
var
   S :TInt64u2D;
begin
     S := _State;

     S.Y := S.Y xor S.X;

     _State.X := Rot( S.X, 24 ) xor S.Y xor ( S.Y shl 16 );  // a, b
     _State.Y := Rot( S.Y, 37 );                             // c
end;

//------------------------------------------------------------------------------

procedure TRandom64XOS128.NextState64;
const
     JUMP :array [ 0..2-1 ] of Int64u = ( $df900294d8f554a5, $170865df4b3201fc );
var
   S :TInt64u2D;
   I, B :Int64s;
begin
     S := TInt64u2D.Create( 0, 0 );

     for I := 0 to 2-1 do
     begin
          for B := 0 to 64 - 1 do
          begin
               if JUMP[ I ] and ( 1 shl B ) = 1 then
               begin
                    S.X := S.X xor _State.X;
                    S.Y := S.Y xor _State.Y;
               end;

               NextState;
          end;
     end;

     _State := S;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoroshiro128plus.c }

function TRandom64XOS128p.GetRand64 :Int64u;
begin
	   with _State do Result := X + Y;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoroshiro128starstar.c }

function TRandom64XOS128ss.GetRand64 :Int64u;
begin
	   with _State do Result := Rot( X * 5, 7 ) * 9;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom64XOS256.Create;
var
   S :TInt64u4D;
begin
     inherited;

     GetTimes( S._ );

     _Random := TRandom64XOS256.Create( S );
end;

constructor TRandom64XOS256.Create;
begin
     _SeedCS.Enter;

       with _Random do
       begin
            Create( State );  NextState128;
       end;

     _SeedCS.Leave;
end;

constructor TRandom64XOS256.Create( const Random_:IRandom );
var
   S :TInt64u4D;
begin
     S.X := Random_.GetRand64;
     S.Y := Random_.GetRand64;
     S.Z := Random_.GetRand64;
     S.W := Random_.GetRand64;

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS256.NextState;
var
   T :Int64u;
begin
     with _State do
     begin
          T := Y shl 17;

          Z := Z xor X;
          W := W xor Y;
          Y := Y xor Z;
          X := X xor W;

          Z := Z xor T;

          W := Rot( W, 45 );
     end;
end;

//------------------------------------------------------------------------------

procedure TRandom64XOS256.NextState128;
const
     JUMP :array [ 0..4-1 ] of Int64u = ( $180ec6d33cfd0aba,
                                          $d5a61266f0c9392c,
                                          $a9582618e03fc9aa,
                                          $39abdc4529b1661c );
var
   S :TInt64u4D;
   I, B :Int64u;
begin
     S := TInt64u4D.Create( 0, 0, 0, 0 );

     for I := 0 to 4-1 do
     begin
          for B := 0 to 64-1 do
          begin
               if JUMP[ I ] and ( 1 shl B ) = 0 then
               begin
                    with S do
                    begin
                         X := X xor _State.X;
                         Y := Y xor _State.Y;
                         Z := Z xor _State.Z;
                         W := W xor _State.W;
                    end;
               end;

               NextState;
          end;
     end;

     _State := S;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }

function TRandom64XOS256p.GetRand64 :Int64u;
begin
     with _State do Result := X + W;

     NextState;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }

function TRandom64XOS256ss.GetRand64 :Int64u;
begin
     with _State do Result := Rot( Y * 5, 7 ) * 9;

     NextState;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■