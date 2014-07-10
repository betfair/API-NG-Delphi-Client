object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'API NG TestBed'
  ClientHeight = 944
  ClientWidth = 1684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 227
    Top = 198
    Width = 106
    Height = 14
    Caption = 'Turn Inplay Enabled'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 925
    Width = 1684
    Height = 19
    Panels = <>
  end
  object memMsg: TMemo
    Left = 0
    Top = 537
    Width = 1684
    Height = 388
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabStop = False
    Align = alClient
    BorderStyle = bsNone
    Color = 16316664
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'memMsg')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 1684
    Height = 503
    Align = alTop
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1682
      Height = 501
      ActivePage = tabAccount
      Align = alClient
      TabOrder = 0
      object tabAccount: TTabSheet
        Caption = 'Account'
        object Shape16: TShape
          Left = 12
          Top = 67
          Width = 560
          Height = 173
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Label22: TLabel
          Left = 38
          Top = 117
          Width = 68
          Height = 14
          Caption = 'Include Item'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 38
          Top = 87
          Width = 93
          Height = 14
          Caption = 'Date Range From'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 316
          Top = 87
          Width = 19
          Height = 14
          Caption = ' To '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 38
          Top = 145
          Width = 33
          Height = 14
          Caption = 'Wallet'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 38
          Top = 172
          Width = 36
          Height = 14
          Caption = 'Locale'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnGetAccountFunds: TBitBtn
          Left = 38
          Top = 25
          Width = 130
          Height = 25
          Caption = 'getAccountFunds'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnGetAccountFundsClick
        end
        object btnListAccountStatement: TBitBtn
          Left = 38
          Top = 198
          Width = 130
          Height = 25
          Caption = 'getAccountStatement'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = btnGetAccountStatementClick
        end
        object cbGAS_IncludeDateRange: TCheckBox
          Left = 138
          Top = 86
          Width = 20
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = cbGAS_IncludeDateRangeClick
        end
        object cbGAS_IncludeItem: TComboBox
          Left = 138
          Top = 114
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 3
          Text = 'All'
          Items.Strings = (
            'All'
            'Deposits & Withdrawals only'
            'Exchange only'
            'Poker Room only')
        end
        object edtGAS_DateFrom: TDateTimePicker
          Left = 161
          Top = 84
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object edtGAS_DateTo: TDateTimePicker
          Left = 336
          Top = 84
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object edtGAS_TimeFrom: TDateTimePicker
          Left = 247
          Top = 84
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 6
        end
        object edtGAS_TimeTo: TDateTimePicker
          Left = 423
          Top = 84
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 7
        end
        object cbGAS_Wallet: TComboBox
          Left = 138
          Top = 142
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 8
          Text = 'UK'
          Items.Strings = (
            'UK'
            'Australian')
        end
        object edtGAS_Locale: TEdit
          Left = 138
          Top = 170
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
      end
      object tabMarketFilter: TTabSheet
        Caption = 'Market Filter'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label10: TLabel
          Left = 293
          Top = 8
          Width = 70
          Height = 14
          Caption = 'Market Filter'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 551
          Top = 47
          Width = 55
          Height = 14
          Caption = '(1-Football)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 12
          Top = 88
          Width = 58
          Height = 14
          Caption = 'Event Id(s)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 12
          Top = 257
          Width = 117
          Height = 14
          Caption = 'Market Betting Types'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 374
          Top = 256
          Width = 107
          Height = 14
          Caption = 'Market Type Codes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 551
          Top = 60
          Width = 49
          Height = 14
          Caption = '(2-Tennis)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 676
          Top = 37
          Width = 98
          Height = 14
          Caption = 'Market Projection'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 676
          Top = 170
          Width = 65
          Height = 14
          Caption = 'Market Sort'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 676
          Top = 324
          Width = 67
          Height = 14
          Caption = 'Max Results'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 746
          Top = 8
          Width = 97
          Height = 14
          Caption = 'Market Catalogue'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 12
          Top = 60
          Width = 84
          Height = 14
          Caption = 'EventType Id(s)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 551
          Top = 72
          Width = 83
          Height = 14
          Caption = '(7-Horse Racing)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 980
          Top = 8
          Width = 72
          Height = 14
          Caption = 'Time Ranges'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 951
          Top = 36
          Width = 60
          Height = 14
          Caption = 'Granularity'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 12
          Top = 115
          Width = 59
          Height = 14
          Caption = 'Text Query'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 12
          Top = 173
          Width = 106
          Height = 14
          Caption = 'Turn Inplay Enabled'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 145
          Width = 48
          Height = 14
          Caption = 'BSP Only'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 12
          Top = 201
          Width = 59
          Height = 14
          Caption = 'Inplay Only'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 12
          Top = 229
          Width = 89
          Height = 14
          Caption = 'Start Time From'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 325
          Top = 229
          Width = 19
          Height = 14
          Caption = ' To '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 660
          Top = 3
          Width = 270
          Height = 390
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape2: TShape
          Left = 936
          Top = 3
          Width = 161
          Height = 184
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape5: TShape
          Left = 4
          Top = 3
          Width = 643
          Height = 433
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object btnListCompetitions: TBitBtn
          Left = 135
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listCompetitions'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnListCompetitionsClick
        end
        object btnListCountries: TBitBtn
          Left = 537
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listCountries'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = btnListCountriesClick
        end
        object btnListEvents: TBitBtn
          Left = 251
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listEvents'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 2
          OnClick = btnListEventsClick
        end
        object btnListEventTypes: TBitBtn
          Left = 19
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listEventTypes'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 3
          OnClick = btnListEventTypesClick
        end
        object btnListMarketCatalogue: TBitBtn
          Left = 732
          Top = 362
          Width = 130
          Height = 25
          Caption = 'listMarketCatalogue'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 4
          OnClick = btnListMarketCatalogueClick
        end
        object btnListMarketTypes: TBitBtn
          Left = 421
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listMarketTypes'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 5
          OnClick = btnListMarketTypesClick
        end
        object btnListTimeRanges: TBitBtn
          Left = 951
          Top = 151
          Width = 130
          Height = 25
          Caption = 'listTimeRanges'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          OnClick = btnListTimeRangesClick
        end
        object btnListVenues: TBitBtn
          Left = 653
          Top = 442
          Width = 110
          Height = 25
          Caption = 'listVenues'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 7
          OnClick = btnListVenuesClick
        end
        object cbMktFilt_BSPOnly: TComboBox
          Left = 143
          Top = 143
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 8
          Text = 'Dont Care'
          Items.Strings = (
            'Dont Care'
            'Yes'
            'No')
        end
        object cbMktFilt_IncludeTimeRange: TCheckBox
          Left = 143
          Top = 229
          Width = 20
          Height = 17
          TabOrder = 9
          OnClick = cbMktFilt_IncludeTimeRangeClick
        end
        object cbMktFilt_InplayOnly: TComboBox
          Left = 143
          Top = 199
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 10
          Text = 'Dont Care'
          Items.Strings = (
            'Dont Care'
            'Yes'
            'No')
        end
        object cbMktFilt_MBType_AHDouble: TCheckBox
          Left = 143
          Top = 306
          Width = 160
          Height = 17
          Caption = 'Asian Handicap Double Line'
          TabOrder = 11
        end
        object cbMktFilt_MBType_AHSingle: TCheckBox
          Left = 143
          Top = 323
          Width = 160
          Height = 17
          Caption = 'Asian Handicap Single Line'
          TabOrder = 12
        end
        object cbMktFilt_MBType_FixedOdds: TCheckBox
          Left = 143
          Top = 340
          Width = 160
          Height = 17
          Caption = 'Fixed Odds'
          TabOrder = 13
        end
        object cbMktFilt_MBType_Line: TCheckBox
          Left = 143
          Top = 272
          Width = 160
          Height = 17
          Caption = 'Line'
          TabOrder = 14
        end
        object cbMktFilt_MBType_Odds: TCheckBox
          Left = 143
          Top = 255
          Width = 160
          Height = 17
          Caption = 'Odds'
          TabOrder = 15
        end
        object cbMktFilt_MBType_Range: TCheckBox
          Left = 143
          Top = 289
          Width = 160
          Height = 17
          Caption = 'Range'
          TabOrder = 16
        end
        object cbMktFilt_MTCode_CorrectScore: TCheckBox
          Left = 487
          Top = 289
          Width = 140
          Height = 17
          Caption = 'Correct Score'
          TabOrder = 17
        end
        object cbMktFilt_MTCode_HalfTimeScore: TCheckBox
          Left = 487
          Top = 306
          Width = 140
          Height = 17
          Caption = 'Half Time score'
          TabOrder = 18
        end
        object cbMktFilt_MTCode_MatchOdds: TCheckBox
          Left = 487
          Top = 255
          Width = 140
          Height = 17
          Caption = 'Match Odds'
          TabOrder = 19
        end
        object cbMktFilt_MTCode_Place: TCheckBox
          Left = 487
          Top = 323
          Width = 140
          Height = 17
          Caption = 'Place'
          TabOrder = 20
        end
        object cbMktFilt_MTCode_Win: TCheckBox
          Left = 487
          Top = 272
          Width = 140
          Height = 17
          Caption = 'Win'
          TabOrder = 21
        end
        object cbMktFilt_TurnInplayEnabled: TComboBox
          Left = 143
          Top = 171
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 22
          Text = 'Dont Care'
          Items.Strings = (
            'Dont Care'
            'Yes'
            'No')
        end
        object cbMktProj_Competition: TCheckBox
          Left = 780
          Top = 35
          Width = 120
          Height = 17
          Caption = 'Competition'
          Checked = True
          State = cbChecked
          TabOrder = 23
        end
        object cbMktProj_Event: TCheckBox
          Left = 780
          Top = 52
          Width = 120
          Height = 17
          Caption = 'Event'
          Checked = True
          State = cbChecked
          TabOrder = 24
        end
        object cbMktProj_EventType: TCheckBox
          Left = 780
          Top = 69
          Width = 120
          Height = 17
          Caption = 'Event Type'
          Checked = True
          State = cbChecked
          TabOrder = 25
        end
        object cbMktProj_MarketDescription: TCheckBox
          Left = 780
          Top = 103
          Width = 120
          Height = 17
          Caption = 'Market Description'
          Checked = True
          State = cbChecked
          TabOrder = 26
        end
        object cbMktProj_MarketStartTime: TCheckBox
          Left = 780
          Top = 86
          Width = 120
          Height = 17
          Caption = 'Market Start Time'
          Checked = True
          State = cbChecked
          TabOrder = 27
        end
        object cbMktProj_RunnerDescription: TCheckBox
          Left = 780
          Top = 120
          Width = 120
          Height = 17
          Caption = 'Runner Description'
          Checked = True
          State = cbChecked
          TabOrder = 28
        end
        object cbMktProj_RunnerMetadata: TCheckBox
          Left = 780
          Top = 137
          Width = 120
          Height = 17
          Caption = 'Runner Metadata'
          Checked = True
          State = cbChecked
          TabOrder = 29
        end
        object edtMktFilt_DateFrom: TDateTimePicker
          Left = 165
          Top = 227
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 30
        end
        object edtMktFilt_DateTo: TDateTimePicker
          Left = 350
          Top = 227
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 31
        end
        object edtMktFilt_EventId1: TEdit
          Left = 143
          Top = 86
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 32
        end
        object edtMktFilt_EventId2: TEdit
          Left = 285
          Top = 86
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 33
        end
        object edtMktFilt_EventId3: TEdit
          Left = 425
          Top = 86
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
        end
        object edtMktFilt_EventTypeId1: TEdit
          Left = 143
          Top = 58
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 35
        end
        object edtMktFilt_EventTypeId2: TEdit
          Left = 285
          Top = 58
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 36
        end
        object edtMktFilt_EventTypeId3: TEdit
          Left = 425
          Top = 58
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 37
        end
        object edtMktFilt_TextQuery: TEdit
          Left = 143
          Top = 115
          Width = 402
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 38
        end
        object edtMktFilt_TimeFrom: TDateTimePicker
          Left = 251
          Top = 227
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 39
        end
        object edtMktFilt_TimeTo: TDateTimePicker
          Left = 437
          Top = 227
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 40
        end
        object rgMarketSort: TRadioGroup
          Left = 780
          Top = 160
          Width = 133
          Height = 134
          ItemIndex = 0
          Items.Strings = (
            'Minimum Traded'
            'Maximum Traded'
            'Minimum Available'
            'Maximum Available'
            'First To Start'
            'Last To Start')
          TabOrder = 41
        end
        object rgGranularity: TRadioGroup
          Left = 951
          Top = 56
          Width = 82
          Height = 89
          ItemIndex = 0
          Items.Strings = (
            'Days'
            'Hours'
            'Minutes')
          TabOrder = 42
        end
        object edtMaxResults: TSpinEdit
          Left = 780
          Top = 322
          Width = 80
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxValue = 9999
          MinValue = 0
          ParentFont = False
          TabOrder = 43
          Value = 1000
        end
      end
      object tabMarketBook: TTabSheet
        Caption = 'Market Book'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label26: TLabel
          Left = 16
          Top = 5
          Width = 67
          Height = 14
          Caption = 'Market Id(s)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 89
          Top = 40
          Width = 87
          Height = 14
          Caption = 'Price Projection'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 16
          Top = 66
          Width = 54
          Height = 14
          Caption = 'Price Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 16
          Top = 226
          Width = 136
          Height = 14
          Caption = 'Ex Best Offers Overrides'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 16
          Top = 250
          Width = 98
          Height = 14
          Caption = 'Best Prices Depth'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 16
          Top = 290
          Width = 71
          Height = 14
          Caption = 'Rollup Model'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 16
          Top = 378
          Width = 65
          Height = 14
          Caption = 'Rollup Limit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 16
          Top = 408
          Width = 139
          Height = 14
          Caption = 'Rollup Liability Threshold'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 16
          Top = 438
          Width = 116
          Height = 14
          Caption = 'Rollup Liability Factor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 16
          Top = 155
          Width = 53
          Height = 14
          Caption = 'Virtualise'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 16
          Top = 177
          Width = 86
          Height = 14
          Caption = 'Rollover Stakes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 365
          Top = 45
          Width = 91
          Height = 14
          Caption = 'Order Projection'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 365
          Top = 185
          Width = 92
          Height = 14
          Caption = 'Match Projection'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 288
          Top = 333
          Width = 83
          Height = 14
          Caption = 'Currency Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label75: TLabel
          Left = 792
          Top = 53
          Width = 110
          Height = 14
          Caption = 'Include Settled Bets'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 792
          Top = 73
          Width = 92
          Height = 14
          Caption = 'Include BSP Bets'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label77: TLabel
          Left = 792
          Top = 93
          Width = 107
          Height = 14
          Caption = 'Net Of Commission'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label78: TLabel
          Left = 776
          Top = 149
          Width = 166
          Height = 14
          Caption = '(NB: Requires Market Ids only)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape15: TShape
          Left = 727
          Top = 35
          Width = 270
          Height = 134
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape3: TShape
          Left = 3
          Top = 35
          Width = 270
          Height = 435
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape4: TShape
          Left = 279
          Top = 35
          Width = 270
          Height = 134
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape6: TShape
          Left = 279
          Top = 175
          Width = 270
          Height = 134
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object btnListMarketBook: TBitBtn
          Left = 348
          Top = 394
          Width = 130
          Height = 25
          Caption = 'listMarketBook'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnListMarketBookClick
        end
        object btnListProfitAndLoss: TBitBtn
          Left = 792
          Top = 118
          Width = 130
          Height = 25
          Caption = 'listProfitAndLoss'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = btnListProfitAndLossClick
        end
        object cbMktBook_MatchProj: TCheckBox
          Left = 463
          Top = 182
          Width = 20
          Height = 17
          TabOrder = 2
          OnClick = cbMktBook_MatchProjClick
        end
        object cbMktBook_OrderProj: TCheckBox
          Left = 462
          Top = 42
          Width = 20
          Height = 17
          TabOrder = 3
          OnClick = cbMktBook_OrderProjClick
        end
        object cbMktBook_PriceProj: TCheckBox
          Left = 182
          Top = 39
          Width = 20
          Height = 17
          TabOrder = 4
          OnClick = PriceProjectionClick
        end
        object cbPandL_IncludeBSPBets: TCheckBox
          Left = 914
          Top = 72
          Width = 20
          Height = 17
          TabOrder = 5
        end
        object cbPandL_IncludeSettledBets: TCheckBox
          Left = 914
          Top = 52
          Width = 20
          Height = 17
          TabOrder = 6
        end
        object cbPandL_NetOfCommission: TCheckBox
          Left = 914
          Top = 92
          Width = 20
          Height = 17
          TabOrder = 7
        end
        object cbPriceData_ExAllOffers: TCheckBox
          Left = 108
          Top = 115
          Width = 120
          Height = 17
          Caption = 'Ex All Offers'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
        object cbPriceData_ExBestOffers: TCheckBox
          Left = 108
          Top = 98
          Width = 120
          Height = 17
          Caption = 'Ex Best Offers'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object cbPriceData_ExTraded: TCheckBox
          Left = 108
          Top = 132
          Width = 120
          Height = 17
          Caption = 'Ex Traded'
          Checked = True
          State = cbChecked
          TabOrder = 10
        end
        object cbPriceData_SPAvailable: TCheckBox
          Left = 108
          Top = 64
          Width = 120
          Height = 17
          Caption = 'SP Available'
          Checked = True
          State = cbChecked
          TabOrder = 11
        end
        object cbPriceData_SPTraded: TCheckBox
          Left = 108
          Top = 81
          Width = 120
          Height = 17
          Caption = 'SP Traded'
          Checked = True
          State = cbChecked
          TabOrder = 12
        end
        object cbPriceProj_ExBestOO: TCheckBox
          Left = 158
          Top = 225
          Width = 20
          Height = 17
          TabOrder = 13
          OnClick = PriceProjectionClick
        end
        object cbPriceProj_RolloverStakes: TCheckBox
          Left = 158
          Top = 176
          Width = 20
          Height = 17
          TabOrder = 14
        end
        object cbPriceProj_Virtualise: TCheckBox
          Left = 158
          Top = 154
          Width = 20
          Height = 17
          TabOrder = 15
        end
        object edtMktBook_CurrencyCode: TEdit
          Left = 377
          Top = 330
          Width = 160
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
        end
        object edtMktBook_MktId1: TEdit
          Left = 131
          Top = 3
          Width = 160
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          Text = '1.112631585'
        end
        object edtMktBook_MktId2: TEdit
          Left = 338
          Top = 2
          Width = 160
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
        end
        object edtMktBook_MktId3: TEdit
          Left = 544
          Top = 2
          Width = 160
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
        end
        object rgPriceProj_RollupModel: TRadioGroup
          Left = 108
          Top = 280
          Width = 133
          Height = 90
          ItemIndex = 3
          Items.Strings = (
            'Stake'
            'Payout'
            'Managed Liability'
            'None')
          TabOrder = 20
        end
        object rgMktBook_OrderProj: TRadioGroup
          Left = 357
          Top = 65
          Width = 133
          Height = 97
          ItemIndex = 0
          Items.Strings = (
            'All'
            'Executable'
            'Execution Complete')
          TabOrder = 21
        end
        object rgMktBook_MatchProj: TRadioGroup
          Left = 357
          Top = 205
          Width = 133
          Height = 97
          ItemIndex = 0
          Items.Strings = (
            'No Rollup'
            'Rolled Up By Price'
            'Rolled Up By Avg Price')
          TabOrder = 22
        end
        object edtPriceProj_BestPricesDepth: TSpinEdit
          Left = 164
          Top = 246
          Width = 90
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxValue = 999999
          MinValue = -1
          ParentFont = False
          TabOrder = 23
          Value = -1
        end
        object edtPriceProj_RollupLimit: TSpinEdit
          Left = 164
          Top = 374
          Width = 90
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxValue = 999999
          MinValue = -1
          ParentFont = False
          TabOrder = 24
          Value = -1
        end
        object edtPriceProj_RollupLiabilityThreshold: TSpinEdit
          Left = 164
          Top = 404
          Width = 90
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxValue = 999999
          MinValue = -1
          ParentFont = False
          TabOrder = 25
          Value = -1
        end
        object edtPriceProj_RollupLiabilityFactor: TSpinEdit
          Left = 164
          Top = 434
          Width = 90
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxValue = 999999
          MinValue = -1
          ParentFont = False
          TabOrder = 26
          Value = -1
        end
      end
      object tabOrders: TTabSheet
        Caption = 'Orders'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label40: TLabel
          Left = 12
          Top = 16
          Width = 52
          Height = 14
          Caption = 'Market Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 348
          Top = 16
          Width = 77
          Height = 14
          Caption = 'Customer Ref'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 12
          Top = 70
          Width = 61
          Height = 14
          Caption = 'Order Type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 12
          Top = 94
          Width = 64
          Height = 14
          Caption = 'Selection Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 12
          Top = 122
          Width = 49
          Height = 14
          Caption = 'Handicap'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 12
          Top = 150
          Width = 24
          Height = 14
          Caption = 'Side'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label46: TLabel
          Left = 158
          Top = 47
          Width = 27
          Height = 14
          Caption = 'Bet 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 326
          Top = 47
          Width = 27
          Height = 14
          Caption = 'Bet 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 494
          Top = 47
          Width = 27
          Height = 14
          Caption = 'Bet 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 644
          Top = 47
          Width = 31
          Height = 14
          Caption = 'Bet Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 740
          Top = 47
          Width = 81
          Height = 14
          Caption = 'Size Reduction'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 644
          Top = 225
          Width = 31
          Height = 14
          Caption = 'Bet Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 754
          Top = 225
          Width = 55
          Height = 14
          Caption = 'New Price'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 908
          Top = 225
          Width = 31
          Height = 14
          Caption = 'Bet Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 1000
          Top = 225
          Width = 94
          Height = 14
          Caption = 'New Persistence'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 1143
          Top = 15
          Width = 31
          Height = 14
          Caption = 'Bet Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label57: TLabel
          Left = 1143
          Top = 43
          Width = 52
          Height = 14
          Caption = 'Market Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 1143
          Top = 71
          Width = 91
          Height = 14
          Caption = 'Order Projection'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 1143
          Top = 99
          Width = 93
          Height = 14
          Caption = 'Date Range From'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 1420
          Top = 99
          Width = 19
          Height = 14
          Caption = ' To '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label61: TLabel
          Left = 1143
          Top = 127
          Width = 48
          Height = 14
          Caption = 'Order By'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label62: TLabel
          Left = 1143
          Top = 155
          Width = 41
          Height = 14
          Caption = 'Sort Dir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 1143
          Top = 245
          Width = 56
          Height = 14
          Caption = 'Bet Status'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 1143
          Top = 276
          Width = 72
          Height = 14
          Caption = 'Event Type Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 1143
          Top = 304
          Width = 43
          Height = 14
          Caption = 'Event Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 1143
          Top = 332
          Width = 52
          Height = 14
          Caption = 'Market Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label67: TLabel
          Left = 1143
          Top = 361
          Width = 93
          Height = 14
          Caption = 'Runner Id: Mkt id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 1366
          Top = 360
          Width = 64
          Height = 14
          Caption = 'Selection id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 1143
          Top = 388
          Width = 31
          Height = 14
          Caption = 'Bet Id'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label70: TLabel
          Left = 1411
          Top = 245
          Width = 24
          Height = 14
          Caption = 'Side'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label71: TLabel
          Left = 1416
          Top = 416
          Width = 13
          Height = 14
          Caption = 'To'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label72: TLabel
          Left = 1143
          Top = 416
          Width = 66
          Height = 14
          Caption = 'Settled Date'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label73: TLabel
          Left = 1143
          Top = 444
          Width = 50
          Height = 14
          Caption = 'Group By'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label74: TLabel
          Left = 1356
          Top = 444
          Width = 134
          Height = 14
          Caption = 'Include Item description'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_LO_Persistence: TLabel
          Left = 12
          Top = 245
          Width = 67
          Height = 14
          Caption = 'Persistence'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_LO_Price: TLabel
          Left = 12
          Top = 217
          Width = 28
          Height = 14
          Caption = 'Price'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_LO_Size: TLabel
          Left = 12
          Top = 189
          Width = 23
          Height = 14
          Caption = 'Size'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_LOC_Liability: TLabel
          Left = 12
          Top = 285
          Width = 42
          Height = 14
          Caption = 'Liability'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_LOC_Price: TLabel
          Left = 12
          Top = 313
          Width = 28
          Height = 14
          Caption = 'Price'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPO_MOC_Liability: TLabel
          Left = 12
          Top = 349
          Width = 42
          Height = 14
          Caption = 'Liability'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape10: TShape
          Left = 602
          Top = 41
          Width = 243
          Height = 162
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape11: TShape
          Left = 602
          Top = 219
          Width = 243
          Height = 162
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape12: TShape
          Left = 866
          Top = 219
          Width = 243
          Height = 162
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape13: TShape
          Left = 1107
          Top = 3
          Width = 560
          Height = 216
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape14: TShape
          Left = 1107
          Top = 225
          Width = 560
          Height = 245
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape7: TShape
          Left = 95
          Top = 41
          Width = 154
          Height = 340
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape8: TShape
          Left = 263
          Top = 41
          Width = 154
          Height = 340
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object Shape9: TShape
          Left = 431
          Top = 41
          Width = 154
          Height = 340
          Brush.Style = bsClear
          Shape = stRoundRect
        end
        object btnCancelOrders: TBitBtn
          Left = 662
          Top = 162
          Width = 130
          Height = 25
          Caption = 'cancelOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btnCancelOrdersClick
        end
        object btnListClearedOrders: TBitBtn
          Left = 1521
          Top = 441
          Width = 130
          Height = 25
          Caption = 'listClearedOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = btnListClearedOrdersClick
        end
        object btnListCurrentOrders: TBitBtn
          Left = 1238
          Top = 184
          Width = 130
          Height = 25
          Caption = 'listCurrentOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 2
          OnClick = btnListCurrentOrdersClick
        end
        object btnPlaceOrders: TBitBtn
          Left = 278
          Top = 434
          Width = 130
          Height = 25
          Caption = 'placeOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 3
          OnClick = btnPlaceOrdersClick
        end
        object btnReplaceOrders: TBitBtn
          Left = 662
          Top = 340
          Width = 130
          Height = 25
          Caption = 'replaceOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 4
          OnClick = btnReplaceOrdersClick
        end
        object btnUpdateOrders: TBitBtn
          Left = 926
          Top = 340
          Width = 130
          Height = 25
          Caption = 'updateOrders'
          DoubleBuffered = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 5
          OnClick = btnUpdateOrdersClick
        end
        object cbLCLO_BetStatus: TComboBox
          Left = 1238
          Top = 242
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 6
          Text = 'Settled'
          Items.Strings = (
            'Settled'
            'Voided'
            'Lapsed'
            'Cancelled')
        end
        object cbLCLO_GroupBy: TComboBox
          Left = 1238
          Top = 441
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 7
          Text = 'None'
          Items.Strings = (
            'None'
            'Event Type'
            'Event'
            'Market'
            'Runner'
            'Side'
            'Bet')
        end
        object cbLCLO_IncludeItemDesc: TCheckBox
          Left = 1496
          Top = 443
          Width = 20
          Height = 17
          TabOrder = 8
          OnClick = cbLCO_IncludeDateRangeClick
        end
        object cbLCLO_IncludeSettledDateRange: TCheckBox
          Left = 1237
          Top = 415
          Width = 20
          Height = 17
          TabOrder = 9
          OnClick = cbLCLO_IncludeSettledDateRangeClick
        end
        object cbLCLO_Side: TComboBox
          Left = 1450
          Top = 242
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 10
          Text = 'BACK & LAY'
          Items.Strings = (
            'BACK & LAY'
            'BACK'
            'LAY')
        end
        object cbLCO_IncludeDateRange: TCheckBox
          Left = 1242
          Top = 98
          Width = 20
          Height = 17
          TabOrder = 11
          OnClick = cbLCO_IncludeDateRangeClick
        end
        object cbLCO_OrderBy: TComboBox
          Left = 1238
          Top = 124
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 12
          Text = 'By Bet'
          Items.Strings = (
            'By Bet'
            'By Market'
            'By Match Time')
        end
        object cbLCO_OrderProjection: TComboBox
          Left = 1238
          Top = 68
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 13
          Text = 'All'
          Items.Strings = (
            'All'
            'Executable'
            'Execution Complete')
        end
        object cbLCO_SortDir: TComboBox
          Left = 1238
          Top = 152
          Width = 150
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 14
          Text = 'Earliest To Latest'
          Items.Strings = (
            'Earliest To Latest'
            'Latest To Earliest')
        end
        object cbPO_LO_Persistence1: TComboBox
          Left = 110
          Top = 242
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 15
          Text = 'Lapse'
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object cbPO_LO_Persistence2: TComboBox
          Left = 278
          Top = 242
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 16
          Text = 'Lapse'
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object cbPO_LO_Persistence3: TComboBox
          Left = 446
          Top = 242
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 17
          Text = 'Lapse'
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object cbPO_OrderType1: TComboBox
          Left = 110
          Top = 67
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          OnChange = UpdateOrdersDisplay
          Items.Strings = (
            'Limit'
            'Limit On Close'
            'Market On Close')
        end
        object cbPO_OrderType2: TComboBox
          Left = 278
          Top = 67
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
          OnChange = UpdateOrdersDisplay
          Items.Strings = (
            'Limit'
            'Limit On Close'
            'Market On Close')
        end
        object cbPO_OrderType3: TComboBox
          Left = 446
          Top = 67
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
          OnChange = UpdateOrdersDisplay
          Items.Strings = (
            'Limit'
            'Limit On Close'
            'Market On Close')
        end
        object cbUO_Persistence1: TComboBox
          Left = 984
          Top = 245
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object cbUO_Persistence2: TComboBox
          Left = 984
          Top = 273
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object cbUO_Persistence3: TComboBox
          Left = 984
          Top = 301
          Width = 120
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
          Items.Strings = (
            'Lapse'
            'Persist'
            'Market On Close')
        end
        object edtCO_BetId1: TEdit
          Left = 614
          Top = 67
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
        end
        object edtCO_BetId2: TEdit
          Left = 614
          Top = 95
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
        end
        object edtCO_BetId3: TEdit
          Left = 614
          Top = 123
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
        end
        object edtCO_SizeReduction1: TEdit
          Left = 734
          Top = 67
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
        end
        object edtCO_SizeReduction2: TEdit
          Left = 734
          Top = 95
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 28
        end
        object edtCO_SizeReduction3: TEdit
          Left = 734
          Top = 123
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
        end
        object edtLCLO_BetId1: TEdit
          Left = 1238
          Top = 385
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 30
        end
        object edtLCLO_BetId2: TEdit
          Left = 1344
          Top = 385
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 31
        end
        object edtLCLO_BetId3: TEdit
          Left = 1450
          Top = 385
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 32
        end
        object edtLCLO_EventId1: TEdit
          Left = 1238
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 33
        end
        object edtLCLO_EventId2: TEdit
          Left = 1344
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
        end
        object edtLCLO_EventId3: TEdit
          Left = 1450
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 35
        end
        object edtLCLO_EventTypeId1: TEdit
          Left = 1238
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 36
        end
        object edtLCLO_EventTypeId2: TEdit
          Left = 1344
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 37
        end
        object edtLCLO_EventTypeId3: TEdit
          Left = 1450
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 38
        end
        object edtLCLO_MarketId1: TEdit
          Left = 1238
          Top = 329
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 39
        end
        object edtLCLO_MarketId2: TEdit
          Left = 1344
          Top = 329
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 40
        end
        object edtLCLO_MarketId3: TEdit
          Left = 1450
          Top = 329
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 41
        end
        object edtLCLO_Runner_MarketId1: TEdit
          Left = 1238
          Top = 357
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 42
        end
        object edtLCLO_Runner_SelId1: TEdit
          Left = 1450
          Top = 357
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 43
        end
        object edtLCLO_SettledDateFrom: TDateTimePicker
          Left = 1258
          Top = 413
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 44
        end
        object edtLCLO_SettledDateTo: TDateTimePicker
          Left = 1433
          Top = 413
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 45
        end
        object edtLCLO_SettledTimeFrom: TDateTimePicker
          Left = 1344
          Top = 413
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 46
        end
        object edtLCLO_SettledTimeTo: TDateTimePicker
          Left = 1520
          Top = 413
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 47
        end
        object edtLCO_BetId1: TEdit
          Left = 1238
          Top = 12
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 48
        end
        object edtLCO_BetId2: TEdit
          Left = 1344
          Top = 12
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 49
        end
        object edtLCO_BetId3: TEdit
          Left = 1450
          Top = 12
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 50
        end
        object edtLCO_DateFrom: TDateTimePicker
          Left = 1265
          Top = 96
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 51
        end
        object edtLCO_DateTo: TDateTimePicker
          Left = 1440
          Top = 96
          Width = 80
          Height = 22
          Date = 41712.901600462970000000
          Format = 'dd/MM/yyyy'
          Time = 41712.901600462970000000
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 52
        end
        object edtLCO_MarketId1: TEdit
          Left = 1238
          Top = 40
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 53
        end
        object edtLCO_MarketId2: TEdit
          Left = 1344
          Top = 40
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 54
        end
        object edtLCO_MarketId3: TEdit
          Left = 1450
          Top = 40
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 55
        end
        object edtLCO_TimeFrom: TDateTimePicker
          Left = 1351
          Top = 96
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 56
        end
        object edtLCO_TimeTo: TDateTimePicker
          Left = 1527
          Top = 96
          Width = 68
          Height = 22
          Date = 41712.901600462970000000
          Format = 'HH:mm:ss'
          Time = 41712.901600462970000000
          DateMode = dmUpDown
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Kind = dtkTime
          ParentFont = False
          TabOrder = 57
        end
        object edtPO_CustomerRef: TEdit
          Left = 446
          Top = 13
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 58
        end
        object edtPO_Handicap1: TEdit
          Left = 110
          Top = 119
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 59
        end
        object edtPO_Handicap2: TEdit
          Left = 278
          Top = 119
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 60
        end
        object edtPO_Handicap3: TEdit
          Left = 446
          Top = 119
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 61
        end
        object edtPO_LO_Price1: TEdit
          Left = 110
          Top = 214
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 62
          Text = '800'
        end
        object edtPO_LO_Price2: TEdit
          Left = 278
          Top = 214
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 63
        end
        object edtPO_LO_Price3: TEdit
          Left = 446
          Top = 214
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 64
        end
        object edtPO_LO_Size1: TEdit
          Left = 110
          Top = 186
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 65
          Text = '2'
        end
        object edtPO_LO_Size2: TEdit
          Left = 278
          Top = 186
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 66
        end
        object edtPO_LO_Size3: TEdit
          Left = 446
          Top = 186
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 67
        end
        object edtPO_LOC_Liability1: TEdit
          Left = 110
          Top = 282
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 68
        end
        object edtPO_LOC_Liability2: TEdit
          Left = 278
          Top = 282
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 69
        end
        object edtPO_LOC_Liability3: TEdit
          Left = 446
          Top = 282
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 70
        end
        object edtPO_LOC_Price1: TEdit
          Left = 110
          Top = 310
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 71
        end
        object edtPO_LOC_Price2: TEdit
          Left = 278
          Top = 310
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 72
        end
        object edtPO_LOC_Price3: TEdit
          Left = 446
          Top = 310
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 73
        end
        object edtPO_MarketId: TEdit
          Left = 110
          Top = 13
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 74
          Text = '1.112721009'
        end
        object edtPO_MOC_Liability1: TEdit
          Left = 110
          Top = 346
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 75
        end
        object edtPO_MOC_Liability2: TEdit
          Left = 278
          Top = 346
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 76
        end
        object edtPO_MOC_Liability3: TEdit
          Left = 446
          Top = 346
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 77
        end
        object edtPO_SelectionId1: TEdit
          Left = 110
          Top = 91
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 78
          Text = '1096'
        end
        object edtPO_SelectionId2: TEdit
          Left = 278
          Top = 91
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 79
          Text = '48351'
        end
        object edtPO_SelectionId3: TEdit
          Left = 446
          Top = 91
          Width = 120
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 80
          Text = '58805'
        end
        object edtPO_Side1: TComboBox
          Left = 110
          Top = 147
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 81
          Text = 'BACK'
          Items.Strings = (
            'BACK'
            'LAY')
        end
        object edtPO_Side2: TComboBox
          Left = 278
          Top = 147
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 82
          Text = 'BACK'
          Items.Strings = (
            'BACK'
            'LAY')
        end
        object edtPO_Side3: TComboBox
          Left = 446
          Top = 147
          Width = 100
          Height = 22
          Style = csDropDownList
          DropDownCount = 4
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ItemIndex = 0
          ParentFont = False
          TabOrder = 83
          Text = 'BACK'
          Items.Strings = (
            'BACK'
            'LAY')
        end
        object edtRO_BetId1: TEdit
          Left = 614
          Top = 245
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 84
        end
        object edtRO_BetId2: TEdit
          Left = 614
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 85
        end
        object edtRO_BetId3: TEdit
          Left = 614
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 86
        end
        object edtRO_NewPrice1: TEdit
          Left = 734
          Top = 245
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 87
        end
        object edtRO_NewPrice2: TEdit
          Left = 734
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 88
        end
        object edtRO_NewPrice3: TEdit
          Left = 734
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 89
        end
        object edtUO_BetId1: TEdit
          Left = 878
          Top = 245
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 90
        end
        object edtUO_BetId2: TEdit
          Left = 878
          Top = 273
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 91
        end
        object edtUO_BetId3: TEdit
          Left = 878
          Top = 301
          Width = 100
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 92
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1684
    Height = 34
    Align = alTop
    TabOrder = 3
    object Label79: TLabel
      Left = 248
      Top = 10
      Width = 52
      Height = 14
      Caption = 'Exchange'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbShowRawJson: TCheckBox
      Left = 8
      Top = 9
      Width = 200
      Height = 17
      Caption = 'Display Raw Json Request/Response'
      TabOrder = 0
      OnClick = cbShowRawJsonClick
    end
    object cbExchange: TComboBox
      Left = 306
      Top = 6
      Width = 60
      Height = 22
      Style = csDropDownList
      DropDownCount = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'UK'
      Items.Strings = (
        'UK'
        'AUS')
    end
    object btnStopDisplay: TBitBtn
      Left = 442
      Top = 4
      Width = 140
      Height = 25
      Caption = 'Stop Display Update'
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnStopDisplayClick
    end
  end
  object BFKeepAliveTimer: TTimer
    Enabled = False
    Interval = 420000
    OnTimer = BFKeepAliveTimerTimer
    Left = 528
    Top = 592
  end
  object MainMenu1: TMainMenu
    Left = 736
    Top = 584
    object mnClearResults: TMenuItem
      Caption = 'ClearResults'
      OnClick = mnClearResultsClick
    end
    object mnLogout: TMenuItem
      Caption = 'Logout'
      OnClick = mnLogoutClick
    end
  end
end
