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
  File last update : 2025-10-05T15:59:32.765+02:00
  Signature : f0c00468e212d0efbd5e719d1bba60cb22d41b06
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Unit2, Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, FMX.Layouts, FMX.ListBox, Data.Bind.Components, Data.Bind.DBScope, FMX.Bind.Navigator, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, FMX.ScrollBox, FMX.Memo,
  FMX.Grid.Style, Fmx.Bind.Grid, Data.Bind.Grid, FMX.Grid;

type
  TForm1 = class(TForm)
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
begin
  if Button in [TNavigateButton.nbInsert, TNavigateButton.nbEdit] then
    Edit1.SetFocus;
  // ListBox1.Selected.IsChecked := CheckBox1.IsChecked;
end;

end.
