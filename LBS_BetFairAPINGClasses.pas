unit LBS_BetfairAPINGClasses ;

interface

uses sysutils, classes, generics.collections, SuperObject ;


type TTriState = (triTrue, triFalse, triNone) ;


type
  EbfAPIError = class(Exception)
  private
    fErrorCode : integer ;
    fMessage   : string ;
    fRequest   : string ;
    fResponse  : string ;
  public
    constructor Create(aErrorCode : integer ;
                       aMessage   : string ;
                       aSORequest : ISuperObject ;
                       aResponse  : string ) ;
    property ErrorCode : integer read fErrorCode ;
    property Message   : string  read fMessage ;
    property sRequest  : string  read fRequest ;
    property sResponse : string  read fResponse ;
  end ;

type
  EbfhttpError                 = class(EbfAPIError) ;
  EbfFunctionError             = class(EbfAPIError) ;


type TbfngMarketProjection     = ( bfmpjUnknown,
                                   bfmpjCOMPETITION,                   {If not selected then the competition will not be returned with marketCatalogue}
                                   bfmpfEVENT,                         {If not selected then the event will not be returned with marketCatalogue}
                                   bfmpjEVENT_TYPE,                    {If not selected then the eventType will not be returned with marketCatalogue}
                                   bfmpjMARKET_START_TIME,             {If not selected then the start time will not be returned with marketCatalogue}
                                   bfmpjMARKET_DESCRIPTION,            {If not selected then the description will not be returned with marketCatalogue}
                                   bfmpjRUNNER_DESCRIPTION,            {If not selected then the runners will not be returned with marketCatalogue}
                                   bfmpjRUNNER_METADATA ) ;            {If not selected then the runner metadata will not be returned with marketCatalogue. 
                                                                        If selected then RUNNER_DESCRIPTION will also be returned regardless of whether it is included as a market projection.}
type TbfngMarketProjectionSet  = set of TbfngMarketProjection ;


type TbfngPriceData            = ( bfpdUnknown,
                                   bfpdSP_AVAILABLE,                   {Amount available for the BSP auction.}
                                   bfpdSP_TRADED,                      {Amount traded in the BSP auction.}
                                   bfpdEX_BEST_OFFERS,                 {Only the best prices available for each runner, to requested price depth.}
                                   bfpdEX_ALL_OFFERS,                  {EX_ALL_OFFERS trumps EX_BEST_OFFERS if both settings are present}
                                   bfpdEX_TRADED ) ;                   {Amount traded on the exchange.}

type TbfngPriceDataSet  = set of TbfngPriceData ;


type TbfngMatchProjection      = ( bfmtpNone,
                                   bfmtpNO_ROLLUP,                    {No rollup, return raw fragments}
                                   bfmtpROLLED_UP_BY_PRICE,           {Rollup matched amounts by distinct matched prices per side.}
                                   bfmtpROLLED_UP_BY_AVG_PRICE ) ;    {Rollup matched amounts by average matched price per side}


type TbfngOrderProjection      = ( bforpNone,
                                   bforpALL,                          {EXECUTABLE and EXECUTION_COMPLETE orders}
                                   bforpEXECUTABLE,                   {An order that has a remaining unmatched portion}
                                   bforpEXECUTION_COMPLETE ) ;        {An order that does not have any remaining unmatched portion}
                                   

type TbfngMarketStatus         = ( bfmksUnknown,
                                   bfmksINACTIVE,                     {Inactive Market}
                                   bfmksOPEN,                         {Open Market}
                                   bfmksSUSPENDED,                    {Suspended Market}
                                   bfmksCLOSED ) ;                    {Closed Market}
                                   

type TbfngRunnerStatus         = ( bfrnsUnknown,
                                   bfrnsACTIVE,
                                   bfrnsWINNER,
                                   bfrnsLOSER,
                                   bfrnsREMOVED_VACANT,               {REMOVED_VACANT applies to Greyhounds. Greyhound markets always return a fixed number of runners (traps). 
                                                                       If a dog has been removed, the trap is shown as vacant.}
                                   bfrnsREMOVED ) ;
 

type TbfngTimeGranularity      = ( bftgUnknown,
                                   bftgDAYS,
                                   bftgHOURS,
                                   bftgMINUTES ) ;


type TbfngSide                 = ( bfsideUnknown,
                                   bfsideBACK,                        {To back a team, horse or outcome is to bet on the selection to win.}
                                   bfsideLAY ) ;                      {To lay a team, horse, or outcome is to bet on the selection to lose.}
                                   

type TbfngOrderStatus          = ( bfordstUnknown,
                                   bfordstEXECUTION_COMPLETE,         {An order that does not have any remaining unmatched portion.}
                                   bfordstEXECUTABLE ) ;              {An order that has a remaining unmatched portion.}


type TbfngOrderBy              = ( bfordbyNone,
                                   bfordbyBY_BET,                     {Order by placed time, then bet id.}
                                   bfordbyBY_MARKET,                  {Order by market id, then placed time, then bet id.}
                                   bfordbyBY_MATCH_TIME ) ;           {Order by time of last matched fragment (if any), then placed time, then bet id}
                                   

type TbfngSortDir              = ( bfsortdirNone,
                                   bfsortdirEARLIEST_TO_LATEST,       {Order from earliest value to latest e.g. lowest betId is first in the results.}
                                   bfsortdirLATEST_TO_EARLIEST ) ;    {Order from the latest value to the earliest e.g. highest betId is first in the results.}
 

type TbfngOrderType            = ( bfordtypUnknown,
                                   bfordtypLIMIT,                     {A normal exchange limit order for immediate execution}
                                   bfordtypLIMIT_ON_CLOSE,            {Limit order for the auction (SP)}
                                   bfordtypMARKET_ON_CLOSE ) ;        {Market order for the auction (SP)}


type TbfngMarketSort           = ( bfmsortMINIMUM_TRADED,              {Minimum traded volume}
                                   bfmsortMAXIMUM_TRADED,              {Maximum traded volume}
                                   bfmsortMINIMUM_AVAILABLE,           {Minimum available to match}
                                   bfmsortMAXIMUM_AVAILABLE,           {Maximum available to match}
                                   bfmsortFIRST_TO_START,              {The closest markets based on their expected start time}
                                   bfmosrtLAST_TO_START ) ;            {The most distant markets based on their expected start time}


type TbfngMarketBettingType    = ( bfmbtUnknown,
                                   bfmbtODDS,                          {Odds Market}
                                   bfmbtLINE,                          {Line Market}
                                   bfmbtRANGE,                         {Range Market}
                                   bfmbtASIAN_HANDICAP_DOUBLE_LINE,    {Asian Handicap Market}
                                   bfmbtASIAN_HANDICAP_SINGLE_LINE,    {Asian Single Line Market}
                                   bfmbtFIXED_ODDS ) ;                 {Sportsbook Odds Market. This type is deprecated and will be removed in future releases, when Sportsbook markets will be represented as ODDS market but with a different product type.}
type TbfngMarketBettingTypeSet = set of TbfngMarketBettingType ;


type TbfngExecutionReportStatus= ( bfersUnknown,
                                   bfersSUCCESS,                       {Order processed successfully}
                                   bfersFAILURE,                       {Order failed.}
                                   bfersPROCESSED_WITH_ERRORS,         {The order itself has been accepted, but at least one (possibly all) actions have generated errors}
                                   bfersTIMEOUT ) ;                    {Order timed out.}
                                   

