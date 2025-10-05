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
  File last update : 2025-10-05T15:59:32.656+02:00
  Signature : 500c15699a69cfe9306c339dbf849d23615e23e6
  ***************************************************************************
*)

unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TLigne = class(TFrame)
    CheckBox1: TCheckBox;
    btnModifier: TBitBtn;
    btnSupprimer: TBitBtn;
    procedure btnSupprimerClick(Sender: TObject);
    procedure btnModifierClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses Unit1;

procedure TLigne.btnModifierClick(Sender: TObject);
var
  ch: string;
begin
  ch := inputbox('Modifier', 'Libellé ?', CheckBox1.Caption);
  if (ch.Trim.Length > 0) then
  begin
    CheckBox1.Caption := ch.Trim;
    if (parent.parent.parent is TForm1) then
      (parent.parent.parent as TForm1).listemodifiee := true;
  end;
end;

procedure TLigne.btnSupprimerClick(Sender: TObject);
begin
  if MessageDlg('Supprimer la liste ?', tmsgdlgtype.mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    if (parent.parent.parent is TForm1) then
      (parent.parent.parent as TForm1).listemodifiee := true;
    Free;
  end;
end;

end.
