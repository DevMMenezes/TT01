unit Pedido.Controller;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param,
  DataModule.Database,
  Pedido.Model,
  PedidosProdutos.Model,
  Pedido.ViewModel;

type
  TFilterType = (ftAll, ftCodigo, ftCodigoCliente);

type
  TPedidoController = class
  private

  public
    procedure buscarPedidos(MemTable: TFDMemTable; FilterValue: String;
      FilterType: TFilterType; out MsgError: String);
    procedure buscarDadosPedido(MemTable: TFDMemTable; NumeroPedido: Integer;
      out MsgError: String);
    procedure SalvarDadosPedido(PedidoModel: TPedidosModel;
      out MsgError: String; out NumeroPedido: Integer);
    procedure AlterarDadosPedido(PedidoModel: TPedidosModel;
      out MsgError: String);
    procedure ExcluirPedido(NumeroPedido: Integer; out MsgError: String);
    procedure buscarPedidoItens(MemTable: TFDMemTable; NumeroPedido: Integer;
      out MsgError: String);
    procedure SalvarPedidoItem(PedidoProdutoModel: TPedidosProdutosModel;
      out MsgError: String);
    procedure AlterarPedidoItem(PedidoProdutoModel: TPedidosProdutosModel;
      out MsgError: String);
    function buscarValoresPedido(NumeroPedido: Integer): TPedidoViewModel;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  inherited;
end;

destructor TPedidoController.Destroy;
begin;
  inherited;
end;

