object ProdutoView: TProdutoView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Produtos'
  ClientHeight = 515
  ClientWidth = 828
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
  object GBPesquisa: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 822
    Height = 146
    Align = alTop
    Caption = ' Pesquisar '
    TabOrder = 0
    ExplicitWidth = 818
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
      TabOrder = 0
      Text = 'Todos'
      OnClick = cbPesquisarClick
      Items.Strings = (
        'Todos'
        'Codigo'
        'Descricao'
        'Preco')
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
      Top = 65
      Width = 161
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
      Visible = False
      OnKeyPress = edtPesquisaKeyPress
    end
  end
  object DBGrid: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 155
    Width = 822
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
    TabOrder = 1
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
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 329
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_de_venda'
        Title.Caption = 'Pre'#231'o de Venda'
        Width = 110
        Visible = True
      end>
  end
  object MemProdutos: TFDMemTable
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
  object DS: TDataSource
    DataSet = MemProdutos
    Left = 240
    Top = 88
  end
end
