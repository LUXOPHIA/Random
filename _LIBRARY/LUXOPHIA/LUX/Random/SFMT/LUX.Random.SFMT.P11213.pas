unit LUX.Random.SFMT.P11213;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SFMT11213

     TRandom32SFMT11213 = class( TRandom32SFMT )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SFMT11213

     TRandom64SFMT11213 = class( TRandom64SFMT )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SFMT11213

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom32SFMT11213.GetSFMT_MEXP :Int32s;
begin
     Result := 11213;
end;

function TRandom32SFMT11213.GetSFMT_POS1 :Int32s;
begin
     Result := 68;
end;

function TRandom32SFMT11213.GetSFMT_SL1 :Int32s;
begin
     Result := 14;
end;

function TRandom32SFMT11213.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom32SFMT11213.GetSFMT_SR1 :Int32s;
begin
     Result := 7;
end;

function TRandom32SFMT11213.GetSFMT_SR2 :Int32s;
begin
     Result := 3;
end;

function TRandom32SFMT11213.GetSFMT_MSK1 :Int32u;
begin
     Result := $effff7fb;
end;

function TRandom32SFMT11213.GetSFMT_MSK2 :Int32u;
begin
     Result := $ffffffef;
end;

function TRandom32SFMT11213.GetSFMT_MSK3 :Int32u;
begin
     Result := $dfdfbfff;
end;

function TRandom32SFMT11213.GetSFMT_MSK4 :Int32u;
begin
     Result := $7fffdbfd;
end;

function TRandom32SFMT11213.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SFMT11213.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SFMT11213.GetSFMT_PARITY3 :Int32u;
begin
     Result := $e8148000;
end;

function TRandom32SFMT11213.GetSFMT_PARITY4 :Int32u;
begin
     Result := $d0c7afa3;
end;

function TRandom32SFMT11213.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-11213:68-14-3-7-3:effff7fb-ffffffef-dfdfbfff-7fffdbfd';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SFMT11213

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom64SFMT11213.GetSFMT_MEXP :Int32s;
begin
     Result := 11213;
end;

function TRandom64SFMT11213.GetSFMT_POS1 :Int32s;
begin
     Result := 68;
end;

function TRandom64SFMT11213.GetSFMT_SL1 :Int32s;
begin
     Result := 14;
end;

function TRandom64SFMT11213.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom64SFMT11213.GetSFMT_SR1 :Int32s;
begin
     Result := 7;
end;

function TRandom64SFMT11213.GetSFMT_SR2 :Int32s;
begin
     Result := 3;
end;

function TRandom64SFMT11213.GetSFMT_MSK1 :Int32u;
begin
     Result := $effff7fb;
end;

function TRandom64SFMT11213.GetSFMT_MSK2 :Int32u;
begin
     Result := $ffffffef;
end;

function TRandom64SFMT11213.GetSFMT_MSK3 :Int32u;
begin
     Result := $dfdfbfff;
end;

function TRandom64SFMT11213.GetSFMT_MSK4 :Int32u;
begin
     Result := $7fffdbfd;
end;

function TRandom64SFMT11213.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SFMT11213.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SFMT11213.GetSFMT_PARITY3 :Int32u;
begin
     Result := $e8148000;
end;

function TRandom64SFMT11213.GetSFMT_PARITY4 :Int32u;
begin
     Result := $d0c7afa3;
end;

function TRandom64SFMT11213.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-11213:68-14-3-7-3:effff7fb-ffffffef-dfdfbfff-7fffdbfd';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■