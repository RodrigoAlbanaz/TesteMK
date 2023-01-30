unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, SQLExpr, IdHTTP, System.JSON,
  ACBrBase, ACBrValidador, System.StrUtils;

type
  TFClientes = class(TForm)
    pnBotoes: TPanel;
    pnDados: TPanel;
    lbNome: TLabel;
    lbTipo: TLabel;
    cbTipo: TComboBox;
    lbCPF: TLabel;
    lbRG: TLabel;
    edNome: TDBEdit;
    edCPF: TDBEdit;
    edRG: TDBEdit;
    edCEP: TDBEdit;
    lbCEP: TLabel;
    lbRua: TLabel;
    edRua: TDBEdit;
    lbNumero: TLabel;
    edNumero: TDBEdit;
    lbBairro: TLabel;
    edBairro: TDBEdit;
    cbUF: TDBComboBox;
    lbUF: TLabel;
    lbCidade: TLabel;
    edCidade: TDBEdit;
    lbPais: TLabel;
    edPais: TDBEdit;
    lbTelefone: TLabel;
    grdTelefone: TDBGrid;
    btCancelar: TButton;
    btGravar: TButton;
    navTelefone: TDBNavigator;
    dsCliente: TDataSource;
    ACBrVal: TACBrValidador;
    dsTelefone: TDataSource;
    procedure btCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure edCEPExit(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure edCPFExit(Sender: TObject);
  private
    { Private declarations }
    procedure buscaCEP(cep: string);
    function validaDados: boolean;
  public
    { Public declarations }
    idCliente: integer;
  end;

var
  FClientes: TFClientes;

implementation

{$R *.dfm}

uses uDM;

procedure TFClientes.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFClientes.btGravarClick(Sender: TObject);
var tr: TTransactionDesc;
begin
  if validaDados then
  begin
    DM.cdsClientePESSOA_FISICA.AsInteger := cbTipo.ItemIndex;
    if DM.cdsClienteID_CLIENTE.AsInteger = 0 then //pega id do cliente
    begin
      DM.sqlGenClientes.Close;
      DM.sqlGenClientes.Open;
      DM.cdsClienteID_CLIENTE.AsInteger := DM.sqlGenClientes.FieldByName('ID').AsInteger;
    end;
    DM.cdsCliente.Post;

    DM.cdsTelefone.First;
    while not DM.cdsTelefone.Eof do
    begin
      DM.cdsTelefone.Edit;
      DM.cdsTelefoneID_CLIENTE.AsInteger := DM.cdsClienteID_CLIENTE.AsInteger;
      DM.cdsTelefone.Post;
      DM.cdsTelefone.Next;
    end;

    try
      tr.TransactionID := 1;
      tr.IsolationLevel := xilREADCOMMITTED;
      DM.Conexao.StartTransaction(tr);
      DM.cdsCliente.ApplyUpdates(0);
      DM.cdsTelefone.ApplyUpdates(0);
      DM.Conexao.Commit(tr);
      Close;
    except
      on e:exception do
      begin
        DM.Conexao.Rollback(tr);
        raise exception.Create('Ocorreu um erro ao gravar o cliente.');
      end;
    end;
  end;
end;

procedure TFClientes.buscaCEP(cep: string);
var http: TIdHTTP;
    resposta: UnicodeString;
    jsonCEP: TJSONObject;
begin
  try
    http := TIdHTTP.Create(nil);
    try
      resposta := http.Get('http://viacep.com.br/ws/' + cep + '/json/');
    except
      Application.MessageBox('Ocorreu um erro ao buscar o CEP!', 'CEP', MB_OK+MB_ICONWARNING);
      Exit;
    end;
  finally
    FreeAndNil(http);
  end;

  try
    jsonCEP := TJSonObject.Create;
    jsonCEP := (jsonCEP.ParseJSONValue(resposta) as TJSONObject);

    if Trim(jsonCEP.ToJSON) <> '' then
    begin
      DM.cdsClienteLOGRADOURO.AsString := jsonCEP.GetValue('logradouro').Value;
      DM.cdsClienteBairro.AsString     := jsonCEP.GetValue('bairro').Value;
      DM.cdsClienteCidade.AsString     := jsonCEP.GetValue('localidade').Value;
      DM.cdsClienteUF.AsString         := jsonCEP.GetValue('uf').Value;
      DM.cdsClientePais.AsString       := 'Brasil';
    end;
  finally
    jsonCEP.Free;
  end;
end;

procedure TFClientes.cbTipoChange(Sender: TObject);
begin
  if cbTipo.ItemIndex = 1 then // pessoa física
  begin
    lbCPF.Caption := 'CPF';
    lbRG.Caption  := 'RG';
  end
  else
  begin
    lbCPF.Caption := 'CNPJ';
    lbRG.Caption  := 'IE';
  end;
end;

procedure TFClientes.edCEPExit(Sender: TObject);
begin
  buscaCEP(edCEP.Text);
end;

procedure TFClientes.edCPFExit(Sender: TObject);
begin
  if Trim(edCPF.Text) <> '' then
  begin
    if cbTipo.ItemIndex = 1 then //pessoa física
      ACBrVal.TipoDocto := docCPF
    else
      ACBrVal.TipoDocto := docCNPJ;

    ACBrVal.Documento := edCPF.Text;

    if not ACBrVal.Validar then
    begin
      Application.MessageBox('Documento Inválido!', 'Validação', MB_OK+MB_ICONWARNING);
      edCPF.Clear;
      edCPF.SetFocus;
    end;
  end;
end;

procedure TFClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFClientes.FormShow(Sender: TObject);
begin
  dm.cdsCliente.Close;
  dm.sqlCliente.ParamByName('idCliente').AsInteger := idCliente;
  dm.cdsCliente.Open;

  dm.cdsTelefone.Close;
  dm.sqlTelefone.ParamByName('idCliente').AsInteger := idCliente;
  dm.cdsTelefone.Open;

  if idCliente = 0 then //inclusão
  begin
    dm.cdsCliente.Append;
    dm.cdsClienteID_CLIENTE.AsInteger := 0;
    dm.cdsClienteATIVO.AsInteger      := 1;
  end
  else //alteração
    dm.cdsCliente.Edit;

  cbTipo.ItemIndex := dm.cdsClientePESSOA_FISICA.AsInteger;
  cbTipoChange(Self);
end;

function TFClientes.validaDados: boolean;
begin
  Result := False;
  if Trim(edNome.Text) = '' then
  begin
    Application.MessageBox('Favor informar o Nome do cliente!', 'Validação', MB_OK+MB_ICONWARNING);
    edNome.SetFocus;
    Exit;
  end;
  if Trim(edCPF.Text) = '' then
  begin
    Application.MessageBox(PChar('Favor informar o ' + IfThen(cbTipo.ItemIndex = 0, 'CNPJ', 'CPF') + ' do cliente!'), 'Validação', MB_OK+MB_ICONWARNING);
    edCPF.SetFocus;
    Exit;
  end;
  if Trim(edRG.Text) = '' then
  begin
    Application.MessageBox(PChar('Favor informar ' + IfThen(cbTipo.ItemIndex = 0, 'a IE', 'o RG') + ' do cliente!'), 'Validação', MB_OK+MB_ICONWARNING);
    edRG.SetFocus;
    Exit;
  end;

  DM.sqlBuscaCPFCNPJ.Close;
  DM.sqlBuscaCPFCNPJ.ParamByName('cpf').AsString := edCPF.Text;
  DM.sqlBuscaCPFCNPJ.ParamByName('idCliente').AsInteger := DM.cdsClienteID_CLIENTE.AsInteger;
  DM.sqlBuscaCPFCNPJ.Open;
  if DM.sqlBuscaCPFCNPJ.FieldByName('qtd').AsFloat > 0 then
  begin
    Application.MessageBox(PChar('Já existe um cliente cadastrado com este ' + IfThen(cbTipo.ItemIndex = 0, 'CNPJ', 'CPF') + '!'), 'Validação', MB_OK+MB_ICONWARNING);
    edRG.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
