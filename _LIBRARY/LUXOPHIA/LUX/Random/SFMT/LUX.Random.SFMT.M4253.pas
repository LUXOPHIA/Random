unit LUX.Random.SFMT.M4253;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSFMT4253

     TRandomSFMT4253 = class( TRandomSFMT )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSFMT4253

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandomSFMT4253.GetSFMT_MEXP :Int32s;
begin
     Result := 4253;
end;

function TRandomSFMT4253.GetSFMT_POS1 :Int32s;
begin
     Result := 17;
end;

function TRandomSFMT4253.GetSFMT_SL1 :Int32s;
begin
     Result := 20;
end;

function TRandomSFMT4253.GetSFMT_SL2 :Int32s;
begin
     Result := 1;
end;

function TRandomSFMT4253.GetSFMT_SR1 :Int32s;
begin
     Result := 7;
end;

function TRandomSFMT4253.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandomSFMT4253.GetSFMT_MSK1 :Int32u;
begin
     Result := $9f7bffff;
end;

function TRandomSFMT4253.GetSFMT_MSK2 :Int32u;
begin
     Result := $9fffff5f;
end;

function TRandomSFMT4253.GetSFMT_MSK3 :Int32u;
begin
     Result := $3efffffb;
end;

function TRandomSFMT4253.GetSFMT_MSK4 :Int32u;
begin
     Result := $fffff7bb;
end;

function TRandomSFMT4253.GetSFMT_PARITY1 :Int32u;
begin
     Result := $a8000001;
end;

function TRandomSFMT4253.GetSFMT_PARITY2 :Int32u;
begin
     Result := $af5390a3;
end;

function TRandomSFMT4253.GetSFMT_PARITY3 :Int32u;
begin
     Result := $b740b3f8;
end;

function TRandomSFMT4253.GetSFMT_PARITY4 :Int32u;
begin
     Result := $6c11486d;
end;

function TRandomSFMT4253.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-4253:17-20-1-7-1:9f7bffff-9fffff5f-3efffffb-fffff7bb';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■