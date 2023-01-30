program TesteAlmonth;

uses
  Vcl.Forms,
  uConsultaCliente in 'uConsultaCliente.pas' {FConsultaCliente},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSelecionaBanco in 'uSelecionaBanco.pas' {FSelecionaBanco},
  uClientes in 'uClientes.pas' {FClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFConsultaCliente, FConsultaCliente);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFSelecionaBanco, FSelecionaBanco);
  Application.CreateForm(TFClientes, FClientes);
  Application.Run;
end.
