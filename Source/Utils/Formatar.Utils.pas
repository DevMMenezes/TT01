unit Formatar.Utils;

interface

uses
  System.SysUtils,
  Vcl.StdCtrls,
  Winapi.Windows;

type
  TUtils = class
  private
  public
    class procedure FormatFloatKeyPress(Sender: TObject; var Key: Char);
  end;

implementation

class procedure TUtils.FormatFloatKeyPress(Sender: TObject; var Key: Char);
var
  Texto1, Texto2: string;
  I: byte;
  Valor: Double;
begin
  { Formatar Valores Currency }
  if TryStrToFloat(TEdit(Sender).Text, Valor) then
  begin
    if (Key in ['0' .. '9', Char(vk_back)]) then
    begin
      if (Key in ['0' .. '9']) and (Length(Trim(TEdit(Sender).Text)) > 23) then
        Key := #0;

      Texto2 := '0';
      Texto1 := Trim(TEdit(Sender).Text) + Key;
      for I := 1 to Length(Texto1) do
        if Texto1[I] in ['0' .. '9'] then
          Texto2 := Texto2 + Texto1[I];

      if Key = Char(vk_back) then
        Delete(Texto2, Length(Texto2), 1);

      Texto2 := FormatFloat('0.00', StrToInt64(Texto2) / 100);

      TEdit(Sender).Text := Texto2;

      TEdit(Sender).SelStart := Length(Texto2);
    end;
    Key := #0;
  end;
end;

end.
