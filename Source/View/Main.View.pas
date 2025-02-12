unit Main.View;

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
  Vcl.WinXPanels,
  Vcl.ExtCtrls,
  Vcl.TitleBarCtrls,
  Vcl.WinXCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage,
  Cliente.View,
  Produto.View,
  Pedido.View;

type
  TMainView = class(TForm)
    pnlBackground: TPanel;
    pnlCliente: TPanel;
    pnlProduto: TPanel;
    pnlPedido: TPanel;
    imgCliente: TImage;
    lblCliente: TLabel;
    imgProduto: TImage;
    lblProduto: TLabel;
    imgPedido: TImage;
    lblPedido: TLabel;
    imgGithub: TImage;
    imgLinkedin: TImage;
    imgDelphi: TImage;
    lblMidia: TLabel;
    procedure imgGithubClick(Sender: TObject);
    procedure imgLinkedinClick(Sender: TObject);
    procedure pnlClienteClick(Sender: TObject);
    procedure pnlProdutoClick(Sender: TObject);
    procedure pnlPedidoClick(Sender: TObject);
  private
    { Private declarations }
    ClienteView: TClienteView;
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

uses
  MidiaSocial.Controller;

{$R *.dfm}

procedure TMainView.imgGithubClick(Sender: TObject);
begin
  TMidiaSocial.GitHub();
end;

procedure TMainView.imgLinkedinClick(Sender: TObject);
begin
  TMidiaSocial.Linkedin();
end;

procedure TMainView.pnlClienteClick(Sender: TObject);
begin
  ClienteView := TClienteView.Create(nil);
  try
    ClienteView.ShowModal;
  finally
    FreeAndNil(ClienteView);
  end;
end;

procedure TMainView.pnlPedidoClick(Sender: TObject);
begin
  PedidoView := TPedidoView.Create(nil);
  try
    PedidoView.ShowModal;
  finally
    FreeAndNil(PedidoView);
  end;
end;

procedure TMainView.pnlProdutoClick(Sender: TObject);
begin
  ProdutoView := TProdutoView.Create(nil);
  try
    ProdutoView.ShowModal;
  finally
    FreeAndNil(ProdutoView);
  end;
end;

end.
