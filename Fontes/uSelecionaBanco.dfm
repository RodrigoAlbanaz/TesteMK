object FSelecionaBanco: TFSelecionaBanco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Selecionar Banco de Dados'
  ClientHeight = 102
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbServidor: TLabel
    Left = 16
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Servidor:'
  end
  object Label1: TLabel
    Left = 206
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object lbArquivo: TLabel
    Left = 16
    Top = 38
    Width = 41
    Height = 13
    Caption = 'Arquivo:'
  end
  object edServidor: TEdit
    Left = 66
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'LOCALHOST'
  end
  object edPorta: TEdit
    Left = 242
    Top = 5
    Width = 71
    Height = 21
    TabOrder = 1
    Text = '3050'
  end
  object edArquivo: TEdit
    Left = 66
    Top = 35
    Width = 219
    Height = 21
    TabOrder = 2
    Text = 'BANCOTESTE.FDB'
  end
  object btConfirmar: TButton
    Left = 128
    Top = 69
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btConfirmarClick
  end
  object btProcurar: TButton
    Left = 290
    Top = 35
    Width = 23
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = btProcurarClick
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileName = 'bancoteste.fdb'
    FileTypes = <
      item
        DisplayName = 'Banco de Dados do Firebird'
        FileMask = '*.FDB'
      end>
    Options = []
    Left = 256
    Top = 56
  end
end