procedure TPedidoController.ExcluirPedido(NumeroPedido: Integer;
  out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text :=
        'DELETE FROM PEDIDOS WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO ';
      Query.ParamByName('NUMERO_PEDIDO').AsInteger := NumeroPedido;

      Query.ExecSQL();
      Query.Transaction.Commit();

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

procedure TPedidoController.AlterarDadosPedido(PedidoModel: TPedidosModel;
  out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'UPDATE PEDIDOS SET             ' +
        'DATA_EMISSAO = :DATA_EMISSAO,                  ' +
        'CODIGO_CLIENTE = :CODIGO_CLIENTE,              ' +
        'VALOR_TOTAL = :VALOR_TOTAL                     ';

      Query.ParamByName('DATA_EMISSAO').AsDateTime := Now();
      Query.ParamByName('CODIGO_CLIENTE').AsInteger :=
        PedidoModel.getCodigoCliente();
      Query.ParamByName('VALOR_TOTAL').AsCurrency :=
        PedidoModel.getValorTotal();

      Query.ExecSQL();
      Query.Transaction.Commit();
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

procedure TPedidoController.AlterarPedidoItem(PedidoProdutoModel
  : TPedidosProdutosModel; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'UPDATE PEDIDOS_PRODUTOS SET    ' +
        'NUMERO_PEDIDO = :NUMERO_PEDIDO,                ' +
        'CODIGO_PRODUTO = :CODIGO_PRODUTO,              ' +
        'QUANTIDADE = :QUANTIDADE,                      ' +
        'VLR_UNITARIO = :VLR_UNITARIO,                  ' +
        'VLR_TOTAL = :VLR_TOTAL                         ' +
        'WHERE CODIGO = :CODIGO                         ';

      Query.ParamByName('CODIGO').AsInteger := PedidoProdutoModel.getCodigo();
      Query.ParamByName('NUMERO_PEDIDO').AsInteger :=
        PedidoProdutoModel.getNumeroPedido();
      Query.ParamByName('CODIGO_PRODUTO').AsInteger :=
        PedidoProdutoModel.getCodigoProduto();
      Query.ParamByName('QUANTIDADE').AsCurrency :=
        PedidoProdutoModel.getQuantidade();
      Query.ParamByName('VLR_UNITARIO').AsCurrency :=
        PedidoProdutoModel.getVlrUnitario();
      Query.ParamByName('VLR_TOTAL').AsCurrency :=
        PedidoProdutoModel.getVlrTotal();

      Query.ExecSQL();
      Query.Transaction.Commit();
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

procedure TPedidoController.buscarDadosPedido(MemTable: TFDMemTable;
  NumeroPedido: Integer; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'SELECT P.*, C.NOME FROM PEDIDOS P     ' +
        ' INNER JOIN CLIENTES C ON C.CODIGO = P.CODIGO_CLIENTE ';
      Query.SQL.Text := Concat(Query.SQL.Text, 'WHERE P.CODIGO = :CODIGO');
      Query.ParamByName('CODIGO').AsInteger := NumeroPedido;

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

procedure TPedidoController.buscarPedidoItens(MemTable: TFDMemTable;
  NumeroPedido: Integer; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text :=
        'SELECT PP.*,P.descricao FROM PEDIDOS_PRODUTOS PP       ' +
        'INNER JOIN PRODUTOS P ON P.CODIGO = PP.CODIGO_PRODUTO  ' +
        'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO                   ';

      Query.ParamByName('NUMERO_PEDIDO').AsInteger := NumeroPedido;

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

procedure TPedidoController.buscarPedidos(MemTable: TFDMemTable;
  FilterValue: String; FilterType: TFilterType; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'SELECT P.*, C.NOME FROM PEDIDOS P     ' +
        ' INNER JOIN CLIENTES C ON C.CODIGO = P.CODIGO_CLIENTE ';

      case FilterType of
        ftCodigo:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text,
              'WHERE P.CODIGO = :CODIGO');
            Query.ParamByName('CODIGO').AsInteger :=
              StrToIntDef(FilterValue, 0);
          end;
        ftCodigoCliente:
          begin
            Query.SQL.Text := Concat(Query.SQL.Text,
              'WHERE P.CODIGO_CLIENTE like :CODIGO_CLIENTE');
            Query.ParamByName('CODIGO_CLIENTE').AsString :=
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

function TPedidoController.buscarValoresPedido(NumeroPedido: Integer)
  : TPedidoViewModel;
var
  oPedidoViewModel: TPedidoViewModel;
  Query: TFDQuery;
begin
  oPedidoViewModel := TPedidoViewModel.Create;
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text :=
        'SELECT COUNT(CODIGO) AS TotalItens, sum(quantidade) as TotalVolumes,' +
        ' sum(vlr_total) ValorTotal FROM pedidos_produtos                    ' +
        ' WHERE numero_pedido = :numero_pedido                               ';

      Query.ParamByName('numero_pedido').AsInteger := NumeroPedido;
      Query.Open();
      Query.Transaction.Commit();

      oPedidoViewModel.setTotalItensPedido(Query.FieldByName('TotalItens')
        .AsInteger);
      oPedidoViewModel.setValorTotalVolumes(Query.FieldByName('TotalVolumes')
        .AsCurrency);
      oPedidoViewModel.setValorTotal(Query.FieldByName('ValorTotal')
        .AsCurrency);

      Result := oPedidoViewModel;

    except
      on E: Exception do
      begin
        Result := Nil;
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

procedure TPedidoController.SalvarDadosPedido(PedidoModel: TPedidosModel;
  out MsgError: String; out NumeroPedido: Integer);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'INSERT INTO PEDIDOS(           ' +
        'DATA_EMISSAO,                                  ' +
        'CODIGO_CLIENTE,                                ' +
        'VALOR_TOTAL)                                   ' +
        'VALUES(                                        ' +
        ':DATA_EMISSAO,                                 ' +
        ':CODIGO_CLIENTE,                               ' +
        ':VALOR_TOTAL)                                  ';

      Query.ParamByName('DATA_EMISSAO').AsDateTime := Now();
      Query.ParamByName('CODIGO_CLIENTE').AsInteger :=
        PedidoModel.getCodigoCliente();
      Query.ParamByName('VALOR_TOTAL').AsCurrency :=
        PedidoModel.getValorTotal();

      Query.ExecSQL();

      Query.SQL.Text := 'SELECT LAST_INSERT_ID() AS NumeroPedido';
      Query.Open();
      NumeroPedido := Query.FieldByName('NumeroPedido').AsInteger;

      Query.Transaction.Commit();
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

procedure TPedidoController.SalvarPedidoItem(PedidoProdutoModel
  : TPedidosProdutosModel; out MsgError: String);
var
  Query: TFDQuery;
begin
  Query := Connection.GetQuery();
  try
    try
      Query.SQL.Text := 'INSERT INTO PEDIDOS_PRODUTOS(  ' +
        'NUMERO_PEDIDO,                                 ' +
        'CODIGO_PRODUTO,                                ' +
        'QUANTIDADE,                                    ' +
        'VLR_UNITARIO,                                  ' +
        'VLR_TOTAL                                      ' +
        ')                                              ' +
        'VALUES(                                        ' +
        ':NUMERO_PEDIDO,                                ' +
        ':CODIGO_PRODUTO,                               ' +
        ':QUANTIDADE,                                   ' +
        ':VLR_UNITARIO,                                 ' +
        ':VLR_TOTAL)                                    ';

      Query.ParamByName('NUMERO_PEDIDO').AsInteger :=
        PedidoProdutoModel.getNumeroPedido();
      Query.ParamByName('CODIGO_PRODUTO').AsInteger :=
        PedidoProdutoModel.getCodigoProduto();
      Query.ParamByName('QUANTIDADE').AsCurrency :=
        PedidoProdutoModel.getQuantidade();
      Query.ParamByName('VLR_UNITARIO').AsCurrency :=
        PedidoProdutoModel.getVlrUnitario();
      Query.ParamByName('VLR_TOTAL').AsCurrency :=
        PedidoProdutoModel.getVlrTotal();

      Query.ExecSQL();
      Query.Transaction.Commit();
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
