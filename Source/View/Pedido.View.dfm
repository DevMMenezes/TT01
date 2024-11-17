object PedidoView: TPedidoView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pedidos'
  ClientHeight = 512
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
  object lblTotaisQuantidadeProdutos: TLabel
    Left = 210
    Top = 472
    Width = 135
    Height = 15
    Caption = 'Quantidade de Produtos: '
  end
  object lblTotaisQuantidadeProdutosNumero: TLabel
    Left = 351
    Top = 472
    Width = 6
    Height = 15
    Caption = '0'
  end
  object lblTotaisValorTotal: TLabel
    Left = 210
    Top = 456
    Width = 117
    Height = 15
    Caption = 'Valor Total do Pedido: '
  end
  object lblTotaisValorTotalNumero: TLabel
    Left = 351
    Top = 456
    Width = 6
    Height = 15
    Caption = '0'
  end
  object lblTotaisQuantidadeVolumes: TLabel
    Left = 210
    Top = 489
    Width = 132
    Height = 15
    Caption = 'Quantidade de Volumes: '
  end
  object lblTotaisQuantidadeVolumesNumero: TLabel
    Left = 351
    Top = 489
    Width = 6
    Height = 15
    Caption = '0'
  end
  object GBPedido: TGroupBox
    Left = 0
    Top = 0
    Width = 828
    Height = 153
    Align = alTop
    Caption = ' Dados do Pedido'
    TabOrder = 0
    ExplicitWidth = 824
    object lblPedidoCodigo: TLabel
      Left = 16
      Top = 19
      Width = 39
      Height = 15
      Caption = 'Codigo'
    end
    object lblClienteCodigo: TLabel
      Left = 15
      Top = 72
      Width = 62
      Height = 15
      Caption = 'Cod Cliente'
    end
    object lblClienteDescricao: TLabel
      Left = 111
      Top = 72
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object edtPedidoCodigo: TEdit
      Left = 16
      Top = 40
      Width = 49
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object edtClienteCodigo: TEdit
      Left = 13
      Top = 93
      Width = 64
      Height = 23
      NumbersOnly = True
      TabOrder = 1
      OnExit = edtClienteCodigoExit
    end
    object edtClienteNome: TEdit
      Left = 111
      Top = 94
      Width = 216
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object pnlClienteCons: TPanel
      Left = 83
      Top = 93
      Width = 25
      Height = 24
      Cursor = crHandPoint
      BevelOuter = bvNone
      TabOrder = 3
      object imgClienteCons: TImage
        Left = 0
        Top = 0
        Width = 25
        Height = 24
        Cursor = crHandPoint
        Align = alClient
        AutoSize = True
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          00300804000000FD0B310C000002BC4944415478DAED977B688D611CC73FDBE9
          F8C7DAFE616B492E632825AC586433978C588C94B944CA2D89FC850CA3B98436
          B9D64C49723B65A3AD094BC9F5CFB56C14616396921186F13DB36C6767EF7B9E
          673B4B69BF3FCEFBF63EE77D3ECFF37D7FB727826EB6881E400F6020194C6300
          714453470D155CE5265FC303184F2EA9BA5650452D5F88255ECF6268208F037C
          EC1A2086532CE02D07F1F1BCCD732F29AC6021EFD9C0F9CE038650CC607238CC
          E70EC74793CF04F6B195A6CE0012B8AFDF4CEEB8BCE7954C6B2860A53D209A7B
          523B99672177BF836C366997968073D27E3AE521A7F7BF7B81795ACA231B4012
          0FD9A5B5995914D5F2B0C936803246E91337180260152748A7D414D08F57F28C
          5CE3E9FD1FFB85E4CC3205ACE528C3B46D1B3BA9A888A5D10CE063248956D3C3
          1C258F89DC35033C56B6C9B00424EA332F728EEA40402D45ACB60444C925362B
          A518013E705AA163671EE99FE3ECD881802A8994156AC67616AF7DAFE39819A0
          5CC92BCD1230568B9ACF1533403ECBE96B534E641B39447F5E9B01A672839994
          58016E4BA4E1CEC38100AF4ACC2D253B731B4A257BDC7257FB5CB44DA92E9907
          C6808BCC52DDAE3707F4E6A94A642ADF8DA69F2249F7B2C5ED2FC1F520934BAA
          C726E1364895A08E317CB303C04EB62B74B2F91562FAEB8C507A9FED9CE89C00
          111C579EBF2C97FDE4F85E9AAA599FE6BB6245810BC2A96D592FEF7EA70F5EC0
          8FA0B104762B4557F24472FAAD487E6798AEDB5A12FB550C6BB4C26B9ACADF78
          C5C9E32749921441F32464A332D7B25008F7D6718626485713E6B726229BAFD5
          12E7488B634652C8527744E8E6B717E3D49BC6AB9DA9E78D22E465C0A847BB70
          4574BDBB8EFC2B540973835D361CED7BAB501D20C2733E68152A0811AE038823
          227C271C0F6758DC7CE76B898F3003FC884296F05319E06CF700FE0855A6F6B9
          8DFDF343600FE03F00FC069ED2AB313145A75F0000000049454E44AE426082}
        Stretch = True
        OnClick = imgClienteConsClick
        ExplicitTop = -8
      end
    end
  end
  object GPPedidoItens: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 156
    Width = 822
    Height = 293
    Cursor = crHandPoint
    Align = alTop
    Caption = 'Itens Pedido'
    Enabled = False
    TabOrder = 4
    ExplicitWidth = 818
    object lblProdutoCodigo: TLabel
      Left = 12
      Top = 24
      Width = 43
      Height = 15
      Caption = 'Cod Pro'
    end
    object lblProdutoDescricao: TLabel
      Left = 108
      Top = 24
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lblProdutoQuantidade: TLabel
      Left = 330
      Top = 24
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object lblProdutoVlrUnitario: TLabel
      Left = 410
      Top = 25
      Width = 71
      Height = 15
      Caption = 'Valor Unit'#225'rio'
    end
    object edtProdutoCodigo: TEdit
      Left = 10
      Top = 45
      Width = 64
      Height = 23
      TabOrder = 0
      OnExit = edtProdutoCodigoExit
    end
    object edtProdutoDescricao: TEdit
      Left = 108
      Top = 46
      Width = 216
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object pnlProdutoCons: TPanel
      Left = 80
      Top = 45
      Width = 25
      Height = 24
      Cursor = crHandPoint
      BevelOuter = bvNone
      TabOrder = 1
      object imgProdutoCons: TImage
        Left = 0
        Top = 0
        Width = 25
        Height = 24
        Cursor = crHandPoint
        Align = alClient
        AutoSize = True
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          00300804000000FD0B310C000002BC4944415478DAED977B688D611CC73FDBE9
          F8C7DAFE616B492E632825AC586433978C588C94B944CA2D89FC850CA3B98436
          B9D64C49723B65A3AD094BC9F5CFB56C14616396921186F13DB36C6767EF7B9E
          673B4B69BF3FCEFBF63EE77D3ECFF37D7FB727826EB6881E400F6020194C6300
          714453470D155CE5265FC303184F2EA9BA5650452D5F88255ECF6268208F037C
          EC1A2086532CE02D07F1F1BCCD732F29AC6021EFD9C0F9CE038650CC607238CC
          E70EC74793CF04F6B195A6CE0012B8AFDF4CEEB8BCE7954C6B2860A53D209A7B
          523B99672177BF836C366997968073D27E3AE521A7F7BF7B81795ACA231B4012
          0FD9A5B5995914D5F2B0C936803246E91337180260152748A7D414D08F57F28C
          5CE3E9FD1FFB85E4CC3205ACE528C3B46D1B3BA9A888A5D10CE063248956D3C3
          1C258F89DC35033C56B6C9B00424EA332F728EEA40402D45ACB60444C925362B
          A518013E705AA163671EE99FE3ECD881802A8994156AC67616AF7DAFE39819A0
          5CC92BCD1230568B9ACF1533403ECBE96B534E641B39447F5E9B01A672839994
          58016E4BA4E1CEC38100AF4ACC2D253B731B4A257BDC7257FB5CB44DA92E9907
          C6808BCC52DDAE3707F4E6A94A642ADF8DA69F2249F7B2C5ED2FC1F520934BAA
          C726E1364895A08E317CB303C04EB62B74B2F91562FAEB8C507A9FED9CE89C00
          111C579EBF2C97FDE4F85E9AAA599FE6BB6245810BC2A96D592FEF7EA70F5EC0
          8FA0B104762B4557F24472FAAD487E6798AEDB5A12FB550C6BB4C26B9ACADF78
          C5C9E32749921441F32464A332D7B25008F7D6718626485713E6B726229BAFD5
          12E7488B634652C8527744E8E6B717E3D49BC6AB9DA9E78D22E465C0A847BB70
          4574BDBB8EFC2B540973835D361CED7BAB501D20C2733E68152A0811AE038823
          227C271C0F6758DC7CE76B898F3003FC884296F05319E06CF700FE0855A6F6B9
          8DFDF343600FE03F00FC069ED2AB313145A75F0000000049454E44AE426082}
        Stretch = True
        OnClick = imgProdutoConsClick
        ExplicitTop = -8
      end
    end
    object DBGrid: TDBGrid
      Left = 3
      Top = 74
      Width = 799
      Height = 214
      DataSource = DS
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyUp = DBGridKeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_PRODUTO'
          Title.Caption = 'Cod.Produto'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Nome.Prod'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quant'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO'
          Title.Caption = 'Vlr.Unitario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Caption = 'Vlr.Total'
          Visible = True
        end>
    end
    object pnlProdutoAdd: TPanel
      Left = 487
      Top = 43
      Width = 35
      Height = 25
      Cursor = crHandPoint
      BevelOuter = bvNone
      TabOrder = 5
      object imgProdutoAdd: TImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 29
        Height = 19
        Align = alClient
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000097048597300000B1300000B1301009A9C18
          000002AC4944415478DAED994D48155114C78F8511E5CA72D187851414852D2A
          0ADBD526AA8D4269510B2132418556F6092D4AB265F4415FE0C2A8C08A84A44D
          D4AA1666AB0A2C6AA1A61BB595086559FF3FD7817AF4DEBDF3EE9DB9F785077E
          ABF7E6DDF39B77E7CC99334552E051E43B815901DF09842230176C05DBC146B0
          162C0125339F4F8011F001BC012F402FF8E95B6005680607C1D298C70E833BE0
          2A184A5BA00CB4817A506C7912BE830E70068CA52170085C02A5968967C63868
          01F792129807AE81C38E13CF8C9BA2B6E5944B8185E021D89970F2513C057BC1
          A40B01EEF16EB02BA5E4A37806F688BA46AC046E4BF2DB265BDC008D3602BC60
          3B3D251FC501703F1F8145A01F2CF62CF015AC912C25369700ABC1118B85337F
          FB97C56FB1FA35C51128079F4495CE1004585257834153818BA0D56241D7028C
          7670D244600E1800CB031360EFB452321AC07F096C032F2D174B4280C18EB757
          27701A9C0F54805BA85D27F008D4042AF000ECD309BC07EB021578072A75026C
          6B4D5A65D78FA32682BC9995E992F82666F5DF8700739BFFDF0B14FC16E285B2
          DE4142495CC46FC1069D40C197D153A2260E210A9C10D5A7E514A802AF0215D8
          025EEB04426DE6D84A5780699D0083FDC6F1C0042E88DADE3917898267FFB384
          F340C3FABF4A544B6D24C0B80E8E06227045D4D44EBBC89F11CA433D6FAC9C76
          C77EA86770A471D7B3402DE8CAF6A1493BC0E15283A7E4397A6FCEF505D3D1E2
          63B03BE5E47B4035F8612BC05820EA6F4C4BE209A81347C3DD28F84F5C16BBCA
          6412DC36C74473E6F3118862FF8C88EBEA342A6AFAD615E7A07C7B7A96D873A2
          A6D636373B066F52B7C0595173D05861FB50C23B36CF1A5FF295C73C962FF6A2
          977CC3318F752610051BC0CD6007D8246A9ABC4CFE7ECDFA057C047DE0B9A8D7
          ADD3B1574A48C05BCC0AF88E8217F80D8C348431B86C73A70000000049454E44
          AE426082}
        Proportional = True
        Stretch = True
        OnClick = imgProdutoAddClick
        ExplicitLeft = 2
        ExplicitHeight = 30
      end
    end
    object edtProdutoQuantidade: TEdit
      Left = 330
      Top = 45
      Width = 62
      Height = 23
      TabOrder = 3
      OnKeyPress = edtProdutoQuantidadeKeyPress
    end
    object edtProdutoVlrUnitario: TEdit
      Left = 410
      Top = 45
      Width = 71
      Height = 23
      TabOrder = 4
      OnKeyPress = edtProdutoVlrUnitarioKeyPress
    end
  end
  object pnlPedidoCancelar: TPanel
    Left = 120
    Top = 450
    Width = 57
    Height = 61
    Cursor = crHandPoint
    BevelOuter = bvNone
    TabOrder = 3
    object imgPedidoCancelar: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 51
      Height = 55
      Align = alClient
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F9870000055F4944415478DAD59A5F501B451CC7F77281
        829476B46385F1BF42EA7498A1B42197D4878E3EF8ACE24CACD8EA8B38636AA4
        25ADBEEB58A752813A3076EA8345A9EDF8A0E38BE3134F4AFE026D9D16982823
        5A6154EC0C24FC315CCEEF26B93484FB7F97803B2477D963F7BE9FFDFD76F7B7
        7BC7100B52A8B5B50E87A70586E118417802E78FE1B30BBFB7D3EBC84BE0308F
        CF2FC89BC03188BC612E1299337B6FC684E85D38B443D01154E2345287404804
        209FE3F41260E6CB021074B91EC04D0310FE1A0ADF65B4018A4092A8F302CFB2
        DD0783C15B2501881E385091B2DBDFB0A5D3EF919C6B589D00B204900FEFBE7D
        FBB4231E5FB50C20EC74EE418B5F81F0E652089700190788176E35651A6084E3
        DAD0EA9F95AAD5E52984457CBF0288AF0D03A0A3BE8AC30588B79755FC1D081E
        DFC700F1896E0074D6D77151B6609941FC80F8583340CE6DA8CFB39BAD3D07C0
        A30FBEE00E87BF5105F8D1ED6E60793E06F13B365B771144824DA75B9DB1D884
        2CC04F7BF756266B6AC26AA3CDEEB636B23C3D4D1647472DD1B693E348754303
        991B1A52662064CCCEF31C20529200E8B4EF40FC69A54AEADADBC9437E3F49AF
        AC90A9AE2EB2108D9A16DFD8DD4D6C959564767090FCD6DFAF067112AED4BD01
        00AE733FFC7E1219356AE2C5641662A7CB9515BF6D5B3E4F1522EB4A0E586176
        1D005ABF17ADFF965C39EA368F9C3AB5213F0371FC3859D0E94E52E2C534D3D3
        43E62E5F56B2C247B042571E800666E8E5334AB14DEDFEFD640F2AB655559986
        5012CF2F2D9149583971FDBA12008D9D1EA601A008E047EBF7A9DDB876DF3EE2
        E8ED256C75B534840677AA6D69C93684541DCBCB64F2C4094D8303208EC10AFD
        19004C5A11AD21B1190835F15310AFD58A00080380631065D6AFB1EC2D464764
        6A0442B18C4EF13900016E5FCFC07D5E82FB0C692EA9A5358B20AC162F26269D
        7E9181FBF4A1E9FDBA4B6B8410D6D694AD656004CB2741E8A516F81E1678C658
        0DCA230A154893E4C8453B2CC42F8E8D19BD3575A3EFA8057E66B28B70C34909
        422A655A9EBA4D2C66E6B6D402716A817958E01E73356987B04C3CC958E06F6A
        815558A0D2746D647D5C232BDE82F8A90060F5FF0F60990BA9882F0584E84271
        58E0F17288B71C22D789CD0DA31E0F693C7346523C1D2A51B77C0068B2338BC3
        A8E1894CA9E5F313592A451C7D7DF213592040162211830498C800701800974A
        213E1F4A343797064210BCCC08C7DD87D87A564F30A72A5EC235AC86C80773F4
        07AC10C6496BA9C4970442108258D078C405CD9BE86CE74C89A75125751B954E
        69150422519F2B1A1D285C52FEAAB4A05712CF53F19D9D64717C5C53E3EDC0F2
        D4616279BA61499983E881153AE50A15EF48E4C5630D9B117FF5AA26F15A207E
        1F18207F5CBCA8047016ABB140C61262A6966D95FAA347C9833EDF9DD632B118
        A149CA9DE8E6D6CC39056FCEEE5A3BC4C753C51B5B6FC30A1F28DD5484D0B300
        D70AA12A3E0B1080F8B3E2CF7500F4290CD6C72164B628D551E7F592C4CD9B24
        71ED9A29F17908B8D3F6A6A6CCA6968AF851369D76CB6E2DD2B4953777D1719D
        1879260BB325272FB8D273387CB595B6D7D336DBF39E50E8DBE24BF20F3838AE
        03C4E7375D3BFEA0A3037EFFA9D4F52DFF8809F3930F43A66C43AAC63F08339E
        450B0C02A2B6CCE217E03647A4DC4617004D08F81A0171456D74B250FC28CFB2
        DE83C1605CED5F3547A0C3870ED9AB56567C98ECDE2D9535C407DD35C9E4FB4D
        376EFCABA58CEE570DE85E2A6FB39D846F7628CDDA3A852771384FC5EB7D01C4
        D4CB1E80388C9BBE8CA34BCF7A22279A8E2E2194FD02BEFE25DCE51F233A0C03
        14A61F3C9EDD15A9D45310E3C687BE6EF328C4DD5BF8BA0DCEFFC2E934CE27F0
        09A62A2A869F1C19F9D3ECBDFF0374A34112067812880000000049454E44AE42
        6082}
      OnClick = imgPedidoCancelarClick
      ExplicitTop = 0
    end
  end
  object pnlPedidoConfirma: TPanel
    Left = 0
    Top = 450
    Width = 57
    Height = 61
    Cursor = crHandPoint
    BevelOuter = bvNone
    TabOrder = 1
    object imgPedidoConfirma: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 51
      Height = 55
      Align = alClient
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        0030080300000060DC09B500000132504C544531AF913FB498D6EFE9FFFFFFA8
        DDD0E8F6F24DBAA0B3E2D630AF9031AE9031AF902DB08F31AF902DAD9131AF91
        30AE9031AF9124B69131AE912EAE9330AE9130AC902AAA8D32AD9130AF9030AF
        9031AF9230AF9132AF9131AE9031AF9131AF9131AF9030AE9131AE9030AE903F
        BF7F31AE9033999900000035AE9331AE912FB38D30AE9031AF8F2EAD9631AE90
        2CB19032AE9131AF902FAF9230AE912FAF8F33AC9232B09030AF9031B08F30AE
        9031B18D30AF912AAA7F30AE9031AF9130AF9130AF9030AD9230AE9030AF9131
        AF9030AE9131AF9031AF9030AE9235AA9430AF9033AD8E30AF9031AE9130AE91
        30AF9031AE9131AF9131AF9131AE9030AE9130AF90EEF8F640B5993BB3963DB4
        97D2EDE73CB39784CFBD64C3ACFCFEFD76CAB6FDFEFE78CBB7A0DACCA9DED1A7
        DDD032AF9102799B4F0000005674524E53FFFFFFFFFFFFFFFFFAEED027F31C90
        F58007CF26F225126BC76A676466686DCAC9C86C6F04CE050013F41B8F5716FE
        17565360FB502851FC4EF124CD06787774736ECBDDB6DBB99159185A198D8C8E
        B7D8EDF9F8EBDC563D8E94000002424944415478DA9596EF4B144118C7BF8F8A
        D175D7595D9A1515662C4772F526240C0CFA493F5E9489AF220AFCBB2CEA2808
        EB5D54904105D18B7A1184D08954CA5D6526E79996B03ECDEEB9BBB3BB333BEB
        F3666F673F9F99E766779E19B210891EB299DF30E80489988E3EA6B040DD3411
        6AD8CF19D60B55A27AB447145BD8560B6CFF58822AF2449D0A619697A18BED54
        880999CA12F451E8A947842DF41E49D15FCD84844615A6D8B7591232EDEF8C42
        BFDDF0851DFCD6C803D9E2E2BAB0F3C3720A1E3844D4143A5FA7E281C1EFAED0
        CA932985ECE09423D41653F2C0A58A10A8564FA6461B0FBC9F4566B276BF34F0
        6344ABDE4D5707597B260C3CA3C5370E6CA28B331F4D3C02A34474E14922BF76
        DBBDB6FD5B6FE8A373CF8CFD8BA5C2DEB23B4C679F6F84C7693AF52200AEAF95
        55F98CF07DBFED0C5D79ECDFDCE07BCC89FD03D7E8EAA3802FCB0F953C8602E1
        26DF7586A7B23E1F57F053BA75A709340D0D2F521A7EE8A5C063410AEA7CDC3F
        1D4CAB64687931ADD28BF38DE1711D2F5EDCF9A7F1891F1A57E6EFC4513AC2D2
        C7E78DA1EBDFF9F8ACBF5FA134543C76E5C95AF90695A1E4D1BD552C519A5418
        6ADE5DA268FB8498A1E671F9B3AACC0843C3178E4DBB85ACEB55B87D7485CB2A
        1E276BCDCAC75C419A1898A38D1563DE0BAFDCE72945B9A705F802FECC9AF8D2
        7C169260DEB266720809C87DF995C01FE7054404FCEED0CFD500CF2326C0E6BA
        7A903CF5CD412100BDAD95F8DE523C68CB2794E8E164957372712EFD64DE1626
        62C79F76E65E71EE71BEBF296967F0E23F485402DE7A93523D0000000049454E
        44AE426082}
      OnClick = imgPedidoConfirmaClick
      ExplicitTop = 5
    end
  end
  object pnlPedidoEditar: TPanel
    Left = 60
    Top = 451
    Width = 57
    Height = 60
    Cursor = crHandPoint
    BevelOuter = bvNone
    TabOrder = 2
    object imgPedidoEditar: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 51
      Height = 54
      Align = alClient
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F987000000097048597300000B1300000B1301009A9C18
        0000053B4944415478DAD59A7B4C5B7514C7CFEFB61D6C32CD6438E7A6CBA64E
        B2B84179C84896F87E648942CB024E5D341A21E1D1C260D91263888F38938DD1
        165D24EC0FE363862994A1866062F84B857550B6C58569A799CA70E3B128B0AD
        6BEF3D9E5F6D198536EDEDE3164ED2DCDEDEFBBBFD7ECE3DF7F73BE7F7BB0C62
        60B9C73EB8D3A5713FC600F268371D916D6080A9C820851F670853086C9C31FC
        8D768710855E8D5BE8B11557FE1DED7FB38845B737A5BA105F0426ED628CE544
        78191B7D3E55A370D4A6AF1A570460739B79AD5A803A447C9D842F8BD4017E86
        308D802DA8110F9E7AB676382E00D9CDCD1A31ED5A3963F02E354B8989F0B91C
        8857C92907269360BF63BBD1193380CD1D8D0FA891B5D2E919F1103E9F040645
        104A4EEBAB7E891A406B3515D1E6E378793D2803C2A420E0CB0385D5D6880132
        AC965718620B858D5A49F133108022F56095767DF547B201B4564B195D226843
        85CD60D7199BC206E0618300AD0C982AD1CAB9F13B419F1DA774351D2101B4C7
        1BEE4351D54FBDC1AD89163E07634A1085DCFE1D86A1A0009B8ED52F49D2AC38
        A1586F239B01EDC2E8D2BCFEB232574080CC76D33EF2FC7E25356953EF82656A
        0DFC70E942780C007B0675C683F30032BE6E5823B8D4E7E8975B9414DF945F00
        4B0415ECB57541CFC8F97010A60449DAD85FB47BC40F406B359B6863545A3CF7
        3E37B724850D410FF4A1415D75ED0C80273103F18F98E536212C67E55AB0E43F
        07C92AFFE1C52589B0BBEF9BD0E144B9931A84753C01F40064B6590C4C40B312
        E2B9D56B9F8082759BE6FD7E5D7443C58F1D601FBF18F21A4C82CA8122E387FF
        03B49B6C51A4C4611BF7BC5372C3CF572EC1DB594FC2F6BBD3FDC41B7B3BC136
        FA579857C313765D751ECB6E3BB45A62C23010413CC5FB629EE217CAC9CBB321
        E48B074FEAEA52C16A966935BD4023EEE74A88F73DB0D3EE1B33106F663E0EDF
        FE390427C764889F31E979466903C53E332825DE673E88331391579574134C1C
        A09B009E52523CB788C2663E42178590F93C05FF86C527DE533338E80E987931
        7DFB6213EF0518E300BCF65CB2D8C47B099C31055054FC2C80988490E2E2C11B
        42340E38681CB877B189F70238A2EE461325DE8BD015D5409658F1DE812CB3DD
        B293313CBAD8C473630825ECC1E3A6551A1146E42473029DDAF5F4AB90963CBF
        78E3E20D3F754698DBC8305F32E7F1A6D54C853CE486DB367BE51A68D9561450
        BC129EF7E807ECA5AA2CDF0750451B4BB88DF7653C02C5EBB7244CBC17A08200
        0ECF94946E902E8453D0F3F0E97EE635484DBA597D8E5E9F86374E76C73F6C6E
        AAF72F29B95155D6488F4175A8B6B95455356FD3C3B8F32A7C3FEC80EF867F85
        C1898B2051A7AC982134D8F5C63AFE55F6B4CAAAA5CBE19E94DBA07F6C5859D1
        3EED08931AB76AA36F79CAAFE7A167612F6DDE575C951C00C03A8AFD06DFBE1F
        005F8591D2AEF55197AA4DB4D0C0E261407539796BD0A9456E0B7972D7CD30E7
        4C61CDB9D9BF061CBCB23A4C3A09E1CB8534BD4ED982DE5E58D339F758D0D137
        CB6A2EA55BD69C68F17CC445C64A0775C623810E2FFC2526102AEC3A43504786
        CC7F32AC8D850C854F0862B9A2E211FF6502EE0A1436B200B8657E65BA9F09D0
        AA54EFC47B1B26B84BEC05B58E50E7869D813EDC53AFFEE7CA8A0A6AF24EBCEE
        866FA1DBE99A78EF6CF15B37C269237B3E94CFA58A4CB5871A96C66C3184BF6A
        C0B059E3521F90FB0248542F7BB841DC89C05E62800FC99E1CF6F42ED02748EC
        33CA64BF385B5C3B11898E98CC486F693B7C874A703E4A8AB6D215D319B2F5B4
        4DA343BED5FD29F2F22879F977DA0E519FDE2B4A493DA78BCA2F47FBDFFF0158
        439F406543A0420000000049454E44AE426082}
      Proportional = True
      OnClick = imgPedidoEditarClick
      ExplicitTop = 4
    end
  end
  object MemDadosPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 408
    Top = 24
  end
  object DS: TDataSource
    DataSet = MemPedidoItens
    Left = 451
    Top = 308
  end
  object MemPedidoItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 448
    Top = 256
  end
end
