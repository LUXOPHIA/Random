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
       function GetRand32 :UInt32;
       function GetRand64 :UInt64;
       function Value :Double;
     end;

     //-------------------------------------------------------------------------

     TRandom = class( TInterfacedObject, IRandom )
     protected class var
       _GloSeed :UInt32;
       _SeedCS  :TCriticalSection;
     private
     protected
     public
       class constructor Create;
       constructor Create; overload; virtual;
       constructor Create( const Random_:IRandom ); overload; virtual; abstract;
       class destructor Destroy;
       ///// メソッド
       class function GetGlobalSeed32 :UInt32; virtual;
       class function GetGlobalSeed64 :UInt64; virtual;
       class procedure GetGlobalSeed( out Seeds_:array of UInt32 ); overload; virtual;
       class procedure GetGlobalSeed( out Seeds_:array of UInt64 ); overload; virtual;
       function GetRand32 :UInt32; virtual; abstract;
       function GetRand64 :UInt64; virtual;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom.Create;
begin
     inherited;

     _SeedCS := TCriticalSection.Create;

     _GloSeed := GetClockCount;
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

////////////////////////////////////////////////////////////////////////////////

class function TRandom.GetGlobalSeed32 :UInt32;
begin
     _SeedCS.Enter;

       Result := _GloSeed;  Inc( _GloSeed );

     _SeedCS.Leave;
end;

class function TRandom.GetGlobalSeed64 :UInt64;
begin
     _SeedCS.Enter;

       Result := _GloSeed;  Inc( _GloSeed );

     _SeedCS.Leave;
end;

class procedure TRandom.GetGlobalSeed( out Seeds_:array of UInt32 );
var
   I :Integer;
begin
     _SeedCS.Enter;

       for I := 0 to High( Seeds_ ) do
       begin
            Seeds_[ I ] := _GloSeed;  Inc( _GloSeed );
       end;

     _SeedCS.Leave;
end;

class procedure TRandom.GetGlobalSeed( out Seeds_:array of UInt64 );
var
   I :Integer;
begin
     _SeedCS.Enter;

       for I := 0 to High( Seeds_ ) do
       begin
            Seeds_[ I ] := _GloSeed;  Inc( _GloSeed );
       end;

     _SeedCS.Leave;
end;

//------------------------------------------------------------------------------

function TRandom.GetRand64 :UInt64;
begin
     Result := ( GetRand32 shl 32 ) or GetRand32;
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