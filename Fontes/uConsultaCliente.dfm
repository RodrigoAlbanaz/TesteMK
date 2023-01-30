object FConsultaCliente: TFConsultaCliente
  Left = 0
  Top = 0
  ActiveControl = grdDados
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de Clientes'
  ClientHeight = 367
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grdDados: TDBGrid
    Left = 0
    Top = 52
    Width = 597
    Height = 277
    Align = alClient
    DataSource = dsDados
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESSOA_FISICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RG_IE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGRADOURO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Width = 64
        Visible = True
      end>
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 52
    Align = alTop
    TabOrder = 1
    object lbNome: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edNome: TEdit
      Left = 8
      Top = 24
      Width = 236
      Height = 21
      TabOrder = 0
    end
    object rgAtivo: TRadioGroup
      Left = 250
      Top = 5
      Width = 239
      Height = 40
      Caption = ' Mostrar: '
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Inativos'
        'Ativos'
        'Todos')
      TabOrder = 1
    end
    object btConsultar: TButton
      Left = 506
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Consultar'
      Default = True
      TabOrder = 2
      OnClick = btConsultarClick
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 329
    Width = 597
    Height = 38
    Align = alBottom
    TabOrder = 2
    object btIncluir: TButton
      Left = 8
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = btIncluirClick
    end
    object btAlterar: TButton
      Left = 96
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 184
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btFechar: TButton
      Left = 517
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 3
      OnClick = Sair1Click
    end
  end
  object Menu: TMainMenu
    Left = 272
    Top = 160
    object ConectaraoBancodeDados1: TMenuItem
      Caption = 'Conectar ao &Banco de Dados'
      OnClick = ConectaraoBancodeDados1Click
    end
    object Aes1: TMenuItem
      Caption = 'A'#231#245'e&s'
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
  end
  object dsDados: TDataSource
    DataSet = DM.cdsConsulta
    Left = 440
    Top = 120
  end
end
