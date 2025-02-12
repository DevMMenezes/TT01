unit Pedido.View;

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
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Pedido.Controller,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Cliente.Controller,
  Cliente.Model,
  Cliente.View,
  Pedido.Model,
  Produto.View,
  Produto.Model,
  Produto.Controller,
  Vcl.Grids,
  Vcl.DBGrids,
  Formatar.Utils,
  PedidosProdutos.Model,
  System.UITypes, Pedido.ViewModel;

type
  TPedidoView = class(TForm)
    GBPedido: TGroupBox;
    edtPedidoCodigo: TEdit;
    edtClienteCodigo: TEdit;
    edtClienteNome: TEdit;
    pnlClienteCons: TPanel;
    imgClienteCons: TImage;
    lblPedidoCodigo: TLabel;
    lblClienteCodigo: TLabel;
    lblClienteDescricao: TLabel;
    GPPedidoItens: TGroupBox;
    edtProdutoCodigo: TEdit;
    edtProdutoDescricao: TEdit;
    pnlProdutoCons: TPanel;
    imgProdutoCons: TImage;
    lblProdutoCodigo: TLabel;
    lblProdutoDescricao: TLabel;
    MemDadosPedido: TFDMemTable;
    pnlPedidoCancelar: TPanel;
    imgPedidoCancelar: TImage;
    pnlPedidoConfirma: TPanel;
    imgPedidoConfirma: TImage;
    pnlPedidoEditar: TPanel;
    imgPedidoEditar: TImage;
    DBGrid: TDBGrid;
    DS: TDataSource;
    MemPedidoItens: TFDMemTable;
    pnlProdutoAdd: TPanel;
    imgProdutoAdd: TImage;
    edtProdutoQuantidade: TEdit;
    lblProdutoQuantidade: TLabel;
    edtProdutoVlrUnitario: TEdit;
    lblProdutoVlrUnitario: TLabel;
    lblTotaisQuantidadeProdutos: TLabel;
    lblTotaisQuantidadeProdutosNumero: TLabel;
    lblTotaisValorTotal: TLabel;
    lblTotaisValorTotalNumero: TLabel;
    lblTotaisQuantidadeVolumes: TLabel;
    lblTotaisQuantidadeVolumesNumero: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtClienteCodigoExit(Sender: TObject);
    procedure imgClienteConsClick(Sender: TObject);
    procedure imgPedidoConfirmaClick(Sender: TObject);
    procedure imgProdutoConsClick(Sender: TObject);
    procedure imgPedidoEditarClick(Sender: TObject);
    procedure edtProdutoCodigoExit(Sender: TObject);
    procedure imgPedidoCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtProdutoQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoVlrUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure imgProdutoAddClick(Sender: TObject);
    procedure DBGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    oPedidoController: TPedidoController;
    oClienteController: TClienteController;
    oProdutoController: TProdutoController;
    CodigoItemPedidoProduto: Integer;
    procedure ControlarGroupBox(GroupBox: TGroupBox; Ativo: Boolean = True);
    procedure LimparCamposProduto;
    procedure LimparCamposDadosPedido;
    procedure ValidarCamposProduto;
    procedure ValidarCamposDadosPedido;
  public
    { Public declarations }
  end;

var
  PedidoView: TPedidoView;

implementation

{$R *.dfm}

procedure TPedidoView.ControlarGroupBox(GroupBox: TGroupBox; Ativo: Boolean);
begin
  GroupBox.Enabled := Ativo;
end;

procedure TPedidoView.edtProdutoVlrUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  TUtils.FormatFloatKeyPress(Sender, Key);
end;

procedure TPedidoView.DBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if not DBGrid.DataSource.DataSet.IsEmpty then
        begin
          CodigoItemPedidoProduto := 0;
          CodigoItemPedidoProduto := DBGrid.DataSource.DataSet.FieldByName
            ('CODIGO').AsInteger;
          PedidoView.edtProdutoCodigo.Text :=
            DBGrid.DataSource.DataSet.FieldByName('CODIGO_PRODUTO').AsString;
          PedidoView.edtProdutoDescricao.Text :=
            DBGrid.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
          PedidoView.edtProdutoVlrUnitario.Text :=
            DBGrid.DataSource.DataSet.FieldByName('VLR_UNITARIO').AsString;
          PedidoView.edtProdutoQuantidade.Text :=
            DBGrid.DataSource.DataSet.FieldByName('QUANTIDADE').AsString;
        end;
      end;
  end;
end;

procedure TPedidoView.edtClienteCodigoExit(Sender: TObject);
var
  oClienteModel: TClienteModel;
  MsgError: String;
