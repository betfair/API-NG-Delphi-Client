object fmBetfairLogin: TfmBetfairLogin
  Left = 0
  Top = 0
  Caption = 'Betfair Login'
  ClientHeight = 382
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 554
    Height = 382
    Align = alClient
    TabOrder = 0
    OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
    OnNavigateComplete2 = WebBrowser1NavigateComplete2
    ExplicitLeft = 160
    ExplicitTop = 96
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000423900007B2700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
