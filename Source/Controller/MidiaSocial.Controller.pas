unit MidiaSocial.Controller;

interface

uses
  ShellAPI,
  Winapi.Windows;

type
  TMidiaSocial = class
  private
  public
    class procedure Linkedin();
    class procedure GitHub();
  end;

implementation

{ TMidiaSocial }

class procedure TMidiaSocial.GitHub;
begin
  ShellExecute(0, 'open', PChar('https://github.com/DevMMenezes'), nil, nil,
    SW_SHOWNORMAL);
end;

class procedure TMidiaSocial.Linkedin;
begin
  ShellExecute(0, 'open', PChar('https://www.linkedin.com/in/devmmenezes/'),
    nil, nil, SW_SHOWNORMAL);
end;

end.
