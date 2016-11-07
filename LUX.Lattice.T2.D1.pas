unit LUX.Lattice.T2.D1;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2,
     LUX.Matrix.L4,
     LUX.Lattice.T2,
     LUX.Curve.T2.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridMap2T<T_Item>

     TSingleGridMap2T = class( TGridArray2D<Single> )
     private
     protected
     public
       constructor Create; overload;
       constructor Create( const BricX_,BricY_:Integer ); overload;
       destructor Destroy; override;
       ///// メソッド
       function Nabla( const X_,Y_:Single ) :TSingle2D;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridMap2T

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleGridMap2T.Create;
begin
     Create( 2, 2 );
end;

constructor TSingleGridMap2T.Create( const BricX_,BricY_:Integer );
begin
     Create( BricX_, BricY_, 2, 2 );
end;

destructor TSingleGridMap2T.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleGridMap2T.Nabla( const X_,Y_:Single ) :TSingle2D;
var
   X, X1, X2, X3, X4,
   Y, Y1, Y2, Y3, Y4 :Integer;
   T :TdSingle2D;
   M :TdSingleM4;
begin
     X2 := Floor( X_ );  X1 := X2 - 1;  X3 := X2 + 1;  X4 := X3 + 1;
     Y2 := Floor( Y_ );  Y1 := Y2 - 1;  Y3 := Y2 + 1;  Y4 := Y3 + 1;

     T.o := TSingle2D.Create( X_ - X2,
                              Y_ - Y2 );

     with M do
     begin
          _11 := Grid[ X1, Y1 ];  _12 := Grid[ X2, Y1 ];  _13 := Grid[ X3, Y1 ];  _14 := Grid[ X4, Y1 ];
          _21 := Grid[ X1, Y2 ];  _22 := Grid[ X2, Y2 ];  _23 := Grid[ X3, Y2 ];  _24 := Grid[ X4, Y2 ];
          _31 := Grid[ X1, Y3 ];  _32 := Grid[ X2, Y3 ];  _33 := Grid[ X3, Y3 ];  _34 := Grid[ X4, Y3 ];
          _41 := Grid[ X1, Y4 ];  _42 := Grid[ X2, Y4 ];  _43 := Grid[ X3, Y4 ];  _44 := Grid[ X4, Y4 ];
     end;

     T.d := TSingle2D.Create( 1, 0 );

     Result.X := BSplin4( M, T ).d;

     T.d := TSingle2D.Create( 0, 1 );

     Result.Y := BSplin4( M, T ).d;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
