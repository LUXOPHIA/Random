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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _ThresN := 256;
     _SequsN := 256;

     SetLength( _Rands, _ThresN, _SequsN );

     ComboBoxS.ItemIndex := 0;
     ComboBoxR.ItemIndex := 0;
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
     case ComboBoxS.ItemIndex of
      00: _SeedO := TRandomZero      .Create;
      01: _SeedO := TRandomLCG32     .Create;  // LCG 32
      02: _SeedO := TRandomLCG48     .Create;  // LCG 48
      03: _SeedO := TRandomLCG64     .Create;  // LCG 64
      04: _SeedO := TRandomXOR32     .Create;  // Xorshift 32
      05: _SeedO := TRandomXOR64     .Create;  // Xorshift 64
      06: _SeedO := TRandomXOR96     .Create;  // Xorshift 96
      07: _SeedO := TRandomXOR128    .Create;  // Xorshift 128
      08: _SeedO := TRandom32XOS64s  .Create;  // xoroshiro 64*
      09: _SeedO := TRandom32XOS64ss .Create;  // xoroshiro 64**
      10: _SeedO := TRandom32XOS128p .Create;  // xoshiro128+
      11: _SeedO := TRandom32XOS128ss.Create;  // xoshiro128**
      12: _SeedO := TRandom64XOS128p .Create;  // xoroshiro128+
      13: _SeedO := TRandom64XOS128ss.Create;  // xoroshiro128**
      14: _SeedO := TRandom64XOS256p .Create;  // xoshiro256+
      15: _SeedO := TRandom64XOS256ss.Create;  // xoshiro256**
     end;
end;

procedure TForm1.ComboBoxRChange(Sender: TObject);
begin
     case ComboBoxR.ItemIndex of
      00: _RandC := TRandomLCG32     ;  // LCG 32
      01: _RandC := TRandomLCG48     ;  // LCG 48
      02: _RandC := TRandomLCG64     ;  // LCG 64
      03: _RandC := TRandomXOR32     ;  // Xorshift 32
      04: _RandC := TRandomXOR64     ;  // Xorshift 64
      05: _RandC := TRandomXOR96     ;  // Xorshift 96
      06: _RandC := TRandomXOR128    ;  // Xorshift 128
      07: _RandC := TRandom32XOS64s  ;  // xoroshiro 64*
      08: _RandC := TRandom32XOS64ss ;  // xoroshiro 64**
      09: _RandC := TRandom32XOS128p ;  // xoshiro128+
      10: _RandC := TRandom32XOS128ss;  // xoshiro128**
      11: _RandC := TRandom64XOS128p ;  // xoroshiro128+
      12: _RandC := TRandom64XOS128ss;  // xoroshiro128**
      13: _RandC := TRandom64XOS256p ;  // xoshiro256+
      14: _RandC := TRandom64XOS256ss;  // xoshiro256**
     end;
end;

end. //######################################################################### ■
