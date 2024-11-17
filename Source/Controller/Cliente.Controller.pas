unit Cliente.Controller;

interface

uses
  DB, System.SysUtils,
  DataModule.Database,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  Winapi.Windows,
  Vcl.StdCtrls,
  Cliente.Model;

type
  TFilterType = (ftAll, ftCodigo, ftDescricao, ftCidade, ftUF);

type
  TClienteController = class
  private

  public
    procedure buscarClientes(MemTable: TFDMemTable; FilterValue: String;
      FilterType: TFilterType; out MsgError: String);

    function buscarCliente(CodigoCliente: Integer; out MsgError: String)
      : TClienteModel;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  inherited;
end;

destructor TClienteController.Destroy;
begin
  inherited;
end;

function TClienteController.buscarCliente(CodigoCliente: Integer;
  out MsgError: String): TClienteModel;
var
  Query: TFDQuery;
  oClienteModel: TClienteModel;
begin
  Query := Connection.GetQuery();
  oClienteModel := TClienteModel.Create;
  try
    try
      Query.SQL.Text := 'SELECT * FROM CLIENTES WHERE CODIGO = :CODIGO';

      Query.ParamByName('CODIGO').AsInteger := CodigoCliente;
      Query.Open();
      Query.Transaction.Commit();

      oClienteModel.setCodigo(Query.FieldByName('CODIGO').AsInteger);
      oClienteModel.setNome(Query.FieldByName('NOME').AsString);
      oClienteModel.setCidade(Query.FieldByName('CIDADE').AsString);
      oClienteModel.setUF(Query.FieldByName('UF').AsString);

      if Query.RecordCount > 0 then
        Result := oClienteModel
      else
      begin
        MsgError := 'Não foi possível encontrar o cliente.';
        Result := oClienteModel;
      end;
    except
      on E: Exception do
      begin
        Query.Transaction.Rollback();
        FreeAndNil(Query.Transaction);
        FreeAndNil(Query);
      end;
    end;
  finally
    if Assigned(Query) then
    begin
      FreeAndNil(Query.Transaction);
      FreeAndNil(Query);
    end;
  end;
end;

procedure TClienteController.buscarClientes(MemTable: TFDMemTable;
  FilterValue: String; FilterType: TFilterType; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'SELECT * FROM CLIENTES ';

      case FilterType of
        ftCodigo:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text, 'WHERE CODIGO = :CODIGO');
            Query.ParamByName('CODIGO').AsInteger :=
              StrToIntDef(FilterValue, 0);
          end;
        ftDescricao:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text, 'WHERE NOME like :NOME');
            Query.ParamByName('NOME').AsString := Concat('%', FilterValue, '%');
          end;
        ftCidade:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text,
              'WHERE CIDADE like :CIDADE');
            Query.ParamByName('CIDADE').AsString :=
              Concat('%', FilterValue, '%');
          end;
        ftUF:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text, 'WHERE UF like :UF');
            Query.ParamByName('UF').AsString := Concat('%', FilterValue, '%');
          end;
        ftAll:
          begin
            { All }
          end;
      end;

      Query.Open();
      Query.Transaction.Commit();

      MemTable.CopyDataSet(Query, [coStructure, coRestart, coAppend]);
    except
      on E: Exception do
      begin
        Query.Transaction.Rollback();
        FreeAndNil(Query.Transaction);
        FreeAndNil(Query);
        MsgError := E.Message;
      end;
    end;
  finally
    if Assigned(Query) then
    begin
      FreeAndNil(Query.Transaction);
      FreeAndNil(Query);
    end;
  end;
end;

end.
