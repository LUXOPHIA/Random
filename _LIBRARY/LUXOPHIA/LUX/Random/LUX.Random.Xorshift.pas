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
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

     TRandomXOR32 = class( TRandomXOR<Int32u> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

     TRandomXOR64 = class( TRandomXOR<Int64u> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

     TRandomXOR96 = class( TRandomXOR<TInt32u3D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

     TRandomXOR128 = class( TRandomXOR<TInt32u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand32 :Int32u; override;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR32.CalcNextState;
begin
     _State := _State xor ( _State shl 13 );
     _State := _State xor ( _State shr 17 );
     _State := _State xor ( _State shl 15 );
end;

function TRandomXOR32.CalcRand32 :Int32u;
begin
     Result := _State;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR32.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.GetRandInt32u );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR64.CalcNextState;
begin
     _State := _State xor ( _State shl 13 );
     _State := _State xor ( _State shr  7 );
     _State := _State xor ( _State shl 17 );
end;

function TRandomXOR64.CalcRand32 :Int32u;
begin
     Result := _State;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR64.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.GetRandInt64u );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR96

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR96.CalcNextState;
var
   T :Int32u;
begin
     with _State do
     begin
          T := ( X xor ( X shl  3 ) )
           xor ( Y xor ( Y shr 19 ) )
           xor ( Z xor ( Z shl  6 ) );

          X := Y;  Y := Z;  Z := T;
     end;
end;

function TRandomXOR96.CalcRand32 :Int32u;
begin
     Result := _State.Z;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR96.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u3D.Create( Random_.GetRandInt32u,
                               Random_.GetRandInt32u,
                               Random_.GetRandInt32u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomXOR128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomXOR128.CalcNextState;
var
   T :Int32u;
begin
     with _State do
     begin
          T := X xor ( X shl 11 );

          X := Y;  Y := Z;  Z := W;

          W := ( W xor ( W shr 19 ) )
           xor ( T xor ( T shr  8 ) );
     end;
end;

function TRandomXOR128.CalcRand32 :Int32u;
begin
     Result := _State.W;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomXOR128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt32u4D.Create( Random_.GetRandInt32u,
                               Random_.GetRandInt32u,
                               Random_.GetRandInt32u,
                               Random_.GetRandInt32u ) );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■