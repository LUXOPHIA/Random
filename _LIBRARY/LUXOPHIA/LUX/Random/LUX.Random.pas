unit LUX.Random;

interface //#################################################################### ■

uses System.SyncObjs,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IRandom                    = interface;
       IRandom<_TState_:record> = interface;
         IRandomZero            = interface;

     TRandom                    = class;
       TRandom<_TState_:record> = class;
         TRandomZero            = class;

     ///////////////////////////////////////////////////////////////////////////

     CRandom = class of TRandom;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom

     IRandom = interface
     ['{333C851D-AEE2-4145-A5A0-33934B32B117}']
     {protected}
     {public}
       ///// メソッド
       procedure GoNextState;
       procedure DrawRand( out Rand_:Int32u ); overload;
       procedure DrawRand( out Rand_:Int64u ); overload;
       procedure DrawRand( out Rand_:Flo32s ); overload;
       procedure DrawRand( out Rand_:Flo64s ); overload;
       function DrawRandInt32u :Int32u;
       function DrawRandInt64u :Int64u;
       function DrawRandFlo32s :Single;
       function DrawRandFlo64s :Double;
     end;

     //-------------------------------------------------------------------------

     TRandom = class( TInterfacedObject, IRandom )
     protected class var
       _Zero :IRandomZero;
     private
     protected
       _StateCS :TCriticalSection;
       ///// メソッド
       procedure CalcNextState; virtual; abstract;
       function CalcRand32 :Int32u; virtual;
       function CalcRand64 :Int64u; virtual;
     public
       class constructor Create;
       constructor Create; overload; virtual;
       constructor Create( const Random_:IRandom; const _:Byte = 0 ); overload; virtual; abstract;
       constructor CreateFromRand( const Random_:IRandom ); overload; virtual; abstract;
       destructor Destroy; override;
       ///// メソッド
       procedure GoNextState;
       procedure DrawRand( out Rand_:Int32u ); overload;  // 0 <= Value < 4,294,967,296              = $1,0000,0000           = 2^32
       procedure DrawRand( out Rand_:Int64u ); overload;  // 0 <= Value < 18,446,744,073,709,551,616 = $1,0000,0000,0000,0000 = 2^64
       procedure DrawRand( out Rand_:Flo32s ); overload;  // 0 <= Value < 1
       procedure DrawRand( out Rand_:Flo64s ); overload;  // 0 <= Value < 1
       function DrawRandInt32u :Int32u;                   // 0 <= Value < 4,294,967,296              = $1,0000,0000           = 2^32
       function DrawRandInt64u :Int64u;                   // 0 <= Value < 18,446,744,073,709,551,616 = $1,0000,0000,0000,0000 = 2^64
       function DrawRandFlo32s :Single;                   // 0 <= Value < 1
       function DrawRandFlo64s :Double;                   // 0 <= Value < 1
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom<_TState_>

     IRandom<_TState_:record> = interface( IRandom )
     ['{BF700E87-C812-4802-9470-4922D1653C72}']
     {protected}
       ///// アクセス
       function GetState :_TState_;
       procedure SetState( const State_:_TState_ );
     {public}
       ///// プロパティ
       property State :_TState_ read GetState write SetState;
       ///// メソッド
       procedure DrawSeed( out Rand_:_TState_ ); overload;
       function DrawSeed :_TState_; overload;
     end;

     //-------------------------------------------------------------------------

     TRandom<_TState_:record> = class( TRandom, IRandom<_TState_> )
     private
     protected
       _State :_TState_;
       ///// アクセス
       function GetState :_TState_;
       procedure SetState( const State_:_TState_ );
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom; const _:Byte = 0 ); overload; override;
       constructor CreateFromSeed( const Random_:IRandom<_TState_> );
       constructor Create( const State_:_TState_ ); overload; virtual;
       ///// プロパティ
       property State :_TState_ read GetState write SetState;
       ///// メソッド
       procedure DrawSeed( out Rand_:_TState_ ); overload;
       function DrawSeed :_TState_; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomZero

     IRandomZero = interface( IRandom<Int64u> )
     ['{38D34A14-0D1E-466C-A969-13BDA7BB0E56}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomZero = class( TRandom<Int64u>, IRandomZero )
     protected class var
       _Time64 :Int64u;
       _TimeCS :TCriticalSection;
     private
     protected
       ///// メソッド
       procedure CalcNextState; override;
       function CalcRand64 :Int64u; override;
     public
       class constructor Create;
       constructor Create; overload; override;
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       class destructor Destroy;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetTimeCount :Int64u;

implementation //############################################################### ■

uses System.SysUtils
     {$IF Defined( MSWINDOWS ) }
   , Winapi.Windows
     {$ELSEIF Defined( MACOS ) }
   , Macapi.Mach
     {$ELSEIF Fefined( POSIX ) }
   , Posix.Time
     {$ENDIF};

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom.CalcRand32 :Int32u;
begin
     Result := CalcRand64 and $FFFFFFFF{= 2^32-1 };
end;

function TRandom.CalcRand64 :Int64u;
begin
     Result := CalcRand32;  CalcNextState;

     Result := ( Result shl 32 ) or CalcRand32;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom.Create;
begin
     inherited;

     _Zero := TRandomZero.Create;
end;

constructor TRandom.Create;
begin
     inherited;

     _StateCS := TCriticalSection.Create;
end;

destructor TRandom.Destroy;
begin
     _StateCS.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom.GoNextState;
begin
     _StateCS.Enter;

       CalcNextState;

     _StateCS.Leave;
end;

//------------------------------------------------------------------------------

procedure TRandom.DrawRand( out Rand_:Int32u );
begin
     _StateCS.Enter;

       Rand_ := CalcRand32;  CalcNextState;

     _StateCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Int64u );
