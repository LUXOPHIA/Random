unit MethodsFrame;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.Controls.Presentation, FMX.ScrollBox,
  LUX.Random;

type
  TFrameM = class(TFrame)
    StringGridM: TStringGrid;
      StringColumnA: TStringColumn;
      StringColumnP: TStringColumn;
      StringColumnS: TStringColumn;
      StringColumnB: TStringColumn;
    procedure StringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
  private
    _Methods :TArray<CRandom>;
    _Method  :CRandom;
    ///// メソッド
    procedure AddRow( const A_:String; const P_,B_,S_:Uint32; const M_:CRandom );
  public
    { public 宣言 }
    constructor Create( Owner_:TComponent ); override;
    destructor Destroy; override;
    ///// プロパティ
    property Method :CRandom read _Method;
  end;

implementation //############################################################### ■

{$R *.fmx}

uses LUX.Random.LCG,
     LUX.Random.Xorshift,
     LUX.Random.Xoshiro,
     LUX.Random.Xoshiro.B32,
     LUX.Random.Xoshiro.B32.P64,
     LUX.Random.Xoshiro.B32.P128,
     LUX.Random.Xoshiro.B64,
     LUX.Random.Xoshiro.B64.P128,
     LUX.Random.Xoshiro.B64.P256,
     LUX.Random.Xoshiro.B64.P512,
     LUX.Random.WELL,
     LUX.Random.WELL.P512,
     LUX.Random.WELL.P1024,
     LUX.Random.WELL.P19937,
     LUX.Random.WELL.P44497,
     LUX.Random.PCG,
     LUX.Random.PCG.B08,
     LUX.Random.PCG.B16,
     LUX.Random.PCG.B32,
     LUX.Random.PCG.B64,
     LUX.Random.SFMT,
     LUX.Random.SFMT.P607,
     LUX.Random.SFMT.P1279,
     LUX.Random.SFMT.P2281,
     LUX.Random.SFMT.P4253,
     LUX.Random.SFMT.P11213,
     LUX.Random.SFMT.P19937,
     LUX.Random.SFMT.P44497,
     LUX.Random.SFMT.P86243,
     LUX.Random.SFMT.P132049,
     LUX.Random.SFMT.P216091;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TFrameM.AddRow( const A_:String; const P_,B_,S_:Uint32; const M_:CRandom );
var
   I :Integer;
