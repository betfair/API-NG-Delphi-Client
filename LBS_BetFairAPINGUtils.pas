unit LBS_BetfairAPINGUtils ;

interface

uses sysutils, classes, superobject, IdHttp, LBS_BetfairAPINGClasses ;

const
  cbfngUKExchange              = 1 ;
  cbfngAUSExchange             = 2 ;

  cbfngBettingAPI_UKExchange   = 'https://api.betfair.com/exchange/betting/json-rpc/v1/' ;
  cbfngBettingAPI_AUSExchange  = 'https://api-au.betfair.com/exchange/betting/json-rpc/v1/' ;

  cbfngAccountsAPI_UKExchange  = 'https://api.betfair.com/exchange/account/json-rpc/v1/' ;
  cbfngAccountsAPI_AUSExchange = 'https://api-au.betfair.com/exchange/account/json-rpc/v1/' ;

  cBFLoginURLInternational     = 'https://identitysso.betfair.com/view/login?product=' ;
  cBFRedirectURL               = 'https://www.betfair.com' ;
  
  CRLF = chr(13) + chr(10) ;


var
  gNullDate : TDateTime ;


function bfngGetClientWithSessionAndAuth(sSession, sAppKey: string) : TIdHttp ;

procedure HandleAPINGErrorResponse(sFunction : string ;
                                   IRequest  : ISuperObject ;
                                   IResponse : ISuperObject) ;

function bfngGetTimeRangeJson( dFrom, dTo : TDateTime ) : ISuperObject ;

function bfngGetMarketFilterJson( sTextQuery             : string ;
                                  slEventTypeId          : TStringList ;
                                  slEventId              : TStringList ;
                                  triBSPOnly             : TTriState ;
                                  triTurnInplayEnabled   : TTriState ;
                                  triInplayOnly          : TTriState ;
                                  dMarketStartTimeLo     : TDateTime ; {Set to gNullDate if not required}
                                  dMarketStartTimeHi     : TDateTime ;
                                  setMarketBettingType   : TbfngMarketBettingTypeSet ;
                                  slMarketTypeCode       : TStringList
                                 ) : ISuperObject ;



function TbfngMarketBettingTypeToStr         ( E : TbfngMarketBettingType          ) : string ;
function TbfngMarketStatusToStr              ( E : TbfngMarketStatus               ) : string ;
function TbfngRunnerStatusToStr              ( E : TbfngRunnerStatus               ) : string ;
function TbfngOrderTypeToStr                 ( E : TbfngOrderType                  ) : string ;
function TbfngOrderStatusToStr               ( E : TbfngOrderStatus                ) : string ;
function TbfngPersistenceTypeToStr           ( E : TbfngPersistenceType            ) : string ;
function TbfngSideToStr                      ( E : TbfngSide                       ) : string ;
function TbfngExecutionReportStatusToStr     ( E : TbfngExecutionReportStatus      ) : string ;
function TbfngExecutionReportErrorCodeToStr  ( E : TbfngExecutionReportErrorCode   ) : string ;
function TbfngInstructionReportStatusToStr   ( E : TbfngInstructionReportStatus    ) : string ;
function TbfngInstructionReportErrorCodeToStr( E : TbfngInstructionReportErrorCode ) : string ;
function TbfngItemClassToStr                 ( E : TbfngItemClass                  ) : string ;


function DateTimeToJsonString( D : TDateTime  ) : widestring ;
function JsonStringToDateTime( S : widestring ) : TDateTime ;

function iifstr( BooleanCheck : boolean ;
                 TrueStr, FalseStr : string ) : string ;



implementation

uses StrUtils, DateUtils, Windows, Math, Messages, XSBuiltIns ;





{************************************************************************************}
function bfngGetClientWithSessionAndAuth(sSession, sAppKey: string) : TIdHttp ;
{************************************************************************************}
begin
  Result                     := TIdHttp.Create(nil) ;
  Result.Request.ContentType := 'application/json';
  Result.Request.Accept      := 'application/json';
  Result.ReadTimeout         := 60000 ; {60s. Default is -1 for infinite timeout which produces a 'Socket Error 10060' on Windows 8}

  {*********************************}
  { Add the authentication headers. }
  {*********************************}
  Result.Request.CustomHeaders.Add('X-Application:'    + sAppKey ) ;
  Result.Request.CustomHeaders.Add('X-Authentication:' + sSession) ;

  {****************************************************************************}
  { Try to ensure persistent connections - connections are expensive to setup. }
  {****************************************************************************}
  Result.Request.Connection := 'keep-alive' ;
  Result.HTTPOptions := Result.HTTPOptions + [ hoKeepOrigProtocol ] ;
