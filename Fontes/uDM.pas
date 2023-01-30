unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    sqlConsulta: TSQLQuery;
    pConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    cdsConsultaID_CLIENTE: TIntegerField;
    cdsConsultaNOME: TStringField;
    cdsConsultaCPF_CNPJ: TStringField;
    cdsConsultaRG_IE: TStringField;
    cdsConsultaCEP: TStringField;
    cdsConsultaLOGRADOURO: TStringField;
    cdsConsultaNUMERO: TStringField;
    cdsConsultaBAIRRO: TStringField;
    cdsConsultaCIDADE: TStringField;
    cdsConsultaUF: TStringField;
    cdsConsultaPAIS: TStringField;
    cdsConsultaTELEFONE: TStringField;
    cdsConsultaDATA_CADASTRO: TSQLTimeStampField;
    sqlCliente: TSQLQuery;
    pCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    cdsClienteID_CLIENTE: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClientePESSOA_FISICA: TIntegerField;
    cdsClienteCPF_CNPJ: TStringField;
    cdsClienteRG_IE: TStringField;
    cdsClienteATIVO: TIntegerField;
    cdsClienteCEP: TStringField;
    cdsClienteLOGRADOURO: TStringField;
    cdsClienteNUMERO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
    cdsClientePAIS: TStringField;
    cdsConsultaPESSOA_FISICA: TStringField;
    cdsConsultaATIVO: TStringField;
    sqlTelefone: TSQLQuery;
    pTelefone: TDataSetProvider;
    cdsTelefone: TClientDataSet;
    cdsTelefoneID_TELEFONE: TIntegerField;
    cdsTelefoneID_CLIENTE: TIntegerField;
    cdsTelefoneTELEFONE: TStringField;
    cdsTelefoneRAMAL: TStringField;
    cdsTelefoneDESCRICAO: TStringField;
    sqlGenClientes: TSQLQuery;
    sqlBuscaCPFCNPJ: TSQLQuery;
    procedure cdsTelefoneBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.cdsTelefoneBeforePost(DataSet: TDataSet);
begin
  cdsTelefoneID_TELEFONE.AsInteger := 0;
  cdsTelefoneID_CLIENTE.AsInteger  := cdsClienteID_CLIENTE.AsInteger;
end;

end.
