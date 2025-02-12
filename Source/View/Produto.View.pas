unit Produto.View;

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
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Produto.Controller,
  Formatar.Utils;

type
  TProdutoView = class(TForm)
    GBPesquisa: TGroupBox;
    lblPesquisar: TLabel;
    cbPesquisar: TComboBox;
    btnPesquisar: TButton;
    edtPesquisa: TEdit;
    DBGrid: TDBGrid;
    MemProdutos: TFDMemTable;
    DS: TDataSource;
    procedure cbPesquisarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    oProdutoController: TProdutoController;
    TipoFiltro: TFilterType;
  public
    { Public declarations }
  end;

var
  ProdutoView: TProdutoView;

implementation

uses
  Pedido.View;

{$R *.dfm}

procedure TProdutoView.btnPesquisarClick(Sender: TObject);

var
  MsgError: String;
begin
  oProdutoController.getProdutos(MemProdutos, edtPesquisa.Text, TipoFiltro,
    MsgError);

  if not MsgError.IsEmpty then
  begin
    ShowMessage('N�o foi poss�vel buscar os produtos.' + sLineBreak +
      'Mensagem T�cnica: ' + MsgError);
  end;
end;

procedure TProdutoView.cbPesquisarClick(Sender: TObject);
begin
  case cbPesquisar.ItemIndex of
    0:
      begin
        TipoFiltro := ftAll;
        lblPesquisar.Visible := False;
        edtPesquisa.Visible := False;
        edtPesquisa.NumbersOnly := False;
      end;
    1:
      begin
        TipoFiltro := ftCodigo;
        lblPesquisar.Caption := 'Codigo';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := True;
        edtPesquisa.OnKeyPress := nil;
      end;
    2:
      begin
        TipoFiltro := ftDescricao;
        lblPesquisar.Caption := 'Descri��o';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := False;
        edtPesquisa.OnKeyPress := nil;
      end;
    3:
      begin
        TipoFiltro := ftPrecoVenda;
        lblPesquisar.Caption := 'Pre�o de Venda';
        lblPesquisar.Visible := True;
        edtPesquisa.Visible := True;
        edtPesquisa.NumbersOnly := False;
        edtPesquisa.OnKeyPress := edtPesquisaKeyPress;
      end;
  end;
end;

procedure TProdutoView.DBGridDblClick(Sender: TObject);
begin
  if (not DBGrid.DataSource.DataSet.IsEmpty) and (Self.Tag = 1) then
  begin
    PedidoView.edtProdutoCodigo.Text := DBGrid.DataSource.DataSet.FieldByName
      ('CODIGO').AsString;
    PedidoView.edtProdutoDescricao.Text := DBGrid.DataSource.DataSet.FieldByName
      ('DESCRICAO').AsString;
    PedidoView.edtProdutoVlrUnitario.Text :=
      DBGrid.DataSource.DataSet.FieldByName('PRECO_DE_VENDA').AsString;
    PedidoView.edtProdutoQuantidade.Text := '1';
    Self.Close;
  end;
end;

procedure TProdutoView.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  TUtils.FormatFloatKeyPress(Sender, Key);
end;

procedure TProdutoView.FormCreate(Sender: TObject);
begin
  oProdutoController := TProdutoController.Create;
end;

procedure TProdutoView.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oProdutoController);
end;

procedure TProdutoView.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      btnPesquisarClick(Sender);
  end;
end;

end.
