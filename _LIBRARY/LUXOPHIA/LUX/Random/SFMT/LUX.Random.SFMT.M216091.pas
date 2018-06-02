﻿unit LUX.Random.SFMT.M216091;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSFMT216091

     TRandomSFMT216091 = class( TRandomSFMT )
     private const
     private
     protected
       ///// アクセス
       function GetSFMT_MEXP :Int32s; override;
       function GetSFMT_POS1 :Int32s; override;
       function GetSFMT_SL1 :Int32s; override;
       function GetSFMT_SL2 :Int32s; override;
       function GetSFMT_SR1 :Int32s; override;
       function GetSFMT_SR2 :Int32s; override;
       function GetSFMT_MSK1 :Int32u; override;
       function GetSFMT_MSK2 :Int32u; override;
       function GetSFMT_MSK3 :Int32u; override;
       function GetSFMT_MSK4 :Int32u; override;
       function GetSFMT_PARITY1 :Int32u; override;
       function GetSFMT_PARITY2 :Int32u; override;
       function GetSFMT_PARITY3 :Int32u; override;
       function GetSFMT_PARITY4 :Int32u; override;
       function GetSFMT_IDSTR :String; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSFMT216091

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandomSFMT216091.GetSFMT_MEXP :Int32s;
begin
     Result := 216091;
end;

function TRandomSFMT216091.GetSFMT_POS1 :Int32s;
begin
     Result := 627;
end;

function TRandomSFMT216091.GetSFMT_SL1 :Int32s;
begin
     Result := 11;
end;

function TRandomSFMT216091.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandomSFMT216091.GetSFMT_SR1 :Int32s;
begin
     Result := 10;
end;

function TRandomSFMT216091.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandomSFMT216091.GetSFMT_MSK1 :Int32u;
begin
     Result := $bff7bff7;
end;

function TRandomSFMT216091.GetSFMT_MSK2 :Int32u;
begin
     Result := $bfffffff;
end;

function TRandomSFMT216091.GetSFMT_MSK3 :Int32u;
begin
     Result := $bffffa7f;
end;

function TRandomSFMT216091.GetSFMT_MSK4 :Int32u;
begin
     Result := $ffddfbfb;
end;

function TRandomSFMT216091.GetSFMT_PARITY1 :Int32u;
begin
     Result := $f8000001;
end;

function TRandomSFMT216091.GetSFMT_PARITY2 :Int32u;
begin
     Result := $89e80709;
end;

function TRandomSFMT216091.GetSFMT_PARITY3 :Int32u;
begin
     Result := $3bd2b64b;
end;

function TRandomSFMT216091.GetSFMT_PARITY4 :Int32u;
begin
     Result := $0c64b1e4;
end;

function TRandomSFMT216091.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-216091:627-11-3-10-1:bff7bff7-bfffffff-bffffa7f-ffddfbfb';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■