begin
  if edtClienteCodigo.Text = EmptyStr then
    Abort;

  try
    oClienteModel := oClienteController.buscarCliente
      (StrToIntDef(edtClienteCodigo.Text, 0), MsgError);

    if not MsgError.IsEmpty then
    begin
      ShowMessage(MsgError);
      Abort;
    end
    else
    begin
      edtClienteCodigo.Text := oClienteModel.getCodigo().ToString;
      edtClienteNome.Text := oClienteModel.getNome();
    end;
  finally
    FreeAndNil(oClienteModel);
  end;
end;

procedure TPedidoView.edtProdutoCodigoExit(Sender: TObject);
var
  oProdutoModel: TProdutoModel;
  MsgError: String;
begin
  if edtProdutoCodigo.Text = EmptyStr then
    exit;

  try
    oProdutoModel := oProdutoController.buscarProduto
      (StrToIntDef(edtProdutoCodigo.Text, 0), MsgError);

    if not MsgError.IsEmpty then
    begin
      ShowMessage(MsgError);
      Abort;
    end
    else
    begin
      edtProdutoCodigo.Text := oProdutoModel.getCodigo().ToString;
      edtProdutoDescricao.Text := oProdutoModel.getDescricao();
      edtProdutoQuantidade.Text := '1';
      edtProdutoVlrUnitario.Text := oProdutoModel.getPrecoDeVenda()
        .ToString.Replace('R$', EmptyStr).Trim();
    end;
  finally
    FreeAndNil(oProdutoModel);
  end;
end;

procedure TPedidoView.edtProdutoQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  TUtils.FormatFloatKeyPress(Sender, Key);
end;

procedure TPedidoView.FormCreate(Sender: TObject);
begin
  oPedidoController := TPedidoController.Create;
  oClienteController := TClienteController.Create;
  oProdutoController := TProdutoController.Create;
end;

procedure TPedidoView.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oPedidoController);
  FreeAndNil(oClienteController);
  FreeAndNil(oProdutoController);
end;

procedure TPedidoView.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
  end;
end;

procedure TPedidoView.imgClienteConsClick(Sender: TObject);
begin
  ClienteView := TClienteView.Create(nil);
  try
    ClienteView.Tag := 1;
    ClienteView.ShowModal;
  finally
    FreeAndNil(ClienteView);
  end;
end;

procedure TPedidoView.imgPedidoCancelarClick(Sender: TObject);
var
  MsgError: String;
