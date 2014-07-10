unit frmMain ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  LBS_BetfairAPINGClasses, Spin, Menus ;


type TbfMarketFilterElements = record
  sTextQuery               : string ;
  slEventTypeId            : TStringList ;
  slEventId                : TStringList ;
  triBSPOnly               : TTriState ;
  triTurnInplayEnabled     : TTriState ;
  triInplayOnly            : TTriState ;
  dMarketStartTimeLo       : TDateTime ;
  dMarketStartTimeHi       : TDateTime ;
  setMarketBettingType     : TbfngMarketBettingTypeSet ;
  slMarketTypeCode         : TStringList ;
end ;

type
  TfmMain = class(TForm)
    StatusBar1: TStatusBar;
    memMsg: TMemo;
    BFKeepAliveTimer: TTimer;
    Panel1: TPanel;
    Label2: TLabel;
    btnListCompetitions: TBitBtn;
    Label3: TLabel;
    edtMktFilt_TextQuery: TEdit;
    Label4: TLabel;
    cbMktFilt_TurnInplayEnabled: TComboBox;
    Label5: TLabel;
    cbMktFilt_BSPOnly: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    cbMktFilt_InplayOnly: TComboBox;
    MainMenu1: TMainMenu;
    mnClearResults: TMenuItem;
    mnLogout: TMenuItem;
    Label8: TLabel;
    Label9: TLabel;
    cbMktFilt_IncludeTimeRange: TCheckBox;
    Shape5: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cbMktFilt_MBType_Odds: TCheckBox;
    cbMktFilt_MBType_Line: TCheckBox;
    cbMktFilt_MBType_Range: TCheckBox;
    cbMktFilt_MBType_AHDouble: TCheckBox;
    cbMktFilt_MBType_AHSingle: TCheckBox;
    cbMktFilt_MBType_FixedOdds: TCheckBox;
    cbMktFilt_MTCode_MatchOdds: TCheckBox;
    cbMktFilt_MTCode_Win: TCheckBox;
    cbMktFilt_MTCode_CorrectScore: TCheckBox;
    cbMktFilt_MTCode_HalfTimeScore: TCheckBox;
    btnListEvents: TBitBtn;
    Panel2: TPanel;
    cbShowRawJson: TCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    cbMktProj_Competition: TCheckBox;
    cbMktProj_Event: TCheckBox;
    cbMktProj_EventType: TCheckBox;
    cbMktProj_MarketStartTime: TCheckBox;
    cbMktProj_MarketDescription: TCheckBox;
    cbMktProj_RunnerDescription: TCheckBox;
    cbMktProj_RunnerMetadata: TCheckBox;
    Label17: TLabel;
    Label18: TLabel;
    btnListMarketCatalogue: TBitBtn;
    Shape1: TShape;
    Label19: TLabel;
    Label21: TLabel;
    btnListCountries: TBitBtn;
    btnListEventTypes: TBitBtn;
    btnListMarketTypes: TBitBtn;
    Label24: TLabel;
    btnListTimeRanges: TBitBtn;
    Shape2: TShape;
    Label25: TLabel;
    btnListVenues: TBitBtn;
    Label26: TLabel;
    edtMktBook_MktId1: TEdit;
    edtMktBook_MktId2: TEdit;
    edtMktBook_MktId3: TEdit;
    Shape3: TShape;
    Label27: TLabel;
    cbMktBook_PriceProj: TCheckBox;
    cbPriceData_SPAvailable: TCheckBox;
    cbPriceData_SPTraded: TCheckBox;
    cbPriceData_ExBestOffers: TCheckBox;
    cbPriceData_ExAllOffers: TCheckBox;
    cbPriceData_ExTraded: TCheckBox;
    Label28: TLabel;
    Label29: TLabel;
    cbPriceProj_ExBestOO: TCheckBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    cbPriceProj_Virtualise: TCheckBox;
    Label36: TLabel;
    cbPriceProj_RolloverStakes: TCheckBox;
    Label37: TLabel;
    Shape4: TShape;
    Label38: TLabel;
    Shape6: TShape;
    Label39: TLabel;
    edtMktBook_CurrencyCode: TEdit;
    btnListMarketBook: TBitBtn;
    cbMktBook_OrderProj: TCheckBox;
    cbMktBook_MatchProj: TCheckBox;
    edtMktFilt_EventTypeId1: TEdit;
    edtMktFilt_EventTypeId2: TEdit;
    edtMktFilt_EventTypeId3: TEdit;
    edtMktFilt_EventId1: TEdit;
    edtMktFilt_EventId2: TEdit;
    edtMktFilt_EventId3: TEdit;
    btnStopDisplay: TBitBtn;
    Label40: TLabel;
    edtPO_MarketId: TEdit;
    Label41: TLabel;
    edtPO_CustomerRef: TEdit;
    Label42: TLabel;
    cbPO_OrderType1: TComboBox;
    Label43: TLabel;
    Label44: TLabel;
    edtPO_SelectionId1: TEdit;
    edtPO_Handicap1: TEdit;
    Label45: TLabel;
    edtPO_Side1: TComboBox;
    lblPO_LO_Size: TLabel;
    lblPO_LO_Price: TLabel;
    lblPO_LO_Persistence: TLabel;
    edtPO_LO_Size1: TEdit;
    edtPO_LO_Price1: TEdit;
    cbPO_LO_Persistence1: TComboBox;
    lblPO_LOC_Liability: TLabel;
    lblPO_LOC_Price: TLabel;
    edtPO_LOC_Liability1: TEdit;
    edtPO_LOC_Price1: TEdit;
    lblPO_MOC_Liability: TLabel;
    edtPO_MOC_Liability1: TEdit;
    Shape7: TShape;
    cbPO_OrderType2: TComboBox;
    edtPO_SelectionId2: TEdit;
    edtPO_Handicap2: TEdit;
    edtPO_Side2: TComboBox;
    edtPO_LO_Size2: TEdit;
    edtPO_LO_Price2: TEdit;
    cbPO_LO_Persistence2: TComboBox;
    edtPO_LOC_Liability2: TEdit;
    edtPO_LOC_Price2: TEdit;
    edtPO_MOC_Liability2: TEdit;
    Shape8: TShape;
    cbPO_OrderType3: TComboBox;
    edtPO_SelectionId3: TEdit;
    edtPO_Handicap3: TEdit;
    edtPO_Side3: TComboBox;
    edtPO_LO_Size3: TEdit;
    edtPO_LO_Price3: TEdit;
    cbPO_LO_Persistence3: TComboBox;
    edtPO_LOC_Liability3: TEdit;
    edtPO_LOC_Price3: TEdit;
    edtPO_MOC_Liability3: TEdit;
    Shape9: TShape;
    btnPlaceOrders: TBitBtn;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edtCO_BetId1: TEdit;
    edtCO_SizeReduction1: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    edtCO_BetId2: TEdit;
    edtCO_SizeReduction2: TEdit;
    edtCO_BetId3: TEdit;
    edtCO_SizeReduction3: TEdit;
    btnCancelOrders: TBitBtn;
    Shape10: TShape;
    Label52: TLabel;
    Label53: TLabel;
    Shape11: TShape;
    edtRO_BetId1: TEdit;
    edtRO_NewPrice1: TEdit;
    edtRO_BetId2: TEdit;
    edtRO_NewPrice2: TEdit;
    edtRO_BetId3: TEdit;
    edtRO_NewPrice3: TEdit;
    btnReplaceOrders: TBitBtn;
    Label54: TLabel;
    Label55: TLabel;
    Shape12: TShape;
    edtUO_BetId1: TEdit;
    edtUO_BetId2: TEdit;
    edtUO_BetId3: TEdit;
    btnUpdateOrders: TBitBtn;
    cbUO_Persistence1: TComboBox;
    cbUO_Persistence2: TComboBox;
    cbUO_Persistence3: TComboBox;
    edtLCO_BetId1: TEdit;
    edtLCO_BetId2: TEdit;
    edtLCO_BetId3: TEdit;
    Label56: TLabel;
    Label57: TLabel;
    edtLCO_MarketId1: TEdit;
    edtLCO_MarketId2: TEdit;
    edtLCO_MarketId3: TEdit;
    Label58: TLabel;
    cbLCO_OrderProjection: TComboBox;
    Label59: TLabel;
    cbLCO_IncludeDateRange: TCheckBox;
    Label60: TLabel;
    Label61: TLabel;
    cbLCO_OrderBy: TComboBox;
    Label62: TLabel;
    cbLCO_SortDir: TComboBox;
    btnListCurrentOrders: TBitBtn;
    Shape13: TShape;
    cbLCLO_BetStatus: TComboBox;
    Label63: TLabel;
    edtLCLO_EventTypeId1: TEdit;
    edtLCLO_EventTypeId2: TEdit;
    edtLCLO_EventTypeId3: TEdit;
    Label64: TLabel;
    Label65: TLabel;
    edtLCLO_EventId1: TEdit;
    edtLCLO_EventId3: TEdit;
    edtLCLO_EventId2: TEdit;
    edtLCLO_MarketId2: TEdit;
    edtLCLO_MarketId3: TEdit;
    edtLCLO_MarketId1: TEdit;
    Label66: TLabel;
    Label67: TLabel;
    edtLCLO_Runner_MarketId1: TEdit;
    Label68: TLabel;
    edtLCLO_Runner_SelId1: TEdit;
    Label69: TLabel;
    edtLCLO_BetId1: TEdit;
    edtLCLO_BetId2: TEdit;
    edtLCLO_BetId3: TEdit;
    cbLCLO_Side: TComboBox;
    Label70: TLabel;
    cbLCLO_IncludeSettledDateRange: TCheckBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    cbLCLO_GroupBy: TComboBox;
    Label74: TLabel;
    cbLCLO_IncludeItemDesc: TCheckBox;
    btnListClearedOrders: TBitBtn;
    Shape14: TShape;
    Label75: TLabel;
    cbPandL_IncludeSettledBets: TCheckBox;
    Label76: TLabel;
    cbPandL_IncludeBSPBets: TCheckBox;
    Label77: TLabel;
    cbPandL_NetOfCommission: TCheckBox;
    btnListProfitAndLoss: TBitBtn;
    Shape15: TShape;
    Label78: TLabel;
    btnGetAccountFunds: TBitBtn;
    Label79: TLabel;
    cbExchange: TComboBox;
    cbMktFilt_MTCode_Place: TCheckBox;
    edtMktFilt_DateFrom: TDateTimePicker;
    edtMktFilt_TimeFrom: TDateTimePicker;
    edtMktFilt_DateTo: TDateTimePicker;
    edtMktFilt_TimeTo: TDateTimePicker;
    edtLCO_DateFrom: TDateTimePicker;
    edtLCO_TimeFrom: TDateTimePicker;
    edtLCO_DateTo: TDateTimePicker;
    edtLCO_TimeTo: TDateTimePicker;
    edtLCLO_SettledDateFrom: TDateTimePicker;
    edtLCLO_SettledTimeFrom: TDateTimePicker;
    edtLCLO_SettledDateTo: TDateTimePicker;
    edtLCLO_SettledTimeTo: TDateTimePicker;
    PageControl1: TPageControl;
    tabAccount: TTabSheet;
    tabMarketFilter: TTabSheet;
    tabMarketBook: TTabSheet;
    tabOrders: TTabSheet;
    rgMarketSort: TRadioGroup;
    rgGranularity: TRadioGroup;
    rgPriceProj_RollupModel: TRadioGroup;
    rgMktBook_OrderProj: TRadioGroup;
    rgMktBook_MatchProj: TRadioGroup;
    edtMaxResults: TSpinEdit;
    edtPriceProj_BestPricesDepth: TSpinEdit;
    edtPriceProj_RollupLimit: TSpinEdit;
    edtPriceProj_RollupLiabilityThreshold: TSpinEdit;
    edtPriceProj_RollupLiabilityFactor: TSpinEdit;
    btnListAccountStatement: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    Label49: TLabel;
    Shape16: TShape;
    cbGAS_IncludeDateRange: TCheckBox;
    cbGAS_IncludeItem: TComboBox;
    edtGAS_DateFrom: TDateTimePicker;
    edtGAS_DateTo: TDateTimePicker;
    edtGAS_TimeFrom: TDateTimePicker;
    edtGAS_TimeTo: TDateTimePicker;
    Label1: TLabel;
    cbGAS_Wallet: TComboBox;
    edtGAS_Locale: TEdit;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BFKeepAliveTimerTimer(Sender: TObject);
    procedure btnListCompetitionsClick(Sender: TObject);
    procedure mnClearResultsClick(Sender: TObject);
    procedure mnLogoutClick(Sender: TObject);
    procedure cbMktFilt_IncludeTimeRangeClick(Sender: TObject);
    procedure btnListEventsClick(Sender: TObject);
    procedure cbShowRawJsonClick(Sender: TObject);
    procedure btnListMarketCatalogueClick(Sender: TObject);
    procedure btnListCountriesClick(Sender: TObject);
    procedure btnListEventTypesClick(Sender: TObject);
    procedure btnListMarketTypesClick(Sender: TObject);
    procedure btnListTimeRangesClick(Sender: TObject);
    procedure btnListVenuesClick(Sender: TObject);
    procedure PriceProjectionClick(Sender: TObject);
    procedure btnListMarketBookClick(Sender: TObject);
    procedure cbMktBook_OrderProjClick(Sender: TObject);
    procedure cbMktBook_MatchProjClick(Sender: TObject);
    procedure btnStopDisplayClick(Sender: TObject);
    procedure UpdateOrdersDisplay(Sender: TObject);
    procedure btnPlaceOrdersClick(Sender: TObject);
    procedure btnCancelOrdersClick(Sender: TObject);
    procedure btnReplaceOrdersClick(Sender: TObject);
    procedure btnUpdateOrdersClick(Sender: TObject);
    procedure btnListCurrentOrdersClick(Sender: TObject);
    procedure cbLCO_IncludeDateRangeClick(Sender: TObject);
    procedure btnListClearedOrdersClick(Sender: TObject);
    procedure cbLCLO_IncludeSettledDateRangeClick(Sender: TObject);
    procedure btnListProfitAndLossClick(Sender: TObject);
    procedure btnGetAccountFundsClick(Sender: TObject);
    procedure btnGetAccountStatementClick(Sender: TObject);
    procedure cbGAS_IncludeDateRangeClick(Sender: TObject);
  private
    { Private declarations }
    var
      bClosingApp          : boolean ;
      bStopDisplay         : boolean ;
      sBetfairSessionToken : string ;
      
    procedure GetMarketFilterElements( var recElements : TbfMarketFilterElements ) ;
  public
    { Public declarations }
  end;


