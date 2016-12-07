unit LUX.Lattice.T3;

interface //#################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

     TArray3D<_TItem_> = class
     private
       _AllX :Integer;
       _AllY :Integer;
       _AllZ :Integer;
       ///// メソッド
       procedure MakeArray;
       function XYZtoI( const X_,Y_,Z_:Integer ) :Integer; inline;
     protected
       _CountX  :Integer;
       _CountY  :Integer;
       _CountZ  :Integer;
       _MarginX :Integer;
       _MarginY :Integer;
       _MarginZ :Integer;
       _Item    :array of _TItem_;
       ///// アクセス
       procedure SetCountX( const CountX_:Integer );
       procedure SetCountY( const CountY_:Integer );
       procedure SetCountZ( const CountZ_:Integer );
       procedure SetMarginX( const MarginX_:Integer );
       procedure SetMarginY( const MarginY_:Integer );
       procedure SetMarginZ( const MarginZ_:Integer );
       function GetItem( const X_,Y_,Z_:Integer ) :_TItem_;

       procedure SetItem( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
     public
       constructor Create; overload;
       constructor Create( const CountX_,CountY_,CountZ_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,Margin_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property CountX                         :Integer read   _CountX  write SetCountX ;
       property CountY                         :Integer read   _CountY  write SetCountY ;
       property CountZ                         :Integer read   _CountZ  write SetCountZ ;
       property MarginX                        :Integer read   _MarginX write SetMarginX;
       property MarginY                        :Integer read   _MarginY write SetMarginY;
       property MarginZ                        :Integer read   _MarginZ write SetMarginZ;
       property Item[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItem    write SetItem   ; default;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray3D<_TItem_> ); static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray3D<_TItem_>

     TBricArray3D<_TItem_> = class( TArray3D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetGridX :Integer;
       procedure SetGridX( const GridX_:Integer );
       function GetGridY :Integer;
       procedure SetGridY( const GridY_:Integer );
       function GetGridZ :Integer;
       procedure SetGridZ( const GridZ_:Integer );
     public
       ///// プロパティ
       property Bric[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItem   write SetItem  ; default;
       property BricX                          :Integer read   _CountX write SetCountX;
       property BricY                          :Integer read   _CountY write SetCountY;
       property BricZ                          :Integer read   _CountZ write SetCountZ;
       property GridX                          :Integer read GetGridX  write SetGridX ;
       property GridY                          :Integer read GetGridY  write SetGridY ;
       property GridZ                          :Integer read GetGridZ  write SetGridZ ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray3D<_TItem_>

     TGridArray3D<_TItem_> = class( TArray3D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetDivX :Integer;
       procedure SetDivX( const DivX_:Integer );
       function GetDivY :Integer;
       procedure SetDivY( const DivY_:Integer );
       function GetDivZ :Integer;
       procedure SetDivZ( const DivZ_:Integer );
     public
       constructor Create; overload;
       constructor Create( const DivX_,DivY_,DivZ_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,Margin_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property DivX :Integer read GetDivX write SetDivX;
       property DivY :Integer read GetDivY write SetDivY;
       property DivZ :Integer read GetDivZ write SetDivZ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<_TItem_>.MakeArray;
begin
     _AllX := _MarginX + _CountX + _MarginX;
     _AllY := _MarginY + _CountY + _MarginY;
     _AllZ := _MarginZ + _CountZ + _MarginZ;

     SetLength( _Item, _AllX * _AllY * _AllZ );
end;

function TArray3D<_TItem_>.XYZtoI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( _MarginX + X_ ) + _AllX * ( ( _MarginY + Y_ ) + _AllY * ( _MarginZ + Z_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray3D<_TItem_>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray3D<_TItem_>.SetCountY( const CountY_:Integer );
begin
     _CountY := CountY_;  MakeArray;
end;

procedure TArray3D<_TItem_>.SetCountZ( const CountZ_:Integer );
begin
     _CountZ := CountZ_;  MakeArray;
end;

procedure TArray3D<_TItem_>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

procedure TArray3D<_TItem_>.SetMarginY( const MarginY_:Integer );
begin
     _MarginY := MarginY_;  MakeArray;
end;

procedure TArray3D<_TItem_>.SetMarginZ( const MarginZ_:Integer );
begin
     _MarginZ := MarginZ_;  MakeArray;
end;

function TArray3D<_TItem_>.GetItem( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := _Item[ XYZtoI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<_TItem_>.SetItem( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     _Item[ XYZtoI( X_, Y_, Z_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray3D<_TItem_>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TArray3D<_TItem_>.Create( const CountX_,CountY_,CountZ_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, 0 );
end;

constructor TArray3D<_TItem_>.Create( const CountX_,CountY_,CountZ_,Margin_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, Margin_, Margin_, Margin_ );
end;

constructor TArray3D<_TItem_>.Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _CountY  := CountY_;
     _CountZ  := CountZ_;
     _MarginX := MarginX_;
     _MarginY := MarginY_;
     _MarginZ := MarginZ_;
end;

procedure TArray3D<_TItem_>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray3D<_TItem_>.Swap( var Array0_,Array1_:TArray3D<_TItem_> );
var
   A :TArray3D<_TItem_>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray3D<_TItem_>.GetGridX :Integer;
begin
     Result := BricX + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridX( const GridX_:Integer );
begin
     BricX := GridX_ - 1;
end;

function TBricArray3D<_TItem_>.GetGridY :Integer;
begin
     Result := BricY + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridY( const GridY_:Integer );
begin
     BricY := GridY_ - 1;
end;

function TBricArray3D<_TItem_>.GetGridZ :Integer;
begin
     Result := BricZ + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridZ( const GridZ_:Integer );
begin
     BricY := GridZ_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray3D<_TItem_>.GetDivX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridArray3D<_TItem_>.SetDivX( const DivX_:Integer );
begin
     _CountX  := DivX_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetDivY :Integer;
begin
     Result := _CountY - 1;
end;

procedure TGridArray3D<_TItem_>.SetDivY( const DivY_:Integer );
begin
     _CountY  := DivY_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetDivZ :Integer;
begin
     Result := _CountZ - 1;
end;

procedure TGridArray3D<_TItem_>.SetDivZ( const DivZ_:Integer );
begin
     _CountZ  := DivZ_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray3D<_TItem_>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, 0 );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_,Margin_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, Margin_, Margin_, Margin_ );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited;

     _CountX  := DivX_ + 1;
     _CountY  := DivY_ + 1;
     _CountZ  := DivZ_ + 1;
end;

destructor TGridArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
