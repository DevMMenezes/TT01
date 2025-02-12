program TT01;

uses
  Vcl.Forms,
  Main.View in 'Source\View\Main.View.pas' {MainView},
  Cliente.Model in 'Source\Model\Cliente.Model.pas',
  Produto.Model in 'Source\Model\Produto.Model.pas',
  Pedido.Model in 'Source\Model\Pedido.Model.pas',
  PedidosProdutos.Model in 'Source\Model\PedidosProdutos.Model.pas',
  MidiaSocial.Controller in 'Source\Controller\MidiaSocial.Controller.pas',
  Cliente.Controller in 'Source\Controller\Cliente.Controller.pas',
  Cliente.View in 'Source\View\Cliente.View.pas' {ClienteView},
  DataModule.Database in 'Source\Database\DataModule.Database.pas' {Connection: TDataModule},
  Produto.View in 'Source\View\Produto.View.pas' {ProdutoView},
  Produto.Controller in 'Source\Controller\Produto.Controller.pas',
  Pedido.View in 'Source\View\Pedido.View.pas' {PedidoView},
  Pedido.Controller in 'Source\Controller\Pedido.Controller.pas',
  Formatar.Utils in 'Source\Utils\Formatar.Utils.pas',
  Pedido.ViewModel in 'Source\ViewModel\Pedido.ViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TConnection, Connection);
  Application.CreateForm(TProdutoView, ProdutoView);
  Application.CreateForm(TPedidoView, PedidoView);
  Application.Run;

end.
