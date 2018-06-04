program Random;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.D5 in '_LIBRARY\LUXOPHIA\LUX\LUX.D5.pas',
  LUX.DN in '_LIBRARY\LUXOPHIA\LUX\LUX.DN.pas',
  LUX.M2 in '_LIBRARY\LUXOPHIA\LUX\LUX.M2.pas',
  LUX.M3 in '_LIBRARY\LUXOPHIA\LUX\LUX.M3.pas',
  LUX.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.M4.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.M4.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D2.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.V4.pas',
  LUX.D3.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.M4.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.D3.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.V4.pas',
  LUX.D4.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.M4.pas',
  LUX.D4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.pas',
  LUX.D4.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.V4.pas',
  LUX.Random in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.pas',
  LUX.Random.LCG in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.LCG.pas',
  LUX.Random.Xorshift in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.Xorshift.pas',
  LUX.Random.Xoshiro in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.Xoshiro.pas',
  LUX.Random.WELL in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.WELL.pas',
  LUX.Random.PCG in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.PCG.pas',
  LUX.Random.SFMT in '_LIBRARY\LUXOPHIA\LUX\Random\LUX.Random.SFMT.pas',
  MethodsFrame in 'MethodsFrame.pas' {FrameM: TFrame},
  LUX.Random.PCG.B32 in '_LIBRARY\LUXOPHIA\LUX\Random\PCG\LUX.Random.PCG.B32.pas',
  LUX.Random.PCG.B64 in '_LIBRARY\LUXOPHIA\LUX\Random\PCG\LUX.Random.PCG.B64.pas',
  LUX.Random.PCG.B08 in '_LIBRARY\LUXOPHIA\LUX\Random\PCG\LUX.Random.PCG.B08.pas',
  LUX.Random.PCG.B16 in '_LIBRARY\LUXOPHIA\LUX\Random\PCG\LUX.Random.PCG.B16.pas',
  LUX.Random.WELL.P19937 in '_LIBRARY\LUXOPHIA\LUX\Random\WELL\LUX.Random.WELL.P19937.pas',
  LUX.Random.WELL.P44497 in '_LIBRARY\LUXOPHIA\LUX\Random\WELL\LUX.Random.WELL.P44497.pas',
  LUX.Random.WELL.P512 in '_LIBRARY\LUXOPHIA\LUX\Random\WELL\LUX.Random.WELL.P512.pas',
  LUX.Random.WELL.P1024 in '_LIBRARY\LUXOPHIA\LUX\Random\WELL\LUX.Random.WELL.P1024.pas',
  LUX.Random.Xoshiro.B64 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\LUX.Random.Xoshiro.B64.pas',
  LUX.Random.Xoshiro.B32 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\LUX.Random.Xoshiro.B32.pas',
  LUX.Random.Xoshiro.B32.P64 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\B32\LUX.Random.Xoshiro.B32.P64.pas',
  LUX.Random.Xoshiro.B32.P128 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\B32\LUX.Random.Xoshiro.B32.P128.pas',
  LUX.Random.Xoshiro.B64.P128 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\B64\LUX.Random.Xoshiro.B64.P128.pas',
  LUX.Random.Xoshiro.B64.P256 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\B64\LUX.Random.Xoshiro.B64.P256.pas',
  LUX.Random.Xoshiro.B64.P512 in '_LIBRARY\LUXOPHIA\LUX\Random\Xoshiro\B64\LUX.Random.Xoshiro.B64.P512.pas',
  LUX.Random.SFMT.P4253 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P4253.pas',
  LUX.Random.SFMT.P11213 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P11213.pas',
  LUX.Random.SFMT.P19937 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P19937.pas',
  LUX.Random.SFMT.P44497 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P44497.pas',
  LUX.Random.SFMT.P86243 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P86243.pas',
  LUX.Random.SFMT.P132049 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P132049.pas',
  LUX.Random.SFMT.P216091 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P216091.pas',
  LUX.Random.SFMT.P607 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P607.pas',
  LUX.Random.SFMT.P1279 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P1279.pas',
  LUX.Random.SFMT.P2281 in '_LIBRARY\LUXOPHIA\LUX\Random\SFMT\LUX.Random.SFMT.P2281.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

