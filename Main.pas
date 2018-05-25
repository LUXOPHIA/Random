unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  LUX, LUX.D3, LUX.D4,
  LUX.Random,
  LUX.Random.LCG,
  LUX.Random.Xorshift;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
      GroupBox1: TGroupBox;
        RadioButtonAL1: TRadioButton;
        RadioButtonAL2: TRadioButton;
        RadioButtonAL3: TRadioButton;
        RadioButtonAX1: TRadioButton;
        RadioButtonAX2: TRadioButton;
        RadioButtonAX3: TRadioButton;
        RadioButtonAX4: TRadioButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RadioButtonAL1Change(Sender: TObject);
    procedure RadioButtonAL2Change(Sender: TObject);
    procedure RadioButtonAL3Change(Sender: TObject);
    procedure RadioButtonAX1Change(Sender: TObject);
    procedure RadioButtonAX2Change(Sender: TObject);
    procedure RadioButtonAX3Change(Sender: TObject);
    procedure RadioButtonAX4Change(Sender: TObject);
  private
    { private 宣言 }
    ///// メソッド
    procedure ShowRandoms;
  public
    { public 宣言 }
    _RandomC  :CRandom;
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

     RadioButtonAL1.IsChecked := True;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
var
   Y, X :Integer;
   R :IRandom;
begin
     for Y := 0 to _ThreadsN-1 do
     begin
          R := _RandomC.Create;

          for X := 0 to _SequensN-1 do _Randoms[ Y, X ] := R.Value;
     end;

     ShowRandoms;
end;

//------------------------------------------------------------------------------

procedure TForm1.RadioButtonAL1Change(Sender: TObject);
begin
     _RandomC := TRandomLCG32;
end;

procedure TForm1.RadioButtonAL2Change(Sender: TObject);
begin
     _RandomC := TRandomLCG48;
end;

procedure TForm1.RadioButtonAL3Change(Sender: TObject);
begin
     _RandomC := TRandomLCG64;
end;

procedure TForm1.RadioButtonAX1Change(Sender: TObject);
begin
     _RandomC := TRandomXOR32;
end;

procedure TForm1.RadioButtonAX2Change(Sender: TObject);
begin
     _RandomC := TRandomXOR64;
end;

procedure TForm1.RadioButtonAX3Change(Sender: TObject);
begin
     _RandomC := TRandomXOR96;
end;

procedure TForm1.RadioButtonAX4Change(Sender: TObject);
begin
     _RandomC := TRandomXOR128;
end;

end. //######################################################################### ■