end ;



{************************************************************************************}
procedure HandleAPINGErrorResponse(sFunction : string ;
                                   IRequest  : ISuperObject ;
                                   IResponse : ISuperObject) ;
{************************************************************************************}
var
  sError, sMessage : string ;
  
begin
  try
    try
      sError := 'Betfair API-NG Exception Error. ErrorCode:' + inttostr(IResponse['error']['code'   ].asinteger) + ' Message:' + IResponse['error']['message'].asstring ;

      sMessage := IResponse['error']['message'].asstring ;

      if sMessage = 'DSC-0009' then sError := sError + CRLF + 'ClassConversionFailure (Invalid format for parameter, for example passing a string where a number was expected. Can also happen when a value is passed that does not match any valid enum.)' ;
      if sMessage = 'DSC-0018' then sError := sError + CRLF + 'MandatoryNotDefined (A parameter marked as mandatory was not provided)' ;
      if sMessage = 'DSC-0019' then sError := sError + CRLF + 'Timeout (The request has timed out)' ;
      if sMessage = 'DSC-0021' then sError := sError + CRLF + 'NoSuchOperation (The operation specified does not exist)' ;
      if sMessage = 'DSC-0023' then sError := sError + CRLF + 'NoSuchService' ;
      if sMessage = 'DSC-0034' then sError := sError + CRLF + 'UnknownCaller (An App Key has not been provided in the request)' ;
      if sMessage = 'DSC-0035' then sError := sError + CRLF + 'UnrecognisedCredentials' ;
      if sMessage = 'DSC-0036' then sError := sError + CRLF + 'InvalidCredentials' ;
      if sMessage = 'DSC-0037' then sError := sError + CRLF + 'SubscriptionRequired (The user is not subscribed to the App Key provided)' ;
      if sMessage = 'DSC-0038' then sError := sError + CRLF + 'OperationForbidden' ;
      
      if IResponse['error']['data'] <> nil then
      begin
        sError := sError + CRLF + ' ExceptionName:' + IResponse['error']['data']['exceptionname'].asstring ;
        
        if IResponse['error']['data']['APINGException'] <> nil then
        begin
          sError := sError + ' ErrorDetails:' + IResponse['error']['data']['APINGException']['errorDetails'].asstring +
                             ' ErrorCode: '   + IResponse['error']['data']['APINGException']['errorCode'   ].asstring +
                             ' RequestUUID: ' + IResponse['error']['data']['APINGException']['requestUUID' ].asstring ;
        end ;
      end ;

      raise EbfFunctionError.Create(-1, iifstr(sFunction<>'','Error calling Betfair API function ' + sFunction + ': ', 'Betfair API error: ') + sError, IRequest, IResponse.asstring) ;
      
    except
      on E:Exception do
      begin
        raise ;
      end ;
    end ;
  finally
  end ;
end ;



{************************************************************************************}
function bfngGetTimeRangeJson( dFrom, dTo : TDateTime ) : ISuperObject ;
{************************************************************************************}
begin
  try
    result := SO ;
  
    if (dFrom <> gNullDate) and (dTo <> gNullDate) then
    begin
      result.S['from'] := DateTimeToJsonString(dFrom) ;
      result.S['to'  ] := DateTimeToJsonString(dTo  ) ;
    end ;

  except
    on E:Exception do
    begin
      result := nil ;
      raise EbfAPIError.Create(-1, 'Exception in bfngGetTimeRangeJson: ' + E.Message, nil, '') ;
    end ;
  end ;
end ;



{************************************************************************************}
function bfngGetMarketFilterJson( sTextQuery             : string ;
                                  slEventTypeId          : TStringList ;
                                  slEventId              : TStringList ;
                                  triBSPOnly             : TTriState ;
                                  triTurnInplayEnabled   : TTriState ;
                                  triInplayOnly          : TTriState ;
                                  dMarketStartTimeLo     : TDateTime ; {Set to gNullDate if not required}
                                  dMarketStartTimeHi     : TDateTime ;
                                  setMarketBettingType   : TbfngMarketBettingTypeSet ;
                                  slMarketTypeCode       : TStringList
                                 ) : ISuperObject ;
{************************************************************************************}
var
  I, iIndex : integer ;
  