begin
     _StateCS.Enter;

       Rand_ := CalcRand64;  CalcNextState;

     _StateCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Flo32s );
begin
     Rand_ := DrawRandInt32u / 4294967296.0{= 2^32 };
end;

procedure TRandom.DrawRand( out Rand_:Flo64s );
begin
     Rand_ := DrawRandInt64u / 18446744073709551616.0{= 2^64 };
end;

//------------------------------------------------------------------------------

function TRandom.DrawRandInt32u :Int32u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandInt64u :Int64u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandFlo32s :Single;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandFlo64s :Double;
begin
     DrawRand( Result );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom<_TState_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom<_TState_>.GetState :_TState_;
begin
     Result := _State;
end;

procedure TRandom<_TState_>.SetState( const State_:_TState_ );
begin
     _State := State_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom<_TState_>.Create;
begin
     Create( _Zero );
end;

{ [dcc64 警告] W1029 パラメータが同じ重複した constructor 'TRandom.CreateFromRand' は C++ からアクセスできません }
constructor TRandom<_TState_>.Create( const Random_:IRandom; const _:Byte = 0 );
begin
     if Random_ is ClassType then CreateFromSeed( Random_ as IRandom<_TState_> )
                             else CreateFromRand( Random_ );
end;

constructor TRandom<_TState_>.CreateFromSeed( const Random_:IRandom<_TState_> );
begin
     Create( Random_.DrawSeed );
end;

constructor TRandom<_TState_>.Create( const State_:_TState_ );
begin
     inherited Create;

     _State := State_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom<_TState_>.DrawSeed( out Rand_:_TState_ );
begin
     _StateCS.Enter;

       Rand_ := _State;  CalcNextState;

     _StateCS.Leave;
end;

function TRandom<_TState_>.DrawSeed :_TState_;
begin
     DrawSeed( Result );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomZero

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomZero.CalcNextState;
begin
     Inc( _State );
end;

function TRandomZero.CalcRand64 :Int64u;
begin
     Result := _State;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandomZero.Create;
begin
     inherited;

     _TimeCS := TCriticalSection.Create;

     _Time64 := GetTimeCount;
end;

constructor TRandomZero.Create;
begin
     _TimeCS.Enter;

       Create( _Time64 );  Inc( _Time64 );

     _TimeCS.Leave;
end;

constructor TRandomZero.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt64u );
end;

class destructor TRandomZero.Destroy;
begin
     _TimeCS.DisposeOf;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetTimeCount :Int64u;
{$IFDEF MSWINDOWS }
var
   Counter :Int64;
begin
     if QueryPerformanceCounter( Counter ) then Result := Counter       //Int64s
                                           else Result := GetTickCount; //Int32u
end;
{$ELSEIF MACOS }
begin
     Result := AbsoluteToNanoseconds( MachAbsoluteTime );  //Int64u
end;
{$ELSEIF Defined( LINUX ) or Defined( ANDROID ) }
var
   TimeOfDay :timeval;
begin
     if gettimeofday( TimeOfDay, nil ) = 0
     then Result := TimeOfDay.tv_sec * 1000000 + TimeOfDay.tv_usec
     else Result := time( nil );
end;
{$ENDIF}

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■