const
  {**************************}
  { Betfair application keys }
  {**************************}
  cBetfair_AppKey         = 'EnterAppKeyHere' ;
  cBetfair_AppKey_Delayed = 'EnterDelayedAppKeyHere' ;


  {*************}
  { Order Types }
  {*************}
  cLimit         = 0 ;
  cLimitOnClose  = 1 ;
  cMarketOnClose = 2 ;

  {*******************}
  { Persistence Types }
  {*******************}
  cpLapse         = 0 ;
  cpPersist       = 1 ;
  cpMarketOnClose = 2 ;


var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses strutils, dateutils, XSBuiltIns, superobject, LBS_BetfairAPINGUtils, LBS_BetfairAPINGFunctions, frmBetfairLogin ;



{******************************************************************************************}
procedure TfmMain.FormCreate(Sender: TObject);
{******************************************************************************************}
begin
  fmMain.caption := 'Betfair API-NG Testbed V1.06.00' ;
  memMsg.clear ;

  edtMktFilt_DateFrom.date := now ;
  edtMktFilt_TimeFrom.time := encodetime(0, 0, 0, 0) ;

  edtMktFilt_DateTo.date   := incday(now, 1) ;
  edtMktFilt_TimeTo.time   := encodetime(0, 0, 0, 0) ;

  edtLCO_DateFrom.date     := now ;
  edtLCO_TimeFrom.time     := encodetime(0, 0, 0, 0) ;

  edtLCO_DateTo.date       := incday(now, 1) ;
  edtLCO_TimeTo.time       := encodetime(0, 0, 0, 0) ;

  edtLCLO_SettledDateFrom.date := now ;
  edtLCLO_SettledTimeFrom.time := encodetime(0, 0, 0, 0) ;

  edtLCLO_SettledDateTo.date   := incday(now, 1) ;
  edtLCLO_SettledTimeTo.time   := encodetime(0, 0, 0, 0) ;

  edtGAS_DateFrom.date := now ;
  edtGAS_TimeFrom.time := encodetime(0, 0, 0, 0) ;

  edtGAS_DateTo.date   := incday(now, 1) ;
  edtGAS_TimeTo.time   := encodetime(0, 0, 0, 0) ;


  bClosingApp          := false ;
  bStopDisplay         := false ;
  sBetfairSessionToken := '' ;

  PriceProjectionClick(Sender) ;
  cbMktBook_OrderProjClick(Sender) ;
  cbMktBook_MatchProjClick(Sender) ;

  UpdateOrdersDisplay(Sender) ;
end ;



{******************************************************************************************}
procedure TfmMain.mnClearResultsClick(Sender: TObject);
{******************************************************************************************}
begin
  memMsg.Clear ;
end ;



{******************************************************************************************}
procedure TfmMain.FormActivate(Sender: TObject);
{******************************************************************************************}
var
  formLogin : TfmBetfairLogin ;

begin
  if (sBetfairSessionToken = '') and (not bClosingApp) then
  begin
    if cBetfair_AppKey <> 'EnterAppKeyHere' then
    begin
      try
        formLogin         := TfmBetfairLogin.create(nil) ;
        formLogin.sAppKey := cBetfair_AppKey ;

        if formLogin.showmodal = mrOk then
        begin
          sBetfairSessionToken := formLogin.sSessionToken ;
          memMsg.lines.add('Betfair login successful. Session Token: ' + sBetfairSessionToken) ;
          BFKeepAliveTimer.enabled := true ;
        end else
        begin
          messagedlg('Betfair login failed' + iifstr(formLogin.sBetfairLoginError='','.',': ' + formLogin.sBetfairLoginError) + CRLF + 'Closing App.', mtError, [mbOk], 0) ;
          bClosingApp := true ;
          close ;
        end ;
      finally
        formLogin.free ;
      end ;
    end else
    begin
      messagedlg(cBetfair_AppKey + ' is not a valid Betfair App Key!!' + CRLF + 'Closing App.', mtError, [mbOk], 0) ;
      bClosingApp := true ;
      close ;
    end ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.BFKeepAliveTimerTimer(Sender: TObject) ;
{******************************************************************************************}
var
  sError : string ;
  
begin
  {*******************************************************}
  { The Betfair keep alive function runs every 7 minutes. }
  {*******************************************************}
  if length(sBetfairSessionToken) > 1 then
  begin
    if bfngKeepAlive(sBetfairSessionToken, cBetfair_AppKey, sError) then
    begin
      memMsg.lines.add('Betfair keep alive ok') ;
    end else
    begin
      memMsg.lines.add('BETFAIR KEEP ALIVE FAILED! Error: ' + sError) ;
    end ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.mnLogoutClick(Sender: TObject) ;
{******************************************************************************************}
var
  sError : string ;
  
begin
  if length(sBetfairSessionToken) > 1 then
  begin
    if bfngLogout(sBetfairSessionToken, cBetfair_AppKey, sError) then
    begin
      memMsg.lines.add('Logged out from Betfair.') ;
    end else
    begin
      memMsg.lines.add('Logout failed! Error: ' + sError) ;
    end ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.GetMarketFilterElements( var recElements : TbfMarketFilterElements ) ;
{******************************************************************************************}
var
  I                        : longint ;
  iHour, iMin, iSec, iMSec : word ;
  iYear, iMonth,iDay       : word ;
  dWork1, dWork2           : TdateTime ;

