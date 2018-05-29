unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListBox, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  LUX, LUX.D3, LUX.D4,
  LUX.Random,
  LUX.Random.LCG,
  LUX.Random.Xorshift,
  LUX.Random.Xoshiro;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
      Label3: TLabel;
      ComboBox1: TComboBox;
      Label4: TLabel;
      ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { private 宣言 }
    ///// メソッド
    procedure ShowRandoms;
  public
    { public 宣言 }
    _ScramblC :CRandom;
    _GeneratC :CRandom;
    _Randoms  :TArray2<Double>;
    _ThreadsN :Integer;
    _SequensN :Integer;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses System.Math, System.Threading;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.ShowRandoms;
var
   B :TBitmapData;
begin
     with Image1.Bitmap do
     begin
          SetSize( _SequensN, _ThreadsN );

          Map( TMapAccess.Write, B );

          TParallel.For( 16, 0, _ThreadsN-1, procedure( Y:Integer )
          var
             X :Integer;
             P :PAlphaColor;
             C :Single;
          begin
               P := B.GetScanline( _ThreadsN-1 - Y );

               for X := 0 to _SequensN-1 do
               begin
                    C := Power( _Randoms[ Y, X ], 1 / 2.2 );

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
     _ThreadsN := 256;
     _SequensN := 256;

     SetLength( _Randoms, _ThreadsN, _SequensN );

     ComboBox1.ItemIndex := 0;
     ComboBox2.ItemIndex := 0;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
var
   Y, X :Integer;
   R :IRandom;
begin
     for Y := 0 to _ThreadsN-1 do
     begin
          if Assigned( _ScramblC ) then R := _GeneratC.Create( _ScramblC.Create )
                                   else R := _GeneratC.Create;

          for X := 0 to _SequensN-1 do _Randoms[ Y, X ] := R.Value;
     end;

     ShowRandoms;
end;

//------------------------------------------------------------------------------

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
     case ComboBox1.ItemIndex of
      00: _ScramblC := nil;
      01: _ScramblC := TRandomLCG32;       // LCG 32
      02: _ScramblC := TRandomLCG48;       // LCG 48
      03: _ScramblC := TRandomLCG64;       // LCG 64
      04: _ScramblC := TRandomXOR32;       // Xorshift 32
      05: _ScramblC := TRandomXOR64;       // Xorshift 64
      06: _ScramblC := TRandomXOR96;       // Xorshift 96
      07: _ScramblC := TRandomXOR128;      // Xorshift 128
      08: _ScramblC := TRandom32XOS64s;    // xoroshiro 64*
      09: _ScramblC := TRandom32XOS64ss;   // xoroshiro 64**
      10: _ScramblC := TRandom32XOS128p;   // xoshiro128+
      11: _ScramblC := TRandom32XOS128ss;  // xoshiro128**
      12: _ScramblC := TRandom64XOS128p;   // xoroshiro128+
      13: _ScramblC := TRandom64XOS128ss;  // xoroshiro128**
      14: _ScramblC := TRandom64XOS256p;   // xoshiro256+
      15: _ScramblC := TRandom64XOS256ss;  // xoshiro256**
     end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
     case ComboBox2.ItemIndex of
      00: _GeneratC := TRandomLCG32;       // LCG 32
      01: _GeneratC := TRandomLCG48;       // LCG 48
      02: _GeneratC := TRandomLCG64;       // LCG 64
      03: _GeneratC := TRandomXOR32;       // Xorshift 32
      04: _GeneratC := TRandomXOR64;       // Xorshift 64
      05: _GeneratC := TRandomXOR96;       // Xorshift 96
      06: _GeneratC := TRandomXOR128;      // Xorshift 128
      07: _GeneratC := TRandom32XOS64s;    // xoroshiro 64*
      08: _GeneratC := TRandom32XOS64ss;   // xoroshiro 64**
      09: _GeneratC := TRandom32XOS128p;   // xoshiro128+
      10: _GeneratC := TRandom32XOS128ss;  // xoshiro128**
      11: _GeneratC := TRandom64XOS128p;   // xoroshiro128+
      12: _GeneratC := TRandom64XOS128ss;  // xoroshiro128**
      13: _GeneratC := TRandom64XOS256p;   // xoshiro256+
      14: _GeneratC := TRandom64XOS256ss;  // xoshiro256**
     end;
end;

end. //######################################################################### ■
