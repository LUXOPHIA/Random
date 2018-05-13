unit LUX.Color.Grid.D2.Preset;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     LUX, LUX.Color, LUX.Color.Grid.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TSingleRGB

     TPoinColorGrid2D_TSingleRGB = class( TPoinColorGrid2D<TSingleRGB> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB> ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TSingleRGB

     TCellColorGrid2D_TSingleRGB = class( TCellColorGrid2D<TSingleRGB> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB> ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TByteRGBE

     TPoinColorGrid2D_TByteRGBE = class( TPoinColorGrid2D<TByteRGBE> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE> ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TByteRGBE

     TCellColorGrid2D_TByteRGBE = class( TCellColorGrid2D<TByteRGBE> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE> ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Threading;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TSingleRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB> );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( Func_( X, Y ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TSingleRGB.CopyTo( const BMP_:TBitmap );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TSingleRGB
     begin
          Result := Poins[ X, Y ];
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TSingleRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB> );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( Func_( X, Y ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TSingleRGB.CopyTo( const BMP_:TBitmap );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TSingleRGB
     begin
          Result := Cells[ X, Y ];
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TByteRGBE

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE> );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( 10 ).Gamma( 2.2 ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TByteRGBE.CopyTo( const BMP_:TBitmap );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TByteRGBE
     begin
          Result := Poins[ X, Y ];
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TByteRGBE

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE> );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( 10 ).Gamma( 2.2 ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TByteRGBE.CopyTo( const BMP_:TBitmap );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TByteRGBE
     begin
          Result := Cells[ X, Y ];
     end );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
