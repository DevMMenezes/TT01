unit Produto.Model;

interface

type
  TProdutoModel = class
  private
    FCodigo: Integer;
    FDescricao: String;
    FPrecoDeVenda: Currency;

  public
    function getCodigo: Integer;
    function getDescricao: String;
    function getPrecoDeVenda: Currency;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: String);
    procedure setPrecoDeVenda(const Value: Currency);

    property Codigo: Integer read getCodigo write setCodigo;
    property Descricao: String read getDescricao write setDescricao;
    property PrecoDeVenda: Currency read getPrecoDeVenda write setPrecoDeVenda;

  end;

implementation

{ TProdutoModel }

function TProdutoModel.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProdutoModel.getDescricao: String;
begin
  Result := FDescricao;
end;

function TProdutoModel.getPrecoDeVenda: Currency;
begin
  Result := FPrecoDeVenda;
end;

procedure TProdutoModel.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutoModel.setDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProdutoModel.setPrecoDeVenda(const Value: Currency);
begin
  FPrecoDeVenda := Value;
end;

end.
