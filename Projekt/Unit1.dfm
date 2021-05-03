object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Blackjack von Lars Helm und Maja Buchholz'
  ClientHeight = 623
  ClientWidth = 1017
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 653
    Top = 67
    Width = 94
    Height = 25
    Caption = 'Ihr Einsatz'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 653
    Top = 28
    Width = 103
    Height = 25
    Caption = 'Kontostand'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 121
    Top = 103
    Width = 171
    Height = 25
    Caption = 'Karten des Dealers'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 121
    Top = 241
    Width = 100
    Height = 25
    Caption = 'Ihre Karten'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@Yu Gothic'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 121
    Top = 432
    Width = 145
    Height = 73
    Cursor = crHandPoint
    Caption = 'Hit'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 440
    Top = 432
    Width = 145
    Height = 73
    Cursor = crHandPoint
    Caption = 'Stand'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 776
    Top = 412
    Width = 145
    Height = 113
    Cursor = crHandPoint
    Caption = 'Spiel starten'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 960
    Top = 566
    Width = 49
    Height = 49
    Cursor = crHandPoint
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 121
    Top = 272
    Width = 464
    Height = 89
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 121
    Top = 134
    Width = 464
    Height = 89
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = 653
    Top = 149
    Width = 153
    Height = 58
    Caption = 'Gesamtwert'
    Color = clBtnHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object Panel4: TPanel
    Left = 653
    Top = 288
    Width = 153
    Height = 57
    Caption = 'Gesamtwert'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object Panel5: TPanel
    Left = 762
    Top = 20
    Width = 215
    Height = 33
    Caption = '1500'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Yu Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Panel6: TPanel
    Left = 762
    Top = 59
    Width = 137
    Height = 33
    Caption = '0'
    TabOrder = 9
  end
  object Button5: TButton
    Left = 905
    Top = 59
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Caption = '+'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 944
    Top = 58
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Caption = '-'
    TabOrder = 11
    OnClick = Button6Click
  end
end
