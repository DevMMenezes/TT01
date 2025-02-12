unit PedidosProdutos.Model;

interface

type
  TPedidosProdutosModel = class
  private
    FCodigo: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FQuantidade: Currency;
    FVlrUnitario: Currency;

  public
    function getCodigo: Integer;
    function getCodigoProduto: Integer;
    function getNumeroPedido: Integer;
    function getQuantidade: Currency;
    function getVlrTotal: Currency;
    function getVlrUnitario: Currency;

    procedure setCodigo(const Value: Integer);
    procedure setCodigoProduto(const Value: Integer);
    procedure setNumeroPedido(const Value: Integer);
    procedure setQuantidade(const Value: Currency);
    procedure setVlrUnitario(const Value: Currency);

    property Codigo: Integer read getCodigo write setCodigo;
    property NumeroPedido: Integer read getNumeroPedido write setNumeroPedido;
    property CodigoProduto: Integer read getCodigoProduto
      write setCodigoProduto;
    property Quantidade: Currency read getQuantidade write setQuantidade;
    property VlrUnitario: Currency read getVlrUnitario write setVlrUnitario;
    property VlrTotal: Currency read getVlrTotal;

  end;

implementation

{ TPedidosProdutosModel }

function TPedidosProdutosModel.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TPedidosProdutosModel.getCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TPedidosProdutosModel.getNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidosProdutosModel.getQuantidade: Currency;
begin
  Result := FQuantidade;
end;

function TPedidosProdutosModel.getVlrTotal: Currency;
begin
  Result := FVlrUnitario * FQuantidade;
end;

function TPedidosProdutosModel.getVlrUnitario: Currency;
begin
  Result := FVlrUnitario;
end;

procedure TPedidosProdutosModel.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedidosProdutosModel.setCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TPedidosProdutosModel.setNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedidosProdutosModel.setQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

procedure TPedidosProdutosModel.setVlrUnitario(const Value: Currency);
begin
  FVlrUnitario := Value;
end;

end.
