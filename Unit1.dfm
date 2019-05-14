object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1050#1091#1088#1089#1086#1074#1072#1103' '#1088#1072#1073#1086#1090#1072
  ClientHeight = 414
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Z
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 612
    Top = 24
    Width = 157
    Height = 153
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 24
    Width = 606
    Height = 351
    Cursor = crHandPoint
    Color = clLime
    DataSource = DataSource1
    FixedColor = clBlue
    GradientEndColor = clGreen
    GradientStartColor = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object Button1: TButton
    Left = 8
    Top = 373
    Width = 75
    Height = 33
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1041#1044
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 0
    Top = -3
    Width = 145
    Height = 21
    PopupMenu = PopupMenu1
    TabOrder = 2
    Text = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103
    Items.Strings = (
      #11
      '')
  end
  object LabeledEdit1: TLabeledEdit
    Left = 624
    Top = 200
    Width = 140
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
    ReadOnly = True
    TabOrder = 3
  end
  object LabeledEdit2: TLabeledEdit
    Left = 624
    Top = 248
    Width = 140
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    ReadOnly = True
    TabOrder = 4
  end
  object LabeledEdit3: TLabeledEdit
    Left = 624
    Top = 296
    Width = 140
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    ReadOnly = True
    TabOrder = 5
  end
  object LabeledEdit4: TLabeledEdit
    Left = 640
    Top = 344
    Width = 41
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = #1042#1086#1079#1088#1072#1089#1090
    ReadOnly = True
    TabOrder = 6
  end
  object LabeledEdit5: TLabeledEdit
    Left = 704
    Top = 344
    Width = 41
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = #1057#1090#1072#1078
    ReadOnly = True
    TabOrder = 7
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=end'
      'Password=Legion230189'
      'User_Name=admin'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    Connected = True
    Left = 144
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 208
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 280
    Top = 40
  end
  object Z: TMainMenu
    Left = 88
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1041#1044
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        OnClick = N3Click
      end
      object N5: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N5Click
      end
    end
    object N7: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 40
    object N4: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082' +'
    end
    object N6: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
end
