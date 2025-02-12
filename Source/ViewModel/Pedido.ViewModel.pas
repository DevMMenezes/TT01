unit Pedido.ViewModel;

interface

type
  TPedidoViewModel = class
  private
    FTotalItensPedido: Integer;
    FValorTotal: Currency;
    FValorTotalVolumes: Currency;

  public

    function getTotalItensPedido: Integer;
    function getValorTotal: Currency;
    function getValorTotalVolumes: Currency;

    procedure setTotalItensPedido(const Value: Integer);
    procedure setValorTotal(const Value: Currency);
    procedure setValorTotalVolumes(const Value: Currency);

    property TotalItensPedido: Integer read getTotalItensPedido
      write setTotalItensPedido;
    property ValorTotal: Currency read getValorTotal write setValorTotal;
    property ValorTotalVolumes: Currency read getValorTotalVolumes
      write setValorTotalVolumes;
  end;

implementation

{ TPedidoViewModel }

function TPedidoViewModel.getTotalItensPedido: Integer;
begin
  Result := FTotalItensPedido;
end;

function TPedidoViewModel.getValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoViewModel.getValorTotalVolumes: Currency;
begin
  Result := FValorTotalVolumes;
end;

procedure TPedidoViewModel.setTotalItensPedido(const Value: Integer);
begin
  FTotalItensPedido := Value;
end;

procedure TPedidoViewModel.setValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TPedidoViewModel.setValorTotalVolumes(const Value: Currency);
begin
  FValorTotalVolumes := Value;
end;

end.
