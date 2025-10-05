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
  File last update : 2025-10-05T15:59:32.875+02:00
  Signature : 88a7d0c2eda77f0d88129f583275509a04441c50
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, CLPacket, Mitov.Types, CLBasicComponent, CLComPort, FMX.Objects, Radiant.Shapes,
  SLCommonFilter, SLGenericRealValue, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, SLCommonGen, SLGenericRealValueGen, LPComponent,
  SLBasicGenericFilter, SLGenericFilter;

type
  TForm1 = class(TForm)
    CLComPort1: TCLComPort;
    CLUnpacket1: TCLUnpacket;
    stick: TRadiantCircle;
    SLGenericRealValue1: TSLGenericRealValue;
    SLGenericRealValue2: TSLGenericRealValue;
    procedure SLGenericRealValue1ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
    procedure SLGenericRealValue2ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SLGenericRealValueGen1Generate(Sender: TObject; var OutValue: Real; var Populated, Finished: Boolean);
  private
    { Déclarations privées }
    procedure bouton(appuye: Boolean);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.bouton(appuye: Boolean);
begin
  if appuye then
    stick.Fill.Color := talphacolors.lightgreen
  else
    stick.Fill.Color := talphacolors.Red;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  stick.Position.x := (width - stick.width) * 0.5;
  stick.Position.y := (height - stick.height) * 0.5;
  bouton(false);
end;

procedure TForm1.SLGenericRealValue1ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
begin
  stick.Position.x := width * InValue - stick.width / 2;
end;

procedure TForm1.SLGenericRealValue2ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
begin
  stick.Position.y := height * InValue - stick.height / 2;
end;

procedure TForm1.SLGenericRealValueGen1Generate(Sender: TObject; var OutValue: Real; var Populated, Finished: Boolean);
begin
  bouton(Populated);
end;

end.
