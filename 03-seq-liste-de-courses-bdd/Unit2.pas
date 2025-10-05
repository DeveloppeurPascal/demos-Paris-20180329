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
  File last update : 2025-10-05T15:59:32.626+02:00
  Signature : ace3de6c5d80708b358949ae08ee211d72f73080
  ***************************************************************************
*)

unit Unit2;

interface

procedure doMain;

implementation

uses System.SysUtils, Unit1;

procedure doMain;
var
  e: telem;
  l: tliste;
  sortie: boolean;
  keyok: boolean;
  ch: string;
  c: char;
  num: integer;
begin
  sortie := false;
  repeat
    l := lister;
    if (length(l) > 0) then
    begin
      writeln('');
      writeln('****************************************');
      writeln('');
      for e in l do
      begin
        write(e.id.tostring + ' ');
        if (e.coche) then
          write('X ')
        else
          write('- ');
        writeln(e.libelle);
      end;
      writeln('');
      writeln('****************************************');
      writeln('');
      writeln('(A)jouter - (M)odifier - (S)upprimer - (C)ocher - (D)écocher - (Q)uitter');
    end
    else
      writeln('(A)jouter - (Q)uitter');
    repeat
      readln(c);
      keyok := sametext(c, 'A') or sametext(c, 'M') or sametext(c, 'S') or sametext(c, 'C') or sametext(c, 'D') or sametext(c, 'Q');
    until keyok;
    if sametext(c, 'A') then
    begin
      writeln('Libellé à ajouter ?');
      readln(ch);
      if (ch.Trim.length > 0) then
        ajouter(ch.Trim);
    end
    else if sametext(c, 'M') or sametext(c, 'S') or sametext(c, 'C') or sametext(c, 'D') then
    begin
      writeln('Quelle ligne ?');
      repeat
        readln(ch);
        try
          num := strtoint(ch);
        except
          num := -1;
        end;
      until (num >= 0);
      if sametext(c, 'M') then
      begin
        writeln('Nouveau libellé ?');
        readln(ch);
        if (ch.Trim.length > 0) then
          modifier(num, ch.Trim);
      end
      else if sametext(c, 'S') then
        supprimer(num)
      else if sametext(c, 'C') then
        cocher(num)
      else if sametext(c, 'D') then
        decocher(num);
    end
    else
      sortie := sametext(c, 'q');
  until sortie;
end;

end.

