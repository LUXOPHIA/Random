﻿unit LUX.Random;

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
       function Value :Double;
     end;

     //-------------------------------------------------------------------------

     TRandom = class( TInterfacedObject, IRandom )
     protected class var
       _GloSeed :UInt32;
       _SeedCS  :TCriticalSection;
     private
     protected
       ///// メソッド
       function GetGloSeed :UInt32;
     public
       class constructor Create;
       constructor Create; overload; virtual;
       class destructor Destroy;
       ///// メソッド
       function Value :Double; virtual; abstract;  // 0 <= Value < 1
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetClockCount :UInt64;

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

function TRandom.GetGloSeed :UInt32;
begin
     _SeedCS.Enter;

     Result := _GloSeed;

     if _GloSeed = UInt32.MaxValue then _GloSeed := 0;

     Inc( _GloSeed );

     _SeedCS.Leave;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom.Create;
begin
     inherited;

     _SeedCS := TCriticalSection.Create;

     _GloSeed := ( 1 + GetClockCount ) and UInt32.MaxValue;
end;

constructor TRandom.Create;
begin
     inherited;

end;

class destructor TRandom.Destroy;
begin
     _SeedCS.DisposeOf;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetClockCount :UInt64;
{$IFDEF MSWINDOWS }
var
   Counter :Int64;
begin
     if QueryPerformanceCounter( Counter ) then Result := Counter       // Int64
                                           else Result := GetTickCount; //UInt32
end;
{$ELSEIF MACOS }
begin
     Result := AbsoluteToNanoseconds( MachAbsoluteTime );  //UInt64
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