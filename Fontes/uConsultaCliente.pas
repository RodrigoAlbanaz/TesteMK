unit uConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, SQLExpr;

type
  TFConsultaCliente = class(TForm)
    grdDados: TDBGrid;
    pnTop: TPanel;
    lbNome: TLabel;
    edNome: TEdit;
    rgAtivo: TRadioGroup;
    btConsultar: TButton;
    pnBotoes: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btFechar: TButton;
    Menu: TMainMenu;
    ConectaraoBancodeDados1: TMenuItem;
    Aes1: TMenuItem;
    Sair1: TMenuItem;
    dsDados: TDataSource;
    procedure Sair1Click(Sender: TObject);
    procedure ConectaraoBancodeDados1Click(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaCliente: TFConsultaCliente;

implementation

{$R *.dfm}

uses uDM, uSelecionaBanco, uClientes;

procedure TFConsultaCliente.btAlterarClick(Sender: TObject);
begin
  if not DM.Conexao.Connected then
    ConectaraoBancodeDados1Click(Self);

  if not DM.cdsConsulta.Eof then
  begin
    FClientes := TFClientes.Create(Self);
    FClientes.idCliente := DM.cdsConsultaID_CLIENTE.AsInteger;
    FClientes.ShowModal;
  end;
end;

procedure TFConsultaCliente.btConsultarClick(Sender: TObject);
begin
  if not DM.Conexao.Connected then
    ConectaraoBancodeDados1Click(Self);

  DM.cdsConsulta.Close;
  DM.sqlConsulta.ParamByName('pNome').AsString := '%' + AnsiUpperCase(edNome.Text) + '%';
  if rgAtivo.ItemIndex = 2 then
    DM.sqlConsulta.ParamByName('pAtivo').AsInteger := -1
  else
    DM.sqlConsulta.ParamByName('pAtivo').AsInteger := rgAtivo.ItemIndex;
  DM.cdsConsulta.Open;
end;

procedure TFConsultaCliente.btExcluirClick(Sender: TObject);
var tr: TTransactionDesc;
begin
  if not DM.cdsConsulta.Eof then
  begin
    if Application.MessageBox('Deseja Excluir este cliente? Ele irá para INATIVOS.','Exclusão', MB_YESNO + MB_ICONQUESTION) = idYes then
    begin
      try
        tr.TransactionID := 1;
        tr.IsolationLevel := xilREADCOMMITTED;
        DM.Conexao.StartTransaction(tr);
        DM.Conexao.Execute('UPDATE CLIENTES SET ATIVO = 0 WHERE ID_CLIENTE = 0' + DM.cdsConsultaID_CLIENTE.AsString, nil);
        DM.Conexao.Commit(tr);
      except
        on e:exception do
        begin
          DM.Conexao.Rollback(tr);
          raise exception.Create('Ocorreu um erro ao inativar o cliente.');
        end;
      end;
    end;
  end;
end;

procedure TFConsultaCliente.btIncluirClick(Sender: TObject);
begin
  if not DM.Conexao.Connected then
    ConectaraoBancodeDados1Click(Self);

  FClientes := TFClientes.Create(Self);
  FClientes.idCliente := 0; //zero para inclusão
  FClientes.ShowModal;
end;

procedure TFConsultaCliente.ConectaraoBancodeDados1Click(Sender: TObject);
begin
  if DM.Conexao.Connected then
  begin
    if Application.MessageBox('Deseja desconectar do Banco de Dados?','Desconectar', MB_YESNO + MB_ICONQUESTION) = idYes then
    begin
      dm.Conexao.Close;
      ConectaraoBancodeDados1.Caption := 'Conectar ao &Banco de Dados';
    end;
  end
  else
  begin
    FSelecionaBanco := TFSelecionaBanco.Create(Self);
    FSelecionaBanco.ShowModal;
    if DM.Conexao.Connected then
      ConectaraoBancodeDados1.Caption := 'Desconectar do &Banco de Dados';
  end;
end;

procedure TFConsultaCliente.Sair1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja sair do sistema?','Sair', MB_YESNO + MB_ICONQUESTION) = idYes then
    Close;
end;

end.
