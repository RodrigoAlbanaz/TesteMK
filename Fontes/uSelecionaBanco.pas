unit uSelecionaBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, IWSystem;

type
  TFSelecionaBanco = class(TForm)
    lbServidor: TLabel;
    edServidor: TEdit;
    FileOpenDialog: TFileOpenDialog;
    Label1: TLabel;
    edPorta: TEdit;
    edArquivo: TEdit;
    lbArquivo: TLabel;
    btConfirmar: TButton;
    btProcurar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmarClick(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSelecionaBanco: TFSelecionaBanco;

implementation

{$R *.dfm}

uses uDM;

procedure TFSelecionaBanco.btConfirmarClick(Sender: TObject);
begin
  DM.Conexao.Params.Values['DATABASE']  := edServidor.Text + '/' + edPorta.Text + ':' + edArquivo.Text;
  DM.Conexao.Params.Values['User_Name'] := 'SYSDBA';
  DM.Conexao.Params.Values['Password']  := 'masterkey';
  DM.Conexao.Open;
  if DM.Conexao.Connected then
    Close;
end;

procedure TFSelecionaBanco.btProcurarClick(Sender: TObject);
begin
  FileOpenDialog.DefaultFolder := gsAppPath;
  if FileOpenDialog.Execute then
    edArquivo.Text := FileOpenDialog.FileName;
end;

procedure TFSelecionaBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFSelecionaBanco.FormCreate(Sender: TObject);
begin
  edArquivo.Text := gsAppPath + 'BANCOTESTE.FDB';
end;

end.
