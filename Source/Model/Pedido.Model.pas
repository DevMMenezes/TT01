unit Pedido.Model;

interface

uses
  System.Generics.Collections,
  System.SysUtils;

type
  TPedidosModel = class
  private
    FNumeroPedido: Integer;
    FDataEmissao: String;
    FCodigoCliente: Integer;
    FValorTotal: Currency;
  public
    function getCodigoCliente: Integer;
    function getDataEmissao: String;
    function getNumeroPedido: Integer;
    function getValorTotal: Currency;

    procedure setCodigoCliente(const Value: Integer);
    procedure setDataEmissao(const Value: String);
    procedure setNumeroPedido(const Value: Integer);
    procedure setValorTotal(const Value: Currency);

    property NumeroPedido: Integer read getNumeroPedido write setNumeroPedido;
    property DataEmissao: String read getDataEmissao write setDataEmissao;
    property CodigoCliente: Integer read getCodigoCliente
      write setCodigoCliente;
    property ValorTotal: Currency read getValorTotal write setValorTotal;

  end;

implementation

{ TPedidosModel }


function TPedidosModel.getCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidosModel.getDataEmissao: String;
begin
  Result := FDataEmissao;
end;

function TPedidosModel.getNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidosModel.getValorTotal: Currency;
begin
  Result := FValorTotal;
end;

procedure TPedidosModel.setCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TPedidosModel.setDataEmissao(const Value: String);
begin
  FDataEmissao := Value;
end;

procedure TPedidosModel.setNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedidosModel.setValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.
