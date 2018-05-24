unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  LUX, LUX.D3, LUX.D4,
  LUX.Random, LUX.Random.Xorshift, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
      GroupBox1: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        RadioButton3: TRadioButton;
        RadioButton4: TRadioButton;
      CheckBox1: TCheckBox;
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
    _RandClass :CRandom;
    _Rands     :TArray<Double>;
    _RandsN    :Integer;
    ///// メソッド
    procedure MakeRandsST;
    procedure MakeRandsMT;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses System.Threading;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.ShowRands;
var
   I :Integer;
begin
     with Memo1 do
     begin
          BeginUpdate;
          with Lines do
          begin
               Clear;
               for I := 0 to High( _Rands ) do Add( _Rands[ I ].ToString );
          end;
          EndUpdate;

          SelectAll;
          SetFocus;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.MakeRandsST;
var
   R :IRandom;
   I :Integer;
begin
     R := _RandClass.Create;

     for I := 0 to High( _Rands ) do
     begin
          _Rands[ I ] := R.Value;
     end;
end;

procedure TForm1.MakeRandsMT;
begin
     TParallel.For( 0, High( _Rands ), procedure( I:Integer )
     var
        R :IRandom;
     begin
          R := _RandClass.Create;

          _Rands[ I ] := R.Value;

     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     RadioButton1.IsChecked := True;
     CheckBox1   .IsChecked := True;

     SetLength( _Rands, 10000 );
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
     _RandClass := TRandomXOR32;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
     _RandClass := TRandomXOR64;
end;

procedure TForm1.RadioButton3Change(Sender: TObject);
begin
     _RandClass := TRandomXOR96;
end;

procedure TForm1.RadioButton4Change(Sender: TObject);
begin
     _RandClass := TRandomXOR128;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
     if CheckBox1.IsChecked then MakeRandsMT
                            else MakeRandsST;

     ShowRands;
end;

end. //######################################################################### ■
