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
    procedure AddRow( const A_,P_,S_,B_:String; const M_:CRandom );
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
     LUX.Random.WELL,
     LUX.Random.PCG,
     LUX.Random.PCG.B08,
     LUX.Random.PCG.B16,
     LUX.Random.PCG.B32,
     LUX.Random.PCG.B64,
     LUX.Random.SFMT,
     LUX.Random.SFMT.M607,
     LUX.Random.SFMT.M1279,
     LUX.Random.SFMT.M2281,
     LUX.Random.SFMT.M4253,
     LUX.Random.SFMT.M11213,
     LUX.Random.SFMT.M19937,
     LUX.Random.SFMT.M44497,
     LUX.Random.SFMT.M86243,
     LUX.Random.SFMT.M132049,
     LUX.Random.SFMT.M216091;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TFrameM.AddRow( const A_,P_,S_,B_:String; const M_:CRandom );
var
   I :Integer;
begin
     I := Length( _Methods );

     with StringGridM do
     begin
          Cells[ 0, I ] :=       A_        ;
          Cells[ 1, I ] := '2^'+ P_        ;
          Cells[ 2, I ] := '2^'+ S_        ;
          Cells[ 3, I ] :=       B_ + 'bit';
     end;

     _Methods := _Methods + [ M_ ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFrameM.Create( Owner_:TComponent );
begin
     inherited;

     AddRow( ''           ,     '64',   '0', '64', TRandomZero           );

     AddRow( 'LCG'        ,     '32',   '0', '32', TRandom32LCG32        );
     AddRow( 'LCG'        ,     '48',   '0', '48', TRandom48LCG48        );
     AddRow( 'LCG'        ,     '64',   '0', '64', TRandom64LCG64        );

     AddRow( 'Xorshift'   ,     '32',   '0', '32', TRandom32XOR32        );
     AddRow( 'Xorshift'   ,     '64',   '0', '32', TRandom32XOR64        );
     AddRow( 'Xorshift'   ,     '64',   '0', '64', TRandom64XOR64        );
     AddRow( 'Xorshift'   ,     '96',   '0', '32', TRandom32XOR96        );
     AddRow( 'Xorshift'   ,    '128',   '0', '32', TRandom32XOR128       );

     AddRow( 'xoroshiro*' ,     '64',   '0', '32', TRandom32XOS64s       );
     AddRow( 'xoroshiro+' ,    '128',   '0', '64', TRandom64XOS128p      );
     AddRow( 'xoroshiro+' ,    '128',  '64', '64', TRandom64XOS128x64p   );
     AddRow( 'xoroshiro**',     '64',   '0', '32', TRandom32XOS64ss      );
     AddRow( 'xoroshiro**',    '128',   '0', '64', TRandom64XOS128ss     );
     AddRow( 'xoroshiro**',    '128',  '64', '64', TRandom64XOS128x64ss  );
     AddRow( 'xoshiro+'   ,    '128',   '0', '32', TRandom32XOS128p      );
     AddRow( 'xoshiro+'   ,    '128',  '64', '32', TRandom32XOS128x64p   );
     AddRow( 'xoshiro+'   ,    '256',   '0', '64', TRandom64XOS256p      );
     AddRow( 'xoshiro+'   ,    '256', '128', '64', TRandom64XOS256x128p  );
     AddRow( 'xoshiro**'  ,    '128',   '0', '32', TRandom32XOS128ss     );
     AddRow( 'xoshiro**'  ,    '128',  '64', '32', TRandom32XOS128x64ss  );
     AddRow( 'xoshiro**'  ,    '256',   '0', '64', TRandom64XOS256ss     );
     AddRow( 'xoshiro**'  ,    '256', '128', '64', TRandom64XOS256x128ss );

     AddRow( 'WELLa'      ,    '512',   '0', '32', TRandomWEL512a        );
     AddRow( 'WELLa'      ,   '1024',   '0', '32', TRandomWEL1024a       );
     AddRow( 'WELLa'      ,  '19937',   '0', '32', TRandomWEL19937a      );
     AddRow( 'WELLa-new'  ,  '19937',   '0', '32', TRandomWEL19937anew   );
     AddRow( 'WELLc'      ,  '19937',   '0', '32', TRandomWEL19937c      );
     AddRow( 'WELLa'      ,  '44497',   '0', '32', TRandomWEL44497a      );
     AddRow( 'WELLa-new'  ,  '44497',   '0', '32', TRandomWEL44497anew   );
     AddRow( 'WELLb'      ,  '44497',   '0', '32', TRandomWEL44497b      );

     AddRow( 'PCG'        ,      '8',   '0',  '8', TRandom08PCG08        );
     AddRow( 'PCG'        ,     '16',   '0', '16', TRandom16PCG16        );
     AddRow( 'PCG'        ,     '32',   '0', '32', TRandom32PCG32        );
     AddRow( 'PCG'        ,     '64',   '0', '64', TRandom64PCG64        );

     AddRow( 'SFMT'       ,    '607',   '0', '32', TRandom32SFMT607      );
     AddRow( 'SFMT'       ,    '607',   '0', '64', TRandom64SFMT607      );
     AddRow( 'SFMT'       ,   '1279',   '0', '32', TRandom32SFMT1279     );
     AddRow( 'SFMT'       ,   '1279',   '0', '64', TRandom64SFMT1279     );
     AddRow( 'SFMT'       ,   '2281',   '0', '32', TRandom32SFMT2281     );
     AddRow( 'SFMT'       ,   '2281',   '0', '64', TRandom64SFMT2281     );
     AddRow( 'SFMT'       ,   '4253',   '0', '32', TRandom32SFMT4253     );
     AddRow( 'SFMT'       ,   '4253',   '0', '64', TRandom64SFMT4253     );
     AddRow( 'SFMT'       ,  '11213',   '0', '32', TRandom32SFMT11213    );
     AddRow( 'SFMT'       ,  '11213',   '0', '64', TRandom64SFMT11213    );
     AddRow( 'SFMT'       ,  '19937',   '0', '32', TRandom32SFMT19937    );
     AddRow( 'SFMT'       ,  '19937',   '0', '64', TRandom64SFMT19937    );
     AddRow( 'SFMT'       ,  '44497',   '0', '32', TRandom32SFMT44497    );
     AddRow( 'SFMT'       ,  '44497',   '0', '64', TRandom64SFMT44497    );
     AddRow( 'SFMT'       ,  '86243',   '0', '32', TRandom32SFMT86243    );
     AddRow( 'SFMT'       ,  '86243',   '0', '64', TRandom64SFMT86243    );
     AddRow( 'SFMT'       , '132049',   '0', '32', TRandom32SFMT132049   );
     AddRow( 'SFMT'       , '132049',   '0', '64', TRandom64SFMT132049   );
     AddRow( 'SFMT'       , '216091',   '0', '32', TRandom32SFMT216091   );
     AddRow( 'SFMT'       , '216091',   '0', '64', TRandom64SFMT216091   );
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
