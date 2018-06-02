unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  MethodsFrame,
  LUX, LUX.D3, LUX.D4,
  LUX.Random;

type
  TForm1 = class(TForm)
    LabelX: TLabel;
    LabelY: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    TabControl1: TTabControl;
      TabItemS: TTabItem;
        FrameMS: TFrameM;
      TabItemR: TTabItem;
        FrameMR: TFrameM;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FrameMSStringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FrameMRStringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
  private
    { private 宣言 }
    ///// メソッド
    procedure ShowRands;
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

uses System.Math, System.Threading;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.ShowRands;
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

procedure TForm1.FrameMSStringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
begin
     FrameMS.StringGridMSelectCell(Sender, ACol, ARow, CanSelect);

     _SeedO := FrameMS.Method.Create;
end;

procedure TForm1.FrameMRStringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
begin
     FrameMR.StringGridMSelectCell(Sender, ACol, ARow, CanSelect);

     _RandC := FrameMR.Method;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _ThresN := 256;
     _SequsN := 256;

     SetLength( _Rands, _ThresN, _SequsN );

     FrameMS.StringGridM.SelectRow( 0 );
     FrameMR.StringGridM.SelectRow( 1 );
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

     ShowRands;
end;

end. //######################################################################### ■