begin
  with recElements do
  begin
    {************}
    { Text Query }
    {************}
    sTextQuery := edtMktFilt_TextQuery.text ;
    
    {***************}
    { EventType Ids }
    {***************}
    slEventTypeId := TStringList.create ;
    slEventTypeId.clear ;

    if length(trim(edtMktFilt_EventTypeId1.text)) > 0 then slEventTypeId.add(trim(edtMktFilt_EventTypeId1.text)) ;
    if length(trim(edtMktFilt_EventTypeId2.text)) > 0 then slEventTypeId.add(trim(edtMktFilt_EventTypeId2.text)) ;
    if length(trim(edtMktFilt_EventTypeId3.text)) > 0 then slEventTypeId.add(trim(edtMktFilt_EventTypeId3.text)) ;

    {***************}
    { Event Ids     }
    {***************}
    slEventId := TStringList.create ;
    slEventId.clear ;

    if length(trim(edtMktFilt_EventId1.text)) > 0 then slEventId.add(trim(edtMktFilt_EventId1.text)) ;
    if length(trim(edtMktFilt_EventId2.text)) > 0 then slEventId.add(trim(edtMktFilt_EventId2.text)) ;
    if length(trim(edtMktFilt_EventId3.text)) > 0 then slEventId.add(trim(edtMktFilt_EventId3.text)) ;

    {**********}
    { BSP Only }
    {**********}
    case cbMktFilt_BSPOnly.itemindex of
      0: triBSPOnly := triNone ;
      1: triBSPOnly := triTrue ;
      2: triBSPOnly := triFalse ;
    end ;

    {*********************}
    { Turn Inplay Enabled }
    {*********************}
    case cbMktFilt_TurnInplayEnabled.itemindex of
      0: triTurnInplayEnabled := triNone ;
      1: triTurnInplayEnabled := triTrue ;
      2: triTurnInplayEnabled := triFalse ;
    end ;

    {***********************}
    { Currently Inplay Only }
    {***********************}
    case cbMktFilt_InplayOnly.itemindex of
      0: triInplayOnly := triNone ;
      1: triInplayOnly := triTrue ;
      2: triInplayOnly := triFalse ;
    end ;

    {*************************}
    { Market Start Time range }
    {*************************}
    if cbMktFilt_IncludeTimeRange.checked then
    begin
      decodedate(edtMktFilt_DateFrom.Date, iYear, iMonth, iDay) ;
      decodetime(edtMktFilt_TimeFrom.Time, iHour, iMin, iSec, iMSec) ;
      dWork1 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;
      
      decodedate(edtMktFilt_DateTo.Date, iYear, iMonth, iDay) ;
      decodetime(edtMktFilt_TimeTo.Time, iHour, iMin, iSec, iMSec) ;
      dWork2 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;
      
      dMarketStartTimeLo := dWork1 ;
      dMarketStartTimeHi := dWork2 ;
    end else
    begin
      dMarketStartTimeLo := gNulldate ;
      dMarketStartTimeHi := gNulldate ;
    end ;


    {*********************}
    { Market Betting Type }
    {*********************}
    setMarketBettingType := [] ;

    if cbMktFilt_MBType_Odds.checked      then setMarketBettingType := setMarketBettingType + [bfmbtODDS] ;
    if cbMktFilt_MBType_Line.checked      then setMarketBettingType := setMarketBettingType + [bfmbtLINE] ;
    if cbMktFilt_MBType_Range.checked     then setMarketBettingType := setMarketBettingType + [bfmbtRANGE] ;
    if cbMktFilt_MBType_AHDouble.checked  then setMarketBettingType := setMarketBettingType + [bfmbtASIAN_HANDICAP_DOUBLE_LINE] ;
    if cbMktFilt_MBType_AHSingle.checked  then setMarketBettingType := setMarketBettingType + [bfmbtASIAN_HANDICAP_SINGLE_LINE] ;
    if cbMktFilt_MBType_FixedOdds.checked then setMarketBettingType := setMarketBettingType + [bfmbtFIXED_ODDS] ;


    {******************}
    { Market Type Code }
    {******************}
    slMarketTypeCode := TStringList.create ;
    slMarketTypeCode.clear ;

    if cbMktFilt_MTCode_MatchOdds.checked     then slMarketTypeCode.add('MATCH_ODDS') ;
    if cbMktFilt_MTCode_Win.checked           then slMarketTypeCode.add('WIN') ;
    if cbMktFilt_MTCode_CorrectScore.checked  then slMarketTypeCode.add('CORRECT_SCORE') ;
    if cbMktFilt_MTCode_HalfTimeScore.checked then slMarketTypeCode.add('HALF_TIME_SCORE') ;
    if cbMktFilt_MTCode_Place.checked         then slMarketTypeCode.add('PLACE') ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListCountriesClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfCountryCodeResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listCountries...........') ;
    
    if bfngListCountries( sBetfairSessionToken, cBetfair_AppKey, 
                          iExchange,
                          soMarketFilter,
                          aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('CountryCode'  + stringofchar(' ',12),1,12) + '  ' +
                          'MarketCount' ) ;
        
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy(sCountryCode + stringofchar(' ',12),1,12) + '  ' +
                                             inttostr(iMarketCount) ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListVenuesClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfVenueResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listVenues...........') ;
    
    if bfngListVenues( sBetfairSessionToken, cBetfair_AppKey, 
                       iExchange,
                       soMarketFilter,
                       aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('Venue'  + stringofchar(' ',30),1,30) + '  ' +
                          'MarketCount' ) ;
        
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy(sVenue + stringofchar(' ',30),1,30) + '  ' +
                                             inttostr(iMarketCount) ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListMarketTypesClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfMarketTypeResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listMarketTypes...........') ;
    
    if bfngListMarketTypes( sBetfairSessionToken, cBetfair_AppKey, 
                            iExchange,
                            soMarketFilter,
                            aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('MarketType'  + stringofchar(' ',30),1,30) + '  ' +
                          'MarketCount' ) ;
        
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy(sMarketType + stringofchar(' ',30),1,30) + '  ' +
                                             inttostr(iMarketCount) ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListEventTypesClick(Sender: TObject);
{******************************************************************************************}
var
  I, iTotalMkts            : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfListEventTypesResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listEventTypes...........') ;
    
    if bfngListEventTypes( sBetfairSessionToken, cBetfair_AppKey, 
                           iExchange,
                           soMarketFilter,
                           aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('Id'           + stringofchar(' ',12),1,12) + '  ' +
                          copy('Name'         + stringofchar(' ',50),1,50) + '  ' +
                          'MarketCount' ) ;
        
        iTotalMkts := 0 ;
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy(         obfEventType.sEventTypeId   + stringofchar(' ',12),1,12) + '  ' +
                                             copy(         obfEventType.sEventTypeName + stringofchar(' ',50),1,50) + '  ' +
                                             inttostr(iMarketCount) ) ;
            inc(iTotalMkts, iMarketCount) ;
          end ;
        end ;

        memMsg.lines.add('') ;
        memMsg.lines.add('Total Markets: ' + inttostr(iTotalMkts)) ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListCompetitionsClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfListCompetitionsResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listCompetitions...........') ;
    
    if bfngListCompetitions( sBetfairSessionToken, cBetfair_AppKey, 
                             iExchange,
                             soMarketFilter,
                             aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('Id'           + stringofchar(' ',12),1,12) + '  ' +
                          copy('Name'         + stringofchar(' ',50),1,50) + '  ' +
                          copy('MarketCount'  + stringofchar(' ',14),1,14) + '  ' +
                          'CompetitionRegion' ) ;
        
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy(         obfCompetition.sCompetitionId   + stringofchar(' ',12),1,12) + '  ' +
                                             copy(         obfCompetition.sCompetitionName + stringofchar(' ',50),1,50) + '  ' +
                                             copy(inttostr(iMarketCount)                   + stringofchar(' ',14),1,14) + '  ' +
                                             sCompetitionRegion ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListEventsClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  aResult                  : ArrayOfTbfListEventsResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listEvents...........') ;
    
    if bfngListEvents( sBetfairSessionToken, cBetfair_AppKey, 
                       iExchange,
                       soMarketFilter,
                       aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('Id'                + stringofchar(' ',12),1,12) + '  ' +
                          copy('Name'              + stringofchar(' ',50),1,50) + '  ' +
                          copy('CountryCode'       + stringofchar(' ',11),1,11) + '  ' +
                          copy('TimeZone'          + stringofchar(' ',25),1,25) + '  ' +
                          copy('Venue'             + stringofchar(' ',25),1,25) + '  ' +
                          copy('OpenDate'          + stringofchar(' ',20),1,20) + '  ' +
                          'MarketCount' ) ;
      
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                       copy(         obfEvent.sEventId        + stringofchar(' ',12),1,12) + '  ' +
                                       copy(         obfEvent.sEventName      + stringofchar(' ',50),1,50) + '  ' +
                                       copy(         obfEvent.sCountryCode    + stringofchar(' ',11),1,11) + '  ' +
                                       copy(         obfEvent.sTimeZone       + stringofchar(' ',25),1,25) + '  ' +
                                       copy(         obfEvent.sVenue          + stringofchar(' ',25),1,25) + '  ' +
                                       copy(datetimetostr(obfEvent.dOpenDate) + stringofchar(' ',20),1,20) + '  ' +
                                       inttostr(iMarketCount) ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListMarketCatalogueClick(Sender: TObject);
{******************************************************************************************}
var
  I, J                     : longint ;
  S                        : string ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  setMarketProjection      : TbfngMarketProjectionSet ;
  eMarketSort              : TbfngMarketSort ;
  iMaxResults              : integer ;
  aResult                  : ArrayOfTbfMarketCatalogueObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;

    {*******************}
    { Market Projection }
    {*******************}
    setMarketProjection := [] ;
    if cbMktProj_Competition.checked       then setMarketProjection := setMarketProjection + [bfmpjCOMPETITION] ;
    if cbMktProj_Event.checked             then setMarketProjection := setMarketProjection + [bfmpfEVENT] ;
    if cbMktProj_EventType.checked         then setMarketProjection := setMarketProjection + [bfmpjEVENT_TYPE] ;
    if cbMktProj_MarketStartTime.checked   then setMarketProjection := setMarketProjection + [bfmpjMARKET_START_TIME] ;
    if cbMktProj_MarketDescription.checked then setMarketProjection := setMarketProjection + [bfmpjMARKET_DESCRIPTION] ;
    if cbMktProj_RunnerDescription.checked then setMarketProjection := setMarketProjection + [bfmpjRUNNER_DESCRIPTION] ;
    if cbMktProj_RunnerMetadata.checked    then setMarketProjection := setMarketProjection + [bfmpjRUNNER_METADATA] ;

    {*************}
    { Market Sort }
    {*************}
    case rgMarketSort.itemindex of
      0: eMarketSort := bfmsortMINIMUM_TRADED ;
      1: eMarketSort := bfmsortMAXIMUM_TRADED ;
      2: eMarketSort := bfmsortMINIMUM_AVAILABLE ;
      3: eMarketSort := bfmsortMAXIMUM_AVAILABLE ;
      4: eMarketSort := bfmsortFIRST_TO_START ;
      5: eMarketSort := bfmosrtLAST_TO_START ;
    end ;

    {*************}
    { Max Results }
    {*************}
    iMaxResults := edtMaxResults.value ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listMarketCatalogue...........') ;

    if bfngListMarketCatalogue( sBetfairSessionToken, cBetfair_AppKey, 
                                iExchange,
                                soMarketFilter,
                                setMarketProjection,
                                eMarketSort,
                                iMaxResults,
                                aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        I := 0 ;
        bStopDisplay := false ;
        
        while (I <= length(aResult) - 1) and (not bStopDisplay) do
        begin
          memMsg.lines.add('') ;
          
          with aResult[I] do
          begin
            memMsg.lines.add('CompetitionId    : ' + oCompetition.sCompetitionId) ;
            memMsg.lines.add('CompetitionName  : ' + oCompetition.sCompetitionName) ;

            memMsg.lines.add('EventTypeId      : ' + oEventType.sEventTypeId) ;
            memMsg.lines.add('EventTypeName    : ' + oEventType.sEventTypeName) ;

            memMsg.lines.add('EventId          : ' + oEvent.sEventId) ;
            memMsg.lines.add('EventName        : ' + oEvent.sEventName) ;
            memMsg.lines.add('CountryCode      : ' + oEvent.sCountryCode) ;
            memMsg.lines.add('Timezone         : ' + oEvent.sTimezone) ;
            memMsg.lines.add('Venue            : ' + oEvent.sVenue) ;
            memMsg.lines.add('OpenDate         : ' + datetimetostr(oEvent.dOpenDate)) ;
            
            memMsg.lines.add('MarketId         : ' + sMarketId) ;
            memMsg.lines.add('MarketName       : ' + sMarketName) ;
            memMsg.lines.add('MarketStartTime  : ' + datetimetostr(dMarketStartTime)) ;
            
            memMsg.lines.add('PersistenceEnable: ' + iifstr(oMarketDesc.bPersistenceEnabled, 'true', 'false')) ;
            memMsg.lines.add('BSPMarket        : ' + iifstr(oMarketDesc.bBSPMarket,         'true', 'false')) ;
            memMsg.lines.add('MarketTime       : ' + datetimetostr(oMarketDesc.dMarketTime)) ;
            memMsg.lines.add('SuspendTime      : ' + datetimetostr(oMarketDesc.dSuspendTime)) ;
            memMsg.lines.add('SettleTime       : ' + datetimetostr(oMarketDesc.dSettleTime)) ;
            memMsg.lines.add('BettingType      : ' + TbfngMarketBettingTypeToStr(oMarketDesc.eBettingType)) ;
            memMsg.lines.add('TurnInPlayEnabled: ' + iifstr(oMarketDesc.bTurnInPlayEnabled, 'true', 'false')) ;
            memMsg.lines.add('MarketType       : ' + oMarketDesc.sMarketType) ;
            memMsg.lines.add('Regulator        : ' + oMarketDesc.sRegulator) ;
            memMsg.lines.add('MarketBaseRate   : ' + floattostrf(oMarketDesc.rMarketBaseRate,ffFixed,15,2)) ;
            memMsg.lines.add('DiscountAllowed  : ' + iifstr(oMarketDesc.bDiscountAllowed,   'true', 'false')) ;
            memMsg.lines.add('Wallet           : ' + oMarketDesc.sWallet) ;
            memMsg.lines.add('Rules            : ' + oMarketDesc.sRules) ;
            memMsg.lines.add('RulesHasDate     : ' + iifstr(oMarketDesc.bRulesHasDate,      'true', 'false')) ;
            memMsg.lines.add('Clarifications   : ' + oMarketDesc.sClarifications) ;

            if length(aRunners) > 0 then
            begin
              memMsg.lines.add('Runners:  SelId    Runner Name                     Handicap      Sort') ;
              
              for J := 0 to length(aRunners) - 1 do
              begin
                with aRunners[J] do
                begin
                  memMsg.lines.add( rightstr('   '+inttostr(J+1),3) + ') ' +
                                    copy(inttostr(iSelectionId)              + stringofchar(' ',12),1,12) + '  ' +
                                    copy(sRunnerName                         + stringofchar(' ',30),1,30) + '  ' +
                                    copy(floattostrf(rHandicap,ffFixed,15,2) + stringofchar(' ',12),1,12) + '  ' +
                                    copy(inttostr(iSortPriority)             + stringofchar(' ',12),1,12) + '  ' ) ;

                  memMsg.lines.add(' ') ;
              
                  if dictMetaData.Count > 0 then
                  begin
                    memMsg.lines.add('Metadata:') ;
                    for S in dictMetaData.Keys do fmMain.memMsg.lines.add(copy(S + stringofchar(' ',30),1,30) + ' = ' + dictMetaData.items[S]) ;
                  end else
                  begin
                    memMsg.lines.add('No Metadata.') ;
                  end ;
                end ;
              end ;
            end else
            begin
              memMsg.lines.add('No runners!!') ;
            end ;
            
          end ;
          
          inc(I) ;
          application.processmessages ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListMarketBookClick(Sender: TObject);
{******************************************************************************************}
var
  I, J, K                  : longint ;
  S                        : string ;
  iExchange                : integer ;
  slMarketIds              : TStringList ;
  oPriceProjection         : TbfPriceProjectionObj ;
  eOrderProjection         : TbfngOrderProjection ;
  eMatchProjection         : TbfngMatchProjection ;
  sCurrencyCode            : string ;
  aResult                  : ArrayOfTbfMarketBookObj ;

begin
  try
    try
      slMarketIds      := nil ;
      oPriceProjection := nil ;
  
      {**********}
      { Exchange }
      {**********}
      case cbExchange.itemindex of
        0: iExchange := cbfngUKExchange ;
        1: iExchange := cbfngAUSExchange ;
      else
        iExchange := cbfngUKExchange ;
      end ;

      slMarketIds := TStringList.create ;
      if length(trim(edtMktBook_MktId1.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId1.text)) ;
      if length(trim(edtMktBook_MktId2.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId2.text)) ;
      if length(trim(edtMktBook_MktId3.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId3.text)) ;

      if cbMktBook_PriceProj.checked then
      begin
        oPriceProjection := TbfPriceProjectionObj.create ;

        with oPriceProjection do
        begin
          if cbPriceData_SPAvailable.checked  then setPriceData := setPriceData + [bfpdSP_AVAILABLE  ] ;
          if cbPriceData_SPTraded.checked     then setPriceData := setPriceData + [bfpdSP_TRADED     ] ;
          if cbPriceData_ExBestOffers.checked then setPriceData := setPriceData + [bfpdEX_BEST_OFFERS] ;
          if cbPriceData_ExAllOffers.checked  then setPriceData := setPriceData + [bfpdEX_ALL_OFFERS ] ;
          if cbPriceData_ExTraded.checked     then setPriceData := setPriceData + [bfpdEX_TRADED     ] ;

          if cbPriceProj_ExBestOO.checked then
          begin
            oBestOffersOverrides := TbfExBestOffersOverridesObj.create ;
          
            with oBestOffersOverrides do
            begin
              iBestPricesDepth := edtPriceProj_BestPricesDepth.value ;

              case rgPriceProj_RollupModel.itemindex of
                0: eRollupModel := bfrollupSTAKE ;
                1: eRollupModel := bfrollupPAYOUT ;
                2: eRollupModel := bfrollupMANAGED_LIABILITY ;
                3: eRollupModel := bfrollupNONE ;
              end ;
  
              iRollupLimit              := edtPriceProj_RollupLimit.value ;
              rRollupLiabilityThreshold := edtPriceProj_RollupLiabilityThreshold.value ;
              iRollupLiabilityFactor    := edtPriceProj_RollupLiabilityFactor.value ;
            end ;
          end ;
      
          bVirtualise     := cbPriceProj_Virtualise.checked ;
          bRolloverStakes := cbPriceProj_RolloverStakes.checked ;
        end ;
      end else
      begin
        oPriceProjection := nil ;
      end ;
    
  
      if cbMktBook_OrderProj.checked then
      begin
        case rgMktBook_OrderProj.itemindex of
          0: eOrderProjection := bforpALL ;
          1: eOrderProjection := bforpEXECUTABLE ;
          2: eOrderProjection := bforpEXECUTION_COMPLETE ;
        end ;    
      end else
      begin
        eOrderProjection := bforpNone ;
      end ;


      if cbMktBook_MatchProj.checked then
      begin
        case rgMktBook_MatchProj.itemindex of
          0: eMatchProjection := bfmtpNO_ROLLUP ;
          1: eMatchProjection := bfmtpROLLED_UP_BY_PRICE ;
          2: eMatchProjection := bfmtpROLLED_UP_BY_AVG_PRICE ;
        end ;
      end else
      begin
        eMatchProjection := bfmtpNone ;
      end ;


      sCurrencyCode := trim(edtMktBook_CurrencyCode.text) ;


      {**********************}
      { Call API-NG function }
      {**********************}
      memMsg.lines.add('') ;
      memMsg.lines.add('Calling listMarketBook...........') ;

      if bfngListMarketBook( sBetfairSessionToken, cBetfair_AppKey, 
                             iExchange,
                             slMarketIds,
                             oPriceProjection,
                             eOrderProjection,
                             eMatchProjection,
                             sCurrencyCode,
                             aResult ) then
      begin
        memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;

        if length(aResult) > 0 then
        begin
          for I := 0 to length(aResult) - 1 do
          begin
            memMsg.lines.add('') ;
          
            with aResult[I] do
            begin
              memMsg.lines.add('MarketId            : ' + sMarketId) ;
              memMsg.lines.add('IsMarketDataDelayed : ' + iifstr(bIsMarketDataDelayed,'Yes','No')) ;
              memMsg.lines.add('MarketStatus        : ' + TbfngMarketStatusToStr(eMarketStatus)) ;
              memMsg.lines.add('BetDelay            : ' + inttostr(iBetDelay)) ;
              memMsg.lines.add('BSPReconciled       : ' + iifstr(bBSPReconciled,'Yes','No')) ;
              memMsg.lines.add('Complete            : ' + iifstr(bComplete,'Yes','No')) ;
              memMsg.lines.add('InPlay              : ' + iifstr(bInPlay,'Yes','No')) ;
              memMsg.lines.add('NoOfWinners         : ' + inttostr(iNoOfWinners)) ;
              memMsg.lines.add('NoOfRunners         : ' + inttostr(iNoOfRunners)) ;
              memMsg.lines.add('NoOfActiveRunners   : ' + inttostr(iNoOfActiveRunners)) ;
              memMsg.lines.add('LastMatchTime       : ' + datetimetostr(dLastMatchTime)) ;
              memMsg.lines.add('TotalMatched        : ' + floattostrf(rTotalMatched,ffFixed,15,2)) ;
              memMsg.lines.add('TotalAvailable      : ' + floattostrf(rTotalAvailable,ffFixed,15,2)) ;
              memMsg.lines.add('CrossMatching       : ' + iifstr(bCrossMatching,'Yes','No')) ;
              memMsg.lines.add('RunnersVoidable     : ' + iifstr(bRunnersVoidable,'Yes','No')) ;
              memMsg.lines.add('Version             : ' + inttostr(iVersion)) ;

              if length(aRunners) > 0 then
              begin
                memMsg.lines.add('') ;
                memMsg.lines.add('Runners:') ;
            
                for J := 0 to length(aRunners) - 1 do
                begin
                  with aRunners[J] do
                  begin
                    memMsg.lines.add(rightstr('   '+inttostr(J+1),3) + ') SelectionId   : ' + inttostr(iSelectionId)) ;
                    memMsg.lines.add('  Handicap         : ' + floattostrf(rHandicap,ffFixed,15,2)) ;
                    memMsg.lines.add('  RunnerStatus     : ' + TbfngRunnerStatusToStr(eRunnerStatus)) ;
                    memMsg.lines.add('  AdjustmentFactor : ' + floattostrf(rAdjustmentFactor,ffFixed,15,2)) ;
                    memMsg.lines.add('  LastPriceMatched : ' + floattostrf(rLastPriceMatched,ffFixed,15,2)) ;
                    memMsg.lines.add('  TotalMatched     : ' + floattostrf(rTotalMatched,ffFixed,15,2)) ;
                    memMsg.lines.add('  RemovalDate      : ' + datetimetostr(dRemovalDate)) ;

                    if oSPPrices <> nil then
                    begin
                      with oSPPrices do
                      begin
                        memMsg.lines.add('    Starting Prices:') ;
                        memMsg.lines.add('      NearPrice : ' + floattostrf(rNearPrice,ffFixed,15,3)) ;
                        memMsg.lines.add('      FarPrice  : ' + floattostrf(rFarPrice,ffFixed,15,3)) ;
                        memMsg.lines.add('      ActualSP  : ' + floattostrf(rActualSP,ffFixed,15,3)) ;

                        if length(aBackStakeTaken) > 0 then
                        begin
                          memMsg.lines.add('      Back stake taken:') ;
                          for K := 0 to length(aBackStakeTaken) - 1 do
                              memMsg.lines.add('        ' + floattostrf(aBackStakeTaken[K].rSize,ffFixed,15,2) + ' at ' + floattostrf(aBackStakeTaken[K].rPrice,ffFixed,15,2) ) ;
                        end else
                        begin
                          memMsg.lines.add('      No Back stake taken.') ;
                        end ;

                        if length(aLayLiabilityTaken) > 0 then
                        begin
                          memMsg.lines.add('      Lay liability taken:') ;
                          for K := 0 to length(aLayLiabilityTaken) - 1 do
                              memMsg.lines.add('        ' + floattostrf(aLayLiabilityTaken[K].rSize,ffFixed,15,2) + ' at ' + floattostrf(aLayLiabilityTaken[K].rPrice,ffFixed,15,2) ) ;
                        end else
                        begin
                          memMsg.lines.add('      No Lay liability taken.') ;
                        end ;
                      end ;
                    end else
                    begin
                      memMsg.lines.add('    No Starting Price data.') ;
                    end ;


                    if oExchangePrices <> nil then
                    begin
                      with oExchangePrices do
                      begin
                        if length(aAvailableToBack) > 0 then
                        begin
                          memMsg.lines.add('    Available to Back:') ;
                          for K := 0 to length(aAvailableToBack) - 1 do
                              memMsg.lines.add('      ' + floattostrf(aAvailableToBack[K].rPrice,ffFixed,15,2) + '  (£' + floattostrf(aAvailableToBack[K].rSize,ffFixed,15,2) + ')') ;
                        end else
                        begin
                          memMsg.lines.add('    No available to Back prices.') ;
                        end ;

                        if length(aAvailableToLay) > 0 then
                        begin
                          memMsg.lines.add('    Available to Lay:') ;
                          for K := 0 to length(aAvailableToLay) - 1 do
                              memMsg.lines.add('      ' + floattostrf(aAvailableToLay[K].rPrice,ffFixed,15,2) + '  (£' + floattostrf(aAvailableToLay[K].rSize,ffFixed,15,2) + ')') ;
                        end else
                        begin
                          memMsg.lines.add('    No available to Lay prices.') ;
                        end ;

                        if length(aTradedVolume) > 0 then
                        begin
                          memMsg.lines.add('    Traded Volume:') ;
                          for K := 0 to length(aTradedVolume) - 1 do
                              memMsg.lines.add('      ' + floattostrf(aTradedVolume[K].rPrice,ffFixed,15,2) + '  (£' + floattostrf(aTradedVolume[K].rSize,ffFixed,15,2) + ')') ;
                        end else
                        begin
                          memMsg.lines.add('    No traded volume data.') ;
                        end ;
                      end ;                  
                    end else
                    begin
                      memMsg.lines.add('    No Exchange Price data.') ;
                    end ;


                    if length(aOrders) > 0 then
                    begin
                      memMsg.lines.add('    Orders:') ;
                      for K := 0 to length(aOrders) - 1 do
                      begin
                        with aOrders[K] do
                        begin
                          memMsg.lines.add('') ;
                          memMsg.lines.add(inttostr(K+1) + ')    sBetId           : ' + sBetId ) ;
                          memMsg.lines.add('      eOrderType       : ' + TbfngOrderTypeToStr(eOrderType) ) ;
                          memMsg.lines.add('      eOrderStatus     : ' + TbfngOrderStatusToStr(eOrderStatus) ) ;
                          memMsg.lines.add('      ePersistenceType : ' + TbfngPersistenceTypeToStr(ePersistenceType) ) ;
                          memMsg.lines.add('      eOrderSide       : ' + TbfngSideToStr(eOrderSide) ) ;
                          memMsg.lines.add('      rOrderPrice      : ' + floattostrf(rOrderPrice,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rOrderSize       : ' + floattostrf(rOrderSize,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rBSPLiability    : ' + floattostrf(rBSPLiability,ffFixed,15,2) ) ;
                          memMsg.lines.add('      dPlacedDate      : ' + datetimetostr(dPlacedDate) ) ;
                          memMsg.lines.add('      rAvgPriceMatched : ' + floattostrf(rAvgPriceMatched,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSizeMatched     : ' + floattostrf(rSizeMatched,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSizeRemaining   : ' + floattostrf(rSizeRemaining,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSizeLapsed      : ' + floattostrf(rSizeLapsed,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSizeCancelled   : ' + floattostrf(rSizeCancelled,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSizeVoided      : ' + floattostrf(rSizeVoided,ffFixed,15,2) ) ;
                        end ;
                      end ;
                    end else
                    begin
                      memMsg.lines.add('    No Orders.') ;
                    end ;


                    if length(aMatches) > 0 then
                    begin
                      memMsg.lines.add('    Matches:') ;
                      for K := 0 to length(aMatches) - 1 do
                      begin
                        with aMatches[K] do
                        begin
                          memMsg.lines.add('') ;
                          memMsg.lines.add(inttostr(K+1) + ')    sBetId     : ' + sBetId ) ;
                          memMsg.lines.add('      sMatchId   : ' + sMatchId ) ;
                          memMsg.lines.add('      eSide      : ' + TbfngSideToStr(eSide) ) ;
                          memMsg.lines.add('      rPrice     : ' + floattostrf(rPrice,ffFixed,15,2) ) ;
                          memMsg.lines.add('      rSize      : ' + floattostrf(rSize,ffFixed,15,2) ) ;
                          memMsg.lines.add('      dMatchDate : ' + datetimetostr(dMatchDate) ) ;
                        end ;
                      end ;
                    end else
                    begin
                      memMsg.lines.add('    No Matches.') ;
                    end ;

                  end ;
                
                  memMsg.lines.add('') ;
                  memMsg.lines.add('') ;
                end ;
              end else
              begin
                memMsg.lines.add('No Runners.') ;
              end ;
            end ;

            application.processmessages ;
          end ;
      
          for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
          setlength(aResult, 0) ;
        end ;
      end else
      begin
        memMsg.lines.add('Call FAILED!') ;
      end ;
    
    except
      on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
    end ;
  finally
    if slMarketIds      <> nil then slMarketIds.free ;
    if oPriceProjection <> nil then oPriceProjection.free ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListTimeRangesClick(Sender: TObject);
{******************************************************************************************}
var
  I, J                     : longint ;
  S                        : string ;
  iExchange                : integer ;
  recMarketFilterElements  : TbfMarketFilterElements ;
  soMarketFilter           : ISuperObject ;
  eGranularity             : TbfngTimeGranularity ;
  aResult                  : ArrayOfTbfTimeRangeResultObj ;

begin
  try
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    GetMarketFilterElements ( recMarketFilterElements ) ;

    {*****************************************}
    { Create the required json market filter. }
    {*****************************************}
    soMarketFilter := bfngGetMarketFilterJson( recMarketFilterElements.sTextQuery,
                                               recMarketFilterElements.slEventTypeId,
                                               recMarketFilterElements.slEventId,
                                               recMarketFilterElements.triBSPOnly,
                                               recMarketFilterElements.triTurnInplayEnabled,
                                               recMarketFilterElements.triInplayOnly,
                                               recMarketFilterElements.dMarketStartTimeLo,
                                               recMarketFilterElements.dMarketStartTimeHi,
                                               recMarketFilterElements.setMarketBettingType,
                                               recMarketFilterElements.slMarketTypeCode ) ;

    {*************}
    { Granularity }
    {*************}
    case rgGranularity.itemindex of
      0: eGranularity := bftgDAYS ;
      1: eGranularity := bftgHOURS ;
      2: eGranularity := bftgMINUTES ;
    end ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling listTimeRanges...........') ;

    if bfngListTimeRanges( sBetfairSessionToken, cBetfair_AppKey, 
                           iExchange,
                           soMarketFilter,
                           eGranularity,
                           aResult ) then
    begin
      memMsg.lines.add('Total results: ' + inttostr(length(aResult))) ;
    
      if length(aResult) > 0 then
      begin
        {********************}
        { Write header line. }
        {********************}
        memMsg.lines.add( '        ' +
                          copy('From'         + stringofchar(' ',30),1,30) + '  ' +
                          copy('To'           + stringofchar(' ',30),1,30) + '  ' +
                          'MarketCount' ) ;
        
        
        for I := 0 to length(aResult) - 1 do
        begin
          with aResult[I] do
          begin
            memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                             copy( datetimetostr(obfTimeRange.dFrom) + stringofchar(' ',30),1,30) + '  ' +
                                             copy( datetimetostr(obfTimeRange.dTo  ) + stringofchar(' ',30),1,30) + '  ' +
                                             inttostr(iMarketCount) ) ;
          end ;
        end ;
      
        for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
        setlength(aResult, 0) ;
      end ;
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;

    if recMarketFilterElements.slEventTypeId    <> nil then freeandnil(recMarketFilterElements.slEventTypeId   ) ;
    if recMarketFilterElements.slEventId        <> nil then freeandnil(recMarketFilterElements.slEventId       ) ;
    if recMarketFilterElements.slMarketTypeCode <> nil then freeandnil(recMarketFilterElements.slMarketTypeCode) ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.cbMktFilt_IncludeTimeRangeClick(Sender: TObject);
{******************************************************************************************}
begin
  edtMktFilt_DateFrom.enabled := cbMktFilt_IncludeTimeRange.checked ;
  edtMktFilt_TimeFrom.enabled := cbMktFilt_IncludeTimeRange.checked ;
  
  edtMktFilt_DateTo.enabled   := cbMktFilt_IncludeTimeRange.checked ;
  edtMktFilt_TimeTo.enabled   := cbMktFilt_IncludeTimeRange.checked ;
end ;



{******************************************************************************************}
procedure TfmMain.cbLCO_IncludeDateRangeClick(Sender: TObject);
{******************************************************************************************}
begin
  edtLCO_DateFrom.enabled := cbLCO_IncludeDateRange.checked ;
  edtLCO_TimeFrom.enabled := cbLCO_IncludeDateRange.checked ;

  edtLCO_DateTo.enabled   := cbLCO_IncludeDateRange.checked ;
  edtLCO_TimeTo.enabled   := cbLCO_IncludeDateRange.checked ;
end;



{******************************************************************************************}
procedure TfmMain.cbGAS_IncludeDateRangeClick(Sender: TObject);
{******************************************************************************************}
begin
  edtGAS_DateFrom.enabled := cbGAS_IncludeDateRange.checked ;
  edtGAS_TimeFrom.enabled := cbGAS_IncludeDateRange.checked ;

  edtGAS_DateTo.enabled   := cbGAS_IncludeDateRange.checked ;
  edtGAS_TimeTo.enabled   := cbGAS_IncludeDateRange.checked ;
end ;



{******************************************************************************************}
procedure TfmMain.cbLCLO_IncludeSettledDateRangeClick(Sender: TObject);
{******************************************************************************************}
begin
  edtLCLO_SettledDateFrom.enabled := cbLCLO_IncludeSettledDateRange.checked ;
  edtLCLO_SettledTimeFrom.enabled := cbLCLO_IncludeSettledDateRange.checked ;

  edtLCLO_SettledDateTo.enabled   := cbLCLO_IncludeSettledDateRange.checked ;
  edtLCLO_SettledTimeTo.enabled   := cbLCLO_IncludeSettledDateRange.checked ;
end;



{******************************************************************************************}
procedure TfmMain.cbShowRawJsonClick(Sender: TObject);
{******************************************************************************************}
begin
  gDebugJSON := cbShowRawJson.Checked ;
end ;



{******************************************************************************************}
procedure TfmMain.PriceProjectionClick(Sender: TObject);
{******************************************************************************************}
begin
  cbPriceData_SPAvailable.enabled               := cbMktBook_PriceProj.checked ;
  cbPriceData_SPTraded.enabled                  := cbMktBook_PriceProj.checked ;
  cbPriceData_ExBestOffers.enabled              := cbMktBook_PriceProj.checked ;
  cbPriceData_ExAllOffers.enabled               := cbMktBook_PriceProj.checked ;
  cbPriceData_ExTraded.enabled                  := cbMktBook_PriceProj.checked ;
  cbPriceProj_Virtualise.enabled                := cbMktBook_PriceProj.checked ;
  cbPriceProj_RolloverStakes.enabled            := cbMktBook_PriceProj.checked ;
  
  cbPriceProj_ExBestOO.enabled                  := cbMktBook_PriceProj.checked ;
  edtPriceProj_BestPricesDepth.enabled          := (cbMktBook_PriceProj.checked) and (cbPriceProj_ExBestOO.checked) ;
  rgPriceProj_RollupModel.enabled               := (cbMktBook_PriceProj.checked) and (cbPriceProj_ExBestOO.checked) ;
  edtPriceProj_RollupLimit.enabled              := (cbMktBook_PriceProj.checked) and (cbPriceProj_ExBestOO.checked) ;
  edtPriceProj_RollupLiabilityThreshold.enabled := (cbMktBook_PriceProj.checked) and (cbPriceProj_ExBestOO.checked) ;
  edtPriceProj_RollupLiabilityFactor.enabled    := (cbMktBook_PriceProj.checked) and (cbPriceProj_ExBestOO.checked) ;
end ;



{******************************************************************************************}
procedure TfmMain.cbMktBook_MatchProjClick(Sender: TObject);
{******************************************************************************************}
begin
  rgMktBook_MatchProj.enabled := cbMktBook_MatchProj.checked ;
end ;



{******************************************************************************************}
procedure TfmMain.cbMktBook_OrderProjClick(Sender: TObject);
{******************************************************************************************}
begin
  rgMktBook_OrderProj.enabled := cbMktBook_OrderProj.checked ;
end ;



{******************************************************************************************}
procedure TfmMain.btnStopDisplayClick(Sender: TObject);
{******************************************************************************************}
begin
  bStopDisplay := true ;
end;



{******************************************************************************************}
procedure TfmMain.UpdateOrdersDisplay(Sender: TObject);
{******************************************************************************************}
begin
  case cbPO_OrderType1.itemindex of
    cLimit:
      begin
        lblPO_LO_Size.visible        := true ;
        lblPO_LO_Price.visible       := true ;
        lblPO_LO_Persistence.visible := true ;
        edtPO_LO_Size1.visible       := true ;
        edtPO_LO_Price1.visible      := true ;
        cbPO_LO_Persistence1.visible := true ;
        
        lblPO_LOC_Liability.visible  := false ;
        lblPO_LOC_Price.visible      := false ;
        edtPO_LOC_Liability1.visible := false ;
        edtPO_LOC_Price1.visible     := false ;
        
        lblPO_MOC_Liability.visible  := false ;
        edtPO_MOC_Liability1.visible := false ;
      end ;
      
    cLimitOnClose:
      begin
        lblPO_LO_Size.visible        := false ;
        lblPO_LO_Price.visible       := false ;
        lblPO_LO_Persistence.visible := false ;
        edtPO_LO_Size1.visible       := false ;
        edtPO_LO_Price1.visible      := false ;
        cbPO_LO_Persistence1.visible := false ;
        
        lblPO_LOC_Liability.visible  := true ;
        lblPO_LOC_Price.visible      := true ;
        edtPO_LOC_Liability1.visible := true ;
        edtPO_LOC_Price1.visible     := true ;
        
        lblPO_MOC_Liability.visible  := false ;
        edtPO_MOC_Liability1.visible := false ;
      end ;
    
    cMarketOnClose:
      begin
        lblPO_LO_Size.visible        := false ;
        lblPO_LO_Price.visible       := false ;
        lblPO_LO_Persistence.visible := false ;
        edtPO_LO_Size1.visible       := false ;
        edtPO_LO_Price1.visible      := false ;
        cbPO_LO_Persistence1.visible := false ;
        
        lblPO_LOC_Liability.visible  := false ;
        lblPO_LOC_Price.visible      := false ;
        edtPO_LOC_Liability1.visible := false ;
        edtPO_LOC_Price1.visible     := false ;
        
        lblPO_MOC_Liability.visible  := true ;
        edtPO_MOC_Liability1.visible := true ;
      end ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnPlaceOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  iExchange                : integer ;
  sMarketId, sCustomerRef  : string ;
  aInstructions            : ArrayOfTbfPlaceInstructionObj ;
  oResult                  : TbfPlaceExecutionReportObj ;

begin
  try
    oResult := nil ;
    
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    sMarketId    := trim(edtPO_MarketId.text) ;
    sCustomerRef := trim(edtPO_CustomerRef.text) ;
    
    setlength(aInstructions, 0) ;
    iCount := 0 ;

    {*******}
    { BET 1 }
    {*******}
    if (cbPO_OrderType1.itemindex > -1) and (length(trim(edtPO_SelectionId1.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfPlaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        iSelectionId := strtoint64(trim(edtPO_SelectionId1.text)) ;
        if length(trim(edtPO_Handicap1.text)) > 0 then rHandicap := strtofloat(trim(edtPO_Handicap1.text   )) ;

        case edtPO_Side1.itemindex of
          0: eSide := bfsideBack ;
          1: eSide := bfsideLay ;
        end ;

        case cbPO_OrderType1.itemindex of
          cLimit:
            begin
              eOrderType := bfordtypLIMIT ;

              oLimitOrder        := TbfLimitOrderObj.create ;
              oLimitOrder.rSize  := strtofloat(trim(edtPO_LO_Size1.text )) ;
              oLimitOrder.rPrice := strtofloat(trim(edtPO_LO_Price1.text)) ;

              case cbPO_LO_Persistence1.itemindex of
                cpLapse:         oLimitOrder.ePersistenceType := bfperstypLAPSE ;
                cpPersist:       oLimitOrder.ePersistenceType := bfperstypPERSIST ;
                cpMarketOnClose: oLimitOrder.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
              end ;
            end ;
            
          cLimitOnClose:
            begin
              eOrderType := bfordtypLIMIT_ON_CLOSE ;

              oLimitOnCloseOrder            := TbfLimitOnCloseOrderObj.create ;
              oLimitOnCloseOrder.rLiability := strtofloat(trim(edtPO_LOC_Liability1.text)) ;
              oLimitOnCloseOrder.rPrice     := strtofloat(trim(edtPO_LOC_Price1.text    )) ;
            end ;
            
          cMarketOnClose:
            begin
              eOrderType := bfordtypMARKET_ON_CLOSE ;

              oMarketOnCloseOrder            := TbfMarketOnCloseOrderObj.create ;
              oMarketOnCloseOrder.rLiability := strtofloat(trim(edtPO_MOC_Liability1.text)) ;
            end ;
        end ;
      end ;
    end ;

    {*******}
    { BET 2 }
    {*******}
    if (cbPO_OrderType2.itemindex > -1) and (length(trim(edtPO_SelectionId2.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfPlaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        iSelectionId := strtoint64(trim(edtPO_SelectionId2.text)) ;
        if length(trim(edtPO_Handicap2.text)) > 0 then rHandicap := strtofloat(trim(edtPO_Handicap2.text   )) ;

        case edtPO_Side2.itemindex of
          0: eSide := bfsideBack ;
          1: eSide := bfsideLay ;
        end ;

        case cbPO_OrderType2.itemindex of
          cLimit:
            begin
              eOrderType := bfordtypLIMIT ;

              oLimitOrder        := TbfLimitOrderObj.create ;
              oLimitOrder.rSize  := strtofloat(trim(edtPO_LO_Size2.text )) ;
              oLimitOrder.rPrice := strtofloat(trim(edtPO_LO_Price2.text)) ;

              case cbPO_LO_Persistence2.itemindex of
                cpLapse:         oLimitOrder.ePersistenceType := bfperstypLAPSE ;
                cpPersist:       oLimitOrder.ePersistenceType := bfperstypPERSIST ;
                cpMarketOnClose: oLimitOrder.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
              end ;
            end ;
            
          cLimitOnClose:
            begin
              eOrderType := bfordtypLIMIT_ON_CLOSE ;

              oLimitOnCloseOrder            := TbfLimitOnCloseOrderObj.create ;
              oLimitOnCloseOrder.rLiability := strtofloat(trim(edtPO_LOC_Liability2.text)) ;
              oLimitOnCloseOrder.rPrice     := strtofloat(trim(edtPO_LOC_Price2.text    )) ;
            end ;
            
          cMarketOnClose:
            begin
              eOrderType := bfordtypMARKET_ON_CLOSE ;

              oMarketOnCloseOrder            := TbfMarketOnCloseOrderObj.create ;
              oMarketOnCloseOrder.rLiability := strtofloat(trim(edtPO_MOC_Liability2.text)) ;
            end ;
        end ;
      end ;
    end ;

    {*******}
    { BET 3 }
    {*******}
    if (cbPO_OrderType3.itemindex > -1) and (length(trim(edtPO_SelectionId3.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfPlaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        iSelectionId := strtoint64(trim(edtPO_SelectionId3.text)) ;
        if length(trim(edtPO_Handicap3.text)) > 0 then rHandicap := strtofloat(trim(edtPO_Handicap3.text   )) ;

        case edtPO_Side3.itemindex of
          0: eSide := bfsideBack ;
          1: eSide := bfsideLay ;
        end ;

        case cbPO_OrderType3.itemindex of
          cLimit:
            begin
              eOrderType := bfordtypLIMIT ;

              oLimitOrder        := TbfLimitOrderObj.create ;
              oLimitOrder.rSize  := strtofloat(trim(edtPO_LO_Size3.text )) ;
              oLimitOrder.rPrice := strtofloat(trim(edtPO_LO_Price3.text)) ;

              case cbPO_LO_Persistence3.itemindex of
                cpLapse:         oLimitOrder.ePersistenceType := bfperstypLAPSE ;
                cpPersist:       oLimitOrder.ePersistenceType := bfperstypPERSIST ;
                cpMarketOnClose: oLimitOrder.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
              end ;
            end ;
            
          cLimitOnClose:
            begin
              eOrderType := bfordtypLIMIT_ON_CLOSE ;

              oLimitOnCloseOrder            := TbfLimitOnCloseOrderObj.create ;
              oLimitOnCloseOrder.rLiability := strtofloat(trim(edtPO_LOC_Liability3.text)) ;
              oLimitOnCloseOrder.rPrice     := strtofloat(trim(edtPO_LOC_Price3.text    )) ;
            end ;
            
          cMarketOnClose:
            begin
              eOrderType := bfordtypMARKET_ON_CLOSE ;

              oMarketOnCloseOrder            := TbfMarketOnCloseOrderObj.create ;
              oMarketOnCloseOrder.rLiability := strtofloat(trim(edtPO_MOC_Liability3.text)) ;
            end ;
        end ;
      end ;
    end ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling placeOrders...........') ;

    if bfngPlaceOrders( sBetfairSessionToken, cBetfair_AppKey, 
                        iExchange,
                        sMarketId,
                        aInstructions,
                        sCustomerRef,
                        oResult ) then
    begin
      if oResult <> nil then
      begin
        memMsg.lines.add('') ;

        memMsg.lines.add('MarketId    : ' + oResult.sMarketId) ;
        memMsg.lines.add('CustomerRef : ' + oResult.sCustomerRef) ;
        memMsg.lines.add('Status      : ' + TbfngExecutionReportStatusToStr   (oResult.eStatus   )) ;
        memMsg.lines.add('ErrorCode   : ' + TbfngExecutionReportErrorCodeToStr(oResult.eErrorCode)) ;

        if length(oResult.aInstructionReports) > 0 then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add(inttostr(length(oResult.aInstructionReports)) + ' Instruction Reports:') ;
          
          for I := 0 to length(oResult.aInstructionReports) - 1 do
          begin
            memMsg.lines.add('') ;
          
            with oResult.aInstructionReports[I] do
            begin
              memMsg.lines.add(inttostr(I+1) + ') Status          : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
              memMsg.lines.add('ErrorCode          : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;
              memMsg.lines.add('PlacedDate         : ' + datetimetostr(dPlacedDate)) ;
              
              memMsg.lines.add('BetId              : ' + sBetId) ;
              
              case I of
                0: begin
                     edtCO_BetId1.text := sBetId ;
                     edtRO_BetId1.text := sBetId ;
                     edtUO_BetId1.text := sBetId ;
                   end ;
                   
                1: begin
                     edtCO_BetId2.text := sBetId ;
                     edtRO_BetId2.text := sBetId ;
                     edtUO_BetId2.text := sBetId ;
                   end ;
                   
                2: begin
                     edtCO_BetId3.text := sBetId ;
                     edtRO_BetId3.text := sBetId ;
                     edtUO_BetId3.text := sBetId ;
                   end ;
              end ;


              if oInstruction <> nil then
              begin
                with oInstruction do
                begin
                  memMsg.lines.add('OrderType          : ' + TbfngOrderTypeToStr(eOrderType)) ;
                  memMsg.lines.add('SelectionId        : ' + inttostr(iSelectionId)) ;
                  memMsg.lines.add('Handicap           : ' + floattostr(rHandicap)) ;
                  memMsg.lines.add('Side               : ' + TbfngSideToStr(eSide)) ;

                  if oLimitOrder <> nil then
                    memMsg.lines.add('LimitOrder         : £' + floattostrf(oLimitOrder.rSize,ffFixed,15,2) + ' @ ' + floattostrf(oLimitOrder.rPrice,ffFixed,15,2) + '  ' + TbfngPersistenceTypeToStr(oLimitOrder.ePersistenceType)) ;

                  if oLimitOnCloseOrder <> nil then
                    memMsg.lines.add('LimitOnCloseOrder  : £' + floattostrf(oLimitOnCloseOrder.rLiability,ffFixed,15,2) + ' liability @ ' + floattostrf(oLimitOnCloseOrder.rPrice,ffFixed,15,2) ) ;

                  if oMarketOnCloseOrder <> nil then
                    memMsg.lines.add('MarketOnCloseOrder : £' + floattostrf(oMarketOnCloseOrder.rLiability,ffFixed,15,2) + ' liability' ) ;
                end ;
              end ;

              memMsg.lines.add('PlacedDate         : ' + datetimetostr(dPlacedDate)) ;
              memMsg.lines.add('AveragePriceMatched: ' + floattostrf(rAveragePriceMatched,ffFixed,15,2)) ;
              memMsg.lines.add('SizeMatched        : ' + floattostrf(rSizeMatched,ffFixed,15,2)) ;
            end ;
          end ;
        end else
        begin
          memMsg.lines.add('No Instruction Reports.') ;
        end ;

        if oResult <> nil then freeandnil(oResult) ;
      end ;
      
      if length(aInstructions) > 0 then
      begin
        for I := 0 to length(aInstructions) - 1 do freeandnil(aInstructions[I]) ;
        setlength(aInstructions, 0) ;
      end ;
      
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnCancelOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  iExchange                : integer ;
  sMarketId, sCustomerRef  : string ;
  aInstructions            : ArrayOfTbfCancelInstructionObj ;
  oResult                  : TbfCancelExecutionReportObj ;

begin
  try
    oResult := nil ;
    
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    sMarketId    := trim(edtPO_MarketId.text) ;
    sCustomerRef := trim(edtPO_CustomerRef.text) ;
    
    setlength(aInstructions, 0) ;
    iCount := 0 ;

    {*******}
    { BET 1 }
    {*******}
    if (length(trim(edtCO_BetId1.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfCancelInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtCO_BetId1.text) ;
        if length(trim(edtCO_SizeReduction1.text)) > 0 then rSizeReduction := strtofloat(trim(edtCO_SizeReduction1.text)) ;
      end ;
    end ;

    {*******}
    { BET 2 }
    {*******}
    if (length(trim(edtCO_BetId2.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfCancelInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtCO_BetId2.text) ;
        if length(trim(edtCO_SizeReduction2.text)) > 0 then rSizeReduction := strtofloat(trim(edtCO_SizeReduction2.text)) ;
      end ;
    end ;

    {*******}
    { BET 3 }
    {*******}
    if (length(trim(edtCO_BetId3.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfCancelInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtCO_BetId3.text) ;
        if length(trim(edtCO_SizeReduction3.text)) > 0 then rSizeReduction := strtofloat(trim(edtCO_SizeReduction3.text)) ;
      end ;
    end ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling cancelOrders...........') ;

    if bfngCancelOrders( sBetfairSessionToken, cBetfair_AppKey, 
                         iExchange,
                         sMarketId,
                         aInstructions,
                         sCustomerRef,
                         oResult ) then
    begin
      if oResult <> nil then
      begin
        memMsg.lines.add('') ;
        memMsg.lines.add('MarketId    : ' + oResult.sMarketId) ;
        memMsg.lines.add('CustomerRef : ' + oResult.sCustomerRef) ;
        memMsg.lines.add('Status      : ' + TbfngExecutionReportStatusToStr   (oResult.eStatus   )) ;
        memMsg.lines.add('ErrorCode   : ' + TbfngExecutionReportErrorCodeToStr(oResult.eErrorCode)) ;


        if length(oResult.aInstructionReports) > 0 then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add(inttostr(length(oResult.aInstructionReports)) + ' Instruction Reports:') ;
          
          for I := 0 to length(oResult.aInstructionReports) - 1 do
          begin
            memMsg.lines.add('') ;
          
            with oResult.aInstructionReports[I] do
            begin
              memMsg.lines.add(inttostr(I+1) + ') Status          : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
              memMsg.lines.add('ErrorCode          : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;
              memMsg.lines.add('CancelledDate      : ' + datetimetostr(dCancelledDate)) ;

              if oInstruction <> nil then
              begin
                memMsg.lines.add('BetId              : ' + oInstruction.sBetId) ;
                memMsg.lines.add('SizeReduction      : ' + floattostrf(oInstruction.rSizeReduction,ffFixed,15,2)) ;
              end ;

              memMsg.lines.add('SizeCancelled      : ' + floattostrf(rSizeCancelled,ffFixed,15,2)) ;
            end ;
          end ;
        end else
        begin
          memMsg.lines.add('No Instruction Reports.') ;
        end ;

        if oResult <> nil then freeandnil(oResult) ;
      end ;
      
      if length(aInstructions) > 0 then
      begin
        for I := 0 to length(aInstructions) - 1 do freeandnil(aInstructions[I]) ;
        setlength(aInstructions, 0) ;
      end ;
      
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnReplaceOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  iExchange                : integer ;
  sMarketId, sCustomerRef  : string ;
  aInstructions            : ArrayOfTbfReplaceInstructionObj ;
  oResult                  : TbfReplaceExecutionReportObj ;

begin
  try
    oResult := nil ;
    
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    sMarketId    := trim(edtPO_MarketId.text) ;
    sCustomerRef := trim(edtPO_CustomerRef.text) ;
    
    setlength(aInstructions, 0) ;
    iCount := 0 ;

    {*******}
    { BET 1 }
    {*******}
    if (length(trim(edtRO_BetId1.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfReplaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtRO_BetId1.text) ;
        if length(trim(edtRO_NewPrice1.text)) > 0 then rNewPrice := strtofloat(trim(edtRO_NewPrice1.text)) ;
      end ;
    end ;

    {*******}
    { BET 2 }
    {*******}
    if (length(trim(edtRO_BetId2.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfReplaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtRO_BetId2.text) ;
        if length(trim(edtRO_NewPrice2.text)) > 0 then rNewPrice := strtofloat(trim(edtRO_NewPrice2.text)) ;
      end ;
    end ;

    {*******}
    { BET 3 }
    {*******}
    if (length(trim(edtRO_BetId3.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfReplaceInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtRO_BetId3.text) ;
        if length(trim(edtRO_NewPrice3.text)) > 0 then rNewPrice := strtofloat(trim(edtRO_NewPrice3.text)) ;
      end ;
    end ;



    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling replaceOrders...........') ;

    if bfngReplaceOrders( sBetfairSessionToken, cBetfair_AppKey, 
                          iExchange,
                          sMarketId,
                          aInstructions,
                          sCustomerRef,
                          oResult ) then
    begin
      if oResult <> nil then
      begin
        memMsg.lines.add('') ;
        memMsg.lines.add('MarketId    : ' + oResult.sMarketId) ;
        memMsg.lines.add('CustomerRef : ' + oResult.sCustomerRef) ;
        memMsg.lines.add('Status      : ' + TbfngExecutionReportStatusToStr   (oResult.eStatus   )) ;
        memMsg.lines.add('ErrorCode   : ' + TbfngExecutionReportErrorCodeToStr(oResult.eErrorCode)) ;

        if length(oResult.aInstructionReports) > 0 then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add(inttostr(length(oResult.aInstructionReports)) + ' Instruction Reports:') ;
          
          for I := 0 to length(oResult.aInstructionReports) - 1 do
          begin
            memMsg.lines.add('') ;
          
            with oResult.aInstructionReports[I] do
            begin
              memMsg.lines.add(inttostr(I+1) + ') Status          : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
              memMsg.lines.add('ErrorCode          : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;

              if oCancelInstructionReport <> nil then
              begin
                with oCancelInstructionReport do
                begin
                  memMsg.lines.add('Cancel Report:') ;
                  memMsg.lines.add('Status         : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
                  memMsg.lines.add('ErrorCode      : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;
                  memMsg.lines.add('CancelledDate  : ' + datetimetostr(dCancelledDate)) ;

                  if oInstruction <> nil then
                  begin
                    memMsg.lines.add('BetId              : ' + oInstruction.sBetId) ;
                    memMsg.lines.add('SizeReduction      : ' + floattostrf(oInstruction.rSizeReduction,ffFixed,15,2)) ;
                  end ;

                  memMsg.lines.add('SizeCancelled      : ' + floattostrf(rSizeCancelled,ffFixed,15,2)) ;
                end ;
              end ;


              if oPlaceInstructionReport <> nil then
              begin
                with oPlaceInstructionReport do
                begin
                  memMsg.lines.add('Place Report:') ;
                  memMsg.lines.add('Status             : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
                  memMsg.lines.add('ErrorCode          : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;
                  memMsg.lines.add('PlacedDate         : ' + datetimetostr(dPlacedDate)) ;
              
                  memMsg.lines.add('BetId              : ' + sBetId) ;
              
                  if oInstruction <> nil then
                  begin
                    with oInstruction do
                    begin
                      memMsg.lines.add('OrderType          : ' + TbfngOrderTypeToStr(eOrderType)) ;
                      memMsg.lines.add('SelectionId        : ' + inttostr(iSelectionId)) ;
                      memMsg.lines.add('Handicap           : ' + floattostr(rHandicap)) ;
                      memMsg.lines.add('Side               : ' + TbfngSideToStr(eSide)) ;

                      if oLimitOrder <> nil then
                        memMsg.lines.add('LimitOrder         : £' + floattostrf(oLimitOrder.rSize,ffFixed,15,2) + ' @ ' + floattostrf(oLimitOrder.rPrice,ffFixed,15,2) + '  ' + TbfngPersistenceTypeToStr(oLimitOrder.ePersistenceType)) ;

                      if oLimitOnCloseOrder <> nil then
                        memMsg.lines.add('LimitOnCloseOrder  : £' + floattostrf(oLimitOnCloseOrder.rLiability,ffFixed,15,2) + ' liability @ ' + floattostrf(oLimitOnCloseOrder.rPrice,ffFixed,15,2) ) ;

                      if oMarketOnCloseOrder <> nil then
                        memMsg.lines.add('MarketOnCloseOrder : £' + floattostrf(oMarketOnCloseOrder.rLiability,ffFixed,15,2) + ' liability' ) ;
                    end ;
                  end ;

                  memMsg.lines.add('PlacedDate         : ' + datetimetostr(dPlacedDate)) ;
                  memMsg.lines.add('AveragePriceMatched: ' + floattostrf(rAveragePriceMatched,ffFixed,15,2)) ;
                  memMsg.lines.add('SizeMatched        : ' + floattostrf(rSizeMatched,ffFixed,15,2)) ;
                end ;
              end ;
            end ;
          end ;
        end else
        begin
          memMsg.lines.add('No Instruction Reports.') ;
        end ;

        if oResult <> nil then freeandnil(oResult) ;
      end ;
      
      if length(aInstructions) > 0 then
      begin
        for I := 0 to length(aInstructions) - 1 do freeandnil(aInstructions[I]) ;
        setlength(aInstructions, 0) ;
      end ;
      
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnUpdateOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  iExchange                : integer ;
  sMarketId, sCustomerRef  : string ;
  aInstructions            : ArrayOfTbfUpdateInstructionObj ;
  oResult                  : TbfUpdateExecutionReportObj ;

begin
  try
    oResult := nil ;
    
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;

    sMarketId    := trim(edtPO_MarketId.text) ;
    sCustomerRef := trim(edtPO_CustomerRef.text) ;
    
    setlength(aInstructions, 0) ;
    iCount := 0 ;

    {*******}
    { BET 1 }
    {*******}
    if (length(trim(edtUO_BetId1.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfUpdateInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtUO_BetId1.text) ;

        case cbUO_Persistence1.itemindex of
          cpLapse:         ePersistenceType := bfperstypLAPSE ;
          cpPersist:       ePersistenceType := bfperstypPERSIST ;
          cpMarketOnClose: ePersistenceType := bfperstypMARKET_ON_CLOSE ;
        end ;
      end ;
    end ;

    {*******}
    { BET 2 }
    {*******}
    if (length(trim(edtUO_BetId2.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfUpdateInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtUO_BetId2.text) ;

        case cbUO_Persistence2.itemindex of
          cpLapse:         ePersistenceType := bfperstypLAPSE ;
          cpPersist:       ePersistenceType := bfperstypPERSIST ;
          cpMarketOnClose: ePersistenceType := bfperstypMARKET_ON_CLOSE ;
        end ;
      end ;
    end ;

    {*******}
    { BET 3 }
    {*******}
    if (length(trim(edtUO_BetId3.text)) > 0) then
    begin
      inc(iCount) ;
      setlength(aInstructions, iCount) ;
      aInstructions[iCount-1] := TbfUpdateInstructionObj.create ;

      with aInstructions[iCount-1] do
      begin
        sBetId := trim(edtUO_BetId3.text) ;

        case cbUO_Persistence3.itemindex of
          cpLapse:         ePersistenceType := bfperstypLAPSE ;
          cpPersist:       ePersistenceType := bfperstypPERSIST ;
          cpMarketOnClose: ePersistenceType := bfperstypMARKET_ON_CLOSE ;
        end ;
      end ;
    end ;




    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling updateOrders...........') ;

    if bfngUpdateOrders( sBetfairSessionToken, cBetfair_AppKey, 
                         iExchange,
                         sMarketId,
                         aInstructions,
                         sCustomerRef,
                         oResult ) then
    begin
      if oResult <> nil then
      begin
        memMsg.lines.add('') ;
        memMsg.lines.add('MarketId    : ' + oResult.sMarketId) ;
        memMsg.lines.add('CustomerRef : ' + oResult.sCustomerRef) ;
        memMsg.lines.add('Status      : ' + TbfngExecutionReportStatusToStr   (oResult.eStatus   )) ;
        memMsg.lines.add('ErrorCode   : ' + TbfngExecutionReportErrorCodeToStr(oResult.eErrorCode)) ;

        if length(oResult.aInstructionReports) > 0 then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add(inttostr(length(oResult.aInstructionReports)) + ' Instruction Reports:') ;
          
          for I := 0 to length(oResult.aInstructionReports) - 1 do
          begin
            memMsg.lines.add('') ;
          
            with oResult.aInstructionReports[I] do
            begin
              memMsg.lines.add(inttostr(I+1) + ') Status          : ' + TbfngInstructionReportStatusToStr(eStatus)) ;
              memMsg.lines.add('ErrorCode          : ' + TbfngInstructionReportErrorCodeToStr(eErrorCode)) ;

              if oInstruction <> nil then
              begin
                memMsg.lines.add('BetId              : ' + oInstruction.sBetId) ;
                memMsg.lines.add('PersistenceType    : ' + TbfngPersistenceTypeToStr(oInstruction.ePersistenceType) ) ;
              end ;
            end ;
          end ;
        end else
        begin
          memMsg.lines.add('No Instruction Reports.') ;
        end ;

        if oResult <> nil then freeandnil(oResult) ;
      end ;
      
      if length(aInstructions) > 0 then
      begin
        for I := 0 to length(aInstructions) - 1 do freeandnil(aInstructions[I]) ;
        setlength(aInstructions, 0) ;
      end ;
      
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListCurrentOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  iHour, iMin, iSec, iMSec : word ;
  iYear, iMonth,iDay       : word ;
  dWork1, dWork2           : TdateTime ;
  iExchange                : integer ;
  sMarketId, sCustomerRef  : string ;
  slBetIds                 : TStringList ;
  slMarketIds              : TStringList ;
  eOrderProjection         : TbfngOrderProjection ;
  oPlacedDateRange         : TbfTimeRangeObj ;
  eOrderBy                 : TbfngOrderBy ;
  eSortDir                 : TbfngSortDir ;
  oResult                  : TbfCurrentOrderSummaryReportObj ;

begin
  try
    try
      oResult := nil ;
    
      {**********}
      { Exchange }
      {**********}
      case cbExchange.itemindex of
        0: iExchange := cbfngUKExchange ;
        1: iExchange := cbfngAUSExchange ;
      else
        iExchange := cbfngUKExchange ;
      end ;


      {********}
      { BetIds }
      {********}
      slBetIds := TStringList.create ;
      if length(trim(edtLCO_BetId1.text)) > 0 then slBetIds.add(trim(edtLCO_BetId1.text)) ;
      if length(trim(edtLCO_BetId2.text)) > 0 then slBetIds.add(trim(edtLCO_BetId2.text)) ;
      if length(trim(edtLCO_BetId3.text)) > 0 then slBetIds.add(trim(edtLCO_BetId3.text)) ;


      {***********}
      { MarketIds }
      {***********}
      slMarketIds := TStringList.create ;
      if length(trim(edtLCO_MarketId1.text)) > 0 then slMarketIds.add(trim(edtLCO_MarketId1.text)) ;
      if length(trim(edtLCO_MarketId2.text)) > 0 then slMarketIds.add(trim(edtLCO_MarketId2.text)) ;
      if length(trim(edtLCO_MarketId3.text)) > 0 then slMarketIds.add(trim(edtLCO_MarketId3.text)) ;


      {*****************}
      { OrderProjection }
      {*****************}
      eOrderProjection := bforpNone ;
      case cbLCO_OrderProjection.itemindex of
         0: eOrderProjection := bforpALL ;
         1: eOrderProjection := bforpEXECUTABLE ;
         2: eOrderProjection := bforpEXECUTION_COMPLETE ;
      end ;


      {*****************}
      { PlacedDateRange }
      {*****************}
      oPlacedDateRange := nil ;

      if cbLCO_IncludeDateRange.checked then
      begin
        decodedate(edtLCO_DateFrom.Date, iYear, iMonth, iDay) ;
        decodetime(edtLCO_TimeFrom.Time, iHour, iMin, iSec, iMSec) ;
        dWork1 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;

        decodedate(edtLCO_DateTo.Date, iYear, iMonth, iDay) ;
        decodetime(edtLCO_TimeTo.Time, iHour, iMin, iSec, iMSec) ;
        dWork2 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;
      
        oPlacedDateRange       := TbfTimeRangeObj.create ;
        oPlacedDateRange.dFrom := dWork1 ;
        oPlacedDateRange.dTo   := dWork2 ;
      end ;
    
    
      {*********}
      { OrderBy }
      {*********}
      eOrderBy := bfordbyNone ;
      case cbLCO_OrderBy.itemindex of
        0: eOrderBy := bfordbyBY_BET ;
        1: eOrderBy := bfordbyBY_MARKET ;
        2: eOrderBy := bfordbyBY_MATCH_TIME ;
      end ;


      {*********}
      { SortDir }
      {*********}
      eSortDir := bfsortdirNone ;
      case cbLCO_SortDir.itemindex of
        0: eSortDir := bfsortdirEARLIEST_TO_LATEST ;
        1: eSortDir := bfsortdirLATEST_TO_EARLIEST ;
      end ;
    

      {**********************}
      { Call API-NG function }
      {**********************}
      memMsg.lines.add('') ;
      memMsg.lines.add('Calling listCurrentOrders...........') ;

      if bfngListCurrentOrders( sBetfairSessionToken, cBetfair_AppKey, 
                                iExchange,
                                slBetIds,
                                slMarketIds,
                                eOrderProjection,
                                oPlacedDateRange,
                                eOrderBy,
                                eSortDir,
                                oResult ) then
      begin
        if oResult <> nil then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add('More Available : ' + iifstr(oResult.bMoreAvailable,'YES','No')) ;

          if length(oResult.aCurrentOrders) > 0 then
          begin
            bStopDisplay := false ;
            I := 0 ;
          
            while (I <= length(oResult.aCurrentOrders) - 1) and (not bStopDisplay) do
            begin
              memMsg.lines.add('') ;
              memMsg.lines.add('Order ' + inttostr(I+1) + ')') ;
              memMsg.lines.add('BetId               : ' + oResult.aCurrentOrders[I].sBetId ) ;
              memMsg.lines.add('MarketId            : ' + oResult.aCurrentOrders[I].sMarketId ) ;
              memMsg.lines.add('SelectionId         : ' + inttostr(oResult.aCurrentOrders[I].iSelectionId) ) ;
              memMsg.lines.add('Handicap            : ' + floattostrf(oResult.aCurrentOrders[I].rHandicap,ffFixed,15,2) ) ;
              memMsg.lines.add('PriceSize           : ' + '£' + floattostrf(oResult.aCurrentOrders[I].oPriceSize.rSize,ffFixed,15,2) + ' @ ' + floattostrf(oResult.aCurrentOrders[I].oPriceSize.rPrice,ffFixed,15,2) ) ;
              memMsg.lines.add('BSPLiability        : ' + floattostrf(oResult.aCurrentOrders[I].rBSPLiability,ffFixed,15,2) ) ;
              memMsg.lines.add('Side                : ' + TbfngSideToStr(oResult.aCurrentOrders[I].eSide) ) ;
              memMsg.lines.add('Status              : ' + TbfngOrderStatusToStr(oResult.aCurrentOrders[I].eStatus) ) ;
              memMsg.lines.add('PersistenceType     : ' + TbfngPersistenceTypeToStr(oResult.aCurrentOrders[I].ePersistenceType) ) ;
              memMsg.lines.add('OrderType           : ' + TbfngOrderTypeToStr(oResult.aCurrentOrders[I].eOrderType) ) ;
              memMsg.lines.add('PlacedDate          : ' + datetimetostr(oResult.aCurrentOrders[I].dPlacedDate) ) ;
              memMsg.lines.add('MatchedDate         : ' + datetimetostr(oResult.aCurrentOrders[I].dMatchedDate) ) ;
              memMsg.lines.add('AveragePriceMatched : ' + floattostrf(oResult.aCurrentOrders[I].rAveragePriceMatched,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeMatched         : ' + floattostrf(oResult.aCurrentOrders[I].rSizeMatched,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeRemaining       : ' + floattostrf(oResult.aCurrentOrders[I].rSizeRemaining,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeLapsed          : ' + floattostrf(oResult.aCurrentOrders[I].rSizeLapsed,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeCancelled       : ' + floattostrf(oResult.aCurrentOrders[I].rSizeCancelled,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeVoided          : ' + floattostrf(oResult.aCurrentOrders[I].rSizeVoided,ffFixed,15,2) ) ;
              memMsg.lines.add('RegulatorAuthCode   : ' + oResult.aCurrentOrders[I].sRegulatorAuthCode ) ;
              memMsg.lines.add('RegulatorCode       : ' + oResult.aCurrentOrders[I].sRegulatorCode ) ;
            
              inc(I) ;
              application.processmessages ;
            end ;
          end else
          begin
            memMsg.lines.add('No current orders.') ;
          end ;

          freeandnil(oResult) ;
        end ;
      
      end else
      begin
        memMsg.lines.add('Call FAILED!') ;
      end ;
    
    except
      on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
    end ;
  finally
    slBetIds.free ;
    slMarketIds.free ;
    oPlacedDateRange.free ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListClearedOrdersClick(Sender: TObject);
{******************************************************************************************}
var
  I                        : longint ;
  iHour, iMin, iSec, iMSec : word ;
  iYear, iMonth,iDay       : word ;
  dWork1, dWork2           : TdateTime ;
  iExchange                : integer ;
  eBetStatus               : TbfngBetStatus ;
  slEventTypeIds           : TStringList ;
  slEventIds               : TStringList ;
  slMarketIds              : TStringList ;
  aRunnerIds               : ArrayOfTbfRunnerIdObj ;
  slBetIds                 : TStringList ;
  eSide                    : TbfngSide ;
  oSettledDateRange        : TbfTimeRangeObj ;
  eGroupBy                 : TbfngGroupBy ;
  bIncludeItemDescription  : boolean ;
  sLocale                  : string ;
  oResult                  : TbfClearedOrderSummaryReportObj ;

begin
  try
    try
      slEventTypeIds     := nil ;
      slEventIds         := nil ;
      slMarketIds        := nil ;
      slBetIds           := nil ;
      oSettledDateRange  := nil ;
      oResult            := nil ;
    
      {**********}
      { Exchange }
      {**********}
      case cbExchange.itemindex of
        0: iExchange := cbfngUKExchange ;
        1: iExchange := cbfngAUSExchange ;
      else
        iExchange := cbfngUKExchange ;
      end ;


      {************}
      { Bet Status }
      {************}
      case cbLCLO_BetStatus.itemindex of
        0: eBetStatus := bfbetstSETTLED ;
        1: eBetStatus := bfbetstVOIDED ;
        2: eBetStatus := bfbetstLAPSED ;
        3: eBetStatus := bfbetstCANCELLED ;
      end ;


      {****************}
      { Event Type Ids }
      {****************}
      slEventTypeIds := TStringList.create ;
      if length(trim(edtLCLO_EventTypeId1.text)) > 0 then slEventTypeIds.add(trim(edtLCLO_EventTypeId1.text)) ;
      if length(trim(edtLCLO_EventTypeId2.text)) > 0 then slEventTypeIds.add(trim(edtLCLO_EventTypeId2.text)) ;
      if length(trim(edtLCLO_EventTypeId3.text)) > 0 then slEventTypeIds.add(trim(edtLCLO_EventTypeId3.text)) ;


      {****************}
      { Event Ids      }
      {****************}
      slEventIds := TStringList.create ;
      if length(trim(edtLCLO_EventId1.text)) > 0 then slEventIds.add(trim(edtLCLO_EventId1.text)) ;
      if length(trim(edtLCLO_EventId2.text)) > 0 then slEventIds.add(trim(edtLCLO_EventId2.text)) ;
      if length(trim(edtLCLO_EventId3.text)) > 0 then slEventIds.add(trim(edtLCLO_EventId3.text)) ;


      {****************}
      { Market Ids     }
      {****************}
      slMarketIds := TStringList.create ;
      if length(trim(edtLCLO_MarketId1.text)) > 0 then slMarketIds.add(trim(edtLCLO_MarketId1.text)) ;
      if length(trim(edtLCLO_MarketId2.text)) > 0 then slMarketIds.add(trim(edtLCLO_MarketId2.text)) ;
      if length(trim(edtLCLO_MarketId3.text)) > 0 then slMarketIds.add(trim(edtLCLO_MarketId3.text)) ;

 
      {****************}
      { Runner Ids     }
      {****************}
      setlength(aRunnerIds, 0) ;
      if (length(trim(edtLCLO_Runner_MarketId1.text)) > 0) and (length(trim(edtLCLO_Runner_SelId1.text)) > 0) then
      begin
        setlength(aRunnerIds, 1) ;
        aRunnerIds[0] := TbfRunnerIdObj.create ;
        aRunnerIds[0].sMarketId    := edtLCLO_Runner_MarketId1.text ;
        aRunnerIds[0].iSelectionId := strtoint64(edtLCLO_Runner_SelId1.text) ;
        aRunnerIds[0].rHandicap    := -1 ;
      end ;


      {********}
      { BetIds }
      {********}
      slBetIds := TStringList.create ;
      if length(trim(edtLCLO_BetId1.text)) > 0 then slBetIds.add(trim(edtLCLO_BetId1.text)) ;
      if length(trim(edtLCLO_BetId2.text)) > 0 then slBetIds.add(trim(edtLCLO_BetId2.text)) ;
      if length(trim(edtLCLO_BetId3.text)) > 0 then slBetIds.add(trim(edtLCLO_BetId3.text)) ;


      {*********}
      { Side    }
      {*********}
      case cbLCLO_Side.itemindex of
        0: eSide := bfsideUnknown ;
        1: eSide := bfsideBACK ;
        2: eSide := bfsideLAY ;
      end ;


      {********************}
      { Settled Date Range }
      {********************}
      oSettledDateRange := nil ;

      if cbLCLO_IncludeSettledDateRange.checked then
      begin
        decodedate(edtLCLO_SettledDateFrom.Date, iYear, iMonth, iDay) ;
        decodetime(edtLCLO_SettledTimeFrom.Time, iHour, iMin, iSec, iMSec) ;
        dWork1 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;

        decodedate(edtLCLO_SettledDateTo.Date, iYear, iMonth, iDay) ;
        decodetime(edtLCLO_SettledTimeTo.Time, iHour, iMin, iSec, iMSec) ;
        dWork2 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;
      
        oSettledDateRange       := TbfTimeRangeObj.create ;
        oSettledDateRange.dFrom := dWork1 ;
        oSettledDateRange.dTo   := dWork2 ;
      end ;


      {**********}
      { Group By }
      {**********}
      case cbLCLO_GroupBy.itemindex of
        0: eGroupBy := bfgrpbyNone ;
        1: eGroupBy := bfgrpbyEVENT_TYPE ;
        2: eGroupBy := bfgrpbyEVENT ;
        3: eGroupBy := bfgrpbyMARKET ;
        4: eGroupBy := bfgrpbyRUNNER ;
        5: eGroupBy := bfgrpbySIDE ;
        6: eGroupBy := bfgrpbyBET ;
      end ;    


      {******************}
      { Item Description }
      {******************}
      bIncludeItemDescription := cbLCLO_IncludeItemDesc.checked ;
    
    
      {********}
      { Locale }
      {********}
      sLocale := '' ;



      {**********************}
      { Call API-NG function }
      {**********************}
      memMsg.lines.add('') ;
      memMsg.lines.add('Calling listClearedOrders...........') ;

      if bfngListClearedOrders( sBetfairSessionToken, cBetfair_AppKey, 
                                iExchange,
                                eBetStatus,
                                slEventTypeIds,
                                slEventIds,
                                slMarketIds,
                                aRunnerIds,
                                slBetIds,
                                eSide,
                                oSettledDateRange,
                                eGroupBy,
                                bIncludeItemDescription,
                                sLocale,
                                oResult ) then
      begin
        if oResult <> nil then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add('More Available : ' + iifstr(oResult.bMoreAvailable,'YES','No')) ;

          if length(oResult.aClearedOrders) > 0 then
          begin
            bStopDisplay := false ;
            I := 0 ;
          
            while (I <= length(oResult.aClearedOrders) - 1) and (not bStopDisplay) do
            begin
              memMsg.lines.add('') ;
              memMsg.lines.add('Order ' + inttostr(I+1) + ')') ;
              memMsg.lines.add('EventTypeId     : ' + oResult.aClearedOrders[I].sEventTypeId ) ;
              memMsg.lines.add('EventId         : ' + oResult.aClearedOrders[I].sEventId ) ;
              memMsg.lines.add('MarketId        : ' + oResult.aClearedOrders[I].sMarketId ) ;
              memMsg.lines.add('SelectionId     : ' + inttostr(oResult.aClearedOrders[I].iSelectionId) ) ;
              memMsg.lines.add('Handicap        : ' + floattostrf(oResult.aClearedOrders[I].rHandicap,ffFixed,15,2) ) ;
              memMsg.lines.add('BetId           : ' + oResult.aClearedOrders[I].sBetId ) ;
              memMsg.lines.add('PlacedDate      : ' + datetimetostr(oResult.aClearedOrders[I].dPlacedDate) ) ;
              memMsg.lines.add('PersistenceType : ' + TbfngPersistenceTypeToStr(oResult.aClearedOrders[I].ePersistenceType) ) ;
              memMsg.lines.add('OrderType       : ' + TbfngOrderTypeToStr(oResult.aClearedOrders[I].eOrderType) ) ;
              memMsg.lines.add('Side            : ' + TbfngSideToStr(oResult.aClearedOrders[I].eSide) ) ;
            
              if oResult.aClearedOrders[I].oItemDescription <> nil then
              begin
                memMsg.lines.add('ItemDescription :') ;


                memMsg.lines.add('  EventTypeDesc   : ' + oResult.aClearedOrders[I].oItemDescription.sEventTypeDesc ) ;
                memMsg.lines.add('  EventDesc       : ' + oResult.aClearedOrders[I].oItemDescription.sEventDesc ) ;
                memMsg.lines.add('  MarketDesc      : ' + oResult.aClearedOrders[I].oItemDescription.sMarketDesc ) ;
                memMsg.lines.add('  MarketStartTime : ' + datetimetostr(oResult.aClearedOrders[I].oItemDescription.dMarketStartTime) ) ;
                memMsg.lines.add('  RunnerDesc      : ' + oResult.aClearedOrders[I].oItemDescription.sRunnerDesc ) ;
                memMsg.lines.add('  NumberOfWinners : ' + inttostr(oResult.aClearedOrders[I].oItemDescription.iNumberOfWinners) ) ;
              end else
              begin
                memMsg.lines.add('ItemDescription : None') ;
              end ;
            
              memMsg.lines.add('PriceRequested  : ' + floattostrf(oResult.aClearedOrders[I].rPriceRequested,ffFixed,15,2) ) ;
              memMsg.lines.add('SettledDate     : ' + datetimetostr(oResult.aClearedOrders[I].dSettledDate) ) ;
              memMsg.lines.add('BetCount        : ' + inttostr(oResult.aClearedOrders[I].iBetCount) ) ;
              memMsg.lines.add('Commission      : ' + floattostrf(oResult.aClearedOrders[I].rCommission,ffFixed,15,2) ) ;
              memMsg.lines.add('PriceMatched    : ' + floattostrf(oResult.aClearedOrders[I].rPriceMatched,ffFixed,15,2) ) ;
              memMsg.lines.add('PriceReduced    : ' + iifstr(oResult.aClearedOrders[I].bPriceReduced,'YES','No') ) ;
              memMsg.lines.add('SizeSettled     : ' + floattostrf(oResult.aClearedOrders[I].rSizeSettled,ffFixed,15,2) ) ;
              memMsg.lines.add('Profit          : ' + floattostrf(oResult.aClearedOrders[I].rProfit,ffFixed,15,2) ) ;
              memMsg.lines.add('SizeCancelled   : ' + floattostrf(oResult.aClearedOrders[I].rSizeCancelled,ffFixed,15,2) ) ;

              inc(I) ;
              application.processmessages ;
            end ;
          end else
          begin
            memMsg.lines.add('No cleared orders.') ;
          end ;

          freeandnil(oResult) ;
        end ;
      
      end else
      begin
        memMsg.lines.add('Call FAILED!') ;
      end ;
    
    except
      on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
    end ;
  finally
    if slEventTypeIds     <> nil then freeandnil(slEventTypeIds     ) ;
    if slEventIds         <> nil then freeandnil(slEventIds         ) ;
    if slMarketIds        <> nil then freeandnil(slMarketIds        ) ;
    if slBetIds           <> nil then freeandnil(slBetIds           ) ;
    if oSettledDateRange  <> nil then freeandnil(oSettledDateRange  ) ;
    if oResult            <> nil then freeandnil(oResult            ) ;

    if length(aRunnerIds) > 0 then
    begin
      for I := 0 to length(aRunnerIds) - 1 do aRunnerIds[I].free ;
      setlength(aRunnerIds, 0) ;
    end ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnListProfitAndLossClick(Sender: TObject);
{******************************************************************************************}
var
  I, J                : longint ;
  iExchange           : integer ;
  slMarketIds         : TStringList ;
  bIncludeSettledBets : boolean ;
  bIncludeBSPBets     : boolean ;
  bNetOfCommission    : boolean ;
  aResult             : ArrayOfTbfMarketProfitAndLossObj ;

begin
  try
    try
      slMarketIds := nil ;
      setlength(aResult, 0) ;
    
      {**********}
      { Exchange }
      {**********}
      case cbExchange.itemindex of
        0: iExchange := cbfngUKExchange ;
        1: iExchange := cbfngAUSExchange ;
      else
        iExchange := cbfngUKExchange ;
      end ;


      {***********}
      { MarketIds }
      {***********}
      slMarketIds := TStringList.create ;
      if length(trim(edtMktBook_MktId1.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId1.text)) ;
      if length(trim(edtMktBook_MktId2.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId2.text)) ;
      if length(trim(edtMktBook_MktId3.text)) > 0 then slMarketIds.add(trim(edtMktBook_MktId3.text)) ;


      {***********}
      { Flags     }
      {***********}
      bIncludeSettledBets := cbPandL_IncludeSettledBets.checked ;
      bIncludeBSPBets     := cbPandL_IncludeBSPBets.checked ;
      bNetOfCommission    := cbPandL_NetOfCommission.checked ;
    
    

      {**********************}
      { Call API-NG function }
      {**********************}
      memMsg.lines.add('') ;
      memMsg.lines.add('Calling listMarketProfitAndLoss...........') ;

      if bfngListMarketProfitAndLoss( sBetfairSessionToken, cBetfair_AppKey, 
                                      iExchange,
                                      slMarketIds,
                                      bIncludeSettledBets,
                                      bIncludeBSPBets,
                                      bNetOfCommission,
                                      aResult ) then
      begin
        if length(aResult) > 0 then
        begin
          for I := 0 to length(aResult) - 1 do
          begin
            with aResult[I] do
            begin
              memMsg.lines.add('') ;
              memMsg.lines.add('MarketId         : ' + sMarketId ) ;
              memMsg.lines.add('ComissionApplied : ' + floattostrf(rCommissionApplied,ffFixed,15,2)) ;

              if length(aProfitAndLoss) > 0 then
              begin
                for J := 0 to length(aProfitAndLoss) - 1 do
                begin
                  with aProfitAndLoss[J] do
                  begin
                    memMsg.lines.add('  SelectionId: ' + inttostr(iSelectionId) + '  If Win: £' + floattostrf(rIfWin,ffFixed,15,2) + '  If Lose: £' + floattostrf(rIfLose,ffFixed,15,2) ) ;
                  end ;
                end ;
              end else
              begin
                memMsg.lines.add('No runner records returned.') ;
              end ;
            end ;
          end ;

          for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
          setlength(aResult, 0) ;
        end else
        begin
          memMsg.lines.add('No market records returned.') ;
        end ;
      
      end else
      begin
        memMsg.lines.add('Call FAILED!') ;
      end ;
    
    except
      on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
    end ;
  finally
    if slMarketIds <> nil then freeandnil(slMarketIds) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnGetAccountFundsClick(Sender: TObject);
{******************************************************************************************}
var
  iExchange           : integer ;
  oResult             : TbfAccountFundsResponseObj ;

begin
  try
    oResult := nil ;
    
    {**********}
    { Exchange }
    {**********}
    case cbExchange.itemindex of
      0: iExchange := cbfngUKExchange ;
      1: iExchange := cbfngAUSExchange ;
    else
      iExchange := cbfngUKExchange ;
    end ;


    {**********************}
    { Call API-NG function }
    {**********************}
    memMsg.lines.add('') ;
    memMsg.lines.add('Calling getAccountFunds...........') ;

    if bfngGetAccountFunds( sBetfairSessionToken, cBetfair_AppKey, 
                            iExchange,
                            oResult ) then
    begin
      if oResult <> nil then
      begin
        with oResult do
        begin
          memMsg.lines.add('') ;
          
          memMsg.lines.add('AvailableToBetBalance : ' + floattostrf(rAvailableToBetBalance,ffFixed,15,2)) ;
          memMsg.lines.add('Exposure              : ' + floattostrf(rExposure,ffFixed,15,2)) ;
          memMsg.lines.add('RetainedCommission    : ' + floattostrf(rRetainedCommission,ffFixed,15,2)) ;
          memMsg.lines.add('ExposureLimit         : ' + floattostrf(rExposureLimit,ffFixed,15,2)) ;
        end ;

        freeandnil(oResult) ;
      end else
      begin
        memMsg.lines.add('No results returned.') ;
      end ;
      
    end else
    begin
      memMsg.lines.add('Call FAILED!') ;
    end ;
    
  except
    on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
    on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
  end ;
end ;



{******************************************************************************************}
procedure TfmMain.btnGetAccountStatementClick(Sender: TObject);
{******************************************************************************************}
var
  iCount                   : integer ;
  I                        : longint ;
  S                        : string ;
  iHour, iMin, iSec, iMSec : word ;
  iYear, iMonth,iDay       : word ;
  dWork1, dWork2           : TdateTime ;
  iExchange                : integer ;
  oItemDateRange           : TbfTimeRangeObj ;
  eIncludeItem             : TbfngIncludeItem ;
  eWallet                  : TbfngWallet ;
  sLocale                  : string ;
  oResult                  : TbfAccountStatementReportObj ;

begin
  try
    try
      oItemDateRange := nil ;
      oResult        := nil ;
    
      {**********}
      { Exchange }
      {**********}
      case cbExchange.itemindex of
        0: iExchange := cbfngUKExchange ;
        1: iExchange := cbfngAUSExchange ;
      else
        iExchange := cbfngUKExchange ;
      end ;


      {***************}
      { ItemDateRange }
      {***************}
      oItemDateRange := nil ;

      if cbGAS_IncludeDateRange.checked then
      begin
        decodedate(edtGAS_DateFrom.Date, iYear, iMonth, iDay) ;
        decodetime(edtGAS_TimeFrom.Time, iHour, iMin, iSec, iMSec) ;
        dWork1 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;

        decodedate(edtGAS_DateTo.Date, iYear, iMonth, iDay) ;
        decodetime(edtGAS_TimeTo.Time, iHour, iMin, iSec, iMSec) ;
        dWork2 := encodedatetime(iYear, iMonth, iDay, iHour, iMin, iSec, iMSec) ;
      
        oItemDateRange       := TbfTimeRangeObj.create ;
        oItemDateRange.dFrom := dWork1 ;
        oItemDateRange.dTo   := dWork2 ;
      end ;
    

      {*************}
      { IncludeItem }
      {*************}
      eIncludeItem := bfiitALL ;
      case cbGAS_IncludeItem.itemindex of
        0: eIncludeItem := bfiitALL ;
        1: eIncludeItem := bfiitDEPOSITS_WITHDRAWALS ;
        2: eIncludeItem := bfiitEXCHANGE ;
        3: eIncludeItem := bfiitPOKER_ROOM ;
      end ;
    

      {********}
      { Wallet }
      {********}
      eWallet := bfwalletUK ;
      case cbGAS_Wallet.itemindex of
        0: eWallet := bfwalletUK ;
        1: eWallet := bfwalletAUSTRALIAN ;
      end ;


      {********}
      { Locale }
      {********}
      sLocale := edtGAS_Locale.text ;
    
    

      {**********************}
      { Call API-NG function }
      {**********************}
      memMsg.lines.add('') ;
      memMsg.lines.add('Calling getAccountStatement...........') ;
  
      if bfngGetAccountStatement( sBetfairSessionToken, cBetfair_AppKey, 
                                  iExchange,
                                  oItemDateRange,
                                  eIncludeItem,
                                  eWallet,
                                  sLocale,
                                  oResult ) then
      begin
        if oResult <> nil then
        begin
          memMsg.lines.add('') ;
          memMsg.lines.add('No of statement items: ' + inttostr(length(oResult.aAccountStatement)) + '  More Available : ' + iifstr(oResult.bMoreAvailable,'YES','No')) ;
          memMsg.lines.add('') ;
        
          {********************}
          { Write header line. }
          {********************}
          memMsg.lines.add( '        ' +
                            copy('RefId'         + stringofchar(' ',14),1,14) + '  ' +
                            copy('Date'          + stringofchar(' ',20),1,20) + '  ' +
                            copy('Amount'        + stringofchar(' ',12),1,12) + '  ' +
                            copy('Balance'       + stringofchar(' ',12),1,12) + '  ' +
                            copy('ItemClass'     + stringofchar(' ',10),1,10) + '  ' ) ;

          if length(oResult.aAccountStatement) > 0 then
          begin
            bStopDisplay := false ;
            I := 0 ;
          
            while (I <= length(oResult.aAccountStatement) - 1) and (not bStopDisplay) do
            begin
              with oResult.aAccountStatement[I] do
              begin
                memMsg.lines.add( rightstr('     '+inttostr(I+1),5) + ')  ' +
                                  copy(sRefId                          + stringofchar(' ',14),1,14) + '  ' +
                                  copy(datetimetostr(dItemDate)        + stringofchar(' ',20),1,20) + '  ' +
                                  rightstr(stringofchar(' ',12)        + floattostrf(rAmount, ffFixed,15,2),12)  +  '  ' +
                                  rightstr(stringofchar(' ',12)        + floattostrf(rBalance,ffFixed,15,2),12)  +  '  ' +
                                  copy(TbfngItemClassToStr(eItemClass) + stringofchar(' ',10),1,10) + '  ' ) ;
                                
                memMsg.lines.add( stringofchar(' ',74) + 'ItemClassData' ) ;

                if dictItemClassData <> nil then
                begin
                  if dictItemClassData.Count > 0 then
                  begin
                    for S in dictItemClassData.Keys do memMsg.lines.add( stringofchar(' ',74) + copy(S + stringofchar(' ',30),1,30) + ' = ' + dictItemClassData.items[S] ) ;;
                  end ;
                end else
                begin
                  memMsg.lines.add( stringofchar(' ',74) + 'None' ) ;
                end ;
              
                memMsg.lines.add('') ;
                memMsg.lines.add( stringofchar(' ',74) + 'LegacyData' ) ;
              
                if oLegacyData <> nil then
                begin
                  memMsg.lines.add(stringofchar(' ',74) + 'AvgPrice        = ' + floattostrf(oLegacyData.rAvgPrice,      ffFixed,15,2)) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'BetSize         = ' + floattostrf(oLegacyData.rBetSize,       ffFixed,15,2)) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'BetType         = ' + oLegacyData.sBetType                                 ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'BetCategoryType = ' + oLegacyData.sBetCategoryType                         ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'CommissionRate  = ' + oLegacyData.sCommissionRate                          ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'EventId         = ' + inttostr(oLegacyData.iEventId)                       ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'EventTypeId     = ' + inttostr(oLegacyData.iEventTypeId)                   ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'FullMarketName  = ' + oLegacyData.sFullMarketName                          ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'GrossBetAmount  = ' + floattostrf(oLegacyData.rGrossBetAmount,ffFixed,15,2)) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'MarketName      = ' + oLegacyData.sMarketName                              ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'MarketType      = ' + oLegacyData.sMarketType                              ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'PlacedDate      = ' + datetimetostr(oLegacyData.dPlacedDate)               ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'SelectionId     = ' + inttostr(oLegacyData.iSelectionId)                   ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'SelectionName   = ' + oLegacyData.sSelectionName                           ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'StartDate       = ' + datetimetostr(oLegacyData.dStartDate)                ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'TransactionType = ' + oLegacyData.sTransactionType                         ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'TransactionId   = ' + inttostr(oLegacyData.iTransactionId)                 ) ;
                  memMsg.lines.add(stringofchar(' ',74) + 'WinLose         = ' + oLegacyData.sWinLose                                 ) ;
                end else
                begin
                  memMsg.lines.add( stringofchar(' ',74) + 'None' ) ;
                end ;
              end ;
            
              inc(I) ;
              application.processmessages ;
            end ;
          end else
          begin
            memMsg.lines.add('No statement items returned.') ;
          end ;

          freeandnil(oResult) ;
        end ;
      
      end else
      begin
        memMsg.lines.add('Call FAILED!') ;
      end ;
    
    except
      on E:EbfAPIError      do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfhttpError     do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:EbfFunctionError do memMsg.lines.add('Exception: ' + E.Message + CRLF + 'Request: ' + E.sRequest + CRLF + 'Response: ' + E.sResponse) ;
      on E:Exception        do memMsg.lines.add('Exception: ' + E.Message) ;
    end ;
  finally
    if oItemDateRange <> nil then freeandnil(oItemDateRange) ;
  end ;
end ;



end.
