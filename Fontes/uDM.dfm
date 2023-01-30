object DM: TDM
  OldCreateOrder = False
  Height = 189
  Width = 215
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver240.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=database.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 16
    Top = 15
  end
  object sqlConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pNome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pAtivo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pAtivo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT C.ID_CLIENTE, C.NOME, C.CPF_CNPJ, C.RG_IE, C.DATA_CADASTR' +
        'O,'
      '       CASE C.ATIVO WHEN 1 THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END ATIVO,'
      
        '       CASE C.PESSOA_FISICA WHEN 1 THEN '#39'F'#237'sica'#39' ELSE '#39'Jur'#237'dica'#39 +
        ' END PESSOA_FISICA,'
      
        '       C.CEP, C.LOGRADOURO, C.NUMERO, C.BAIRRO, C.CIDADE, C.UF, ' +
        'C.PAIS,'
      
        '       CAST((SELECT LIST(TC.TELEFONE,'#39'; '#39') FROM TELEFONES_CLIENT' +
        'ES TC WHERE TC.ID_CLIENTE = C.ID_CLIENTE) AS VARCHAR(100)) TELEF' +
        'ONE'
      'FROM CLIENTES C'
      'WHERE UPPER(C.NOME) LIKE :pNome'
      '  AND ((:pAtivo = -1) OR (C.ATIVO = :pAtivo))')
    SQLConnection = Conexao
    Left = 72
    Top = 14
  end
  object pConsulta: TDataSetProvider
    DataSet = sqlConsulta
    Left = 100
    Top = 14
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pConsulta'
    Left = 128
    Top = 14
    object cdsConsultaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsultaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsConsultaPESSOA_FISICA: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'PESSOA_FISICA'
      Size = 8
    end
    object cdsConsultaCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Size = 18
    end
    object cdsConsultaRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RG_IE'
    end
    object cdsConsultaTELEFONE: TStringField
      DisplayLabel = 'Telefones'
      FieldName = 'TELEFONE'
      Size = 100
    end
    object cdsConsultaDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object cdsConsultaATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Size = 3
    end
    object cdsConsultaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsConsultaLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object cdsConsultaNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Size = 60
    end
    object cdsConsultaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 60
    end
    object cdsConsultaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 60
    end
    object cdsConsultaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsConsultaPAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      Size = 60
    end
  end
  object sqlCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'idCliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID_CLIENTE, NOME, PESSOA_FISICA, CPF_CNPJ, RG_IE, ATIVO,'
      '       CEP, LOGRADOURO, NUMERO, BAIRRO, CIDADE, UF, PAIS'
      'FROM CLIENTES '
      'WHERE ID_CLIENTE = :idCliente')
    SQLConnection = Conexao
    Left = 72
    Top = 70
  end
  object pCliente: TDataSetProvider
    DataSet = sqlCliente
    Left = 100
    Top = 70
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCliente'
    Left = 128
    Top = 70
    object cdsClienteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsClienteNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClientePESSOA_FISICA: TIntegerField
      FieldName = 'PESSOA_FISICA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsClienteRG_IE: TStringField
      DisplayLabel = 'RG/IE'
      FieldName = 'RG_IE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsClienteLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClienteNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClienteBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClienteCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsClientePAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object sqlTelefone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'idCliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ID_TELEFONE, ID_CLIENTE, TELEFONE, RAMAL, DESCRICAO'
      'FROM TELEFONES_CLIENTES'
      'WHERE ID_CLIENTE = :idCliente')
    SQLConnection = Conexao
    Left = 72
    Top = 134
  end
  object pTelefone: TDataSetProvider
    DataSet = sqlTelefone
    Left = 100
    Top = 134
  end
  object cdsTelefone: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pTelefone'
    BeforePost = cdsTelefoneBeforePost
    Left = 128
    Top = 134
    object cdsTelefoneID_TELEFONE: TIntegerField
      FieldName = 'ID_TELEFONE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTelefoneID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsTelefoneTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object cdsTelefoneRAMAL: TStringField
      DisplayLabel = 'Ramal'
      FieldName = 'RAMAL'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsTelefoneDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object sqlGenClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select GEN_ID(GEN_CLIENTES, 1) ID FROM RDB$DATABASE')
    SQLConnection = Conexao
    Left = 16
    Top = 88
  end
  object sqlBuscaCPFCNPJ: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cpf'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idCliente'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(*) qtd '
      'from clientes '
      'where cpf_cnpj = :cpf'
      '  and id_cliente <> :idCliente')
    SQLConnection = Conexao
    Left = 16
    Top = 136
  end
end
