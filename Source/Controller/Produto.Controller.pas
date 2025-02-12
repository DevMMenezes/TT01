unit Produto.Controller;

interface

uses
  FireDAC.Comp.Client,
  DataModule.Database,
  System.SysUtils,
  FireDAC.Comp.DataSet,
  Winapi.Windows,
  Vcl.StdCtrls,
  FireDAC.Stan.Param,
  Produto.Model;

type
  TFilterType = (ftAll, ftCodigo, ftDescricao, ftPrecoVenda);

type
  TProdutoController = class
  private
  public
    procedure getProdutos(MemTable: TFDMemTable; FilterValue: String;
      FilterType: TFilterType; out MsgError: String);

    function buscarProduto(CodigoProduto: Integer; out MsgError: String)
      : TProdutoModel;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TProdutoController }

function TProdutoController.buscarProduto(CodigoProduto: Integer;
  out MsgError: String): TProdutoModel;
var
  Query: TFDQuery;
  oProdutoModel: TProdutoModel;
begin
  Query := Connection.GetQuery();
  oProdutoModel := TProdutoModel.Create;
  try
    try
      Query.SQL.Text := 'SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO';

      Query.ParamByName('CODIGO').AsInteger := CodigoProduto;
      Query.Open();
      Query.Transaction.Commit();

      oProdutoModel.setCodigo(Query.FieldByName('CODIGO').AsInteger);
      oProdutoModel.setDescricao(Query.FieldByName('DESCRICAO').AsString);
      oProdutoModel.setPrecoDeVenda(Query.FieldByName('PRECO_DE_VENDA')
        .AsCurrency);

      if Query.RecordCount > 0 then
        Result := oProdutoModel
      else
      begin
        MsgError := 'N�o foi poss�vel encontrar o produto.';
        Result := oProdutoModel;
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

constructor TProdutoController.Create;
begin
  inherited;
end;

destructor TProdutoController.Destroy;
begin
  inherited;
end;

procedure TProdutoController.getProdutos(MemTable: TFDMemTable;
  FilterValue: String; FilterType: TFilterType; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'SELECT * FROM PRODUTOS ';

      case FilterType of
        ftCodigo:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text, 'WHERE CODIGO = :CODIGO');
            Query.ParamByName('CODIGO').AsInteger :=
              StrToIntDef(FilterValue, 0);
          end;
        ftDescricao:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text,
              'WHERE DESCRICAO like :DESCRICAO');
            Query.ParamByName('DESCRICAO').AsString :=
              Concat('%', FilterValue, '%');
          end;
        ftPrecoVenda:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text,
              'WHERE PRECO_DE_VENDA like :PRECO_DE_VENDA');
            Query.ParamByName('PRECO_DE_VENDA').AsString :=
              Concat('%', FilterValue, '%');
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
