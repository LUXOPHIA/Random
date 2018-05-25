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
    Timer1: TTimer;
    Panel1: TPanel;
      GroupBoxS: TGroupBox;
        RadioButtonS0: TRadioButton;
        RadioButtonSL1: TRadioButton;
        RadioButtonSL2: TRadioButton;
        RadioButtonSL3: TRadioButton;
        RadioButtonSX1: TRadioButton;
        RadioButtonSX2: TRadioButton;
        RadioButtonSX3: TRadioButton;
        RadioButtonSX4: TRadioButton;
      GroupBoxG: TGroupBox;
        RadioButtonGX1: TRadioButton;
        RadioButtonGX2: TRadioButton;
        RadioButtonGX3: TRadioButton;
        RadioButtonGX4: TRadioButton;
        RadioButtonGL1: TRadioButton;
        RadioButtonGL2: TRadioButton;
        RadioButtonGL3: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RadioButtonS0Change(Sender: TObject);
    procedure RadioButtonSL1Change(Sender: TObject);
    procedure RadioButtonSL2Change(Sender: TObject);
    procedure RadioButtonSL3Change(Sender: TObject);
    procedure RadioButtonSX1Change(Sender: TObject);
    procedure RadioButtonSX2Change(Sender: TObject);
    procedure RadioButtonSX3Change(Sender: TObject);
    procedure RadioButtonSX4Change(Sender: TObject);
    procedure RadioButtonGL1Change(Sender: TObject);
    procedure RadioButtonGL2Change(Sender: TObject);
    procedure RadioButtonGL3Change(Sender: TObject);
    procedure RadioButtonGX1Change(Sender: TObject);
    procedure RadioButtonGX2Change(Sender: TObject);
    procedure RadioButtonGX3Change(Sender: TObject);
    procedure RadioButtonGX4Change(Sender: TObject);
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

     RadioButtonS0 .IsChecked := True;
     RadioButtonGL1.IsChecked := True;
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

procedure TForm1.RadioButtonS0Change(Sender: TObject);
begin
     _ScramblC := nil;
end;

procedure TForm1.RadioButtonSL1Change(Sender: TObject);
begin
     _ScramblC := TRandomLCG32;
end;

procedure TForm1.RadioButtonSL2Change(Sender: TObject);
begin
     _ScramblC := TRandomLCG48;
end;

procedure TForm1.RadioButtonSL3Change(Sender: TObject);
begin
     _ScramblC := TRandomLCG64;
end;

procedure TForm1.RadioButtonSX1Change(Sender: TObject);
begin
     _ScramblC := TRandomXOR32;
end;

procedure TForm1.RadioButtonSX2Change(Sender: TObject);
begin
     _ScramblC := TRandomXOR64;
end;

procedure TForm1.RadioButtonSX3Change(Sender: TObject);
begin
     _ScramblC := TRandomXOR96;
end;

procedure TForm1.RadioButtonSX4Change(Sender: TObject);
begin
     _ScramblC := TRandomXOR128;
end;

//------------------------------------------------------------------------------

procedure TForm1.RadioButtonGL1Change(Sender: TObject);
begin
     _GeneratC := TRandomLCG32;
end;

procedure TForm1.RadioButtonGL2Change(Sender: TObject);
begin
     _GeneratC := TRandomLCG48;
end;

procedure TForm1.RadioButtonGL3Change(Sender: TObject);
begin
     _GeneratC := TRandomLCG64;
end;

procedure TForm1.RadioButtonGX1Change(Sender: TObject);
begin
     _GeneratC := TRandomXOR32;
end;

procedure TForm1.RadioButtonGX2Change(Sender: TObject);
begin
     _GeneratC := TRandomXOR64;
end;

procedure TForm1.RadioButtonGX3Change(Sender: TObject);
begin
     _GeneratC := TRandomXOR96;
end;

procedure TForm1.RadioButtonGX4Change(Sender: TObject);
begin
     _GeneratC := TRandomXOR128;
end;

end. //######################################################################### ■