type TbfngExecutionReportErrorCode
                               = ( bferecUnknown,
                                   bferecERROR_IN_MATCHER,             {The matcher is not healthy}
                                   bferecPROCESSED_WITH_ERRORS,        {The order itself has been accepted, but at least one (possibly all) actions have generated errors}
                                   bferecBET_ACTION_ERROR,             {There is an error with an action that has caused the entire order to be rejected}
                                   bferecINVALID_ACCOUNT_STATE,        {Order rejected due to the account's status (suspended, inactive, dup cards)}
                                   bferecINVALID_WALLET_STATUS,        {Order rejected due to the account's wallet's status}
                                   bferecINSUFFICIENT_FUNDS,           {Account has exceeded its exposure limit or available to bet limit}
                                   bferecLOSS_LIMIT_EXCEEDED,          {The account has exceed the self imposed loss limit}
                                   bferecMARKET_SUSPENDED,             {Market is suspended}
                                   bferecMARKET_NOT_OPEN_FOR_BETTING,  {Market is not open for betting, either inactive, suspended or closed}
                                   bferecDUPLICATE_TRANSACTION,        {duplicate customer referece data submitted}
                                   bferecINVALID_ORDER,                {Order cannot be accepted by the matcher due to the combination of actions. 
                                                                        For example, bets being edited are not on the same market, or order includes both edits and placement}
                                   bferecINVALID_MARKET_ID,            {Market doesn't exist}
                                   bferecPERMISSION_DENIED,            {Business rules do not allow order to be placed}
                                   bferecDUPLICATE_BETIDS,             {duplicate bet ids found}
                                   bferecNO_ACTION_REQUIRED,           {Order hasn't been passed to matcher as system detected there will be no state change}
                                   bferecSERVICE_UNAVAILABLE,          {The requested service is unavailable}
                                   bferecREJECTED_BY_REGULATOR ) ;     {The regulator rejected the order}
                                   

type TbfngPersistenceType      = ( bfperstypUnknown,
                                   bfperstypLAPSE,                     {Lapse the order at turn-in-play}
                                   bfperstypPERSIST,                   {Persist the order to in-play}
                                   bfperstypMARKET_ON_CLOSE ) ;        {Put the order into the auction (SP) at turn-in-play}


type TbfngInstructionReportStatus
                               = ( bfirsUnknown,
                                   bfirsSUCCESS,
                                   bfirsFAILURE,
                                   bfirsTIMEOUT ) ;


type TbfngInstructionReportErrorCode
                               = ( bfirecUnknown,
                                   bfirecINVALID_BET_SIZE,                {bet size is invalid for your currency or your regulator}
                                   bfirecINVALID_RUNNER,                  {Runner does not exist, includes vacant traps in greyhound racing}
                                   bfirecBET_TAKEN_OR_LAPSED,             {Bet cannot be cancelled or modified as it has already been taken or has lapsed Includes attempts to cancel/modify market on close BSP bets and cancelling limit on close BSP bets}
                                   bfirecBET_IN_PROGRESS,                 {No result was received from the matcher in a timeout configured for the system}
                                   bfirecRUNNER_REMOVED,                  {Runner has been removed from the event}
                                   bfirecMARKET_NOT_OPEN_FOR_BETTING,     {Attempt to edit a bet on a market that has closed.}
                                   bfirecLOSS_LIMIT_EXCEEDED,             {The action has caused the account to exceed the self imposed loss limit}
                                   bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING, {Market now closed to bsp betting. Turned in-play or has been reconciled}
                                   bfirecINVALID_PRICE_EDIT,              {Attempt to edit down the price of a bsp limit on close lay bet, or edit up the price of a limit on close back bet}
                                   bfirecINVALID_ODDS,                    {Odds not on price ladder - either edit or placement}
                                   bfirecINSUFFICIENT_FUNDS,              {Insufficient funds available to cover the bet action. Either the exposure limit or available to bet limit would be exceeded}
                                   bfirecINVALID_PERSISTENCE_TYPE,        {Invalid persistence type for this market, e.g. KEEP for a non bsp market}
                                   bfirecERROR_IN_MATCHER,                {A problem with the matcher prevented this action completing successfully}
                                   bfirecINVALID_BACK_LAY_COMBINATION,    {The order contains a back and a lay for the same runner at overlapping prices. This would guarantee a self match. 
                                                                           This also applies to BSP limit on close bets}
                                   bfirecERROR_IN_ORDER,                  {The action failed because the parent order failed}
                                   bfirecINVALID_BID_TYPE,                {Bid type is mandatory}
                                   bfirecINVALID_BET_ID,                  {Bet for id supplied has not been found}
                                   bfirecCANCELLED_NOT_PLACED,            {Bet cancelled but replacement bet was not placed}
                                   bfirecRELATED_ACTION_FAILED,           {Action failed due to the failure of a action on which this action is dependent}
                                   bfirecNO_ACTION_REQUIRED ) ;           {the action does not result in any state change. eg changing a persistence to it's current value}


type TbfngRollupModel          = ( bfrollupSTAKE,                      {The volumes will be rolled up to the minimum value which is >= rollupLimit.}
                                   bfrollupPAYOUT,                     {The volumes will be rolled up to the minimum value where the payout( price * volume ) is >= rollupLimit.}
                                   bfrollupMANAGED_LIABILITY,          {The volumes will be rolled up to the minimum value which is >= rollupLimit, until a lay price threshold. 
                                                                        There after, the volumes will be rolled up to the minimum value such that the liability >= a minimum liability. 
                                                                        Not supported as yet.}
                                   bfrollupNONE ) ;                    {No rollup will be applied. However the volumes will be filtered by currency specific minimum stake unless overridden specifically for the channel.}


type TbfngGroupBy              = ( bfgrpbyNone,
                                   bfgrpbyEVENT_TYPE,                  {A roll up of settled P&L, commission paid and number of bet orders, on a specified event type}
                                   bfgrpbyEVENT,                       {A roll up of settled P&L, commission paid and number of bet orders, on a specified event}
                                   bfgrpbyMARKET,                      {A roll up of settled P&L, commission paid and number of bet orders, on a specified market}
                                   bfgrpbyRUNNER,                      {A roll up of settled P&L and the number of bet orders, on a specified runner within a specified market}
                                   bfgrpbySIDE,                        {An averaged roll up of settled P&L, and number of bets, on the specified side of a specified selection within a specified market, 
                                                                        that are either settled or voided}
                                   bfgrpbyBET ) ;                      {The P&L, commission paid, side and regulatory information etc, about each individual bet order}



type TbfngBetStatus            = ( bfbetstUnknown,
                                   bfbetstSETTLED,                     {A matched bet that was settled normally}
                                   bfbetstVOIDED,                      {A matched bet that was subsequently voided by Betfair, before, during or after settlement}
                                   bfbetstLAPSED,                      {Unmatched bet that was cancelled by Betfair (for example at turn in play).}
                                   bfbetstCANCELLED ) ;                {Unmatched bet that was cancelled by an explicit customer action.}
 

type TbfngItemClass            = ( bfitcUNKNOWN ) ;                    {Statement item not mapped to a specific class. All values will be concatenated into a single key/value pair. 
                                                                        The key will be 'unknownStatementItem' and the value will be a comma separated string.}


type TbfngWallet               = ( bfwalletUK, bfwalletAUSTRALIAN ) ;

type TbfngIncludeItem          = ( bfiitALL,                           {Include all items}
                                   bfiitDEPOSITS_WITHDRAWALS,          {Include payments only}
                                   bfiitEXCHANGE,                      {Include exchange bets only}
                                   bfiitPOKER_ROOM ) ;                 {Include poker transactions only}
 



{************************************************************}
{ Class structure for holding a Betfair TimeRange.           }
{************************************************************}
type TbfTimeRangeObj = class(TObject)
private
  fFrom : TDateTime ;
  fTo   : TDateTime ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property dFrom  : TDateTime  read fFrom  write fFrom       ;
  property dTo    : TDateTime  read fTo    write fTo         ;
end ;



{************************************************************}
{ Class structure for holding a Betfair TimeRangeResult.     }
{************************************************************}
type TbfTimeRangeResultObj = class(TObject)
private
  fbfTimeRange : TbfTimeRangeObj ;
  fMarketCount : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property obfTimeRange : TbfTimeRangeObj  read fbfTimeRange  write fbfTimeRange         ;
  property iMarketCount : longint          read fMarketCount  write fMarketCount         ;
end ;

type ArrayOfTbfTimeRangeResultObj = array of TbfTimeRangeResultObj ;



{************************************************************}
{ Class structure for holding a Betfair CountryCodeResult.   }
{************************************************************}
type TbfCountryCodeResultObj = class(TObject)
private
  fCountryCode         : string ;
  fMarketCount         : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sCountryCode         : string      read fCountryCode         write fCountryCode         ;
  property iMarketCount         : longint     read fMarketCount         write fMarketCount         ;
end ;

type ArrayOfTbfCountryCodeResultObj = array of TbfCountryCodeResultObj ;



{************************************************************}
{ Class structure for holding a Betfair VenueResult.         }
{************************************************************}
type TbfVenueResultObj = class(TObject)
private
  fVenue               : string ;
  fMarketCount         : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sVenue               : string      read fVenue               write fVenue               ;
  property iMarketCount         : longint     read fMarketCount         write fMarketCount         ;
end ;

type ArrayOfTbfVenueResultObj = array of TbfVenueResultObj ;



{************************************************************}
{ Class structure for holding a Betfair MarketTypeResult.    }
{************************************************************}
type TbfMarketTypeResultObj = class(TObject)
private
  fMarketType          : string ;
  fMarketCount         : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sMarketType          : string      read fMarketType          write fMarketType          ;
  property iMarketCount         : longint     read fMarketCount         write fMarketCount         ;
end ;

type ArrayOfTbfMarketTypeResultObj = array of TbfMarketTypeResultObj ;



{************************************************************}
{ Class structure for holding a Betfair Competition.         }
{************************************************************}
type TbfCompetitionObj = class(TObject)
private
  fCompetitionId       : string ;
  fCompetitionName     : string ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sCompetitionId       : string      read fCompetitionId       write fCompetitionId       ;
  property sCompetitionName     : string      read fCompetitionName     write fCompetitionName     ;
end ;



{************************************************************}
{ Class structure for holding a Betfair EventType.           }
{************************************************************}
type TbfEventTypeObj = class(TObject)
private
  fEventTypeId         : string ;
  fEventTypeName       : string ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sEventTypeId         : string      read fEventTypeId         write fEventTypeId         ;
  property sEventTypeName       : string      read fEventTypeName       write fEventTypeName       ;
end ;



{************************************************************}
{ Class structure for holding a Betfair Event.               }
{************************************************************}
type TbfEventObj = class(TObject)
private
  fEventId                   : string ;    {The unique id for the event}
  fEventName                 : string ;    {The name of the event}
  fCountryCode               : string ;    {The ISO-2 code for the event.  A list of ISO-2 codes is available via http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}
  fTimezone                  : string ;    {The timezone in which the event is taking place}
  fVenue                     : string ;    {Venue}
  fOpenDate                  : TDateTime ; {The scheduled start date and time of the event.}

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sEventId             : string      read fEventId             write fEventId             ;
  property sEventName           : string      read fEventName           write fEventName           ;
  property sCountryCode         : string      read fCountryCode         write fCountryCode         ;
  property sTimezone            : string      read fTimezone            write fTimezone            ;
  property sVenue               : string      read fVenue               write fVenue               ;
  property dOpenDate            : TDateTime   read fOpenDate            write fOpenDate            ;
end ;



{************************************************************}
{ Class structure for holding results from listEventTypes.   }
{************************************************************}
type TbfListEventTypesResultObj = class(TObject)
private
  fbfEventType         : TbfEventTypeObj ;
  fMarketCount         : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property obfEventType         : TbfEventTypeObj       read fbfEventType                 write fbfEventType       ;
  property iMarketCount         : longint               read fMarketCount                 write fMarketCount         ;
end ;

type ArrayOfTbfListEventTypesResultObj = array of TbfListEventTypesResultObj ;



{************************************************************}
{ Class structure for holding results from listCompetitions. }
{************************************************************}
type TbfListCompetitionsResultObj = class(TObject)
private
  fbfCompetition       : TbfCompetitionObj ;
  fMarketCount         : longint ;
  fCompetitionRegion   : string ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property obfCompetition       : TbfCompetitionObj     read fbfCompetition               write fbfCompetition       ;
  property iMarketCount         : longint               read fMarketCount                 write fMarketCount         ;
  property sCompetitionRegion   : string                read fCompetitionRegion           write fCompetitionRegion   ;
end ;

type ArrayOfTbfListCompetitionsResultObj = array of TbfListCompetitionsResultObj ;



{************************************************************}
{ Class structure for holding results from listEvents.       }
{************************************************************}
type TbfListEventsResultObj = class(TObject)
private
  fbfEvent             : TbfEventObj ;
  fMarketCount         : longint ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property obfEvent             : TbfEventObj           read fbfEvent                     write fbfEvent             ;
  property iMarketCount         : longint               read fMarketCount                 write fMarketCount         ;
end ;

type ArrayOfTbfListEventsResultObj = array of TbfListEventsResultObj ;



{***************************************************}
{ Class structure for holding a Market Description. }
{***************************************************}
type TbfMarketDescriptionObj = class(TObject)
private
  fPersistenceEnabled  : boolean ;                 {If 'true' the market supports 'Keep' bets if the market is to be turned in-play}
  fBSPMarket           : boolean ;                 {If 'true' the market supports Betfair SP betting}
  fMarketTime          : TDateTime ;               {The market start time}
  fSuspendTime         : TDateTime ;               {The market suspend time}
  fSettleTime          : TDateTime ;               {Settled time}
  fBettingType         : TbfngMarketBettingType ;  {Market Betting Type}
  fTurnInPlayEnabled   : boolean ;                 {If 'true' the market is set to turn in-play}
  fMarketType          : string ;                  {Market base type}
  fRegulator           : string ;                  {The market regulator}
  fMarketBaseRate      : double ;                  {The commission rate applicable to the market}
  fDiscountAllowed     : boolean ;                 {Indicates whether or not the user's discount rate is taken into account on this market. If ‘false’ all users will be charged the same commission rate, regardless of discount rat}
  fWallet              : string ;                  {The wallet to which the market belongs (UK/AUS)}
  fRules               : string ;                  {The market rules.}
  fRulesHasDate        : boolean ;
  fClarifications      : string ;                  {Any additional information regarding the market}

public
  constructor Create ;
  destructor  Destroy ; override ;

  property bPersistenceEnabled  : boolean                         read fPersistenceEnabled              write fPersistenceEnabled  ;
  property bBSPMarket           : boolean                         read fBSPMarket                       write fBSPMarket           ;
  property dMarketTime          : TDateTime                       read fMarketTime                      write fMarketTime          ;
  property dSuspendTime         : TDateTime                       read fSuspendTime                     write fSuspendTime         ;
  property dSettleTime          : TDateTime                       read fSettleTime                      write fSettleTime          ;
  property eBettingType         : TbfngMarketBettingType          read fBettingType                     write fBettingType         ;
  property bTurnInPlayEnabled   : boolean                         read fTurnInPlayEnabled               write fTurnInPlayEnabled   ;
  property sMarketType          : string                          read fMarketType                      write fMarketType          ;
  property sRegulator           : string                          read fRegulator                       write fRegulator           ;
  property rMarketBaseRate      : double                          read fMarketBaseRate                  write fMarketBaseRate      ;
  property bDiscountAllowed     : boolean                         read fDiscountAllowed                 write fDiscountAllowed     ;
  property sWallet              : string                          read fWallet                          write fWallet              ;
  property sRules               : string                          read fRules                           write fRules               ;
  property bRulesHasDate        : boolean                         read fRulesHasDate                    write fRulesHasDate        ;
  property sClarifications      : string                          read fClarifications                  write fClarifications      ;
end ;



{*************************************************}
{ Class structure for holding a Runner Catalogue. }
{*************************************************}
type TbfRunnerCatalogueObj = class(TObject)
private
  fSelectionId         : int64 ;                       {The unique id for the selection.}
  fRunnerName          : string ;                      {The name of the runner}
  fHandicap            : double ;                      {The handicap}
  fSortPriority        : longint ;                     {The sort priority of this runner}
  fMetaData            : TDictionary<string, string> ; {Metadata associated with the runner}

public
  constructor Create ;
  destructor  Destroy ; override ;


  property iSelectionId         : int64                           read fSelectionId                     write fSelectionId         ;
  property sRunnerName          : string                          read fRunnerName                      write fRunnerName          ;
  property rHandicap            : double                          read fHandicap                        write fHandicap            ;
  property iSortPriority        : longint                         read fSortPriority                    write fSortPriority        ;
  property dictMetaData         : TDictionary<string, string>     read fMetaData                        write fMetaData            ;
end ;

type ArrayOfTbfRunnerCatalogueObj = array of TbfRunnerCatalogueObj ;




{*************************************************}
{ Class structure for holding a Market Catalogue. }
{*************************************************}
type TbfMarketCatalogueObj = class(TObject)
private
  fMarketId            : string ;
  fMarketName          : string ;
  fMarketStartTime     : TDateTime ;
  fMarketDesc          : TbfMarketDescriptionObj ;
  fEventType           : TbfEventTypeObj ;
  fCompetition         : TbfCompetitionObj ;
  fEvent               : TbfEventObj ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aRunners : ArrayOfTbfRunnerCatalogueObj ;

  property sMarketId            : string                          read fMarketId                        write fMarketId            ;
  property sMarketName          : string                          read fMarketName                      write fMarketName          ;
  property dMarketStartTime     : TDateTime                       read fMarketStartTime                 write fMarketStartTime     ;
  property oMarketDesc          : TbfMarketDescriptionObj         read fMarketDesc                      write fMarketDesc          ;
  property oEventType           : TbfEventTypeObj                 read fEventType                       write fEventType           ;
  property oCompetition         : TbfCompetitionObj               read fCompetition                     write fCompetition         ;
  property oEvent               : TbfEventObj                     read fEvent                           write fEvent               ;
end ;

type ArrayOfTbfMarketCatalogueObj = array of TbfMarketCatalogueObj ;




{**************************************************************}
{ Class structure for holding an ExBestOffersOverrides object. }
{**************************************************************}
type TbfExBestOffersOverridesObj = class(TObject)
private
  fBestPricesDepth          : integer ;
  fRollupModel              : TbfngRollupModel ;
  fRollupLimit              : integer ;
  fRollupLiabilityThreshold : double ;
  fRollupLiabilityFactor    : integer ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property iBestPricesDepth          : integer                    read fBestPricesDepth                 write fBestPricesDepth          ;
  property eRollupModel              : TbfngRollupModel           read fRollupModel                     write fRollupModel              ;
  property iRollupLimit              : integer                    read fRollupLimit                     write fRollupLimit              ;
  property rRollupLiabilityThreshold : double                     read fRollupLiabilityThreshold        write fRollupLiabilityThreshold ;
  property iRollupLiabilityFactor    : integer                    read fRollupLiabilityFactor           write fRollupLiabilityFactor    ;
end ;




{*************************************************************}
{ Class structure for holding a PriceProjection.              }
{*************************************************************}
type TbfPriceProjectionObj = class(TObject)
private
  fPriceData                : TbfngPriceDataSet ;
  fExBestOffersOverrides    : TbfExBestOffersOverridesObj ; {Only created if required}
  fVirtualise               : boolean ;
  fRolloverStakes           : boolean ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property setPriceData              : TbfngPriceDataSet            read fPriceData                     write fPriceData                ;
  property oBestOffersOverrides      : TbfExBestOffersOverridesObj  read fExBestOffersOverrides         write fExBestOffersOverrides    ;
  property bVirtualise               : boolean                      read fVirtualise                    write fVirtualise               ;
  property bRolloverStakes           : boolean                      read fRolloverStakes                write fRolloverStakes           ;
end ;



{*************************************************************}
{ Class structure for holding a Betfair Order.                }
{*************************************************************}
type TbfOrderObj = class(TObject)
private
  fBetId                    : string ;
  fOrderType                : TbfngOrderType ;
  fOrderStatus              : TbfngOrderStatus ;
  fPersistenceType          : TbfngPersistenceType ;
  fOrderSide                : TbfngSide ;
  fOrderPrice               : double ;
  fOrderSize                : double ;
  fBSPLiability             : double ;
  fPlacedDate               : TDateTime ;
  fAvgPriceMatched          : double ;
  fSizeMatched              : double ;
  fSizeRemaining            : double ;
  fSizeLapsed               : double ;
  fSizeCancelled            : double ;
  fSizeVoided               : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId                    : string                      read fBetId                          write fBetId                    ;
  property eOrderType                : TbfngOrderType              read fOrderType                      write fOrderType                ;
  property eOrderStatus              : TbfngOrderStatus            read fOrderStatus                    write fOrderStatus              ;
  property ePersistenceType          : TbfngPersistenceType        read fPersistenceType                write fPersistenceType          ;
  property eOrderSide                : TbfngSide                   read fOrderSide                      write fOrderSide                ;
  property rOrderPrice               : double                      read fOrderPrice                     write fOrderPrice               ;
  property rOrderSize                : double                      read fOrderSize                      write fOrderSize                ;
  property rBSPLiability             : double                      read fBSPLiability                   write fBSPLiability             ;
  property dPlacedDate               : TDateTime                   read fPlacedDate                     write fPlacedDate               ;
  property rAvgPriceMatched          : double                      read fAvgPriceMatched                write fAvgPriceMatched          ;
  property rSizeMatched              : double                      read fSizeMatched                    write fSizeMatched              ;
  property rSizeRemaining            : double                      read fSizeRemaining                  write fSizeRemaining            ;
  property rSizeLapsed               : double                      read fSizeLapsed                     write fSizeLapsed               ;
  property rSizeCancelled            : double                      read fSizeCancelled                  write fSizeCancelled            ;
  property rSizeVoided               : double                      read fSizeVoided                     write fSizeVoided               ;
end ;

type ArrayOfTbfOrderObj = array of TbfOrderObj ;



{*************************************************************}
{ Class structure for holding a Betfair Match.                }
{*************************************************************}
type TbfMatchObj = class(TObject)
private
  fBetId                    : string ;
  fMatchId                  : string ;
  fSide                     : TbfngSide ;
  fPrice                    : double ;
  fSize                     : double ;
  fMatchDate                : TDateTime ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId                    : string                       read fBetId                         write fBetId                    ;
  property sMatchId                  : string                       read fMatchId                       write fMatchId                  ;
  property eSide                     : TbfngSide                    read fSide                          write fSide                     ;
  property rPrice                    : double                       read fPrice                         write fPrice                    ;
  property rSize                     : double                       read fSize                          write fSize                     ;
  property dMatchDate                : TDateTime                    read fMatchDate                     write fMatchDate                ;
end ;

type ArrayOfTbfMatchObj = array of TbfMatchObj ;




{*************************************************************}
{ Class structure for holding a PriceSize.                    }
{*************************************************************}
type TbfPriceSizeObj = class(TObject)
private
  fPrice : double ;
  fSize  : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property rPrice   : double      read fPrice        write fPrice ;
  property rSize    : double      read fSize         write fSize  ;
end ;

type ArrayOfTbfPriceSizeObj = array of TbfPriceSizeObj ;




{*************************************************************}
{ Class structure for holding StartingPrices.                 }
{*************************************************************}
type TbfStartingPricesObj = class(TObject)
private
  fNearPrice                : double ;
  fFarPrice                 : double ;
  fActualSP                 : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aBackStakeTaken         : ArrayOfTbfPriceSizeObj ;
    aLayLiabilityTaken      : ArrayOfTbfPriceSizeObj ;
  
  property rNearPrice                : double                       read fNearPrice                     write fNearPrice                ;
  property rFarPrice                 : double                       read fFarPrice                      write fFarPrice                 ;
  property rActualSP                 : double                       read fActualSP                      write fActualSP                 ;
end ;

type ArrayOfTbfStartingPricesObj = array of TbfStartingPricesObj ;




{*************************************************************}
{ Class structure for holding ExchangePrices.                 }
{*************************************************************}
type TbfExchangePricesObj = class(TObject)
private

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aAvailableToBack          : ArrayOfTbfPriceSizeObj ;
    aAvailableToLay           : ArrayOfTbfPriceSizeObj ;
    aTradedVolume             : ArrayOfTbfPriceSizeObj ;
end ;

type ArrayOfTbfExchangePricesObj = array of TbfExchangePricesObj ;




{*************************************************************}
{ Class structure for holding a Runner.                       }
{*************************************************************}
type TbfRunnerObj = class(TObject)
private
  fSelectionId              : int64 ;
  fHandicap                 : double ;
  fRunnerStatus             : TbfngRunnerStatus ;
  fAdjustmentFactor         : double ;
  fLastPriceMatched         : double ;
  fTotalMatched             : double ;
  fRemovalDate              : TDateTime ;
  fSPPrices                 : TbfStartingPricesObj ;
  fExchangePrices           : TbfExchangePricesObj ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aOrders                 : ArrayOfTbfOrderObj ;
    aMatches                : ArrayOfTbfMatchObj ;
  
  property iSelectionId              : int64                        read fSelectionId                   write fSelectionId              ;
  property rHandicap                 : double                       read fHandicap                      write fHandicap                 ;
  property eRunnerStatus             : TbfngRunnerStatus            read fRunnerStatus                  write fRunnerStatus             ;
  property rAdjustmentFactor         : double                       read fAdjustmentFactor              write fAdjustmentFactor         ;
  property rLastPriceMatched         : double                       read fLastPriceMatched              write fLastPriceMatched         ;
  property rTotalMatched             : double                       read fTotalMatched                  write fTotalMatched             ;
  property dRemovalDate              : TDateTime                    read fRemovalDate                   write fRemovalDate              ;
  property oSPPrices                 : TbfStartingPricesObj         read fSPPrices                      write fSPPrices                 ;
  property oExchangePrices           : TbfExchangePricesObj         read fExchangePrices                write fExchangePrices           ;
end ;

type ArrayOfTbfRunnerObj = array of TbfRunnerObj ;




{*************************************************************}
{ Class structure for holding a MarketBook.                   }
{*************************************************************}
type TbfMarketBookObj = class(TObject)
private
  fMarketId                 : string ;
  fIsMarketDataDelayed      : boolean ;
  fMarketStatus             : TbfngMarketStatus ;
  fBetDelay                 : integer ;
  fBSPReconciled            : boolean ;
  fComplete                 : boolean ;
  fInPlay                   : boolean ;
  fNoOfWinners              : integer ;
  fNoOfRunners              : integer ;
  fNoOfActiveRunners        : integer ;
  fLastMatchTime            : TDateTime ;
  fTotalMatched             : double ;
  fTotalAvailable           : double ;
  fCrossMatching            : boolean ;
  fRunnersVoidable          : boolean ;
  fVersion                  : int64 ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aRunners : ArrayOfTbfRunnerObj ;

  property sMarketId                 : string                       read fMarketId                      write fMarketId                 ;
  property bIsMarketDataDelayed      : boolean                      read fIsMarketDataDelayed           write fIsMarketDataDelayed      ;
  property eMarketStatus             : TbfngMarketStatus            read fMarketStatus                  write fMarketStatus             ;
  property iBetDelay                 : integer                      read fBetDelay                      write fBetDelay                 ;
  property bBSPReconciled            : boolean                      read fBSPReconciled                 write fBSPReconciled            ;
  property bComplete                 : boolean                      read fComplete                      write fComplete                 ;
  property bInPlay                   : boolean                      read fInPlay                        write fInPlay                   ;
  property iNoOfWinners              : integer                      read fNoOfWinners                   write fNoOfWinners              ;
  property iNoOfRunners              : integer                      read fNoOfRunners                   write fNoOfRunners              ;
  property iNoOfActiveRunners        : integer                      read fNoOfActiveRunners             write fNoOfActiveRunners        ;
  property dLastMatchTime            : TDateTime                    read fLastMatchTime                 write fLastMatchTime            ;
  property rTotalMatched             : double                       read fTotalMatched                  write fTotalMatched             ;
  property rTotalAvailable           : double                       read fTotalAvailable                write fTotalAvailable           ;
  property bCrossMatching            : boolean                      read fCrossMatching                 write fCrossMatching            ;
  property bRunnersVoidable          : boolean                      read fRunnersVoidable               write fRunnersVoidable          ;
  property iVersion                  : int64                        read fVersion                       write fVersion                  ;
end ;

type ArrayOfTbfMarketBookObj = array of TbfMarketBookObj ;




{*************************************************************}
{ Class structure for holding a LimitOrder.                   }
{*************************************************************}
type TbfLimitOrderObj = class(TObject)
private
  fSize                     : double ;
  fPrice                    : double ;
  fPersistenceType          : TbfngPersistenceType ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property rSize                     : double                       read fSize                          write fSize                     ;
  property rPrice                    : double                       read fPrice                         write fPrice                    ;
  property ePersistenceType          : TbfngPersistenceType         read fPersistenceType               write fPersistenceType          ;
end ;



{*************************************************************}
{ Class structure for holding a LimitOnCloseOrder.            }
{*************************************************************}
type TbfLimitOnCloseOrderObj = class(TObject)
private
  fLiability                : double ;
  fPrice                    : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property rLiability                : double                       read fLiability                     write fLiability                ;
  property rPrice                    : double                       read fPrice                         write fPrice                    ;
end ;



{*************************************************************}
{ Class structure for holding a MarketOnCloseOrder.           }
{*************************************************************}
type TbfMarketOnCloseOrderObj = class(TObject)
private
  fLiability                : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property rLiability                : double                       read fLiability                     write fLiability                ;
end ;



{*************************************************************}
{ Class structure for holding a PlaceInstruction.             }
{*************************************************************}
type TbfPlaceInstructionObj = class(TObject)
private
  fOrderType                : TbfngOrderType ;
  fSelectionId              : int64 ;
  fHandicap                 : double ;
  fSide                     : TbfngSide ;
  fLimitOrder               : TbfLimitOrderObj ;
  fLimitOnCloseOrder        : TbfLimitOnCloseOrderObj ;
  fMarketOnCloseOrder       : TbfMarketOnCloseOrderObj ;

  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property eOrderType                : TbfngOrderType               read fOrderType                     write fOrderType                ;
  property iSelectionId              : int64                        read fSelectionId                   write fSelectionId              ;
  property rHandicap                 : double                       read fHandicap                      write fHandicap                 ;
  property eSide                     : TbfngSide                    read fSide                          write fSide                     ;
  property oLimitOrder               : TbfLimitOrderObj             read fLimitOrder                    write fLimitOrder               ;
  property oLimitOnCloseOrder        : TbfLimitOnCloseOrderObj      read fLimitOnCloseOrder             write fLimitOnCloseOrder        ;
  property oMarketOnCloseOrder       : TbfMarketOnCloseOrderObj     read fMarketOnCloseOrder            write fMarketOnCloseOrder       ;
end ;

type ArrayOfTbfPlaceInstructionObj = array of TbfPlaceInstructionObj ;




{*************************************************************}
{ Class structure for holding a PlaceInstructionReport.       }
{*************************************************************}
type TbfPlaceInstructionReportObj = class(TObject)
private
  fStatus                   : TbfngInstructionReportStatus ;
  fErrorCode                : TbfngInstructionReportErrorCode ;
  fInstruction              : TbfPlaceInstructionObj ;
  fBetId                    : string ;
  fPlacedDate               : TDateTime ;
  fAveragePriceMatched      : double ;
  fSizeMatched              : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property eStatus                   : TbfngInstructionReportStatus      read fStatus                   write fStatus                   ;
  property eErrorCode                : TbfngInstructionReportErrorCode   read fErrorCode                write fErrorCode                ;
  property oInstruction              : TbfPlaceInstructionObj            read fInstruction              write fInstruction              ;
  property sBetId                    : string                            read fBetId                    write fBetId                    ;
  property dPlacedDate               : TDateTime                         read fPlacedDate               write fPlacedDate               ;
  property rAveragePriceMatched      : double                            read fAveragePriceMatched      write fAveragePriceMatched      ;
  property rSizeMatched              : double                            read fSizeMatched              write fSizeMatched              ;
end ;

type ArrayOfTbfPlaceInstructionReportObj = array of TbfPlaceInstructionReportObj ;



{*************************************************************}
{ Class structure for holding a CancelInstruction.            }
{*************************************************************}
type TbfCancelInstructionObj = class(TObject)
private
  fBetId            : string ;
  fSizeReduction    : double ;  {This value represents how much of the stake to cancel. So if current is £3 and SizeReduction=2 then £1 will remain as the stake.}
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId            : string        read fBetId                 write fBetId            ;
  property rSizeReduction    : double        read fSizeReduction         write fSizeReduction    ;
end ;

type ArrayOfTbfCancelInstructionObj = array of TbfCancelInstructionObj ;



{*************************************************************}
{ Class structure for holding a CancelInstructionReport.      }
{*************************************************************}
type TbfCancelInstructionReportObj = class(TObject)
private
  fStatus                   : TbfngInstructionReportStatus ;
  fErrorCode                : TbfngInstructionReportErrorCode ;
  fInstruction              : TbfCancelInstructionObj ;
  fSizeCancelled            : double ;
  fCancelledDate            : TDateTime ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property eStatus                   : TbfngInstructionReportStatus      read fStatus                   write fStatus                   ;
  property eErrorCode                : TbfngInstructionReportErrorCode   read fErrorCode                write fErrorCode                ;
  property oInstruction              : TbfCancelInstructionObj           read fInstruction              write fInstruction              ;
  property dCancelledDate            : TDateTime                         read fCancelledDate            write fCancelledDate            ;
  property rSizeCancelled            : double                            read fSizeCancelled            write fSizeCancelled            ;
end ;

type ArrayOfTbfCancelInstructionReportObj = array of TbfCancelInstructionReportObj ;




{*************************************************************}
{ Class structure for holding a ReplaceInstructionReport.     }
{*************************************************************}
type TbfReplaceInstructionReportObj = class(TObject)
private
  fStatus                   : TbfngInstructionReportStatus ;
  fErrorCode                : TbfngInstructionReportErrorCode ;
  fCancelInstructionReport  : TbfCancelInstructionReportObj ;
  fPlaceInstructionReport   : TbfPlaceInstructionReportObj ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property eStatus                   : TbfngInstructionReportStatus      read fStatus                   write fStatus                   ;
  property eErrorCode                : TbfngInstructionReportErrorCode   read fErrorCode                write fErrorCode                ;
  property oCancelInstructionReport  : TbfCancelInstructionReportObj     read fCancelInstructionReport  write fCancelInstructionReport  ;
  property oPlaceInstructionReport   : TbfPlaceInstructionReportObj      read fPlaceInstructionReport   write fPlaceInstructionReport   ;
end ;

type ArrayOfTbfReplaceInstructionReportObj = array of TbfReplaceInstructionReportObj ;




{*************************************************************}
{ Class structure for holding an UpdateInstruction.           }
{*************************************************************}
type TbfUpdateInstructionObj = class(TObject)
private
  fBetId                    : string ;
  fPersistenceType          : TbfngPersistenceType ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId                    : string                       read fBetId                         write fBetId                    ;
  property ePersistenceType          : TbfngPersistenceType         read fPersistenceType               write fPersistenceType          ;
end ;

type ArrayOfTbfUpdateInstructionObj = array of TbfUpdateInstructionObj ;




{*************************************************************}
{ Class structure for holding a UpdateInstructionReport.      }
{*************************************************************}
type TbfUpdateInstructionReportObj = class(TObject)
private
  fStatus             : TbfngInstructionReportStatus ;
  fErrorCode          : TbfngInstructionReportErrorCode ;
  fInstruction        : TbfUpdateInstructionObj ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property eStatus             : TbfngInstructionReportStatus      read fStatus            write fStatus             ;
  property eErrorCode          : TbfngInstructionReportErrorCode   read fErrorCode         write fErrorCode          ;
  property oInstruction        : TbfUpdateInstructionObj           read fInstruction       write fInstruction        ;
end ;

type ArrayOfTbfUpdateInstructionReportObj = array of TbfUpdateInstructionReportObj ;




{*************************************************************}
{ Class structure for holding a PlaceExecutionReport.         }
{*************************************************************}
type TbfPlaceExecutionReportObj = class(TObject)
private
  fCustomerRef              : string ;
  fStatus                   : TbfngExecutionReportStatus ;
  fErrorCode                : TbfngExecutionReportErrorCode ;
  fMarketId                 : string ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aInstructionReports              : ArrayOfTbfPlaceInstructionReportObj ;

  property sCustomerRef              : string                                read fCustomerRef                write fCustomerRef              ;
  property eStatus                   : TbfngExecutionReportStatus            read fStatus                     write fStatus                   ;
  property eErrorCode                : TbfngExecutionReportErrorCode         read fErrorCode                  write fErrorCode                ;
  property sMarketId                 : string                                read fMarketId                   write fMarketId                 ;
end ;



{*************************************************************}
{ Class structure for holding a CancelExecutionReport.        }
{*************************************************************}
type TbfCancelExecutionReportObj = class(TObject)
private
  fCustomerRef              : string ;
  fStatus                   : TbfngExecutionReportStatus ;
  fErrorCode                : TbfngExecutionReportErrorCode ;
  fMarketId                 : string ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aInstructionReports     : ArrayOfTbfCancelInstructionReportObj ;

  property sCustomerRef              : string                                read fCustomerRef                write fCustomerRef              ;
  property eStatus                   : TbfngExecutionReportStatus            read fStatus                     write fStatus                   ;
  property eErrorCode                : TbfngExecutionReportErrorCode         read fErrorCode                  write fErrorCode                ;
  property sMarketId                 : string                                read fMarketId                   write fMarketId                 ;
end ;



{*************************************************************}
{ Class structure for holding a ReplaceExecutionReport.       }
{*************************************************************}
type TbfReplaceExecutionReportObj = class(TObject)
private
  fCustomerRef              : string ;
  fStatus                   : TbfngExecutionReportStatus ;
  fErrorCode                : TbfngExecutionReportErrorCode ;
  fMarketId                 : string ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aInstructionReports     : ArrayOfTbfReplaceInstructionReportObj ;

  property sCustomerRef              : string                                read fCustomerRef                write fCustomerRef              ;
  property eStatus                   : TbfngExecutionReportStatus            read fStatus                     write fStatus                   ;
  property eErrorCode                : TbfngExecutionReportErrorCode         read fErrorCode                  write fErrorCode                ;
  property sMarketId                 : string                                read fMarketId                   write fMarketId                 ;
end ;



{*************************************************************}
{ Class structure for holding an UpdateExecutionReport.       }
{*************************************************************}
type TbfUpdateExecutionReportObj = class(TObject)
private
  fCustomerRef              : string ;
  fStatus                   : TbfngExecutionReportStatus ;
  fErrorCode                : TbfngExecutionReportErrorCode ;
  fMarketId                 : string ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aInstructionReports     : ArrayOfTbfUpdateInstructionReportObj ;

  property sCustomerRef              : string                                read fCustomerRef                write fCustomerRef              ;
  property eStatus                   : TbfngExecutionReportStatus            read fStatus                     write fStatus                   ;
  property eErrorCode                : TbfngExecutionReportErrorCode         read fErrorCode                  write fErrorCode                ;
  property sMarketId                 : string                                read fMarketId                   write fMarketId                 ;
end ;



{*************************************************************}
{ Class structure for holding a ReplaceInstruction.           }
{*************************************************************}
type TbfReplaceInstructionObj = class(TObject)
private
  fBetId            : string ;
  fNewPrice         : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId            : string        read fBetId                 write fBetId        ;
  property rNewPrice         : double        read fNewPrice              write fNewPrice     ;
end ;

type ArrayOfTbfReplaceInstructionObj = array of TbfReplaceInstructionObj ;




{*************************************************************}
{ Class structure for holding a CurrentOrderSummary.          }
{*************************************************************}
type TbfCurrentOrderSummaryObj = class(TObject)
private
  fBetId                  : string ;
  fMarketId               : string ;
  fSelectionId            : int64 ;
  fHandicap               : double ;
  fPriceSize              : TbfPriceSizeObj ;
  fBSPLiability           : double ;
  fSide                   : TbfngSide ;
  fStatus                 : TbfngOrderStatus ;
  fPersistenceType        : TbfngPersistenceType ;
  fOrderType              : TbfngOrderType ;
  fPlacedDate             : TDateTime ;
  fMatchedDate            : TDateTime ;
  fAveragePriceMatched    : double ;
  fSizeMatched            : double ;
  fSizeRemaining          : double ;
  fSizeLapsed             : double ;
  fSizeCancelled          : double ;
  fSizeVoided             : double ;
  fRegulatorAuthCode      : string ;
  fRegulatorCode          : string ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sBetId                  : string                     read fBetId                             write fBetId                  ;
  property sMarketId               : string                     read fMarketId                          write fMarketId               ;
  property iSelectionId            : int64                      read fSelectionId                       write fSelectionId            ;
  property rHandicap               : double                     read fHandicap                          write fHandicap               ;
  property oPriceSize              : TbfPriceSizeObj            read fPriceSize                         write fPriceSize              ;
  property rBSPLiability           : double                     read fBSPLiability                      write fBSPLiability           ;
  property eSide                   : TbfngSide                  read fSide                              write fSide                   ;
  property eStatus                 : TbfngOrderStatus           read fStatus                            write fStatus                 ;
  property ePersistenceType        : TbfngPersistenceType       read fPersistenceType                   write fPersistenceType        ;
  property eOrderType              : TbfngOrderType             read fOrderType                         write fOrderType              ;
  property dPlacedDate             : TDateTime                  read fPlacedDate                        write fPlacedDate             ;
  property dMatchedDate            : TDateTime                  read fMatchedDate                       write fMatchedDate            ;
  property rAveragePriceMatched    : double                     read fAveragePriceMatched               write fAveragePriceMatched    ;
  property rSizeMatched            : double                     read fSizeMatched                       write fSizeMatched            ;
  property rSizeRemaining          : double                     read fSizeRemaining                     write fSizeRemaining          ;
  property rSizeLapsed             : double                     read fSizeLapsed                        write fSizeLapsed             ;
  property rSizeCancelled          : double                     read fSizeCancelled                     write fSizeCancelled          ;
  property rSizeVoided             : double                     read fSizeVoided                        write fSizeVoided             ;
  property sRegulatorAuthCode      : string                     read fRegulatorAuthCode                 write fRegulatorAuthCode      ;
  property sRegulatorCode          : string                     read fRegulatorCode                     write fRegulatorCode          ;
end ;

type ArrayOfTbfCurrentOrderSummaryObj = array of TbfCurrentOrderSummaryObj ;




{*************************************************************}
{ Class structure for holding a CurrentOrderSummaryReport.    }
{*************************************************************}
type TbfCurrentOrderSummaryReportObj = class(TObject)
private
  fMoreAvailable  : boolean ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aCurrentOrders : ArrayOfTbfCurrentOrderSummaryObj ;

  property bMoreAvailable : boolean  read fMoreAvailable write fMoreAvailable            ;
end ;




{************************************************************}
{ Class structure for holding a Betfair ItemDescription.     }
{************************************************************}
type TbfItemDescriptionObj = class(TObject)
private
  fEventTypeDesc             : string ;
  fEventDesc                 : string ;
  fMarketDesc                : string ;
  fMarketStartTime           : TDateTime ;
  fRunnerDesc                : string ;
  fNumberOfWinners           : integer ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  property sEventTypeDesc       : string          read fEventTypeDesc             write fEventTypeDesc             ;
  property sEventDesc           : string          read fEventDesc                 write fEventDesc                 ;
  property sMarketDesc          : string          read fMarketDesc                write fMarketDesc                ;
  property dMarketStartTime     : TDateTime       read fMarketStartTime           write fMarketStartTime           ;
  property sRunnerDesc          : string          read fRunnerDesc                write fRunnerDesc                ;
  property iNumberOfWinners     : integer         read fNumberOfWinners           write fNumberOfWinners           ;
end ;



{************************************************************}
{ Class structure for holding a RunnerId.                    }
{************************************************************}
type TbfRunnerIdObj = class(TObject)
private
  fMarketId     : string ;
  fSelectionId  : int64 ;
  fHandicap     : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;
  
  property sMarketId       : string   read fMarketId      write fMarketId    ;
  property iSelectionId    : int64    read fSelectionId   write fSelectionId ;
  property rHandicap       : double   read fHandicap      write fHandicap    ;
end ;

type ArrayOfTbfRunnerIdObj = array of TbfRunnerIdObj ;




{*************************************************************}
{ Class structure for holding a ClearedOrderSummary.          }
{*************************************************************}
type TbfClearedOrderSummaryObj = class(TObject)
private
  fEventTypeId            : string ;
  fEventId                : string ;
  fMarketId               : string ;
  fSelectionId            : int64 ;
  fHandicap               : double ;
  fBetId                  : string ;
  fPlacedDate             : TDateTime ;
  fPersistenceType        : TbfngPersistenceType ;
  fOrderType              : TbfngOrderType ;
  fSide                   : TbfngSide ;
  fItemDescription        : TbfItemDescriptionObj ;
  fPriceRequested         : double ;
  fSettledDate            : TDateTime ;
  fBetCount               : longint ;
  fCommission             : double ;
  fPriceMatched           : double ;
  fPriceReduced           : boolean ;
  fSizeSettled            : double ;
  fProfit                 : double ;
  fSizeCancelled          : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;
  
  property sEventTypeId            : string                     read fEventTypeId                       write fEventTypeId            ;
  property sEventId                : string                     read fEventId                           write fEventId                ;
  property sMarketId               : string                     read fMarketId                          write fMarketId               ;
  property iSelectionId            : int64                      read fSelectionId                       write fSelectionId            ;
  property rHandicap               : double                     read fHandicap                          write fHandicap               ;
  property sBetId                  : string                     read fBetId                             write fBetId                  ;
  property dPlacedDate             : TDateTime                  read fPlacedDate                        write fPlacedDate             ;
  property ePersistenceType        : TbfngPersistenceType       read fPersistenceType                   write fPersistenceType        ;
  property eOrderType              : TbfngOrderType             read fOrderType                         write fOrderType              ;
  property eSide                   : TbfngSide                  read fSide                              write fSide                   ;
  property oItemDescription        : TbfItemDescriptionObj      read fItemDescription                   write fItemDescription        ;
  property rPriceRequested         : double                     read fPriceRequested                    write fPriceRequested         ;
  property dSettledDate            : TDateTime                  read fSettledDate                       write fSettledDate            ;
  property iBetCount               : longint                    read fBetCount                          write fBetCount               ;
  property rCommission             : double                     read fCommission                        write fCommission             ;
  property rPriceMatched           : double                     read fPriceMatched                      write fPriceMatched           ;
  property bPriceReduced           : boolean                    read fPriceReduced                      write fPriceReduced           ;
  property rSizeSettled            : double                     read fSizeSettled                       write fSizeSettled            ;
  property rProfit                 : double                     read fProfit                            write fProfit                 ;
  property rSizeCancelled          : double                     read fSizeCancelled                     write fSizeCancelled          ;
end ;

type ArrayOfTbfClearedOrderSummaryObj = array of TbfClearedOrderSummaryObj ;




{*************************************************************}
{ Class structure for holding a ClearedOrderSummaryReport.    }
{*************************************************************}
type TbfClearedOrderSummaryReportObj = class(TObject)
private
  fMoreAvailable            : boolean ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aClearedOrders     : ArrayOfTbfClearedOrderSummaryObj ;

  property bMoreAvailable            : boolean                               read fMoreAvailable              write fMoreAvailable            ;
end ;




{************************************************************}
{ Class structure for holding a RunnerProfitAndLoss.         }
{************************************************************}
type TbfRunnerProfitAndLossObj = class(TObject)
private
  fSelectionId               : int64 ;
  fIfWin                     : double ;
  fIfLose                    : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;
  
  property iSelectionId         : int64           read fSelectionId         write fSelectionId               ;
  property rIfWin               : double          read fIfWin               write fIfWin                     ;
  property rIfLose              : double          read fIfLose              write fIfLose                    ;
end ;

type ArrayOfTbfRunnerProfitAndLossObj = array of TbfRunnerProfitAndLossObj ;



{************************************************************}
{ Class structure for holding a MarketProfitAndLoss.         }
{************************************************************}
type TbfMarketProfitAndLossObj = class(TObject)
private
  fMarketId                  : string ;
  fCommissionApplied         : double ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aProfitAndLoss : ArrayOfTbfRunnerProfitAndLossObj ;
  
  property sMarketId            : string          read fMarketId            write fMarketId                  ;
  property rCommissionApplied   : double          read fCommissionApplied   write fCommissionApplied         ;
end ;

type ArrayOfTbfMarketProfitAndLossObj = array of TbfMarketProfitAndLossObj ;




{************************************************************}
{ Class structure for holding an AccountFundsResponse.       }
{************************************************************}
type TbfAccountFundsResponseObj = class(TObject)
private
  fAvailableToBetBalance     : double ;
  fExposure                  : double ;
  fRetainedCommission        : double ;
  fExposureLimit             : double ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property rAvailableToBetBalance     : double            read fAvailableToBetBalance         write fAvailableToBetBalance     ;
  property rExposure                  : double            read fExposure                      write fExposure                  ;
  property rRetainedCommission        : double            read fRetainedCommission            write fRetainedCommission        ;
  property rExposureLimit             : double            read fExposureLimit                 write fExposureLimit             ;
end ;




{************************************************************}
{ Class structure for holding an AccountDetailsResponse.     }
{************************************************************}
type TbfAccountDetailsResponseObj = class(TObject)
private
  fCurrencyCode              : string ;
  fFirstName                 : string ;
  fLastName                  : string ;
  fLocaleCode                : string ;
  fRegion                    : string ;
  fTimezone                  : string ;
  fDiscountRate              : double ;
  fPointsBalance             : longint ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sCurrencyCode              : string            read fCurrencyCode                  write fCurrencyCode              ;
  property sFirstName                 : string            read fFirstName                     write fFirstName                 ;
  property sLastName                  : string            read fLastName                      write fLastName                  ;
  property sLocaleCode                : string            read fLocaleCode                    write fLocaleCode                ;
  property sRegion                    : string            read fRegion                        write fRegion                    ;
  property sTimezone                  : string            read fTimezone                      write fTimezone                  ;
  property rDiscountRate              : double            read fDiscountRate                  write fDiscountRate              ;
  property iPointsBalance             : longint           read fPointsBalance                 write fPointsBalance             ;
end ;




{************************************************************}
{ Class structure for holding a DeveloperAppVersion.         }
{************************************************************}
type TbfDeveloperAppVersionObj = class(TObject)
private
  fOwner                     : string ;
  fVersionId                 : int64 ;
  fVersion                   : string ;
  fApplicationKey            : string ;
  fDelayData                 : boolean ;
  fSubscriptionRequired      : boolean ;
  fOwnerManaged              : boolean ;
  fActive                    : boolean ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sOwner                     : string            read fOwner                         write fOwner                     ;
  property iVersionId                 : int64             read fVersionId                     write fVersionId                 ;
  property sVersion                   : string            read fVersion                       write fVersion                   ;
  property sApplicationKey            : string            read fApplicationKey                write fApplicationKey            ;
  property bDelayData                 : boolean           read fDelayData                     write fDelayData                 ;
  property bSubscriptionRequired      : boolean           read fSubscriptionRequired          write fSubscriptionRequired      ;
  property bOwnerManaged              : boolean           read fOwnerManaged                  write fOwnerManaged              ;
  property bActive                    : boolean           read fActive                        write fActive                    ;
end ;

type ArrayOfTbfDeveloperAppVersionObj = array of TbfDeveloperAppVersionObj ;




{************************************************************}
{ Class structure for holding a DeveloperApp.                }
{************************************************************}
type TbfDeveloperAppObj = class(TObject)
private
  fAppName                   : string ;
  fAppId                     : int64 ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aAppVersions : ArrayOfTbfDeveloperAppVersionObj ;
    
  property sAppName                   : string     read fAppName       write fAppName ;
  property iAppId                     : int64      read fAppId         write fAppId   ;
end ;

type ArrayOfTbfDeveloperAppObj = array of TbfDeveloperAppObj ;




{************************************************************}
{ Class structure for holding a StatementLegacyData object.  }
{************************************************************}
type TbfStatementLegacyDataObj = class(TObject)
private
  fAvgPrice                : double ;
  fBetSize                 : double ;
  fBetType                 : string ;
  fBetCategoryType         : string ;
  fCommissionRate          : string ;
  fEventId                 : int64 ;
  fEventTypeId             : int64 ;
  fFullMarketName          : string ;
  fGrossBetAmount          : double ;
  fMarketName              : string ;
  fMarketType              : string ;
  fPlacedDate              : TDateTime ;
  fSelectionId             : int64 ;
  fSelectionName           : string ;
  fStartDate               : TDateTime ;
  fTransactionType         : string ;
  fTransactionId           : int64 ;
  fWinLose                 : string ;
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property rAvgPrice                : double           read fAvgPrice               write fAvgPrice                ;
  property rBetSize                 : double           read fBetSize                write fBetSize                 ;
  property sBetType                 : string           read fBetType                write fBetType                 ;
  property sBetCategoryType         : string           read fBetCategoryType        write fBetCategoryType         ;
  property sCommissionRate          : string           read fCommissionRate         write fCommissionRate          ;
  property iEventId                 : int64            read fEventId                write fEventId                 ;
  property iEventTypeId             : int64            read fEventTypeId            write fEventTypeId             ;
  property sFullMarketName          : string           read fFullMarketName         write fFullMarketName          ;
  property rGrossBetAmount          : double           read fGrossBetAmount         write fGrossBetAmount          ;
  property sMarketName              : string           read fMarketName             write fMarketName              ;
  property sMarketType              : string           read fMarketType             write fMarketType              ;
  property dPlacedDate              : TDateTime        read fPlacedDate             write fPlacedDate              ;
  property iSelectionId             : int64            read fSelectionId            write fSelectionId             ;
  property sSelectionName           : string           read fSelectionName          write fSelectionName           ;
  property dStartDate               : TDateTime        read fStartDate              write fStartDate               ;
  property sTransactionType         : string           read fTransactionType        write fTransactionType         ;
  property iTransactionId           : int64            read fTransactionId          write fTransactionId           ;
  property sWinLose                 : string           read fWinLose                write fWinLose                 ;
end ;




{******************************************************}
{ Class structure for holding a StatementItem object.  }
{******************************************************}
type TbfStatementItemObj = class(TObject)
private
  fRefId                   : string ;                         {An external reference, eg. equivalent to betId in the case of an exchange bet statement item.}
  fItemDate                : TDateTime ;                      {The date and time of the statement item, eg. equivalent to settledData for an exchange bet statement item. (in ISO-8601 format, not translated)}
  fAmount                  : double ;                         {The amount of money the balance is adjusted by}
  fBalance                 : double ;                         {Account balance.}
  fItemClass               : TbfngItemClass ;                 {Class of statement item. This value will determine which set of keys will be included in itemClassData}
  fItemClassData           : TDictionary<string, string> ;    {Key value pairs describing the current statement item. The set of keys will be determined by the itemClass}
  fLegacyData              : TbfStatementLegacyDataObj ;      {Set of fields originally returned from APIv6. Provided to facilitate migration from APIv6 to API-NG, and ultimately onto itemClass and itemClassData}
  
public
  constructor Create ;
  destructor  Destroy ; override ;

  property sRefId                   : string                           read fRefId                   write fRefId                   ;
  property dItemDate                : TDateTime                        read fItemDate                write fItemDate                ;
  property rAmount                  : double                           read fAmount                  write fAmount                  ;
  property rBalance                 : double                           read fBalance                 write fBalance                 ;
  property eItemClass               : TbfngItemClass                   read fItemClass               write fItemClass               ;
  property dictItemClassData        : TDictionary<string, string>      read fItemClassData           write fItemClassData           ;
  property oLegacyData              : TbfStatementLegacyDataObj        read fLegacyData              write fLegacyData              ;
end ;

type ArrayOfTbfStatementItemObj = array of TbfStatementItemObj ;



{********************************************************}
{ Class structure for holding an AccountStatementReport. }
{********************************************************}
type TbfAccountStatementReportObj = class(TObject)
private
  fMoreAvailable           : boolean ;

public
  constructor Create ;
  destructor  Destroy ; override ;

  var
    aAccountStatement : ArrayOfTbfStatementItemObj ;

  property bMoreAvailable           : boolean                          read fMoreAvailable           write fMoreAvailable           ;
end ;




implementation

uses LBS_BetfairAPINGUtils ;




{************************************************************************************}
constructor EbfAPIError.Create(aErrorCode : integer ;
                               aMessage   : string ;
                               aSORequest : ISuperObject ;
                               aResponse  : string ) ;
{************************************************************************************}
begin
  inherited Create( 'Betfair API Error : ' + aMessage ) ;
  fErrorCode := aErrorCode ;
  fMessage   := aMessage ;
  fResponse  := aResponse ;
  
  if aSORequest <> nil then fRequest := aSORequest.asstring else fRequest   := '' ;
end ;



{************************************************************************************}
constructor TbfTimeRangeObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fFrom  := gNullDate ;
  fTo    := gNullDate ;
end ;



{************************************************************************************}
destructor TbfTimeRangeObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfTimeRangeResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fbfTimeRange := TbfTimeRangeObj.create ;
  fMarketCount := 0 ;
end ;



{************************************************************************************}
destructor TbfTimeRangeResultObj.Destroy ;
{************************************************************************************}
begin
  freeandnil(fbfTimeRange) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCountryCodeResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCountryCode         := '' ;
  fMarketCount         := 0 ;
end ;



{************************************************************************************}
destructor TbfCountryCodeResultObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfVenueResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fVenue         := '' ;
  fMarketCount   := 0 ;
end ;



{************************************************************************************}
destructor TbfVenueResultObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketTypeResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMarketType         := '' ;
  fMarketCount        := 0 ;
end ;



{************************************************************************************}
destructor TbfMarketTypeResultObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfEventTypeObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fEventTypeId           := '' ;
  fEventTypeName         := '' ;
end ;



{************************************************************************************}
destructor TbfEventTypeObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCompetitionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCompetitionId           := '' ;
  fCompetitionName         := '' ;
end ;



{************************************************************************************}
destructor TbfCompetitionObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfEventObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fEventId             := '' ;
  fEventName           := '' ;
  fCountryCode         := '' ;
  fTimezone            := '' ;
  fVenue               := '' ;
  fOpenDate            := gNullDate ;
end ;



{************************************************************************************}
destructor TbfEventObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfListEventTypesResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fbfEventType           := TbfEventTypeObj.create ;
  fMarketCount           := 0 ;
end ;



{************************************************************************************}
destructor TbfListEventTypesResultObj.Destroy ;
{************************************************************************************}
begin
  freeandnil(fbfEventType) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfListCompetitionsResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fbfCompetition           := TbfCompetitionObj.create ;
  fMarketCount             := 0 ;
  fCompetitionRegion       := '' ;
end ;



{************************************************************************************}
destructor TbfListCompetitionsResultObj.Destroy ;
{************************************************************************************}
begin
  freeandnil(fbfCompetition) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfListEventsResultObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fbfEvent                 := TbfEventObj.create ;
  fMarketCount             := 0 ;
end ;



{************************************************************************************}
destructor TbfListEventsResultObj.Destroy ;
{************************************************************************************}
begin
  freeandnil(fbfEvent) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketDescriptionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fPersistenceEnabled  := false ;
  fBSPMarket           := false ;
  fMarketTime          := gNullDate ;
  fSuspendTime         := gNullDate ;
  fSettleTime          := gNullDate ;
  fBettingType         := bfmbtUnknown ;
  fTurnInPlayEnabled   := false ;
  fMarketType          := '' ;
  fRegulator           := '' ;
  fMarketBaseRate      := 0 ;
  fDiscountAllowed     := false ;
  fWallet              := '' ;
  fRules               := '' ;
  fRulesHasDate        := false ;
  fClarifications      := '' ;
end ;



{************************************************************************************}
destructor TbfMarketDescriptionObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfRunnerCatalogueObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fSelectionId         := 0 ;
  fRunnerName          := '' ;
  fHandicap            := 0 ;
  fSortPriority        := 0 ;
  fMetaData            := TDictionary<string, string>.create ;
end ;



{************************************************************************************}
destructor TbfRunnerCatalogueObj.Destroy ;
{************************************************************************************}
begin
  fMetaData.free ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketCatalogueObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMarketId            := '' ;
  fMarketName          := '' ;
  fMarketStartTime     := gNulldate ;
  fMarketDesc          := TbfMarketDescriptionObj.create ;
  setlength(aRunners, 0) ;
  fEventType           := TbfEventTypeObj.create ;
  fCompetition         := TbfCompetitionObj.create ;
  fEvent               := TbfEventObj.create ;
end ;



{************************************************************************************}
destructor TbfMarketCatalogueObj.Destroy ;
{************************************************************************************}
var
  I : integer ;

begin
  freeandnil(fMarketDesc) ;
  freeandnil(fEventType) ;
  freeandnil(fCompetition) ;
  freeandnil(fEvent) ;

  if length(aRunners) > 0 then
  begin
    for I := 0 to length(aRunners) - 1 do freeandnil(aRunners[I]) ;
    setlength(aRunners, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfExBestOffersOverridesObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fBestPricesDepth          := -1 ;
  fRollupModel              := bfrollupNONE ;
  fRollupLimit              := -1 ;
  fRollupLiabilityThreshold := -1 ;
  fRollupLiabilityFactor    := -1 ;
end ;



{************************************************************************************}
destructor TbfExBestOffersOverridesObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfPriceProjectionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fPriceData                := [] ;
  fExBestOffersOverrides    := nil ; {Only created if required}
  fVirtualise               := false;
  fRolloverStakes           := false ;
end ;



{************************************************************************************}
destructor TbfPriceProjectionObj.Destroy ;
{************************************************************************************}
begin
  if fExBestOffersOverrides <> nil then freeandnil(fExBestOffersOverrides) ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfOrderObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fBetId                    := '' ;
  fOrderType                := bfordtypUnknown ;
  fOrderStatus              := bfordstUnknown ;
  fPersistenceType          := bfperstypUnknown ;
  fOrderSide                := bfSideUnknown ;
  fOrderPrice               := 0 ;
  fOrderSize                := 0 ;
  fBSPLiability             := 0 ;
  fPlacedDate               := gNullDate ;
  fAvgPriceMatched          := 0 ;
  fSizeMatched              := 0 ;
  fSizeRemaining            := 0 ;
  fSizeLapsed               := 0 ;
  fSizeCancelled            := 0 ;
  fSizeVoided               := 0 ;
end ;



{************************************************************************************}
destructor TbfOrderObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMatchObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fBetId                    := '' ;
  fMatchId                  := '' ;
  fSide                     := bfsideUnknown ;
  fPrice                    := 0 ;
  fSize                     := 0 ;
  fMatchDate                := gNullDate ;
end ;



{************************************************************************************}
destructor TbfMatchObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfPriceSizeObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fPrice                    := 0 ;
  fSize                     := 0 ;
end ;



{************************************************************************************}
destructor TbfPriceSizeObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfStartingPricesObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fNearPrice := 0 ;
  fFarPrice  := 0 ;
  fActualSP  := 0 ;
  
  setlength(aBackStakeTaken,    0) ;
  setlength(aLayLiabilityTaken, 0) ;
end ;



{************************************************************************************}
destructor TbfStartingPricesObj.Destroy ;
{************************************************************************************}
var
  I : longint ;

begin
  if length(aBackStakeTaken) > 0 then
  begin
    for I := 0 to length(aBackStakeTaken) - 1 do freeandnil(aBackStakeTaken[I]) ;
    setlength(aBackStakeTaken, 0) ;
  end ;

  if length(aLayLiabilityTaken) > 0 then
  begin
    for I := 0 to length(aLayLiabilityTaken) - 1 do freeandnil(aLayLiabilityTaken[I]) ;
    setlength(aLayLiabilityTaken, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfExchangePricesObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  setlength(aAvailableToBack, 0) ;
  setlength(aAvailableToLay, 0) ;
  setlength(aTradedVolume, 0) ;
end ;



{************************************************************************************}
destructor TbfExchangePricesObj.Destroy ;
{************************************************************************************}
var
  I : longint ;

begin
  if length(aAvailableToBack) > 0 then
  begin
    for I := 0 to length(aAvailableToBack) - 1 do freeandnil(aAvailableToBack[I]) ;
    setlength(aAvailableToBack, 0) ;
  end ;

  if length(aAvailableToLay) > 0 then
  begin
    for I := 0 to length(aAvailableToLay) - 1 do freeandnil(aAvailableToLay[I]) ;
    setlength(aAvailableToLay, 0) ;
  end ;

  if length(aTradedVolume) > 0 then
  begin
    for I := 0 to length(aTradedVolume) - 1 do freeandnil(aTradedVolume[I]) ;
    setlength(aTradedVolume, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfRunnerObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fSelectionId              := 0 ;
  fHandicap                 := 0 ;
  fRunnerStatus             := bfrnsUnknown ;
  fAdjustmentFactor         := 0 ;
  fLastPriceMatched         := 0 ;
  fTotalMatched             := 0 ;
  fRemovalDate              := gNullDate ;
  fSPPrices                 := nil ;
  fExchangePrices           := nil ;

  setlength(aOrders, 0) ;
  setlength(aMatches, 0) ;
end ;



{************************************************************************************}
destructor TbfRunnerObj.Destroy ;
{************************************************************************************}
var
  I : longint ;

begin
  if fSPPrices       <> nil then freeandnil(fSPPrices) ;
  if fExchangePrices <> nil then freeandnil(fExchangePrices) ;

  if length(aOrders) > 0 then
  begin
    for I := 0 to length(aOrders) - 1 do freeandnil(aOrders[I]) ;
    setlength(aOrders, 0) ;
  end ;

  if length(aMatches) > 0 then
  begin
    for I := 0 to length(aMatches) - 1 do freeandnil(aMatches[I]) ;
    setlength(aMatches, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketBookObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMarketId                 := 'unknown' ;
  fIsMarketDataDelayed      := false ;
  fMarketStatus             := bfmksUnknown ;
  fBetDelay                 := 0 ;
  fBSPReconciled            := false ;
  fComplete                 := false ;
  fInPlay                   := false ;
  fNoOfWinners              := 0 ;
  fNoOfRunners              := 0 ;
  fNoOfActiveRunners        := 0 ;
  fLastMatchTime            := gNullDate ;
  fTotalMatched             := 0 ;
  fTotalAvailable           := 0 ;
  fCrossMatching            := false ;
  fRunnersVoidable          := false ;
  fVersion                  := 0 ;

  setlength(aRunners, 0) ;
end ;



{************************************************************************************}
destructor TbfMarketBookObj.Destroy ;
{************************************************************************************}
var
  I : integer ;

begin
  if length(aRunners) > 0 then
  begin
    for I := 0 to length(aRunners) - 1 do freeandnil(aRunners[I]) ;
    setlength(aRunners, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfLimitOrderObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fSize                     := 0 ;
  fPrice                    := 0 ;
  fPersistenceType          := bfperstypUnknown ;
end ;


{************************************************************************************}
destructor TbfLimitOrderObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfLimitOnCloseOrderObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fLiability   := 0 ;
  fPrice       := 0 ;
end ;



{************************************************************************************}
destructor TbfLimitOnCloseOrderObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketOnCloseOrderObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fLiability   := 0 ;
end ;



{************************************************************************************}
destructor TbfMarketOnCloseOrderObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfPlaceInstructionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fOrderType                := bfordtypUnknown ;
  fSelectionId              := 0 ;
  fHandicap                 := -1 ;
  fSide                     := bfsideUnknown ;
  fLimitOrder               := nil ;
  fLimitOnCloseOrder        := nil ;
  fMarketOnCloseOrder       := nil ;
end ;



{************************************************************************************}
destructor TbfPlaceInstructionObj.Destroy ;
{************************************************************************************}
begin
  if fLimitOrder         <> nil then freeandnil(fLimitOrder) ;
  if fLimitOnCloseOrder  <> nil then freeandnil(fLimitOnCloseOrder) ;
  if fMarketOnCloseOrder <> nil then freeandnil(fMarketOnCloseOrder) ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfPlaceInstructionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fStatus                   := bfirsUnknown ;
  fErrorCode                := bfirecUnknown ;
  fInstruction              := nil ;
  fBetId                    := '' ;
  fPlacedDate               := gNullDate ;
  fAveragePriceMatched      := 0 ;
  fSizeMatched              := 0 ;
end ;



{************************************************************************************}
destructor TbfPlaceInstructionReportObj.Destroy ;
{************************************************************************************}
begin
  if fInstruction <> nil then freeandnil(fInstruction) ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCancelInstructionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fStatus                   := bfirsUnknown ;
  fErrorCode                := bfirecUnknown ;
  fInstruction              := nil ;
  fCancelledDate            := gNullDate ;
  fSizeCancelled            := 0 ;
end ;



{************************************************************************************}
destructor TbfCancelInstructionReportObj.Destroy ;
{************************************************************************************}
begin
  if fInstruction <> nil then freeandnil(fInstruction) ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfPlaceExecutionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCustomerRef              := '' ;
  fStatus                   := bfersUnknown ;
  fErrorCode                := bferecUnknown ;
  fMarketId                 := '' ;
  
  setlength(aInstructionReports, 0) ;
end ;



{************************************************************************************}
destructor TbfPlaceExecutionReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aInstructionReports) > 0 then
  begin
    for I := 0 to length(aInstructionReports) - 1 do freeandnil(aInstructionReports[I]) ;
    setlength(aInstructionReports, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCancelExecutionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCustomerRef              := '' ;
  fStatus                   := bfersUnknown ;
  fErrorCode                := bferecUnknown ;
  fMarketId                 := '' ;
  
  setlength(aInstructionReports, 0) ;
end ;



{************************************************************************************}
destructor TbfCancelExecutionReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aInstructionReports) > 0 then
  begin
    for I := 0 to length(aInstructionReports) - 1 do freeandnil(aInstructionReports[I]) ;
    setlength(aInstructionReports, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfReplaceExecutionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCustomerRef              := '' ;
  fStatus                   := bfersUnknown ;
  fErrorCode                := bferecUnknown ;
  fMarketId                 := '' ;
  
  setlength(aInstructionReports, 0) ;
end ;



{************************************************************************************}
destructor TbfReplaceExecutionReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aInstructionReports) > 0 then
  begin
    for I := 0 to length(aInstructionReports) - 1 do freeandnil(aInstructionReports[I]) ;
    setlength(aInstructionReports, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfUpdateExecutionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fCustomerRef              := '' ;
  fStatus                   := bfersUnknown ;
  fErrorCode                := bferecUnknown ;
  fMarketId                 := '' ;
  
  setlength(aInstructionReports, 0) ;
end ;



{************************************************************************************}
destructor TbfUpdateExecutionReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aInstructionReports) > 0 then
  begin
    for I := 0 to length(aInstructionReports) - 1 do freeandnil(aInstructionReports[I]) ;
    setlength(aInstructionReports, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCancelInstructionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fBetId            := '' ;
  fSizeReduction    := -1 ;
end ;



{************************************************************************************}
destructor TbfCancelInstructionObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfReplaceInstructionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fBetId       := '' ;
  fNewPrice    := 0 ;
end ;



{************************************************************************************}
destructor TbfReplaceInstructionObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfReplaceInstructionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fStatus                   := bfirsUnknown ;
  fErrorCode                := bfirecUnknown ;
  fCancelInstructionReport  := nil ;
  fPlaceInstructionReport   := nil ;
end ;



{************************************************************************************}
destructor TbfReplaceInstructionReportObj.Destroy ;
{************************************************************************************}
begin
  if fCancelInstructionReport <> nil then freeandnil(fCancelInstructionReport) ;
  if fPlaceInstructionReport  <> nil then freeandnil(fPlaceInstructionReport ) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfUpdateInstructionReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fStatus       := bfirsUnknown ;
  fErrorCode    := bfirecUnknown ;
  fInstruction  := nil ;
end ;



{************************************************************************************}
destructor TbfUpdateInstructionReportObj.Destroy ;
{************************************************************************************}
begin
  if fInstruction  <> nil then freeandnil(fInstruction) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfUpdateInstructionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fBetId           := '' ;
  fPersistenceType := bfperstypUnknown ;
end ;



{************************************************************************************}
destructor TbfUpdateInstructionObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCurrentOrderSummaryReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMoreAvailable   := false ;
end ;



{************************************************************************************}
destructor TbfCurrentOrderSummaryReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;

begin
  if length(aCurrentOrders) > 0 then
  begin
    for I := 0 to length(aCurrentOrders) - 1 do freeandnil(aCurrentOrders[I]) ;
    setlength(aCurrentOrders, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfClearedOrderSummaryReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMoreAvailable   := false ;
end ;



{************************************************************************************}
destructor TbfClearedOrderSummaryReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;

begin
  if length(aClearedOrders) > 0 then
  begin
    for I := 0 to length(aClearedOrders) - 1 do freeandnil(aClearedOrders[I]) ;
    setlength(aClearedOrders, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfCurrentOrderSummaryObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fBetId                  := '' ;
  fMarketId               := '' ;
  fSelectionId            := 0 ;
  fHandicap               := 0 ;
  fPriceSize              := nil ;
  fBSPLiability           := 0 ;
  fSide                   := bfsideUnknown ;
  fStatus                 := bfordstUnknown ;
  fPersistenceType        := bfperstypUnknown ;
  fOrderType              := bfordtypUnknown ;
  fPlacedDate             := gNullDate ;
  fMatchedDate            := gNullDate ;
  fAveragePriceMatched    := 0 ;
  fSizeMatched            := 0 ;
  fSizeRemaining          := 0 ;
  fSizeLapsed             := 0 ;
  fSizeCancelled          := 0 ;
  fSizeVoided             := 0 ;
  fRegulatorAuthCode      := '' ;
  fRegulatorCode          := '' ;
end ;



{************************************************************************************}
destructor TbfCurrentOrderSummaryObj.Destroy ;
{************************************************************************************}
begin
  if fPriceSize <> nil then freeandnil(fPriceSize) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfItemDescriptionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fEventTypeDesc             := '' ;
  fEventDesc                 := '' ;
  fMarketDesc                := '' ;
  fMarketStartTime           := gNullDate ;
  fRunnerDesc                := '' ;
  fNumberOfWinners           := 0 ;
end ;



{************************************************************************************}
destructor TbfItemDescriptionObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfRunnerIdObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fMarketId                  := '' ;
  fSelectionId               := 0 ;
  fHandicap                  := -1 ;
end ;



{************************************************************************************}
destructor TbfRunnerIdObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfClearedOrderSummaryObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fEventTypeId            := '' ;
  fEventId                := '' ;
  fMarketId               := '' ;
  fSelectionId            := 0 ;
  fHandicap               := 0 ;
  fBetId                  := '' ;
  fPlacedDate             := gNullDate ;
  fPersistenceType        := bfperstypUnknown ;
  fOrderType              := bfordtypUnknown ;
  fSide                   := bfsideUnknown ;
  fItemDescription        := nil ;
  fPriceRequested         := 0 ;
  fSettledDate            := gNullDate ;
  fBetCount               := 0 ;
  fCommission             := 0 ;
  fPriceMatched           := 0 ;
  fPriceReduced           := false ;
  fSizeSettled            := 0 ;
  fProfit                 := 0 ;
  fSizeCancelled          := 0 ;
end ;



{************************************************************************************}
destructor TbfClearedOrderSummaryObj.Destroy ;
{************************************************************************************}
begin
  if fItemDescription <> nil then freeandnil(fItemDescription) ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfRunnerProfitAndLossObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fSelectionId      := 0 ;
  fIfWin            := 0 ;
  fIfLose           := 0 ;
end ;



{************************************************************************************}
destructor TbfRunnerProfitAndLossObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfMarketProfitAndLossObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fMarketId          := '' ;
  fCommissionApplied := 0 ;
  setlength(aProfitAndLoss, 0) ;
end ;



{************************************************************************************}
destructor TbfMarketProfitAndLossObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aProfitAndLoss) > 0 then
  begin
    for I := 0 to length(aProfitAndLoss) - 1 do freeandnil(aProfitAndLoss[I]) ;
    setlength(aProfitAndLoss, 0) ;
  end ;

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfAccountFundsResponseObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fAvailableToBetBalance := -1 ;
  fExposure              := -1 ;
  fRetainedCommission    := -1 ;
  fExposureLimit         := -1 ;
end ;



{************************************************************************************}
destructor TbfAccountFundsResponseObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfAccountDetailsResponseObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fCurrencyCode         := '' ;
  fFirstName            := '' ;
  fLastName             := '' ;
  fLocaleCode           := '' ;
  fRegion               := '' ;
  fTimezone             := '' ;
  fDiscountRate         := -1 ;
  fPointsBalance        := -1 ;
end ;



{************************************************************************************}
destructor TbfAccountDetailsResponseObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfDeveloperAppVersionObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fOwner                := '' ;
  fVersionId            := -1 ;
  fVersion              := '' ;
  fApplicationKey       := '' ;
  fDelayData            := false ;
  fSubscriptionRequired := false ;
  fOwnerManaged         := false ;
  fActive               := false ;
end ;



{************************************************************************************}
destructor TbfDeveloperAppVersionObj.Destroy ;
{************************************************************************************}
begin

  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfDeveloperAppObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fAppName      := '' ;
  fAppId        := -1 ;
  setlength(aAppVersions, 0) ;
end ;



{************************************************************************************}
destructor TbfDeveloperAppObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aAppVersions) > 0 then
  begin
    for I := 0 to length(aAppVersions) - 1 do freeandnil(aAppVersions[I]) ;
    setlength(aAppVersions, 0) ;
  end ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfStatementLegacyDataObj.Create ;
{************************************************************************************}
begin
  inherited Create ;
  
  fAvgPrice                := 0 ;
  fBetSize                 := 0 ;
  fBetType                 := '' ;
  fBetCategoryType         := '' ;
  fCommissionRate          := '' ;
  fEventId                 := 0;
  fEventTypeId             := 0;
  fFullMarketName          := '' ;
  fGrossBetAmount          := 0 ;
  fMarketName              := '' ;
  fMarketType              := '' ;
  fPlacedDate              := gNullDate ;
  fSelectionId             := 0;
  fSelectionName           := '' ;
  fStartDate               := gNullDate ;
  fTransactionType         := '' ;
  fTransactionId           := 0;
  fWinLose                 := '' ;
end ;



{************************************************************************************}
destructor TbfStatementLegacyDataObj.Destroy ;
{************************************************************************************}
begin
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfStatementItemObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fRefId                   := '' ;
  fItemDate                := gNullDate ;
  fAmount                  := 0 ;
  fBalance                 := 0 ;
  fItemClass               := bfitcUNKNOWN ;
  fItemClassData           := TDictionary<string, string>.create ;
  fLegacyData              := nil ;
end ;



{************************************************************************************}
destructor TbfStatementItemObj.Destroy ;
{************************************************************************************}
begin
  fItemClassData.free ;

  if fLegacyData <> nil then freeandnil(fLegacyData) ;
  
  inherited Destroy ;
end ;



{************************************************************************************}
constructor TbfAccountStatementReportObj.Create ;
{************************************************************************************}
begin
  inherited Create ;

  fMoreAvailable           := false ;

  setlength(aAccountStatement, 0) ;
  
end ;



{************************************************************************************}
destructor TbfAccountStatementReportObj.Destroy ;
{************************************************************************************}
var
  I : longint ;
  
begin
  if length(aAccountStatement) > 0 then
  begin
    for I := 0 to length(aAccountStatement) - 1 do aAccountStatement[I].free ;
    setlength(aAccountStatement, 0) ;
  end ;
  
  inherited Destroy ;
end ;



initialization


end.
