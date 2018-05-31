unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListBox, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  LUX, LUX.D3, LUX.D4,
  LUX.Random;

type
  TForm1 = class(TForm)
    LabelX: TLabel;
    LabelY: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
      LabelS: TLabel;
      ComboBoxS: TComboBox;
      LabelR: TLabel;
      ComboBoxR: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBoxSChange(Sender: TObject);
    procedure ComboBoxRChange(Sender: TObject);
  private
    { private 宣言 }
    ///// メソッド
    procedure ShowRandoms;
  public
    { public 宣言 }
    _SeedO  :IRandom;
    _RandC  :CRandom;
    _Rands  :TArray2<Double>;
    _ThresN :Integer;
    _SequsN :Integer;
    ///// メソッド
    function SelectMethod( const I_:Integer ) :CRandom;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses System.Math, System.Threading,
     LUX.Random.LCG,
     LUX.Random.Xorshift,
     LUX.Random.Xoshiro;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.ShowRandoms;
var
   B :TBitmapData;
begin
     with Image1.Bitmap do
     begin
          SetSize( _SequsN, _ThresN );

          Map( TMapAccess.Write, B );

          TParallel.For( 16, 0, _ThresN-1, procedure( Y:Integer )
          var
             X :Integer;
             P :PAlphaColor;
             C :Single;
          begin
               P := B.GetScanline( _ThresN-1 - Y );

               for X := 0 to _SequsN-1 do
               begin
                    C := Power( _Rands[ Y, X ], 1 / 2.2{Gamma} );

                    P^ := TAlphaColorF.Create( C, C, C ).ToAlphaColor;  Inc( P );
               end;
          end );

          Unmap( B );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TForm1.SelectMethod( const I_:Integer ) :CRandom;
begin
     case I_ of
      01: Result := TRandomLCG32         ;  // LCG 32
      02: Result := TRandomLCG48         ;  // LCG 48
      03: Result := TRandomLCG64         ;  // LCG 64
      04: Result := TRandomXOR32         ;  // Xorshift 32
      05: Result := TRandomXOR64         ;  // Xorshift 64
      06: Result := TRandomXOR96         ;  // Xorshift 96
      07: Result := TRandomXOR128        ;  // Xorshift 128
      08: Result := TRandom32XOS64s      ;  // xoroshiro 64*
      09: Result := TRandom32XOS64ss     ;  // xoroshiro 64**
      10: Result := TRandom32XOS128p     ;  // xoshiro128+
      11: Result := TRandom32XOS128ss    ;  // xoshiro128**
      12: Result := TRandom32XOS128x64p  ;  // xoshiro128+ 2^64-step
      13: Result := TRandom32XOS128x64ss ;  // xoshiro128** 2^64-step
      14: Result := TRandom64XOS128p     ;  // xoroshiro128+
      15: Result := TRandom64XOS128ss    ;  // xoroshiro128**
      16: Result := TRandom64XOS128x64p  ;  // xoroshiro128+ 2^64-step
      17: Result := TRandom64XOS128x64ss ;  // xoroshiro128** 2^64-step
      18: Result := TRandom64XOS256p     ;  // xoshiro256+
      19: Result := TRandom64XOS256ss    ;  // xoshiro256**
      20: Result := TRandom64XOS256x128p ;  // xoshiro256+ 2^128-step
      21: Result := TRandom64XOS256x128ss;  // xoshiro256** 2^128-step
     else Result := TRandomZero;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _ThresN := 256;
     _SequsN := 256;

     SetLength( _Rands, _ThresN, _SequsN );

     ComboBoxS.ItemIndex := 0;
     ComboBoxR.ItemIndex := 1;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
var
   Y, X :Integer;
   R :IRandom;
begin
     for Y := 0 to _ThresN-1 do
     begin
          R := _RandC.Create( _SeedO );

          for X := 0 to _SequsN-1 do _Rands[ Y, X ] := R.DrawRandFlo64s;
     end;

     ShowRandoms;
end;

//------------------------------------------------------------------------------

procedure TForm1.ComboBoxSChange(Sender: TObject);
begin
     _SeedO := SelectMethod( ComboBoxS.ItemIndex ).Create;
end;

procedure TForm1.ComboBoxRChange(Sender: TObject);
begin
     _RandC := SelectMethod( ComboBoxR.ItemIndex );
end;

end. //######################################################################### ■