begin
  try
    result := SO ;

    {************}
    { Text Query }
    {************}
    if length(sTextQuery) > 0 then result.S['textQuery'] := sTextQuery ;

    {**************}
    { EventTypeIds }
    {**************}
    if slEventTypeId <> nil then
    begin
      if slEventTypeId.count > 0 then
      begin
        result.O['eventTypeIds'] := SA([]) ;
        for iIndex := 0 to slEventTypeId.count - 1 do result.A['eventTypeIds'].S[iIndex] := slEventTypeId[iIndex] ;
      end ;
    end ;

    {**************}
    { EventIds     }
    {**************}
    if slEventId <> nil then
    begin
      if slEventId.count > 0 then
      begin
        result.O['eventIds'] := SA([]) ;
        for iIndex := 0 to slEventId.count - 1 do result.A['eventIds'].S[iIndex] := slEventId[iIndex] ;
      end ;
    end ;

    {**********}
    { BSP Only }
    {**********}
    case triBSPOnly of
      triTrue:  result.B['bspOnly'] := true ;
      triFalse: result.B['bspOnly'] := false ;
      triNone: ;
    end ;

    {*********************}
    { Turn Inplay Enabled }
    {*********************}
    case triTurnInplayEnabled of
      triTrue:  result.B['turnInPlayEnabled'] := true ;
      triFalse: result.B['turnInPlayEnabled'] := false ;
      triNone: ;
    end ;

    {************************}
    { Currently In-Play Only }
    {************************}
    case triInplayOnly of
      triTrue:  result.B['inPlayOnly'] := true ;
      triFalse: result.B['inPlayOnly'] := false ;
      triNone: ;
    end ;

    {**********************}
    { Market Betting Types }
    {**********************}
    if setMarketBettingType <> [] then
    begin
      result.O['marketBettingTypes'] := SA([]) ;
      I := 0 ;

      if bfmbtODDS                       in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'ODDS' ;                       end ;
      if bfmbtLINE                       in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'LINE' ;                       end ;
      if bfmbtRANGE                      in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'RANGE' ;                      end ;
      if bfmbtASIAN_HANDICAP_DOUBLE_LINE in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'ASIAN_HANDICAP_DOUBLE_LINE' ; end ;
      if bfmbtASIAN_HANDICAP_SINGLE_LINE in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'ASIAN_HANDICAP_SINGLE_LINE' ; end ;
      if bfmbtFIXED_ODDS                 in setMarketBettingType then begin inc(I) ; result.A['marketBettingTypes'].S[I-1] := 'FIXED_ODDS' ;                 end ;
    end ;


    {*******************}
    { Market Type Codes }
    {*******************}
    if slMarketTypeCode <> nil then
    begin
      if slMarketTypeCode.count > 0 then
      begin
        result.O['marketTypeCodes'] := SA([]) ;
        for iIndex := 0 to slMarketTypeCode.count - 1 do result.A['marketTypeCodes'].S[iIndex] := slMarketTypeCode[iIndex] ;
      end ;
    end ;


    {**************************}
    { Market start Time range. }
    {**************************}
    if (dMarketStartTimeLo <> gNullDate) and (dMarketStartTimeHi <> gNullDate) then
      result.O['marketStartTime'] := bfngGetTimeRangeJson(dMarketStartTimeLo, dMarketStartTimeHi) ;

  except
    on E:Exception do
    begin
      result := nil ;
      raise EbfAPIError.Create(-1, 'Exception in bfngGetMarketFilterJson: ' + E.Message, nil, '') ;
    end ;
  end ;
end ;



