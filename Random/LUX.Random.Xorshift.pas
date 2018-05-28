unit LUX.Random.Xorshift;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR

     IRandomXOR = interface( IRandom )
     ['{FDD69CB5-D221-4FDD-89C9-BB3CF352BD74}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomXOR = class( TRandom, IRandomXOR )
     private
     protected
     public
       ///// メソッド
       class function GetGlobalSeed32 :UInt32; override;
       class function GetGlobalSeed64 :UInt64; override;
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

     TRandomXOR32 = class( TRandomXOR )
     private
     protected
       _Seed :UInt32;
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const Seed_:UInt32 ); overload;
       ///// メソッド
       function GetRand32 :UInt32; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

     TRandomXOR64 = class( TRandomXOR )
     private
     protected
       _Seed :Uint64;
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const Seed_:Uint64 ); overload;
       ///// メソッド
       function GetRand32 :UInt32; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

     TRandomXOR96 = class( TRandomXOR )
     private
     protected
       _Seed :TCardinal3D;
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const SeedX_,SeedY_,SeedZ_:UInt32 ); overload;
       ///// メソッド
       function GetRand32 :UInt32; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

     TRandomXOR128 = class( TRandomXOR )
     private
     protected
       _Seed :TCardinal4D;
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       constructor Create( const SeedX_,SeedY_,SeedZ_,SeedW_:UInt32 ); overload;
       ///// メソッド
       function GetRand32 :UInt32; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

class function TRandomXOR.GetGlobalSeed32 :UInt32;
begin
     repeat
           Result := inherited GetGlobalSeed32;

     until Result > 0;
end;

class function TRandomXOR.GetGlobalSeed64 :UInt64;
begin
     repeat
           Result := inherited GetGlobalSeed64;

     until Result > 0;
end;

//------------------------------------------------------------------------------

function TRandomXOR.Value :Double;
begin
     Result := GetRand32 / 4294967296.0{= 2^32 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR32.Create;
begin
     Create( GetGlobalSeed32 );
end;

constructor TRandomXOR32.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32 );
end;

constructor TRandomXOR32.Create( const Seed_:UInt32 );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR32.GetRand32 :UInt32;
begin
     _Seed := _Seed xor ( _Seed shl 13 );
     _Seed := _Seed xor ( _Seed shr 17 );
     _Seed := _Seed xor ( _Seed shl 15 );

     Result := _Seed;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR64.Create;
begin
     Create( GetGlobalSeed64 );
end;

constructor TRandomXOR64.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand64 );
end;

constructor TRandomXOR64.Create( const Seed_:Uint64 );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR64.GetRand32 :UInt32;
begin
     _Seed := _Seed xor ( _Seed shl 13 );
     _Seed := _Seed xor ( _Seed shr  7 );
     _Seed := _Seed xor ( _Seed shl 17 );

     Result := _Seed and UInt32.MaxValue;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR96.Create;
begin
     Create( GetGlobalSeed32,
             GetGlobalSeed32,
             GetGlobalSeed32 );
end;

constructor TRandomXOR96.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32,
             Random_.GetRand32,
             Random_.GetRand32 );
end;

constructor TRandomXOR96.Create( const SeedX_,SeedY_,SeedZ_:UInt32 );
begin
     inherited Create;

     _Seed.X := SeedX_;
     _Seed.Y := SeedY_;
     _Seed.Z := SeedZ_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR96.GetRand32 :UInt32;
begin
     with _Seed do
     begin
          Result := ( X xor ( X shl  3 ) )
                xor ( Y xor ( Y shr 19 ) )
                xor ( Z xor ( Z shl  6 ) );

          X := Y;  Y := Z;  Z := Result;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR128.Create;
var
   R :IRandomXOR;
begin
     Create( GetGlobalSeed32,
             GetGlobalSeed32,
             GetGlobalSeed32,
             GetGlobalSeed32 );
end;

constructor TRandomXOR128.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32,
             Random_.GetRand32,
             Random_.GetRand32,
             Random_.GetRand32 );
end;

constructor TRandomXOR128.Create( const SeedX_,SeedY_,SeedZ_,SeedW_:UInt32 );
begin
     inherited Create;

     _Seed.X := SeedX_;
     _Seed.Y := SeedY_;
     _Seed.Z := SeedZ_;
     _Seed.W := SeedW_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR128.GetRand32 :UInt32;
var
   T :UInt32;
begin
     with _Seed do
     begin
          T := X xor ( X shl 11 );

          X := Y;  Y := Z;  Z := W;

          W := ( W xor ( W shr 19 ) )
           xor ( T xor ( T shr  8 ) );

          Result := W;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■