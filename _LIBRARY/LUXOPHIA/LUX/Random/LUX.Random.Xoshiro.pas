unit LUX.Random.Xoshiro;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IRandomXOS<_TState_:record> = interface;

     TRandomXOS<_TState_:record>     = class;
       TRandom32XOS<_TState_:record> = class;
         TRandom32XOS64              = class;
           TRandom32XOS64s           = class;
           TRandom32XOS64ss          = class;
         TRandom32XOS128             = class;
           TRandom32XOS128p          = class;
           TRandom32XOS128ss         = class;
       TRandom64XOS<_TState_:record> = class;
         TRandom64XOS128             = class;
           TRandom64XOS128p          = class;
           TRandom64XOS128ss         = class;
         TRandom64XOS256             = class;
           TRandom64XOS256p          = class;
           TRandom64XOS256ss         = class;

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

     TRandom32XOS<_TState_:record> = class( TRandomXOS<_TState_> )
     private
     protected
       ///// メソッド
       function Rot( const X_:Int32u; const K_:Int32s ) :Int32u; overload; inline;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS<_TState_>

     TRandom64XOS<_TState_:record> = class( TRandomXOS<_TState_> )
     private
     protected
       ///// メソッド
       function Rot( const X_:Int64u; const K_:Int64s ) :Int64u; overload; inline;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64

     TRandom32XOS64 = class( TRandom32XOS<TInt32u2D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

     TRandom32XOS64s = class( TRandom32XOS64 )
     private
     protected
       ///// メソッド
       function CalcRand32 :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

     TRandom32XOS64ss = class( TRandom32XOS64 )
     private
     protected
       ///// メソッド
       function CalcRand32 :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

     TRandom32XOS128 = class( TRandom32XOS<TInt32u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       procedure NextState64;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

     TRandom32XOS128p = class( TRandom32XOS128 )
     private
     protected
       ///// メソッド
       function CalcRand32 :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

     TRandom32XOS128ss = class( TRandom32XOS128 )
     private
     protected
       ///// メソッド
       function CalcRand32 :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

     TRandom64XOS128 = class( TRandom64XOS<TInt64u2D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       procedure NextState64;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

     TRandom64XOS128p = class( TRandom64XOS128 )
     private
     protected
       ///// メソッド
       function CalcRand64 :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

     TRandom64XOS128ss = class( TRandom64XOS128 )
     private
     protected
       ///// メソッド
       function CalcRand64 :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

     TRandom64XOS256 = class( TRandom64XOS<TInt64u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       procedure NextState128;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

     TRandom64XOS256p = class( TRandom64XOS256 )
     private
     protected
       ///// メソッド
       function CalcRand64 :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

     TRandom64XOS256ss = class( TRandom64XOS256 )
     private
     protected
       ///// メソッド
       function CalcRand64 :Int64u; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.SyncObjs;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOS<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS<_TState_>.Rot( const X_:Int32u; const K_:Int32s ) :Int32u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 32 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS<_TState_>.Rot( const X_:Int64u; const K_:Int64s ) :Int64u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 64 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS64.CalcNextState;
var
   S :TInt32u2D;
begin
     S := _State;

     with S do
     begin
          Y := Y xor X;

          _State.X := Rot( X, 26 ) xor Y xor ( Y shl 9 );  // a, b
          _State.Y := Rot( Y, 13 );                        // c
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS64.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u2D.Create( Random_.GetRandInt32u,
                               Random_.GetRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

{ http://xoshiro.di.unimi.it/xoroshiro64star.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS64s.CalcRand32 :Int32u;
begin
	   Result := _State.X * $9E3779BB;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

{ http://xoshiro.di.unimi.it/xoroshiro64starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS64ss.CalcRand32 :Int32u;
begin
	   Result := Rot( _State.X * $9E3779BB, 5 ) * 5;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS128.CalcNextState;
var
   T :Int32u;
begin
     with _State do
     begin
          T := Y shl 9;

          Z := Z xor X;
          W := W xor Y;
          Y := Y xor Z;
          X := X xor W;

          Z := Z xor T;

          W := Rot( W, 11 );
     end;
end;

//------------------------------------------------------------------------------

procedure TRandom32XOS128.NextState64;
const
     JUMP :array [ 0..4-1 ] of Int32u = ( $8764000b,
                                          $f542d2d3,
                                          $6fa035c3,
                                          $77f2db5b );
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
                    with S do
                    begin
                         X := X xor _State.X;
                         Y := Y xor _State.Y;
                         Z := Z xor _State.Z;
                         W := W xor _State.W;
                    end;
               end;

               CalcNextState;
          end;
     end;

     _State := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u4D.Create( Random_.GetRandInt32u,
                               Random_.GetRandInt32u,
                               Random_.GetRandInt32u,
                               Random_.GetRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS128p.CalcRand32 :UInt32;
begin
     with _State do Result := X + W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS128ss.CalcRand32 :UInt32;
begin
     Result := Rot( _State.X * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS128.CalcNextState;
var
   S :TInt64u2D;
begin
     S := _State;

     with S do
     begin
          Y := Y xor X;

          _State.X := Rot( X, 24 ) xor Y xor ( Y shl 16 );  // a, b
          _State.Y := Rot( Y, 37 );                         // c
     end;
end;

//------------------------------------------------------------------------------

procedure TRandom64XOS128.NextState64;
const
     JUMP :array [ 0..2-1 ] of Int64u = ( $df900294d8f554a5,
                                          $170865df4b3201fc );
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
                    with S do
                    begin
                         X := X xor _State.X;
                         Y := Y xor _State.Y;
                    end;
               end;

               CalcNextState;
          end;
     end;

     _State := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u2D.Create( Random_.GetRandInt64u,
                               Random_.GetRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

{ http://xoshiro.di.unimi.it/xoroshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS128p.CalcRand64 :Int64u;
begin
	   with _State do Result := X + Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

{ http://xoshiro.di.unimi.it/xoroshiro128starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS128ss.CalcRand64 :Int64u;
begin
	   Result := Rot( _State.X * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS256.CalcNextState;
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

               CalcNextState;
          end;
     end;

     _State := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS256.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u4D.Create( Random_.GetRandInt64u,
                               Random_.GetRandInt64u,
                               Random_.GetRandInt64u,
                               Random_.GetRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS256p.CalcRand64 :Int64u;
begin
     with _State do Result := X + W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS256ss.CalcRand64 :Int64u;
begin
     Result := Rot( _State.Y * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
