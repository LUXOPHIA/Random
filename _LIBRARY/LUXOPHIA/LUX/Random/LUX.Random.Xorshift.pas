unit LUX.Random.Xorshift;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR<_TState_>

     IRandomXOR<_TState_:record> = interface( IRandom<_TState_> )
     ['{FDD69CB5-D221-4FDD-89C9-BB3CF352BD74}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomXOR<_TState_:record> = class( TRandom<_TState_>, IRandomXOR<_TState_> )
     private
     protected
     public
       ///// メソッド
       class function GetTime32 :Int32u; override;
       class function GetTime64 :Int64u; override;
       class procedure GetTimes( out Times_:array of Int32u ); overload; override;
       class procedure GetTimes( out Times_:array of Int64u ); overload; override;
       function Value :Double; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

     TRandomXOR32 = class( TRandomXOR<Int32u> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

     TRandomXOR64 = class( TRandomXOR<Int64u> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

     TRandomXOR96 = class( TRandomXOR<TCardinal3D> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

     TRandomXOR128 = class( TRandomXOR<TCardinal4D> )
     private
     protected
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom ); overload; override;
       ///// メソッド
       function GetRand32 :Int32u; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.SyncObjs;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

class function TRandomXOR<_TState_>.GetTime32 :Int32u;
begin
     _TimeCS.Enter;

       repeat
             Result := _Time64;  Inc( _Time64 );

       until Result > 0;

     _TimeCS.Leave;
end;

class function TRandomXOR<_TState_>.GetTime64 :Int64u;
begin
     _TimeCS.Enter;

       repeat
             Result := _Time64;  Inc( _Time64 );

       until Result > 0;

     _TimeCS.Leave;
end;

class procedure TRandomXOR<_TState_>.GetTimes( out Times_:array of Int32u );
var
   I :Int32s;
begin
     _TimeCS.Enter;

       for I := 0 to High( Times_ ) do
       begin
            repeat
                  Times_[ I ] := _Time64;  Inc( _Time64 );

            until Times_[ I ] > 0;
       end;

     _TimeCS.Leave;
end;

class procedure TRandomXOR<_TState_>.GetTimes( out Times_:array of Int64u );
var
   I :Int32s;
begin
     _TimeCS.Enter;

       for I := 0 to High( Times_ ) do
       begin
            repeat
                  Times_[ I ] := _Time64;  Inc( _Time64 );

            until Times_[ I ] > 0;
       end;

     _TimeCS.Leave;
end;

//------------------------------------------------------------------------------

function TRandomXOR<_TState_>.Value :Double;
begin
     Result := GetRand32 / 4294967296.0{= 2^32 };
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR32.Create;
begin
     Create( GetTime32 );
end;

constructor TRandomXOR32.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand32 );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR32.GetRand32 :Int32u;
begin
     _State := _State xor ( _State shl 13 );
     _State := _State xor ( _State shr 17 );
     _State := _State xor ( _State shl 15 );

     Result := _State;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR64.Create;
begin
     Create( GetTime64 );
end;

constructor TRandomXOR64.Create( const Random_:IRandom );
begin
     Create( Random_.GetRand64 );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR64.GetRand32 :Int32u;
begin
     _State := _State xor ( _State shl 13 );
     _State := _State xor ( _State shr  7 );
     _State := _State xor ( _State shl 17 );

     Result := _State;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR96.Create;
var
   S :TCardinal3D;
begin
     GetTimes( S._ );

     Create( S );
end;

constructor TRandomXOR96.Create( const Random_:IRandom );
var
   S :TCardinal3D;
begin
     S.X := Random_.GetRand32;
     S.Y := Random_.GetRand32;
     S.Z := Random_.GetRand32;

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR96.GetRand32 :Int32u;
begin
     with _State do
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
   S :TCardinal4D;
begin
     GetTimes( S._ );

     Create( S );
end;

constructor TRandomXOR128.Create( const Random_:IRandom );
var
   S :TCardinal4D;
begin
     S.X := Random_.GetRand32;
     S.Y := Random_.GetRand32;
     S.Z := Random_.GetRand32;
     S.W := Random_.GetRand32;

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandomXOR128.GetRand32 :Int32u;
var
   T :Int32u;
begin
     with _State do
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