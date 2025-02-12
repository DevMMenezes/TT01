object ClienteView: TClienteView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Clientes'
  ClientHeight = 514
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  TextHeight = 15
  object DBGrid: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 154
    Width = 818
    Height = 357
    Align = alBottom
    BorderStyle = bsNone
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Visible = True
      end>
  end
  object GBPesquisa: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 818
    Height = 145
    Align = alClient
    Caption = ' Pesquisar '
    TabOrder = 1
    ExplicitWidth = 814
    ExplicitHeight = 144
    object lblPesquisar: TLabel
      Left = 16
      Top = 46
      Width = 39
      Height = 15
      Caption = 'Codigo'
      Visible = False
    end
    object cbPesquisar: TComboBox
      Left = 16
      Top = 17
      Width = 161
      Height = 23
      AutoDropDown = True
      AutoCloseUp = True
      ItemIndex = 0
      TabOrder = 0
      Text = 'Todos'
      OnClick = cbPesquisarClick
      Items.Strings = (
        'Todos'
        'Codigo'
        'Nome'
        'Cidade'
        'UF')
    end
    object btnPesquisar: TButton
      Left = 16
      Top = 104
      Width = 161
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 67
      Width = 161
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
      Visible = False
    end
  end
  object DS: TDataSource
    DataSet = MemClientes
    Left = 248
    Top = 96
  end
  object MemClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 32
  end
end