{************************************************************************************}
function TbfngMarketBettingTypeToStr( E : TbfngMarketBettingType ) : string ;
{************************************************************************************}
begin
  case E of
    bfmbtUnknown:                    result := 'Unknown' ;
    bfmbtODDS:                       result := 'ODDS' ;
    bfmbtLINE:                       result := 'LINE' ;
    bfmbtRANGE:                      result := 'RANGE' ;
    bfmbtASIAN_HANDICAP_DOUBLE_LINE: result := 'ASIAN_HANDICAP_DOUBLE_LINE' ;
    bfmbtASIAN_HANDICAP_SINGLE_LINE: result := 'ASIAN_HANDICAP_SINGLE_LINE' ;
    bfmbtFIXED_ODDS:                 result := 'FIXED_ODDS' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngMarketStatusToStr( E : TbfngMarketStatus ) : string ;
{************************************************************************************}
begin
  case E of
    bfmksUnknown:   result := 'Unknown' ;
    bfmksINACTIVE:  result := 'INACTIVE' ;
    bfmksOPEN:      result := 'OPEN' ;
    bfmksSUSPENDED: result := 'SUSPENDED' ;
    bfmksCLOSED:    result := 'CLOSED' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngRunnerStatusToStr( E : TbfngRunnerStatus ) : string ;
{************************************************************************************}
begin
  case E of
    bfrnsUnknown:        result := 'Unknown' ;
    bfrnsACTIVE:         result := 'ACTIVE' ;
    bfrnsWINNER:         result := 'WINNER' ;
    bfrnsLOSER:          result := 'LOSER' ;
    bfrnsREMOVED_VACANT: result := 'REMOVED_VACANT' ;
    bfrnsREMOVED:        result := 'REMOVED' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngOrderTypeToStr( E : TbfngOrderType ) : string ;
{************************************************************************************}
begin
  case E of
    bfordtypUnknown:         result := 'Unknown' ;
    bfordtypLIMIT:           result := 'LIMIT' ;
    bfordtypLIMIT_ON_CLOSE:  result := 'LIMIT_ON_CLOSE' ;
    bfordtypMARKET_ON_CLOSE: result := 'MARKET_ON_CLOSE' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngOrderStatusToStr( E : TbfngOrderStatus ) : string ;
{************************************************************************************}
begin
  case E of
    bfordstUnknown:            result := 'Unknown' ;
    bfordstEXECUTION_COMPLETE: result := 'EXECUTION_COMPLETE' ;
    bfordstEXECUTABLE:         result := 'EXECUTABLE' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngPersistenceTypeToStr( E : TbfngPersistenceType ) : string ;
{************************************************************************************}
begin
  case E of
    bfperstypUnknown:         result := 'Unknown' ;
    bfperstypLAPSE:           result := 'LAPSE' ;
    bfperstypPERSIST:         result := 'PERSIST' ;
    bfperstypMARKET_ON_CLOSE: result := 'MARKET_ON_CLOSE' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngSideToStr( E : TbfngSide ) : string ;
{************************************************************************************}
begin
  case E of
    bfsideUnknown: result := 'Unknown' ;
    bfsideBACK:    result := 'BACK' ;
    bfsideLAY:     result := 'LAY' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngExecutionReportStatusToStr( E : TbfngExecutionReportStatus ) : string ;
{************************************************************************************}
begin
  case E of
    bfersUnknown:                result := 'Unknown' ;
    bfersSUCCESS:                result := 'SUCCESS' ;
    bfersFAILURE:                result := 'FAILURE' ;
    bfersPROCESSED_WITH_ERRORS:  result := 'PROCESSED_WITH_ERRORS' ;
    bfersTIMEOUT:                result := 'TIMEOUT' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngExecutionReportErrorCodeToStr( E : TbfngExecutionReportErrorCode ) : string ;
{************************************************************************************}
begin
  case E of
    bferecUnknown:                     result := 'Unknown' ;
    bferecERROR_IN_MATCHER:            result := 'ERROR_IN_MATCHER' ;
    bferecPROCESSED_WITH_ERRORS:       result := 'PROCESSED_WITH_ERRORS' ;
    bferecBET_ACTION_ERROR:            result := 'BET_ACTION_ERROR' ;
    bferecINVALID_ACCOUNT_STATE:       result := 'INVALID_ACCOUNT_STATE' ;
    bferecINVALID_WALLET_STATUS:       result := 'INVALID_WALLET_STATUS' ;
    bferecINSUFFICIENT_FUNDS:          result := 'INSUFFICIENT_FUNDS' ;
    bferecLOSS_LIMIT_EXCEEDED:         result := 'LOSS_LIMIT_EXCEEDED' ;
    bferecMARKET_SUSPENDED:            result := 'MARKET_SUSPENDED' ;
    bferecMARKET_NOT_OPEN_FOR_BETTING: result := 'MARKET_NOT_OPEN_FOR_BETTING' ;
    bferecDUPLICATE_TRANSACTION:       result := 'DUPLICATE_TRANSACTION' ;
    bferecINVALID_ORDER:               result := 'INVALID_ORDER' ;
    bferecINVALID_MARKET_ID:           result := 'INVALID_MARKET_ID' ;
    bferecPERMISSION_DENIED:           result := 'PERMISSION_DENIED' ;
    bferecDUPLICATE_BETIDS:            result := 'DUPLICATE_BETIDS' ;
    bferecNO_ACTION_REQUIRED:          result := 'NO_ACTION_REQUIRED' ;
    bferecSERVICE_UNAVAILABLE:         result := 'SERVICE_UNAVAILABLE' ;
    bferecREJECTED_BY_REGULATOR:       result := 'REJECTED_BY_REGULATOR' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngInstructionReportStatusToStr( E : TbfngInstructionReportStatus ) : string ;
{************************************************************************************}
begin
  case E of
    bfirsUnknown: result := 'Unknown' ;
    bfirsSUCCESS: result := 'SUCCESS' ;
    bfirsFAILURE: result := 'FAILURE' ;
    bfirsTIMEOUT: result := 'TIMEOUT' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngInstructionReportErrorCodeToStr( E : TbfngInstructionReportErrorCode ) : string ;
{************************************************************************************}
begin
  case E of
    bfirecUnknown:                         result := 'Unknown' ;
    bfirecINVALID_BET_SIZE:                result := 'INVALID_BET_SIZE' ;
    bfirecINVALID_RUNNER:                  result := 'INVALID_RUNNER' ;
    bfirecBET_TAKEN_OR_LAPSED:             result := 'BET_TAKEN_OR_LAPSED' ;
    bfirecBET_IN_PROGRESS:                 result := 'BET_IN_PROGRESS' ;
    bfirecRUNNER_REMOVED:                  result := 'RUNNER_REMOVED' ;
    bfirecMARKET_NOT_OPEN_FOR_BETTING:     result := 'MARKET_NOT_OPEN_FOR_BETTING' ;
    bfirecLOSS_LIMIT_EXCEEDED:             result := 'LOSS_LIMIT_EXCEEDED' ;
    bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING: result := 'MARKET_NOT_OPEN_FOR_BSP_BETTING' ;
    bfirecINVALID_PRICE_EDIT:              result := 'INVALID_PRICE_EDIT' ;
    bfirecINVALID_ODDS:                    result := 'INVALID_ODDS' ;
    bfirecINSUFFICIENT_FUNDS:              result := 'INSUFFICIENT_FUNDS' ;
    bfirecINVALID_PERSISTENCE_TYPE:        result := 'INVALID_PERSISTENCE_TYPE' ;
    bfirecERROR_IN_MATCHER:                result := 'ERROR_IN_MATCHER' ;
    bfirecINVALID_BACK_LAY_COMBINATION:    result := 'INVALID_BACK_LAY_COMBINATION' ;
    bfirecERROR_IN_ORDER:                  result := 'ERROR_IN_ORDER' ;
    bfirecINVALID_BID_TYPE:                result := 'INVALID_BID_TYPE' ;
    bfirecINVALID_BET_ID:                  result := 'INVALID_BET_ID' ;
    bfirecCANCELLED_NOT_PLACED:            result := 'CANCELLED_NOT_PLACED' ;
    bfirecRELATED_ACTION_FAILED:           result := 'RELATED_ACTION_FAILED' ;
    bfirecNO_ACTION_REQUIRED:              result := 'NO_ACTION_REQUIRED' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{************************************************************************************}
