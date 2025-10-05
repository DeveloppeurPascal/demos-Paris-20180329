(* C2PP
  ***************************************************************************

  Présentation RAD Studio 10.2 Tokyo à Paris le 29 mars 2018

  Copyright 2018 Patrick PREMARTIN under MIT license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr/

  Project site :
  https://github.com/DeveloppeurPascal/demos-Paris-20180329

  ***************************************************************************
  File last update : 2025-10-05T15:59:32.752+02:00
  Signature : 968a5ac2ad2dac3977ac7d1a5b792c463c56a167
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani, FMX.ExtCtrls,
  FMX.Filter.Effects, FMX.Effects;

type
  TForm1 = class(TForm)
    FlowLayout1: TFlowLayout;
    Layout1: TLayout;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    ImageViewer1: TImageViewer;
    BitmapListAnimation1: TBitmapListAnimation;
    ReflectionEffect1: TReflectionEffect;
    BandsEffect1: TBandsEffect;
    TilerEffect1: TTilerEffect;
    procedure Button1Click(Sender: TObject);
  private
    FButtonNumber: integer;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  inc(FButtonNumber);
  with (Button1.Clone(Self) as TButton) do
  begin
    Text := FButtonNumber.ToString;
    parent := FlowLayout1;
    onclick := Button1.onclick;
    AnimateFloat('RotationAngle',FButtonNumber*10 mod 360,5);
  end;
end;

end.
