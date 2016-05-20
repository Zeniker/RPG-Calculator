object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'RPG Calculator'
  ClientHeight = 400
  ClientWidth = 411
  Color = clWhite
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
  object lblLevel: TLabel
    Left = 8
    Top = 7
    Width = 25
    Height = 13
    Caption = 'Level'
  end
  object grpVigor: TGroupBox
    Left = 8
    Top = 56
    Width = 217
    Height = 67
    Caption = 'Vigor'
    TabOrder = 1
    object lblPontosV: TLabel
      Left = 11
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Pontos'
    end
    object lblVida: TLabel
      Left = 127
      Top = 20
      Width = 20
      Height = 13
      Caption = 'Vida'
    end
    object edtVigor: TEdit
      Left = 11
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtVigorChange
    end
    object img1: TcxImage
      Left = 87
      Top = 36
      Enabled = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
        98000017709CBA513C000000097048597300000EBC00000EBC0195BC72490000
        0001624B47443240D24CC80000002574455874646174653A6372656174650032
        3031362D30352D32305430373A30313A34362D30343A3030CE2E3ADE00000025
        74455874646174653A6D6F6469667900323031362D30352D32305430373A3031
        3A34362D30343A3030BF7382620000010B49444154384FAD93BF0E823010C6CF
        1571316EC2E2E88300155AF0158C213AF808FE198D3EA2898B8E8E3A38E9775A
        4C83058DF1921F0DB4DFC7B5BD235B289532AE52D95ACA6C9B24C39694433DFB
        21A44C1907E23938830B58E15B93E76A2349140541D88060A68537CDCB04A35E
        6D89208828CFA7C840092CDC6BF19B496D2642C4D46E770A939D615032D19920
        6DDF461C4B0F0B27109C0C83920932C1CBB182831EAFC034284C963070D9A03C
        F92D7C439BBF1870AA55546D81C58BC716F0F02D7838C82EC6BA4374C0F326CC
        180C62EAF77BB5D78832474159C4512468341AFF5E48489BC250A094536B2957
        FED90C76E7FD41603613DFF9E7662A429B3CDA196C01DAD9D6444477DBF71B58
        E48895BD0000000049454E44AE426082}
      Style.BorderColor = clWhite
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clWhite
      Style.TransparentBorder = False
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 21
      Width = 34
    end
    object edtVida: TEdit
      Left = 127
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object edtLevel: TEdit
    Left = 8
    Top = 26
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnChange = edtLevelChange
  end
  object grpDestreza: TGroupBox
    Left = 8
    Top = 132
    Width = 217
    Height = 67
    Caption = 'Destreza'
    TabOrder = 2
    object lblPontosD: TLabel
      Left = 11
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Pontos'
    end
    object lblDestreza: TLabel
      Left = 127
      Top = 17
      Width = 51
      Height = 13
      Caption = 'Dano Dex.'
    end
    object edtDestreza: TEdit
      Left = 11
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtDestrezaChange
    end
    object img2: TcxImage
      Left = 87
      Top = 36
      Enabled = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
        98000017709CBA513C000000097048597300000EBC00000EBC0195BC72490000
        0001624B47443240D24CC80000002574455874646174653A6372656174650032
        3031362D30352D32305430373A30313A34362D30343A3030CE2E3ADE00000025
        74455874646174653A6D6F6469667900323031362D30352D32305430373A3031
        3A34362D30343A3030BF7382620000010B49444154384FAD93BF0E823010C6CF
        1571316EC2E2E88300155AF0158C213AF808FE198D3EA2898B8E8E3A38E9775A
        4C83058DF1921F0DB4DFC7B5BD235B289532AE52D95ACA6C9B24C39694433DFB
        21A44C1907E23938830B58E15B93E76A2349140541D88060A68537CDCB04A35E
        6D89208828CFA7C840092CDC6BF19B496D2642C4D46E770A939D615032D19920
        6DDF461C4B0F0B27109C0C83920932C1CBB182831EAFC034284C963070D9A03C
        F92D7C439BBF1870AA55546D81C58BC716F0F02D7838C82EC6BA4374C0F326CC
        180C62EAF77BB5D78832474159C4512468341AFF5E48489BC250A094536B2957
        FED90C76E7FD41603613DFF9E7662A429B3CDA196C01DAD9D6444477DBF71B58
        E48895BD0000000049454E44AE426082}
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = False
      Style.TransparentBorder = False
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 22
      Width = 34
    end
    object edtDanoDestreza: TEdit
      Left = 127
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object grpForca: TGroupBox
    Left = 8
    Top = 206
    Width = 217
    Height = 67
    Caption = 'For'#231'a'
    TabOrder = 3
    object lblPontosF: TLabel
      Left = 11
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Pontos'
    end
    object lblForca: TLabel
      Left = 127
      Top = 17
      Width = 55
      Height = 13
      Caption = 'Dano For'#231'a'
    end
    object edtForca: TEdit
      Left = 11
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtForcaChange
    end
    object img3: TcxImage
      Left = 87
      Top = 36
      Enabled = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
        98000017709CBA513C000000097048597300000EBC00000EBC0195BC72490000
        0001624B47443240D24CC80000002574455874646174653A6372656174650032
        3031362D30352D32305430373A30313A34362D30343A3030CE2E3ADE00000025
        74455874646174653A6D6F6469667900323031362D30352D32305430373A3031
        3A34362D30343A3030BF7382620000010B49444154384FAD93BF0E823010C6CF
        1571316EC2E2E88300155AF0158C213AF808FE198D3EA2898B8E8E3A38E9775A
        4C83058DF1921F0DB4DFC7B5BD235B289532AE52D95ACA6C9B24C39694433DFB
        21A44C1907E23938830B58E15B93E76A2349140541D88060A68537CDCB04A35E
        6D89208828CFA7C840092CDC6BF19B496D2642C4D46E770A939D615032D19920
        6DDF461C4B0F0B27109C0C83920932C1CBB182831EAFC034284C963070D9A03C
        F92D7C439BBF1870AA55546D81C58BC716F0F02D7838C82EC6BA4374C0F326CC
        180C62EAF77BB5D78832474159C4512468341AFF5E48489BC250A094536B2957
        FED90C76E7FD41603613DFF9E7662A429B3CDA196C01DAD9D6444477DBF71B58
        E48895BD0000000049454E44AE426082}
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = False
      Style.TransparentBorder = False
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 22
      Width = 34
    end
    object edtDanoForca: TEdit
      Left = 127
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object grpMental: TGroupBox
    Left = 8
    Top = 287
    Width = 217
    Height = 67
    Caption = 'Mental'
    TabOrder = 4
    object lblPontosM: TLabel
      Left = 11
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Pontos'
    end
    object lblMental: TLabel
      Left = 127
      Top = 17
      Width = 60
      Height = 13
      Caption = 'Dano Mental'
    end
    object edtMental: TEdit
      Left = 11
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtMentalChange
    end
    object img4: TcxImage
      Left = 87
      Top = 36
      Enabled = False
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
        0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
        206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
        98000017709CBA513C000000097048597300000EBC00000EBC0195BC72490000
        0001624B47443240D24CC80000002574455874646174653A6372656174650032
        3031362D30352D32305430373A30313A34362D30343A3030CE2E3ADE00000025
        74455874646174653A6D6F6469667900323031362D30352D32305430373A3031
        3A34362D30343A3030BF7382620000010B49444154384FAD93BF0E823010C6CF
        1571316EC2E2E88300155AF0158C213AF808FE198D3EA2898B8E8E3A38E9775A
        4C83058DF1921F0DB4DFC7B5BD235B289532AE52D95ACA6C9B24C39694433DFB
        21A44C1907E23938830B58E15B93E76A2349140541D88060A68537CDCB04A35E
        6D89208828CFA7C840092CDC6BF19B496D2642C4D46E770A939D615032D19920
        6DDF461C4B0F0B27109C0C83920932C1CBB182831EAFC034284C963070D9A03C
        F92D7C439BBF1870AA55546D81C58BC716F0F02D7838C82EC6BA4374C0F326CC
        180C62EAF77BB5D78832474159C4512468341AFF5E48489BC250A094536B2957
        FED90C76E7FD41603613DFF9E7662A429B3CDA196C01DAD9D6444477DBF71B58
        E48895BD0000000049454E44AE426082}
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = False
      Style.TransparentBorder = False
      StyleDisabled.Color = clWhite
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 22
      Width = 34
    end
    object edtDanoMental: TEdit
      Left = 127
      Top = 36
      Width = 70
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object grpArma: TGroupBox
    Left = 240
    Top = 56
    Width = 137
    Height = 298
    Caption = 'Arma'
    TabOrder = 5
    object lblDanoBase: TLabel
      Left = 43
      Top = 20
      Width = 51
      Height = 13
      Caption = 'Dano Base'
    end
    object lblScalingD: TLabel
      Left = 16
      Top = 67
      Width = 106
      Height = 13
      Caption = 'Escalamento Destreza'
    end
    object lblEscForca: TLabel
      Left = 23
      Top = 117
      Width = 90
      Height = 13
      Caption = 'Escalamento For'#231'a'
    end
    object lblEscMental: TLabel
      Left = 21
      Top = 165
      Width = 95
      Height = 13
      Caption = 'Escalamento Mental'
    end
    object edtDanoBase: TEdit
      Left = 28
      Top = 36
      Width = 81
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = edtDanoBaseKeyDown
    end
    object edtEscDex: TEdit
      Left = 28
      Top = 85
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyDown = edtDanoBaseKeyDown
    end
    object edtEscForca: TEdit
      Left = 28
      Top = 135
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyDown = edtDanoBaseKeyDown
    end
    object edtEscMental: TEdit
      Left = 28
      Top = 184
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyDown = edtDanoBaseKeyDown
    end
    object pnlDanoTotal: TPanel
      Left = 2
      Top = 257
      Width = 133
      Height = 39
      Align = alBottom
      BevelKind = bkSoft
      BevelOuter = bvNone
      TabOrder = 5
      ExplicitTop = 231
      object edtDanoTotal: TEdit
        Left = 20
        Top = 7
        Width = 89
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
    end
    object btnCalcular: TcxButton
      Left = 31
      Top = 222
      Width = 75
      Height = 25
      Caption = '&Calcula'
      LookAndFeel.NativeStyle = True
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000010101020E0B0516140F0720140F071F140F071F140F071F140F071F140F
        071F140F071F130E071E0605030A000000000000000000000000000000000000
        00000D0A05147B5D32BA9A7845E4987442E2987644E2987442E2987644E29874
        42E2987744E2967340E140301961000000000000000000000000000000000000
        0000130E081C9C7A49E3C8AC83FFBF9F71FFC7AC82FFBF9F71FFC7AC82FFBF9F
        71FFC7AC82FFBB9A69FF5541237F000000000000000000000000000000000000
        0000130F091CA07F4FE3C7AA80FFC0A072FFC6AA7FFFC0A072FFC6AA7FFFC0A0
        72FFC7AA80FFBD9C6CFF5744287E000000000000000000000000000000000000
        000014100A1CA58657E3CCB189FFC5A77BFFCCB088FFC5A77BFFCCB088FFC5A7
        7BFFCCB189FFC2A375FF5B482D7F000000000000000000000000000000000000
        000014100A1CA98A5DE3D3BB97FFCBAF86FFD3BA96FFCBAF86FFD3BA96FFCBAF
        86FFD3BA97FFC8AA7FFF5C4A307F000000000000000000000000000000000000
        000015110B1CAB8D61E3D1B893FFCBAF85FFD1B893FFCBAF85FFD1B893FFCBAF
        85FFD1B893FFC8AB80FF5E4C327F000000000000000000000000000000000000
        000015110B1CAD8F65E3D3BB97FFCDB28AFFD3BB97FFCDB28AFFD3BB97FFCDB2
        8AFFD3BB97FFCBAE84FF5F4E347F000000000000000000000000000000000000
        000015110C1CB09369E3DAC4A5FFD2B994FFD9C4A4FFD2B994FFD9C4A4FFD2B9
        94FFD9C4A4FFCFB48DFF604F367F000000000000000000000000000000000000
        000016120D1CAF9267E3C7A77AFFC6A677FFC7A779FFC6A677FFC7A779FFC6A6
        77FFC7A779FFC6A577FF6251397F000000000000000000000000000000000000
        000016120D1CB3976EE3D9C2A0FFDCC7A6FFDBC6A6FFDBC6A6FFDBC6A6FFDBC6
        A6FFDCC7A7FFD1B68EFF63523A7F000000000000000000000000000000000000
        000016120D1CB79E77E3F0E6D4FFF5EFE1FFF5EEE0FFF5EEE0FFF5EEE0FFF5EE
        E0FFF6F0E2FFDECBACFF63533B7F000000000000000000000000000000000000
        000016120D1CB9A07BE3F3ECDDFFF9F5EBFFF9F4EAFFF9F4EAFFF9F4EAFFF9F4
        EAFFFAF5ECFFE1CFB2FF64543C7F000000000000000000000000000000000000
        000016120D1CBAA07CE3F1E7D7FFF6EFE4FFF6EFE3FFF6EFE3FFF6EFE3FFF6EF
        E3FFF7F0E5FFE0CDB0FF65543D7F000000000000000000000000000000000000
        0000100D0A14967E5EBABBA17CE4BAA17DE2BAA07DE2BAA07DE2BAA07DE2BAA0
        7DE2BAA17DE2B79C76E14E413061000000000000000000000000000000000000
        000002010102120F0B1619150F2018140E1F18140E1F18140E1F18140E1F1814
        0E1F18140E1F18140E1E0807050A000000000000000000000000}
      TabOrder = 4
      OnClick = btnCalcularClick
    end
  end
end