begin
  if edtPedidoCodigo.Text = EmptyStr then
  begin
    { Exclus�o avulsa - habilita o edt para
      ser inserido um valor e pressionando novamente � exclu�do. }
    ControlarGroupBox(GBPedido, True);
    edtPedidoCodigo.Enabled := True;
    edtPedidoCodigo.SetFocus();
    if not MemPedidoItens.IsEmpty then
      MemPedidoItens.EmptyDataSet;
  end
  else
  begin
    if MessageDlg('Voc� deseja excluir o pedido?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin

      edtPedidoCodigo.Enabled := False;

      oPedidoController.ExcluirPedido(StrToInt(edtPedidoCodigo.Text), MsgError);

      if not MsgError.IsEmpty then
      begin
        ShowMessage('N�o foi poss�vel excluir o pedido.' + sLineBreak +
          'Mensagem T�cnica: ' + MsgError);
        Abort;
      end;

      LimparCamposProduto();
      LimparCamposDadosPedido();

      ControlarGroupBox(GBPedido, True);
      ControlarGroupBox(GPPedidoItens, False);

      if not MemPedidoItens.IsEmpty then
        MemPedidoItens.EmptyDataSet;

      edtClienteCodigo.SetFocus();
    end;
  end;
end;

procedure TPedidoView.imgPedidoConfirmaClick(Sender: TObject);
var
  oPedidoModel: TPedidosModel;
  MsgError: String;
  NumeroPedido: Integer;
begin
  ValidarCamposDadosPedido();

  oPedidoModel := TPedidosModel.Create;
  try
    oPedidoModel.setCodigoCliente(StrToInt(edtClienteCodigo.Text));
    oPedidoModel.setDataEmissao(DateTimeToStr(Now()));
    oPedidoModel.setNumeroPedido(StrToIntDef(edtPedidoCodigo.Text, 0));
    oPedidoModel.setValorTotal(0);

    if oPedidoModel.getNumeroPedido() > 0 then
    begin
      oPedidoController.AlterarDadosPedido(oPedidoModel, MsgError);
    end
    else
    begin
      oPedidoController.SalvarDadosPedido(oPedidoModel, MsgError, NumeroPedido);
      edtPedidoCodigo.Text := NumeroPedido.ToString;
    end;

    if not MsgError.IsEmpty then
    begin
      ShowMessage('N�o foi poss�vel inserir os dados do pedido.' + sLineBreak +
        'Mensagem T�cnica: ' + MsgError);
      Abort;
    end;

    ControlarGroupBox(GBPedido, False);
    ControlarGroupBox(GPPedidoItens, True);

    edtProdutoCodigo.SetFocus();
  finally
    FreeAndNil(oPedidoModel);
  end;

end;

procedure TPedidoView.imgPedidoEditarClick(Sender: TObject);
begin
  ControlarGroupBox(GBPedido, True);
  ControlarGroupBox(GPPedidoItens, False);
  edtClienteCodigo.SetFocus();
end;

procedure TPedidoView.imgProdutoAddClick(Sender: TObject);
var
  oPedidoProdutoModel: TPedidosProdutosModel;
  oPedidoViewModel: TPedidoViewModel;
  MsgError: String;
begin
  ValidarCamposProduto();

  oPedidoProdutoModel := TPedidosProdutosModel.Create;
  try
    oPedidoProdutoModel.setCodigoProduto(StrToInt(edtProdutoCodigo.Text));
    oPedidoProdutoModel.setNumeroPedido(StrToInt(edtPedidoCodigo.Text));
    oPedidoProdutoModel.setQuantidade(StrToFloat(edtProdutoQuantidade.Text));
    oPedidoProdutoModel.setVlrUnitario(StrToFloat(edtProdutoVlrUnitario.Text));

    if CodigoItemPedidoProduto > 0 then
    begin
      oPedidoProdutoModel.setCodigo(CodigoItemPedidoProduto);
      oPedidoController.AlterarPedidoItem(oPedidoProdutoModel, MsgError)
    end
    else
      oPedidoController.SalvarPedidoItem(oPedidoProdutoModel, MsgError);

    LimparCamposProduto();
    edtProdutoCodigo.SetFocus();

    if not MsgError.IsEmpty then
    begin
      ShowMessage('N�o foi poss�vel inserir o produto no pedido.' + sLineBreak +
        'Mensagem T�cnica: ' + MsgError);
      Abort;
    end;

    oPedidoController.buscarPedidoItens(MemPedidoItens,
      oPedidoProdutoModel.getNumeroPedido(), MsgError);

    if not MsgError.IsEmpty then
    begin
      ShowMessage('N�o foi poss�vel buscar os produtos do pedido.' + sLineBreak
        + 'Mensagem T�cnica: ' + MsgError);
      Abort;
    end;

    oPedidoViewModel := oPedidoController.buscarValoresPedido
      (oPedidoProdutoModel.getNumeroPedido());

    lblTotaisQuantidadeProdutosNumero.Caption :=
      oPedidoViewModel.getTotalItensPedido().ToString;
    lblTotaisValorTotalNumero.Caption := oPedidoViewModel.getValorTotal
      ().ToString;
    lblTotaisQuantidadeVolumesNumero.Caption :=
      oPedidoViewModel.getValorTotalVolumes().ToString.Replace('R$',
      EmptyStr).Trim();

  finally
    FreeAndNil(oPedidoProdutoModel);
    FreeAndNil(oPedidoViewModel);
  end;

end;

procedure TPedidoView.imgProdutoConsClick(Sender: TObject);
begin
  ProdutoView := TProdutoView.Create(nil);
  try
    ProdutoView.Tag := 1;
    ProdutoView.ShowModal;
  finally
    FreeAndNil(ProdutoView);
  end;
end;

procedure TPedidoView.LimparCamposDadosPedido;
begin
  edtPedidoCodigo.Clear;
  edtClienteCodigo.Clear;
  edtClienteNome.Clear;
end;

procedure TPedidoView.LimparCamposProduto;
begin
  edtProdutoCodigo.Clear;
  edtProdutoDescricao.Clear;
  edtProdutoQuantidade.Clear;
  edtProdutoVlrUnitario.Clear;
end;

procedure TPedidoView.ValidarCamposDadosPedido;
begin
  if (edtClienteCodigo.Text <> EmptyStr) and (edtClienteNome.Text = EmptyStr)
  then
  begin
    edtClienteCodigoExit(Self);
  end;

  if edtClienteCodigo.Text = EmptyStr then
    Abort;
end;

procedure TPedidoView.ValidarCamposProduto;
begin
  if (edtProdutoCodigo.Text <> EmptyStr) and
    (edtProdutoDescricao.Text = EmptyStr) or
    (edtProdutoVlrUnitario.Text = EmptyStr) then
  begin
    edtProdutoCodigoExit(Self);
  end;

  if (edtProdutoCodigo.Text = EmptyStr) then
    Abort;
end;

end.
