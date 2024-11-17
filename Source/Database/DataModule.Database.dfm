object Connection: TConnection
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=tt01'
      'User_Name=user'
      'Password=123'
      'Compress=False'
      'DriverID=MySQL')
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 120
    Top = 184
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 120
    Top = 304
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\DevMMenezes\Projetos Pessoais\TT01\Build\libmysql.dll'
    Left = 120
    Top = 240
  end
end
