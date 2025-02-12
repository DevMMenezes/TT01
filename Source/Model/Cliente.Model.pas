unit Cliente.Model;

interface

type
  TClienteModel = class
  private
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    FUF: String;

  public
    function getCidade: String;
    function getCodigo: Integer;
    function getNome: String;
    function getUF: String;
    procedure setCidade(const Value: String);
    procedure setCodigo(const Value: Integer);
    procedure setNome(const Value: String);
    procedure setUF(const Value: String);

    property Codigo: Integer read getCodigo write setCodigo;
    property Nome: String read getNome write setNome;
    property Cidade: String read getCidade write setCidade;
    property UF: String read getUF write setUF;

  end;

implementation

{ TClienteModel }

function TClienteModel.getCidade: String;
begin
  Result := FCidade;
end;

function TClienteModel.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TClienteModel.getNome: String;
begin
  Result := FNome;
end;

function TClienteModel.getUF: String;
begin
  Result := FUF;
end;

procedure TClienteModel.setCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TClienteModel.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TClienteModel.setNome(const Value: String);
begin
  FNome := Value;
end;

procedure TClienteModel.setUF(const Value: String);
begin
  FUF := Value;
end;

end.
