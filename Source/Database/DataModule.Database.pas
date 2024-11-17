unit DataModule.Database;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  System.IniFiles,
  FireDAC.DApt;

type
  TConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetQuery: TFDQuery;
  end;

var
  Connection: TConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TConnection.FDConnectionBeforeConnect(Sender: TObject);
var
  IniFile: TIniFile;
begin

  try
    if not FileExists(ExtractFilePath(ParamStr(0)) + 'libmysql.dll') then
      raise Exception.Create
        ('Favor colocar na mesma pasta onde está o executável a biblioteca libmysql.dll');

    if not FileExists(ExtractFilePath(ParamStr(0)) + 'Connection.ini') then
    begin
      IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) +
        'Connection.ini');
      IniFile.WriteString('Configuracoes', 'Servidor', '');
      IniFile.WriteString('Configuracoes', 'Porta', '');
      IniFile.WriteString('Configuracoes', 'BaseDados', '');
      IniFile.WriteString('Configuracoes', 'Usuario', '');
      IniFile.WriteString('Configuracoes', 'Senha', '');
      IniFile.WriteString('Configuracoes', 'CaminhoDLL', '');
      raise Exception.Create
        ('Informações de conexão com a base de dados insuficientes ou inexistentes, '
        + 'favor adicioná-las no arquivo Connection.ini.');
    end
    else
    begin
      IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) +
        'Connection.ini');
      if IniFile.ReadString('Configuracoes', 'Servidor', '').IsEmpty or
        IniFile.ReadString('Configuracoes', 'Porta', '').IsEmpty or
        IniFile.ReadString('Configuracoes', 'BaseDados', '').IsEmpty or
        IniFile.ReadString('Configuracoes', 'Usuario', '').IsEmpty or
        IniFile.ReadString('Configuracoes', 'CaminhoDLL', '').IsEmpty or
        IniFile.ReadString('Configuracoes', 'Senha', '').IsEmpty then
        raise Exception.Create
          ('Informações de conexão com a base de dados insuficientes ou inexistentes, '
          + 'favor adicioná-las no arquivo Connection.ini.')
      else
      begin
        FDConnection.Params.Clear;
        FDConnection.LoginPrompt := False;
        FDConnection.Params.Values['DriverID'] := 'MySQL';
        FDConnection.Params.Values['Protocol'] := 'TCPIP';
        FDConnection.Params.Values['Server'] :=
          IniFile.ReadString('Configuracoes', 'Servidor', '');
        FDConnection.Params.Values['Database'] :=
          IniFile.ReadString('Configuracoes', 'BaseDados', '');
        FDConnection.Params.Values['User_name'] :=
          IniFile.ReadString('Configuracoes', 'Usuario', '');
        FDConnection.Params.Values['Password'] :=
          IniFile.ReadString('Configuracoes', 'Senha', '');
        FDConnection.Params.Values['Port'] :=
          IniFile.ReadString('Configuracoes', 'Porta', '');
        FDConnection.Params.Values['CharacterSet'] := 'UTF8';
        FDPhysMySQLDriverLink.VendorLib := IniFile.ReadString('Configuracoes',
          'CaminhoDLL', '');
      end;
    end;
  finally
    FreeAndNil(IniFile);
  end;
end;

function TConnection.GetQuery: TFDQuery;
var
  Transaction: TFDTransaction;
begin
  Result := TFDQuery.Create(nil);
  Transaction := TFDTransaction.Create(nil);
  Transaction.Connection := FDConnection;

  if Transaction.Active then
    Transaction.Commit;
  Transaction.StartTransaction;

  Result.Connection := FDConnection;
  Result.Transaction := Transaction;
  Result.Close;
  Result.SQL.Clear;
end;

end.
