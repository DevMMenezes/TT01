unit Cliente.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Cliente.Controller;

type
  TClienteView = class(TForm)
    DBGrid: TDBGrid;
    DS: TDataSource;
    MemClientes: TFDMemTable;
    GBPesquisa: TGroupBox;
    cbPesquisar: TComboBox;
    btnPesquisar: TButton;
    edtPesquisa: TEdit;
    lblPesquisar: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cbPesquisarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    oClienteController: TClienteController;
    TipoFiltro: TFilterType;
  public
    { Public declarations }
  end;

var
  ClienteView: TClienteView;

implementation

uses
  Pedido.View;
{$R *.dfm}

procedure TClienteView.btnPesquisarClick(Sender: TObject);
var
  MsgError: String;
begin
  oClienteController.buscarClientes(MemClientes, edtPesquisa.Text, TipoFiltro,
    MsgError);

  if not MsgError.IsEmpty then
  begin
    ShowMessage('N�o foi poss�vel buscar os clientes.' + sLineBreak +
      'Mensagem T�cnica: ' + MsgError);
  end;
end;

procedure TClienteView.cbPesquisarClick(Sender: TObject);
begin
  case cbPesquisar.ItemIndex of
    0:
      begin
        TipoFiltro := ftAll;
        lblPesquisar.Visible := False;
        edtPesquisa.Visible := False;
      end;
    1:
      begin
        TipoFiltro := ftCodigo;
        lblPesquisar.Caption := 'Codigo';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := True;
      end;
    2:
      begin
        TipoFiltro := ftDescricao;
        lblPesquisar.Caption := 'Descri��o';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := False;
      end;
    3:
      begin
        TipoFiltro := ftCidade;
        lblPesquisar.Caption := 'Cidade';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := False;
      end;
    4:
      begin
        TipoFiltro := ftUF;
        lblPesquisar.Caption := 'UF';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := False;
      end;
  end;
end;

procedure TClienteView.DBGridDblClick(Sender: TObject);
begin
  if (not DBGrid.DataSource.DataSet.IsEmpty) and (Self.Tag = 1) then
  begin
    PedidoView.edtClienteCodigo.Text := DBGrid.DataSource.DataSet.FieldByName
      ('CODIGO').AsString;
    PedidoView.edtClienteNome.Text := DBGrid.DataSource.DataSet.FieldByName
      ('NOME').AsString;

    Self.Close;
  end;
end;

procedure TClienteView.FormCreate(Sender: TObject);
begin
  oClienteController := TClienteController.Create;
end;

procedure TClienteView.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oClienteController);
end;

procedure TClienteView.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      btnPesquisarClick(Sender);
  end;
end;

end.