begin
     I := Length( _Methods );

     with StringGridM do
     begin
          Cells[ 0, I ] := A_;
          Cells[ 1, I ] := P_.ToString;
          Cells[ 2, I ] := B_.ToString;
          Cells[ 3, I ] := S_.ToString;
     end;

     _Methods := _Methods + [ M_ ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFrameM.Create( Owner_:TComponent );
begin
     inherited;

     AddRow( '-----'      ,     64, 64,   0, TRandomZero           );

     AddRow( 'LCG'        ,     32, 32,   0, TRandom32LCG32        );
     AddRow( 'LCG'        ,     48, 48,   0, TRandom48LCG48        );
     AddRow( 'LCG'        ,     64, 64,   0, TRandom64LCG64        );

     AddRow( 'Xorshift'   ,     32, 32,   0, TRandom32XOR32        );
     AddRow( 'Xorshift'   ,     64, 32,   0, TRandom32XOR64        );
     AddRow( 'Xorshift'   ,     64, 64,   0, TRandom64XOR64        );
     AddRow( 'Xorshift'   ,     96, 32,   0, TRandom32XOR96        );
     AddRow( 'Xorshift'   ,    128, 32,   0, TRandom32XOR128       );

     AddRow( 'xoroshiro*' ,     64, 32,   0, TRandom32ROS64s       );
     AddRow( 'xoroshiro**',     64, 32,   0, TRandom32ROS64ss      );
     AddRow( 'xoshiro+'   ,    128, 32,   0, TRandom32XOS128p      );
     AddRow( 'xoshiro+'   ,    128, 32,  64, TRandom32XOS128x64p   );
     AddRow( 'xoshiro**'  ,    128, 32,   0, TRandom32XOS128ss     );
     AddRow( 'xoshiro**'  ,    128, 32,  64, TRandom32XOS128x64ss  );
     AddRow( 'xoroshiro+' ,    128, 64,   0, TRandom64ROS128p      );
     AddRow( 'xoroshiro+' ,    128, 64,  64, TRandom64ROS128x64p   );
     AddRow( 'xoroshiro*' ,    128, 64,   0, TRandom64ROS128s      );
     AddRow( 'xoroshiro**',    128, 64,   0, TRandom64ROS128ss     );
     AddRow( 'xoroshiro**',    128, 64,  64, TRandom64ROS128x64ss  );
     AddRow( 'xoshiro+'   ,    256, 64,   0, TRandom64XOS256p      );
     AddRow( 'xoshiro+'   ,    256, 64, 128, TRandom64XOS256x128p  );
     AddRow( 'xoshiro**'  ,    256, 64,   0, TRandom64XOS256ss     );
     AddRow( 'xoshiro**'  ,    256, 64, 128, TRandom64XOS256x128ss );
     AddRow( 'xoshiro+'   ,    512, 64,   0, TRandom64XOS512p      );
     AddRow( 'xoshiro**'  ,    512, 64,   0, TRandom64XOS512ss     );

     AddRow( 'WELL a'     ,    512, 32,   0, TRandomWEL512a        );
     AddRow( 'WELL a'     ,   1024, 32,   0, TRandomWEL1024a       );
     AddRow( 'WELL a'     ,  19937, 32,   0, TRandomWEL19937a      );
     AddRow( 'WELL a_new' ,  19937, 32,   0, TRandomWEL19937anew   );
     AddRow( 'WELL c'     ,  19937, 32,   0, TRandomWEL19937c      );
     AddRow( 'WELL a'     ,  44497, 32,   0, TRandomWEL44497a      );
     AddRow( 'WELL a_new' ,  44497, 32,   0, TRandomWEL44497anew   );
     AddRow( 'WELL b'     ,  44497, 32,   0, TRandomWEL44497b      );

     AddRow( 'PCG'        ,      8,  8,   0, TRandom08PCG08        );
     AddRow( 'PCG'        ,     16, 16,   0, TRandom16PCG16        );
     AddRow( 'PCG'        ,     32, 32,   0, TRandom32PCG32        );
     AddRow( 'PCG'        ,     64, 64,   0, TRandom64PCG64        );

     AddRow( 'SFMT'       ,    607, 32,   0, TRandom32SFMT607      );
     AddRow( 'SFMT'       ,    607, 64,   0, TRandom64SFMT607      );
     AddRow( 'SFMT'       ,   1279, 32,   0, TRandom32SFMT1279     );
     AddRow( 'SFMT'       ,   1279, 64,   0, TRandom64SFMT1279     );
     AddRow( 'SFMT'       ,   2281, 32,   0, TRandom32SFMT2281     );
     AddRow( 'SFMT'       ,   2281, 64,   0, TRandom64SFMT2281     );
     AddRow( 'SFMT'       ,   4253, 32,   0, TRandom32SFMT4253     );
     AddRow( 'SFMT'       ,   4253, 64,   0, TRandom64SFMT4253     );
     AddRow( 'SFMT'       ,  11213, 32,   0, TRandom32SFMT11213    );
     AddRow( 'SFMT'       ,  11213, 64,   0, TRandom64SFMT11213    );
     AddRow( 'SFMT'       ,  19937, 32,   0, TRandom32SFMT19937    );
     AddRow( 'SFMT'       ,  19937, 64,   0, TRandom64SFMT19937    );
     AddRow( 'SFMT'       ,  44497, 32,   0, TRandom32SFMT44497    );
     AddRow( 'SFMT'       ,  44497, 64,   0, TRandom64SFMT44497    );
     AddRow( 'SFMT'       ,  86243, 32,   0, TRandom32SFMT86243    );
     AddRow( 'SFMT'       ,  86243, 64,   0, TRandom64SFMT86243    );
     AddRow( 'SFMT'       , 132049, 32,   0, TRandom32SFMT132049   );
     AddRow( 'SFMT'       , 132049, 64,   0, TRandom64SFMT132049   );
     AddRow( 'SFMT'       , 216091, 32,   0, TRandom32SFMT216091   );
     AddRow( 'SFMT'       , 216091, 64,   0, TRandom64SFMT216091   );
end;

destructor TFrameM.Destroy;
begin

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TFrameM.StringGridMSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
begin
     _Method := _Methods[ ARow ];
end;

end. //######################################################################### ■