function TbfngItemClassToStr( E : TbfngItemClass ) : string ;
{************************************************************************************}
begin
  case E of
    bfitcUNKNOWN:       result := 'UNKNOWN' ;
  else
    result := 'Unrecognised' ;
  end ;
end ;



{*****************************************************************************************}
function DateTimeToJsonString( D : TDateTime ) : widestring ;
{*****************************************************************************************}
begin
  result := '?' ;
  
  with TXSDateTime.Create() do
  begin
    try
      AsDateTime := D ;
      result     := NativeToXS ; 
    finally
      Free;
    end;
  end ;
end ;



{*****************************************************************************************}
function JsonStringToDateTime( S : widestring ) : TDateTime ;
{*****************************************************************************************}
begin
  result := gNullDate ;

  with TXSDateTime.Create() do
  begin
    try
      XSToNative(S) ;
      result := AsDateTime ;
    finally
      Free ;
    end ;
  end ;
end ;



{*****************************************************************************************}
function iifstr( BooleanCheck : boolean ;
                 TrueStr, FalseStr : string ) : string ;
{*****************************************************************************************}
begin
  if BooleanCheck then result := TrueStr else result := FalseStr ;
end ;




initialization
  FormatSettings.decimalseparator := '.' ;
  FormatSettings.dateseparator    := '/' ;
  FormatSettings.timeseparator    := ':' ;
  FormatSettings.shortdateformat  := 'dd/mm/yyyy' ; { Affects date<-->string conversions }
  FormatSettings.longtimeformat   := 'hh:mm:ss' ;
  
  gNullDate                       := strtodate('01/01/1901') ;
end.
