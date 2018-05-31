unit LUX.Random.Xoshiro;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IRandomXOS<_TSeed_:record>     = interface;

     TRandomXOS<_TSeed_:record>     = class;
       TRandom32XOS<_TSeed_:record> = class;
         TRandom32XOS64             = class;
           TRandom32XOS64s          = class;
           TRandom32XOS64ss         = class;
         TRandom32XOS128            = class;
           TRandom32XOS128p         = class;
           TRandom32XOS128ss        = class;
       TRandom64XOS<_TSeed_:record> = class;
         TRandom64XOS128            = class;
           TRandom64XOS128p         = class;
           TRandom64XOS128ss        = class;
         TRandom64XOS256            = class;
           TRandom64XOS256p         = class;
           TRandom64XOS256ss        = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOS<_TSeed_>

     IRandomXOS<_TSeed_:record> = interface( IRandom<_TSeed_> )
     ['{FDD69CB5-D221-4FDD-89C9-BB3CF352BD74}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomXOS<_TSeed_:record> = class( TRandom<_TSeed_>, IRandomXOS<_TSeed_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS<_TSeed_>

     TRandom32XOS<_TSeed_:record> = class( TRandomXOS<_TSeed_> )
     private
     protected
       ///// メソッド
       function Rot( const X_:Int32u; const K_:Int32s ) :Int32u; overload; inline;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS<_TSeed_>

     TRandom64XOS<_TSeed_:record> = class( TRandomXOS<_TSeed_> )
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
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

     TRandom32XOS64s = class( TRandom32XOS64 )
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

     TRandom32XOS64ss = class( TRandom32XOS64 )
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

     TRandom32XOS128 = class( TRandom32XOS<TInt32u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       procedure CalcNextSeed64;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

     TRandom32XOS128p = class( TRandom32XOS128 )
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

     TRandom32XOS128ss = class( TRandom32XOS128 )
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

     TRandom64XOS128 = class( TRandom64XOS<TInt64u2D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       procedure CalcNextSeed64;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

     TRandom64XOS128p = class( TRandom64XOS128 )
     private
     protected
       ///// メソッド
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

     TRandom64XOS128ss = class( TRandom64XOS128 )
     private
     protected
       ///// メソッド
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

     TRandom64XOS256 = class( TRandom64XOS<TInt64u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       procedure CalcNextSeed128;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

     TRandom64XOS256p = class( TRandom64XOS256 )
     private
     protected
       ///// メソッド
       function CalcRandInt64u :Int64u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

     TRandom64XOS256ss = class( TRandom64XOS256 )
     private
     protected
       ///// メソッド
       function CalcRandInt64u :Int64u; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.SyncObjs;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOS<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS<_TSeed_>.Rot( const X_:Int32u; const K_:Int32s ) :Int32u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 32 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS<_TSeed_>.Rot( const X_:Int64u; const K_:Int64s ) :Int64u;
begin
     Result := ( X_ shl K_ ) or ( X_ shr ( 64 - K_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS64.CalcNextSeed;
var
   S :TInt32u2D;
begin
     S := _Seed;

     with S do
     begin
          Y := Y xor X;

          _Seed.X := Rot( X, 26 ) xor Y xor ( Y shl 9 );  // a, b
          _Seed.Y := Rot( Y, 13 );                        // c
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS64.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u2D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64s

{ http://xoshiro.di.unimi.it/xoroshiro64star.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS64s.CalcRandInt32u :Int32u;
begin
	   Result := _Seed.X * $9E3779BB;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS64ss

{ http://xoshiro.di.unimi.it/xoroshiro64starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS64ss.CalcRandInt32u :Int32u;
begin
	   Result := Rot( _Seed.X * $9E3779BB, 5 ) * 5;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32XOS128.CalcNextSeed;
var
   T :Int32u;
begin
     with _Seed do
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

procedure TRandom32XOS128.CalcNextSeed64;
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
                         X := X xor _Seed.X;
                         Y := Y xor _Seed.Y;
                         Z := Z xor _Seed.Z;
                         W := W xor _Seed.W;
                    end;
               end;

               CalcNextSeed;
          end;
     end;

     _Seed := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32XOS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u4D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128p

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS128p.CalcRandInt32u :UInt32;
begin
     with _Seed do Result := X + W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32XOS128ss

{ http://xoshiro.di.unimi.it/xoshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32XOS128ss.CalcRandInt32u :UInt32;
begin
     Result := Rot( _Seed.X * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS128.CalcNextSeed;
var
   S :TInt64u2D;
begin
     S := _Seed;

     with S do
     begin
          Y := Y xor X;

          _Seed.X := Rot( X, 24 ) xor Y xor ( Y shl 16 );  // a, b
          _Seed.Y := Rot( Y, 37 );                         // c
     end;
end;

//------------------------------------------------------------------------------

procedure TRandom64XOS128.CalcNextSeed64;
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
                         X := X xor _Seed.X;
                         Y := Y xor _Seed.Y;
                    end;
               end;

               CalcNextSeed;
          end;
     end;

     _Seed := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u2D.Create( Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128p

{ http://xoshiro.di.unimi.it/xoroshiro128plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS128p.CalcRandInt64u :Int64u;
begin
	   with _Seed do Result := X + Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS128ss

{ http://xoshiro.di.unimi.it/xoroshiro128starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS128ss.CalcRandInt64u :Int64u;
begin
	   Result := Rot( _Seed.X * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS256.CalcNextSeed;
var
   T :Int64u;
begin
     with _Seed do
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

procedure TRandom64XOS256.CalcNextSeed128;
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
                         X := X xor _Seed.X;
                         Y := Y xor _Seed.Y;
                         Z := Z xor _Seed.Z;
                         W := W xor _Seed.W;
                    end;
               end;

               CalcNextSeed;
          end;
     end;

     _Seed := S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS256.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u4D.Create( Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256p

{ http://xoshiro.di.unimi.it/xoshiro256plus.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS256p.CalcRandInt64u :Int64u;
begin
     with _Seed do Result := X + W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256ss

{ http://xoshiro.di.unimi.it/xoshiro256starstar.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64XOS256ss.CalcRandInt64u :Int64u;
begin
     Result := Rot( _Seed.Y * 5, 7 ) * 9;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
