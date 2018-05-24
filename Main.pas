unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation,
  LUX, LUX.D3, LUX.D4,
  LUX.Random, LUX.Random.Xorshift;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
      GroupBox1: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        RadioButton3: TRadioButton;
        RadioButton4: TRadioButton;
      Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure RadioButton3Change(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { private 宣言 }
    ///// メソッド
    procedure ShowRands;
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

procedure TForm1.ShowRands;
var
   B :TBitmapData;
   C :Single;
begin
     with Image1.Bitmap do
     begin
          SetSize( _SequensN, _ThreadsN );

          Map( TMapAccess.Write, B );

          TParallel.For( 0, _ThreadsN-1, procedure( Y:Integer )
          var
             X :Integer;
             P :PAlphaColor;
          begin
               P := B.GetScanline( Y );

               for X := 0 to _SequensN-1 do
               begin
                    C := Power( _Randoms[ Y, X ], 1 / 2.2 );

                    P^ := $FF000000 or $00010101 * Floor( 256 * C );  Inc( P );
               end;

          end );

          Unmap( B );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     RadioButton1.IsChecked := True;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
     _RandomC := TRandomXOR32;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
     _RandomC := TRandomXOR64;
end;

procedure TForm1.RadioButton3Change(Sender: TObject);
begin
     _RandomC := TRandomXOR96;
end;

procedure TForm1.RadioButton4Change(Sender: TObject);
begin
     _RandomC := TRandomXOR128;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
     _ThreadsN := 256;
     _SequensN := 256;

     SetLength( _Randoms, _ThreadsN, _SequensN );

     TParallel.For( 0, _ThreadsN-1, procedure( Y:Integer )
     var
        R :IRandom;
        X :Integer;
     begin
          R := _RandomC.Create;

          for X := 0 to _SequensN-1 do _Randoms[ Y, X ] := R.Value;

     end );

     ShowRands;
end;

end. //######################################################################### ■
