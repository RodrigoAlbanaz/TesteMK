object FClientes: TFClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Cadastro de Clientes'
  ClientHeight = 365
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 0
    Top = 330
    Width = 638
    Height = 35
    Align = alBottom
    TabOrder = 1
    object btCancelar: TButton
      Left = 556
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
    object btGravar: TButton
      Left = 475
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Gravar'
      Default = True
      TabOrder = 0
      OnClick = btGravarClick
    end
  end
  object pnDados: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 330
    Align = alClient
    TabOrder = 0
    object lbNome: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lbTipo: TLabel
      Left = 251
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object lbCPF: TLabel
      Left = 359
      Top = 8
      Width = 23
      Height = 13
      Caption = 'CPF:'
    end
    object lbRG: TLabel
      Left = 495
      Top = 8
      Width = 18
      Height = 13
      Caption = 'RG:'
    end
    object lbCEP: TLabel
      Left = 8
      Top = 56
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object lbRua: TLabel
      Left = 104
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Rua:'
    end
    object lbNumero: TLabel
      Left = 546
      Top = 56
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object lbBairro: TLabel
      Left = 8
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object lbUF: TLabel
      Left = 195
      Top = 104
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object lbCidade: TLabel
      Left = 251
      Top = 104
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object lbPais: TLabel
      Left = 444
      Top = 104
      Width = 23
      Height = 13
      Caption = 'Pa'#237's:'
    end
    object lbTelefone: TLabel
      Left = 8
      Top = 160
      Width = 51
      Height = 13
      Caption = 'Telefones:'
    end
    object cbTipo: TComboBox
      Left = 251
      Top = 24
      Width = 102
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbTipoChange
      Items.Strings = (
        'Pessoa Jur'#237'dica'
        'Pessoa F'#237'sica')
    end
    object edNome: TDBEdit
      Left = 8
      Top = 24
      Width = 237
      Height = 21
      DataField = 'NOME'
      DataSource = dsCliente
      TabOrder = 0
    end
    object edCPF: TDBEdit
      Left = 359
      Top = 24
      Width = 130
      Height = 21
      DataField = 'CPF_CNPJ'
      DataSource = dsCliente
      TabOrder = 2
      OnExit = edCPFExit
    end
    object edRG: TDBEdit
      Left = 495
      Top = 24
      Width = 130
      Height = 21
      DataField = 'RG_IE'
      DataSource = dsCliente
      TabOrder = 3
    end
    object edCEP: TDBEdit
      Left = 8
      Top = 72
      Width = 89
      Height = 21
      DataField = 'CEP'
      DataSource = dsCliente
      TabOrder = 4
      OnExit = edCEPExit
    end
    object edRua: TDBEdit
      Left = 104
      Top = 72
      Width = 436
      Height = 21
      DataField = 'LOGRADOURO'
      DataSource = dsCliente
      TabOrder = 5
    end
    object edNumero: TDBEdit
      Left = 546
      Top = 72
      Width = 79
      Height = 21
      DataField = 'NUMERO'
      DataSource = dsCliente
      TabOrder = 6
    end
    object edBairro: TDBEdit
      Left = 8
      Top = 120
      Width = 181
      Height = 21
      DataField = 'BAIRRO'
      DataSource = dsCliente
      TabOrder = 7
    end
    object cbUF: TDBComboBox
      Left = 195
      Top = 120
      Width = 50
      Height = 21
      Style = csDropDownList
      DataField = 'UF'
      DataSource = dsCliente
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
      TabOrder = 8
    end
    object edCidade: TDBEdit
      Left = 251
      Top = 120
      Width = 185
      Height = 21
      DataField = 'CIDADE'
      DataSource = dsCliente
      TabOrder = 9
    end
    object edPais: TDBEdit
      Left = 444
      Top = 120
      Width = 181
      Height = 21
      DataField = 'PAIS'
      DataSource = dsCliente
      TabOrder = 10
    end
    object grdTelefone: TDBGrid
      Left = 8
      Top = 175
      Width = 320
      Height = 120
      DataSource = dsTelefone
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAMAL'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 146
          Visible = True
        end>
    end
    object navTelefone: TDBNavigator
      Left = 8
      Top = 296
      Width = 320
      Height = 25
      DataSource = dsTelefone
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 12
    end
  end
  object dsCliente: TDataSource
    DataSet = DM.cdsCliente
    Left = 464
    Top = 224
  end
  object ACBrVal: TACBrValidador
    IgnorarChar = './-'
    Left = 544
    Top = 224
  end
  object dsTelefone: TDataSource
    DataSet = DM.cdsTelefone
    Left = 376
    Top = 224
  end
end
