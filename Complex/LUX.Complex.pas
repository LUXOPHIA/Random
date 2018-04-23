unit LUX.Complex;

interface //#################################################################### ■

uses LUX, LUX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleC

     TSingleC = record
     private
       ///// アクセサ
       function GetSiz2 :Single;
       function GetSize :Single;
       procedure SetSize( const Size_:Single );
       function GetUnitor :TSingleC;
       procedure SetUnitor( const Unitor_:TSingleC );
       function GetConj :TSingleC;
       procedure SetConj( const Conj_:TSingleC );
       function GetAngle :Single;
     public
       R :Single;
       I :Single;
       /////
       constructor Create( const R_,I_:Single );
       ///// プロパティ
       property Siz2   :Single   read GetSiz2                  ;
       property Size   :Single   read GetSize   write SetSize  ;
       property Unitor :TSingleC read GetUnitor write SetUnitor;
       property Conj   :TSingleC read GetConj   write SetConj  ;
       property Angle  :Single   read GetAngle                 ;
       ///// 演算子
       class operator Negative( const V_:TSingleC ) :TSingleC;
       class operator Positive( const V_:TSingleC ) :TSingleC;
       class operator Add( const A_,B_:TSingleC ) :TSingleC;
       class operator Subtract( const A_,B_:TSingleC ) :TSingleC;
       class operator Multiply( const A_,B_:TSingleC ) :TSingleC;
       class operator Multiply( const A_:TSingleC; const B_:Single ) :TSingleC;
       class operator Multiply( const A_:Single; const B_:TSingleC ) :TSingleC;
       class operator Divide( const A_,B_:TSingleC ) :TSingleC;
       class operator Divide( const A_:TSingleC; const B_:Single ) :TSingleC;
       ///// 型変換
       class operator Implicit( const V_:Single ) :TSingleC;
       ///// メソッド
       class function RandG( const SD_:Single = 1 ) :TSingleC; overload; static;
       class function RandG( const SD_:TSingleC ) :TSingleC; overload; static;
       class function RandBS1 :TSingleC; static;
       class function RandBS2 :TSingleC; static;
       class function RandBS4 :TSingleC; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleC

     TDoubleC = record
     private
       ///// アクセサ
       function GetSiz2 :Double;
       function GetSize :Double;
       procedure SetSize( const Size_:Double );
       function GetUnitor :TDoubleC;
       procedure SetUnitor( const Unitor_:TDoubleC );
       function GetConj :TDoubleC;
       procedure SetConj( const Conj_:TDoubleC );
       function GetAngle :Double;
     public
       R :Double;
       I :Double;
       /////
       constructor Create( const R_,I_:Double );
       ///// プロパティ
       property Siz2   :Double   read GetSiz2                  ;
       property Size   :Double   read GetSize   write SetSize  ;
       property Unitor :TDoubleC read GetUnitor write SetUnitor;
       property Conj   :TDoubleC read GetConj   write SetConj  ;
       property Angle  :Double   read GetAngle                 ;
       ///// 演算子
       class operator Negative( const V_:TDoubleC ) :TDoubleC;
       class operator Positive( const V_:TDoubleC ) :TDoubleC;
       class operator Add( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Subtract( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Multiply( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Multiply( const A_:TDoubleC; const B_:Double ) :TDoubleC;
       class operator Multiply( const A_:Double; const B_:TDoubleC ) :TDoubleC;
       class operator Divide( const A_,B_:TDoubleC ) :TDoubleC;
       class operator Divide( const A_:TDoubleC; const B_:Double ) :TDoubleC;
       ///// 型変換
       class operator Implicit( const V_:Double ) :TDoubleC;
       class operator Implicit( const V_:TSingleC ) :TDoubleC;
       class operator Implicit( const V_:TDoubleC ) :TSingleC;
       ///// メソッド
       class function RandG( const SD_:Double = 1 ) :TDoubleC; overload; static;
       class function RandG( const SD_:TDoubleC ) :TDoubleC; overload; static;
       class function RandBS1 :TDoubleC; static;
       class function RandBS2 :TDoubleC; static;
       class function RandBS4 :TDoubleC; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleAreaC

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleAreaC

     TDoubleAreaC = record
     private
       _Min :TDoubleC;
       _Max :TDoubleC;
       ///// アクセサ
       function GetCenter :TDoubleC;
       procedure SetCenter( const Center_:TDoubleC );
       function GetCenterR :Double;
       procedure SetCenterR( const CenterR_:Double );
       function GetCenterI :Double;
       procedure SetCenterI( const CenterI_:Double );
       function GetSizeR :Double;
       procedure SetSizeR( const SizeR_:Double );
       function GetSizeI :Double;
       procedure SetSizeI( const SizeI_:Double );
     public
       /////
       constructor Create( const Min_,Max_:TDoubleC ); overload;
       constructor Create( const MinR_,MinI_,MaxR_,MaxI_:Double ); overload;
       ///// プロパティ
       property Min     :TDoubleC read   _Min     write   _Min    ;
       property Max     :TDoubleC read   _Max     write   _Max    ;
       property Center  :TDoubleC read GetCenter  write SetCenter ;
       property CenterR :Double   read GetCenterR write SetCenterR;
       property CenterI :Double   read GetCenterI write SetCenterI;
       property SizeR   :Double   read GetSizeR   write SetSizeR  ;
       property SizeI   :Double   read GetSizeI   write SetSizeI  ;
       ///// 演算子
       class operator Negative( const V_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Positive( const V_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Add( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Subtract( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Multiply( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
       class operator Multiply( const A_:Double; const B_:TDoubleAreaC ) :TDoubleAreaC;
       class operator Divide( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
       ///// 型変換
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

Imaginary :TDoubleC = ( R:0; I:1 );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Pow( const X_:TSingleC; const N_:Single ) :TSingleC; overload;
function Pow( const X_:TDoubleC; const N_:Double ) :TDoubleC; overload;

function Roo2( const X_:TSingleC ) :TSingleC; overload;
function Roo2( const X_:TDoubleC ) :TDoubleC; overload;

function Cos( const A_:TSingleC ) :TSingleC; overload;
function Cos( const A_:TDoubleC ) :TDoubleC; overload;

function Sin( const A_:TSingleC ) :TSingleC; overload;
function Sin( const A_:TDoubleC ) :TDoubleC; overload;

function Tan( const A_:TSingleC ) :TSingleC; overload;
function Tan( const A_:TDoubleC ) :TDoubleC; overload;

function Exp( const A_:TSingleC ) :TSingleC; overload;
function Exp( const A_:TDoubleC ) :TDoubleC; overload;

function Ln( const A_:TSingleC ) :TSingleC; overload;
function Ln( const A_:TDoubleC ) :TDoubleC; overload;

function ArcCos( const X_:TDoubleC ) :TDoubleC; overload;

function ArcSin( const X_:TDoubleC ) :TDoubleC; overload;

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TSingleC.GetSiz2 :Single;
begin
     Result := Pow2( R ) + Pow2( I )
end;

function TSingleC.GetSize :Single;
begin
     Result := Roo2( GetSiz2 )
end;

procedure TSingleC.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor
end;

function TSingleC.GetUnitor :TSingleC;
begin
     Result := Self / Size
end;

procedure TSingleC.SetUnitor( const Unitor_:TSingleC );
begin
     Self := Size * Unitor_
end;

function TSingleC.GetConj :TSingleC;
begin
     Result.R := +R;
     Result.I := -I;
end;

procedure TSingleC.SetConj( const Conj_:TSingleC );
begin
     R := +Conj_.R;
     I := -Conj_.I;
end;

function TSingleC.GetAngle :Single;
begin
     Result := ArcTan2( I, R )
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleC.Create( const R_,I_:Single );
begin
     R := R_;
     I := I_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 演算子

class operator TSingleC.Negative( const V_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := -V_.R;
          I := -V_.I;
     end
end;

class operator TSingleC.Positive( const V_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := +V_.R;
          I := +V_.I;
     end
end;

class operator TSingleC.Add( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          I := A_.I + B_.I;
     end
end;

class operator TSingleC.Subtract( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          I := A_.I - B_.I;
     end
end;

class operator TSingleC.Multiply( const A_,B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R * B_.R - A_.I * B_.I;
          I := A_.R * B_.I + A_.I * B_.R;
     end
end;

class operator TSingleC.Multiply( const A_:TSingleC; const B_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R * B_;
          I := A_.I * B_;
     end
end;

class operator TSingleC.Multiply( const A_:Single; const B_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := A_ * B_.R;
          I := A_ * B_.I;
     end
end;

class operator TSingleC.Divide( const A_,B_:TSingleC ) :TSingleC;
var
   C :Single;
begin
     C := B_.Siz2;

     with Result do
     begin
          R := ( A_.R * B_.R + A_.I * B_.I ) / C;
          I := ( A_.I * B_.R - A_.R * B_.I ) / C;
     end
end;

class operator TSingleC.Divide( const A_:TSingleC; const B_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := A_.R / B_;
          I := A_.I / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 型変換

class operator TSingleC.Implicit( const V_:Single ) :TSingleC;
begin
     with Result do
     begin
          R := V_;
          I := 0;
     end
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TSingleC.RandG( const SD_:Single = 1 ) :TSingleC;
begin
     with Result do
     begin
          R := System.Math.RandG( 0, SD_ );
          I := System.Math.RandG( 0, SD_ );
     end;
end;

class function TSingleC.RandG( const SD_:TSingleC ) :TSingleC;
begin
     with Result do
     begin
          R := System.Math.RandG( 0, SD_.R );
          I := System.Math.RandG( 0, SD_.I );
     end;
end;

//------------------------------------------------------------------------------

class function TSingleC.RandBS1 :TSingleC;
begin
     with Result do
     begin
          R := TSingle.RandBS1;
          I := TSingle.RandBS1;
     end;
end;

class function TSingleC.RandBS2 :TSingleC;
begin
     with Result do
     begin
          R := TSingle.RandBS2;
          I := TSingle.RandBS2;
     end;
end;

class function TSingleC.RandBS4 :TSingleC;
begin
     with Result do
     begin
          R := TSingle.RandBS4;
          I := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TDoubleC.GetSiz2 :Double;
begin
     Result := Pow2( R ) + Pow2( I )
end;

function TDoubleC.GetSize :Double;
begin
     Result := Roo2( GetSiz2 )
end;

procedure TDoubleC.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor
end;

function TDoubleC.GetUnitor :TDoubleC;
begin
     Result := Self / Size
end;

procedure TDoubleC.SetUnitor( const Unitor_:TDoubleC );
begin
     Self := Size * Unitor_
end;

function TDoubleC.GetConj :TDoubleC;
begin
     Result.R := +R;
     Result.I := -I;
end;

procedure TDoubleC.SetConj( const Conj_:TDoubleC );
begin
     R := +Conj_.R;
     I := -Conj_.I;
end;

function TDoubleC.GetAngle :Double;
begin
     Result := ArcTan2( I, R )
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleC.Create( const R_,I_:Double );
begin
     R := R_;
     I := I_;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 演算子

class operator TDoubleC.Negative( const V_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := -V_.R;
          I := -V_.I;
     end
end;

class operator TDoubleC.Positive( const V_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := +V_.R;
          I := +V_.I;
     end
end;

class operator TDoubleC.Add( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          I := A_.I + B_.I;
     end
end;

class operator TDoubleC.Subtract( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          I := A_.I - B_.I;
     end
end;

class operator TDoubleC.Multiply( const A_,B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R * B_.R - A_.I * B_.I;
          I := A_.R * B_.I + A_.I * B_.R;
     end
end;

class operator TDoubleC.Multiply( const A_:TDoubleC; const B_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R * B_;
          I := A_.I * B_;
     end
end;

class operator TDoubleC.Multiply( const A_:Double; const B_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := A_ * B_.R;
          I := A_ * B_.I;
     end
end;

class operator TDoubleC.Divide( const A_,B_:TDoubleC ) :TDoubleC;
var
   C :Double;
begin
     C := B_.Siz2;

     with Result do
     begin
          R := ( A_.R * B_.R + A_.I * B_.I ) / C;
          I := ( A_.I * B_.R - A_.R * B_.I ) / C;
     end
end;

class operator TDoubleC.Divide( const A_:TDoubleC; const B_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := A_.R / B_;
          I := A_.I / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 型変換

class operator TDoubleC.Implicit( const V_:Double ) :TDoubleC;
begin
     with Result do
     begin
          R := V_;
          I := 0;
     end
end;

class operator TDoubleC.Implicit( const V_:TSingleC ) :TDoubleC;
begin
     with Result do
     begin
          R := V_.R;
          I := V_.I;
     end
end;

class operator TDoubleC.Implicit( const V_:TDoubleC ) :TSingleC;
begin
     with Result do
     begin
          R := V_.R;
          I := V_.I;
     end
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TDoubleC.RandG( const SD_:Double = 1 ) :TDoubleC;
begin
     with Result do
     begin
          R := System.Math.RandG( 0, SD_ );
          I := System.Math.RandG( 0, SD_ );
     end;
end;

class function TDoubleC.RandG( const SD_:TDoubleC ) :TDoubleC;
begin
     with Result do
     begin
          R := System.Math.RandG( 0, SD_.R );
          I := System.Math.RandG( 0, SD_.I );
     end;
end;

//------------------------------------------------------------------------------

class function TDoubleC.RandBS1 :TDoubleC;
begin
     with Result do
     begin
          R := TDouble.RandBS1;
          I := TDouble.RandBS1;
     end;
end;

class function TDoubleC.RandBS2 :TDoubleC;
begin
     with Result do
     begin
          R := TDouble.RandBS2;
          I := TDouble.RandBS2;
     end;
end;

class function TDoubleC.RandBS4 :TDoubleC;
begin
     with Result do
     begin
          R := TDouble.RandBS4;
          I := TDouble.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleAreaC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TDoubleAreaC.GetCenter :TDoubleC;
begin
     Result := ( _Max + _Min ) / 2
end;

procedure TDoubleAreaC.SetCenter( const Center_:TDoubleC );
begin
     with Center_ do
     begin
          CenterR := R;
          CenterI := I;
     end
end;

function TDoubleAreaC.GetCenterR :Double;
begin
     Result := ( _Max.R + _Min.R ) / 2
end;

procedure TDoubleAreaC.SetCenterR( const CenterR_:Double );
var
   S :Double;
begin
     S := SizeR / 2;

     _Min.R := CenterR_ - S;
     _Max.R := CenterR_ + S;
end;

function TDoubleAreaC.GetCenterI :Double;
begin
     Result := ( _Max.I + _Min.I ) / 2
end;

procedure TDoubleAreaC.SetCenterI( const CenterI_:Double );
var
   S :Double;
begin
     S := SizeI / 2;

     _Min.I := CenterI_ - S;
     _Max.I := CenterI_ + S;
end;

function TDoubleAreaC.GetSizeR :Double;
begin
     Result := _Max.R - _Min.R
end;

procedure TDoubleAreaC.SetSizeR( const SizeR_:Double );
var
   C, S :Double;
begin
     C := CenterR;
     S := SizeR_ / 2;

     _Min.R := C - S;
     _Max.R := C + S;
end;

function TDoubleAreaC.GetSizeI :Double;
begin
     Result := _Max.I - _Min.I
end;

procedure TDoubleAreaC.SetSizeI( const SizeI_:Double );
var
   C, S :Double;
begin
     C := CenterI;
     S := SizeI_ / 2;

     _Min.I := C - S;
     _Max.I := C + S;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleAreaC.Create( const Min_,Max_:TDoubleC );
begin
     _Min := Min_;
     _Max := Max_;
end;

constructor TDoubleAreaC.Create( const MinR_,MinI_,MaxR_,MaxI_:Double );
begin
     with _Min do
     begin
          R := MinR_;
          I := MinI_;
     end;
     with _Max do
     begin
          R := MaxR_;
          I := MaxI_;
     end;
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 演算子

class operator TDoubleAreaC.Negative( const V_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := -V_._Min;
          _Max := -V_._Max;
     end
end;

class operator TDoubleAreaC.Positive( const V_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := +V_._Min;
          _Max := +V_._Max;
     end
end;

class operator TDoubleAreaC.Add( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min + B_._Min;
          _Max := A_._Max + B_._Max;
     end
end;

class operator TDoubleAreaC.Subtract( const A_,B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min - B_._Min;
          _Max := A_._Max - B_._Max;
     end
end;

class operator TDoubleAreaC.Multiply( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min * B_;
          _Max := A_._Max * B_;
     end
end;

class operator TDoubleAreaC.Multiply( const A_:Double; const B_:TDoubleAreaC ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_ * B_._Min;
          _Max := A_ * B_._Max;
     end
end;

class operator TDoubleAreaC.Divide( const A_:TDoubleAreaC; const B_:Double ) :TDoubleAreaC;
begin
     with Result do
     begin
          _Min := A_._Min / B_;
          _Max := A_._Max / B_;
     end
end;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 型変換


//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Pow( const X_:TSingleC; const N_:Single ) :TSingleC;
var
   S, A: Single;
begin
     S := Power( X_.Size, N_ );
     A := X_.Angle * N_;

     Result.R := S * Cos( A );
     Result.I := S * Sin( A );
end;

function Pow( const X_:TDoubleC; const N_:Double ) :TDoubleC;
var
   S, A: Double;
begin
     S := Power( X_.Size, N_ );
     A := X_.Angle * N_;

     Result.R := S * Cos( A );
     Result.I := S * Sin( A );
end;

////////////////////////////////////////////////////////////////////////////////

function Roo2( const X_:TSingleC ) :TSingleC;
var
   S, A: Single;
begin
     S := Roo2( X_.Size );
     A := X_.Angle / 2;

     Result.R := S * Cos( A );
     Result.I := S * Sin( A );
end;

function Roo2( const X_:TDoubleC ) :TDoubleC;
var
   S, A: Double;
begin
     S := Roo2( X_.Size );
     A := X_.Angle / 2;

     Result.R := S * Cos( A );
     Result.I := S * Sin( A );
end;

////////////////////////////////////////////////////////////////////////////////

function Cos( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := +Cos( R ) * Cosh( I );
          Result.I := -Sin( R ) * Sinh( I );
     end
end;

function Cos( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := +Cos( R ) * Cosh( I );
          Result.I := -Sin( R ) * Sinh( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Sin( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := +Sin( R ) * Cosh( I );
          Result.I := +Cos( R ) * Sinh( I );
     end
end;

function Sin( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := +Sin( R ) * Cosh( I );
          Result.I := +Cos( R ) * Sinh( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Tan( const A_:TSingleC ) :TSingleC;
begin
     Result := Sin( A_ ) / Cos( A_ );
end;

function Tan( const A_:TDoubleC ) :TDoubleC;
begin
     Result := Sin( A_ ) / Cos( A_ );
end;

////////////////////////////////////////////////////////////////////////////////

function Exp( const A_:TSingleC ) :TSingleC;
var
   E :Single;
begin
     with A_ do
     begin
          E := Exp( R );

          Result.R := E * Cos( I );
          Result.I := E * Sin( I );
     end
end;

function Exp( const A_:TDoubleC ) :TDoubleC;
var
   E :Double;
begin
     with A_ do
     begin
          E := Exp( R );

          Result.R := E * Cos( I );
          Result.I := E * Sin( I );
     end
end;

////////////////////////////////////////////////////////////////////////////////

function Ln( const A_:TSingleC ) :TSingleC;
begin
     with A_ do
     begin
          Result.R := Ln( Size );
          Result.I := Angle;
     end
end;

function Ln( const A_:TDoubleC ) :TDoubleC;
begin
     with A_ do
     begin
          Result.R := Ln( Size );
          Result.I := Angle;
     end
end;

////////////////////////////////////////////////////////////////////////////////

function ArcCos( const X_:TDoubleC ) :TDoubleC;
begin
     Result := +Imaginary * Ln( X_ + Imaginary * Roo2( 1 - X_ * X_ ) );
end;

function ArcSin( const X_:TDoubleC ) :TDoubleC;
begin
     Result := -Imaginary * Ln( Imaginary * X_ + Roo2( 1 - X_ * X_ ) );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
