unit LUX.Random;

interface //#################################################################### ■

uses System.SyncObjs,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     CRandom = class of TRandom;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom

     IRandom = interface
     ['{333C851D-AEE2-4145-A5A0-33934B32B117}']
     {protected}
     {public}
       ///// メソッド
       procedure NextState;
       function GetRand32 :Int32u;
       function GetRand64 :UInt64;
       function Value :Double;
     end;

     //-------------------------------------------------------------------------

     TRandom = class( TInterfacedObject, IRandom )
     protected class var
       _Time64 :Int64u;
       _TimeCS :TCriticalSection;
       _SeedCS :TCriticalSection;
     private
     protected
     public
       class constructor Create;
       constructor Create; overload; virtual;
       constructor Create( const Random_:IRandom ); overload; virtual; abstract;
       class destructor Destroy;
       ///// メソッド
       class function GetTime32 :Int32u; virtual;
       class function GetTime64 :Int64u; virtual;
       class procedure GetTimes( out Times_:array of Int32u ); overload; virtual;
       class procedure GetTimes( out Times_:array of Int64u ); overload; virtual;
       procedure NextState; virtual; abstract;
       function GetRand32 :Int32u; virtual;
       function GetRand64 :Int64u; virtual;
       function Value :Double; virtual; abstract;  // 0 <= Value < 1
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom<_TState_>

     IRandom<_TState_:record> = interface( IRandom )
     ['{FF14FAF6-6AF9-488B-A6B2-570921BC7547}']
     {protected}
       ///// アクセス
       function GetState :_TState_;
       procedure SetState( const State_:_TState_ );
     {public}
       ///// プロパティ
       property State :_TState_ read GetState write SetState;
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
       constructor Create( const State_:_TState_ ); overload; virtual;
       ///// プロパティ
       property State :_TState_ read GetState write SetState;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetClockCount :Int64u;

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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom.Create;
begin
     inherited;

     _TimeCS := TCriticalSection.Create;
     _SeedCS := TCriticalSection.Create;

     _Time64 := GetClockCount;
end;

constructor TRandom.Create;
begin
     inherited;

end;

class destructor TRandom.Destroy;
begin
     _TimeCS.DisposeOf;
     _SeedCS.DisposeOf;

     inherited;
end;

////////////////////////////////////////////////////////////////////////////////

class function TRandom.GetTime32 :Int32u;
begin
     Result := GetTime64;
end;

class function TRandom.GetTime64 :Int64u;
begin
     _TimeCS.Enter;

       Result := _Time64;  Inc( _Time64 );

     _TimeCS.Leave;
end;

class procedure TRandom.GetTimes( out Times_:array of Int32u );
var
   I :Int32s;
begin
     _TimeCS.Enter;

       for I := 0 to High( Times_ ) do
       begin
            Times_[ I ] := _Time64;  Inc( _Time64 );
       end;

     _TimeCS.Leave;
end;

class procedure TRandom.GetTimes( out Times_:array of Int64u );
var
   I :Int32s;
begin
     _TimeCS.Enter;

       for I := 0 to High( Times_ ) do
       begin
            Times_[ I ] := _Time64;  Inc( _Time64 );
       end;

     _TimeCS.Leave;
end;

//------------------------------------------------------------------------------

function TRandom.GetRand32 :Int32u;
begin
     Result := GetRand64 shr 32;
end;

function TRandom.GetRand64 :Int64u;
begin
     Result := ( GetRand32 shl 32 ) or GetRand32;
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

constructor TRandom<_TState_>.Create( const State_:_TState_ );
begin
     inherited Create;

     _State := State_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetClockCount :Int64u;
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