unit LUX.Random.Xorshift;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRandomXOR<_TSeed_:record> = class;
       TRandomXOR32             = class;
       TRandomXOR64             = class;
       TRandomXOR96             = class;
       TRandomXOR128            = class;
       TRandom64XOR64           = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR<_TSeed_>

     IRandomXOR<_TSeed_:record> = interface( IRandom<_TSeed_> )
     ['{FDD69CB5-D221-4FDD-89C9-BB3CF352BD74}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomXOR<_TSeed_:record> = class( TRandom<_TSeed_>, IRandomXOR<_TSeed_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

     TRandomXOR32 = class( TRandomXOR<Int32u> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

     TRandomXOR64 = class( TRandomXOR<Int64u> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

     TRandomXOR96 = class( TRandomXOR<TInt32u3D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

     TRandomXOR128 = class( TRandomXOR<TInt32u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOR64

     TRandom64XOR64 = class( TRandomXOR<Int64u> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt64u :Int64u; override;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR32.CalcNextSeed;
begin
     _Seed := _Seed xor ( _Seed shl 13 );
     _Seed := _Seed xor ( _Seed shr 17 );
     _Seed := _Seed xor ( _Seed shl 15 );
end;

function TRandomXOR32.CalcRandInt32u :Int32u;
begin
     Result := _Seed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR32.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt32u );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR64.CalcNextSeed;
begin
     _Seed := _Seed xor ( _Seed shl 13 );
     _Seed := _Seed xor ( _Seed shr  7 );
     _Seed := _Seed xor ( _Seed shl 17 );
end;

function TRandomXOR64.CalcRandInt32u :Int32u;
begin
     Result := _Seed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR64.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt64u );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR96.CalcNextSeed;
var
   T :Int32u;
begin
     with _Seed do
     begin
          T := ( X xor ( X shl  3 ) )
           xor ( Y xor ( Y shr 19 ) )
           xor ( Z xor ( Z shl  6 ) );

          X := Y;  Y := Z;  Z := T;
     end;
end;

function TRandomXOR96.CalcRandInt32u :Int32u;
begin
     Result := _Seed.Z;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR96.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u3D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR128.CalcNextSeed;
var
   T :Int32u;
begin
     with _Seed do
     begin
          T := X xor ( X shl 11 );

          X := Y;  Y := Z;  Z := W;

          W := ( W xor ( W shr 19 ) )
           xor ( T xor ( T shr  8 ) );
     end;
end;

function TRandomXOR128.CalcRandInt32u :Int32u;
begin
     Result := _Seed.W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u4D.Create( Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u,
                               Random_.DrawRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOR64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOR64.CalcNextSeed;
begin
     _Seed := _Seed xor ( _Seed shl 7 );
     _Seed := _Seed xor ( _Seed shr 9 );
end;

function TRandom64XOR64.CalcRandInt64u :Int64u;
begin
     Result := _Seed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOR64.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt64u );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■