unit LBS_BetfairAPINGFunctions ;

interface

uses forms, sysutils, classes, dialogs, superobject, LBS_BetfairAPINGClasses, LBS_BetfairAPINGUtils ;    

var
  gDebugJSON : boolean ; {For debugging purposes only. If true will dump JSON request/response strings to a popup form.}


function bfngKeepAlive          ( sSessionToken, sAppKey : string ;
                                  var sError             : string ) : boolean ;
                                  
function bfngLogout             ( sSessionToken, sAppKey : string ;
                                  var sError             : string ) : boolean ;

function bfngListCompetitions   ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfListCompetitionsResultObj ) : boolean ;

function bfngListCountries      ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfCountryCodeResultObj ) : boolean ;

function bfngListEvents         ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfListEventsResultObj ) : boolean ;

function bfngListEventTypes     ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfListEventTypesResultObj ) : boolean ;

function bfngListMarketBook     ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  slMarketIds            : TStringList ;
                                  oPriceProjection       : TbfPriceProjectionObj ;
                                  eOrderProjection       : TbfngOrderProjection ;
                                  eMatchProjection       : TbfngMatchProjection ;
                                  sCurrencyCode          : string ;
                                  var aResult            : ArrayOfTbfMarketBookObj ) : boolean ;

function bfngListMarketCatalogue( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  setMarketProjection    : TbfngMarketProjectionSet ;
                                  eMarketSort            : TbfngMarketSort ;
                                  iMaxResults            : integer ;  { Range: 1 to unlimited }
                                  var aResult            : ArrayOfTbfMarketCatalogueObj ) : boolean ;

function bfngListMarketTypes    ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfMarketTypeResultObj ) : boolean ;

function bfngListTimeRanges     ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  eGranularity           : TbfngTimeGranularity ;
                                  var aResult            : ArrayOfTbfTimeRangeResultObj ) : boolean ;

function bfngListVenues         ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  var aResult            : ArrayOfTbfVenueResultObj ) : boolean ;

function bfngPlaceOrders        ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  sMarketId              : string ;
                                  aInstructions          : ArrayOfTbfPlaceInstructionObj ;
                                  sCustomerRef           : string ;
                                  var oResult            : TbfPlaceExecutionReportObj ) : boolean ;

function bfngCancelOrders       ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  sMarketId              : string ;
                                  aInstructions          : ArrayOfTbfCancelInstructionObj ;
                                  sCustomerRef           : string ;
                                  var oResult            : TbfCancelExecutionReportObj ) : boolean ;

function bfngReplaceOrders      ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  sMarketId              : string ;
                                  aInstructions          : ArrayOfTbfReplaceInstructionObj ;
                                  sCustomerRef           : string ;
                                  var oResult            : TbfReplaceExecutionReportObj ) : boolean ;

function bfngUpdateOrders       ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  sMarketId              : string ;
                                  aInstructions          : ArrayOfTbfUpdateInstructionObj ;
                                  sCustomerRef           : string ;
                                  var oResult            : TbfUpdateExecutionReportObj ) : boolean ;

function bfngListCurrentOrders  ( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  slBetIds               : TStringList ;
                                  slMarketIds            : TStringList ;
                                  eOrderProjection       : TbfngOrderProjection ;
                                  oDateRange             : TbfTimeRangeObj ;
                                  eOrderBy               : TbfngOrderBy ;
                                  eSortDir               : TbfngSortDir ;
                                  var oResult            : TbfCurrentOrderSummaryReportObj ) : boolean ;

function bfngListClearedOrders  ( sSessionToken, sAppKey  : string ;
                                  iExchangeId             : integer ;
                                  eBetStatus              : TbfngBetStatus ;
                                  slEventTypeIds          : TStringList ;
                                  slEventIds              : TStringList ;
                                  slMarketIds             : TStringList ;
                                  aRunnerIds              : ArrayOfTbfRunnerIdObj ;
                                  slBetIds                : TStringList ;
                                  eSide                   : TbfngSide ;
                                  oSettledDateRange       : TbfTimeRangeObj ;
                                  eGroupBy                : TbfngGroupBy ;
                                  bIncludeItemDescription : boolean ;
                                  sLocale                 : string ;
                                  var oResult             : TbfClearedOrderSummaryReportObj ) : boolean ;

function bfngListMarketProfitAndLoss( sSessionToken, sAppKey  : string ;
                                      iExchangeId             : integer ;
                                      slMarketIds             : TStringList ;
                                      bIncludeSettledBets     : boolean ;
                                      bIncludeBSPBets         : boolean ;
                                      bNetOfCommission        : boolean ;
                                      var aResult             : ArrayOfTbfMarketProfitAndLossObj ) : boolean ;


function bfngGetAccountFunds       ( sSessionToken, sAppKey  : string ;
                                     iExchangeId             : integer ;
                                     var oResult             : TbfAccountFundsResponseObj ) : boolean ;

function bfngGetAccountStatement( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  oDateRange             : TbfTimeRangeObj ;
                                  eIncludeItem           : TbfngIncludeItem ;
                                  eWallet                : TbfngWallet ;
                                  sLocale                : string ;
                                  var oResult            : TbfAccountStatementReportObj ) : boolean ;



implementation

uses StrUtils, DateUtils, Windows, Math, Messages, IdHttp, IdSSLOpenSSL, IdLogFile, frmJSONDump ;



{************************************************************************************}
function bfngKeepAlive( sSessionToken, sAppKey : string ;
                        var sError             : string ) : boolean ;
{************************************************************************************}
var
  httpClient   : TIdHttp ;
  sslIOHandler : TIdSSLIOHandlerSocketOpenSSL ;
  IJson        : ISuperObject ;
  sResponse    : string ;
  formJSONDump : TfmJSONDump ;

begin
  result := false ;
  try
    try
      sError     := '' ;
      sResponse  := '' ;
      httpClient := TIdHttp.Create(nil) ;
      
      httpClient.Request.Accept := 'application/json' ;
      httpClient.ReadTimeout    := 60000 ; {60s. Default is -1 for infinite timeout which produces a 'Socket Error 10060' on Windows 8}
      httpClient.Request.CustomHeaders.Add('X-Authentication:' + sSessionToken ) ;
      
      if sAppKey <> '' then httpClient.Request.CustomHeaders.Add('X-Application:' + sAppKey ) ;

      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      sResponse := httpClient.Get('https://identitysso.betfair.com/api/keepAlive') ;

      if httpClient.ResponseCode = 200 then
      begin
        if gDebugJSON then
        begin
          formJSONDump := TfmJSONDump.create(application) ;
          formJSONDump.caption := 'keepAlive' ;
          formJSONDump.memMsg.lines.add('JSON RESPONSE: ' + sResponse) ; 
          formJSONDump.show ;
        end ;

        IJson := SO(sResponse) ;

        if IJson['status'].asstring = 'SUCCESS' then
        begin
          result := true ;
        end else
        begin
          if IJson['error'] <> nil then sError := IJson['error'].asstring ;
        end ;
      end ;
    except
      result := false ;
    end ;
  finally
    httpClient.Free ;
    sslIOHandler.free ;
  end ;
end ;



{************************************************************************************}
function bfngLogout( sSessionToken, sAppKey : string ;
                     var sError             : string ) : boolean ;
{************************************************************************************}
var
  httpClient   : TIdHttp ;
  sslIOHandler : TIdSSLIOHandlerSocketOpenSSL ;
  IJson        : ISuperObject ;
  sResponse    : string ;
  formJSONDump : TfmJSONDump ;

begin
  result := false ;
  try
    try
      sError     := '' ;
      sResponse  := '' ;
      httpClient := TIdHttp.Create(nil) ;
      
      httpClient.Request.Accept := 'application/json' ;
      httpClient.ReadTimeout    := 60000 ; {60s. Default is -1 for infinite timeout which produces a 'Socket Error 10060' on Windows 8}
      httpClient.Request.CustomHeaders.Add('X-Authentication:' + sSessionToken ) ;
      
      if sAppKey <> '' then httpClient.Request.CustomHeaders.Add('X-Application:' + sAppKey ) ;

      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      sResponse := httpClient.Get('https://identitysso.betfair.com/api/logout') ;

      if httpClient.ResponseCode = 200 then
      begin
        if gDebugJSON then
        begin
          formJSONDump := TfmJSONDump.create(application) ;
          formJSONDump.caption := 'logout' ;
          formJSONDump.memMsg.lines.add('JSON RESPONSE: ' + sResponse) ; 
          formJSONDump.show ;
        end ;

        IJson := SO(sResponse) ;

        if IJson['status'].asstring = 'SUCCESS' then
        begin
          result := true ;
        end else
        begin
          if IJson['error'] <> nil then sError := IJson['error'].asstring ;
        end ;
      end ;
    except
      result := false ;
    end ;
  finally
    httpClient.Free ;
    sslIOHandler.free ;
  end ;
end ;



{************************************************************************************}
function bfngListCountries( sSessionToken, sAppKey : string ;
                            iExchangeId            : integer ;
                            IMarketFilter          : ISuperObject ;
                            var aResult            : ArrayOfTbfCountryCodeResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listCountries' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listCountries' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfCountryCodeResultObj.create ;
            if IResult['countryCode'] <> nil then aResult[iCount-1].sCountryCode := IResult['countryCode'].asstring ;
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listCountries', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listCountries. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listCountries: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;




{************************************************************************************}
function bfngListVenues( sSessionToken, sAppKey : string ;
                         iExchangeId            : integer ;
                         IMarketFilter          : ISuperObject ;
                         var aResult            : ArrayOfTbfVenueResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listVenues' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listVenues' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfVenueResultObj.create ;
            if IResult['venue'      ] <> nil then aResult[iCount-1].sVenue       := IResult['venue'      ].asstring ;
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listVenues', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listVenues. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listVenues: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListMarketTypes( sSessionToken, sAppKey : string ;
                              iExchangeId            : integer ;
                              IMarketFilter          : ISuperObject ;
                              var aResult            : ArrayOfTbfMarketTypeResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listMarketTypes' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listMarketTypes' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfMarketTypeResultObj.create ;
            if IResult['marketType' ] <> nil then aResult[iCount-1].sMarketType  := IResult['marketType' ].asstring ;
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listMarketTypes', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listMarketTypes. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listMarketTypes: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListTimeRanges( sSessionToken, sAppKey : string ;
                             iExchangeId            : integer ;
                             IMarketFilter          : ISuperObject ;
                             eGranularity           : TbfngTimeGranularity ;
                             var aResult            : ArrayOfTbfTimeRangeResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listTimeRanges' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listTimeRanges' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;

      case eGranularity of
        bftgUnknown: IParams.S['granularity'] := 'DAYS' ;
        bftgDAYS   : IParams.S['granularity'] := 'DAYS' ;
        bftgHOURS  : IParams.S['granularity'] := 'HOURS' ;
        bftgMINUTES: IParams.S['granularity'] := 'MINUTES' ;
      end ;

      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfTimeRangeResultObj.create ;
            
            if IResult['timeRange']['from'] <> nil then aResult[iCount-1].obfTimeRange.dFrom := JsonStringToDateTime( IResult['timeRange']['from'].asstring) ;
            if IResult['timeRange']['to'  ] <> nil then aResult[iCount-1].obfTimeRange.dTo   := JsonStringToDateTime( IResult['timeRange']['to'  ].asstring) ;
            
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listTimeRanges', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listTimeRanges. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listTimeRanges: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListEventTypes( sSessionToken, sAppKey : string ;
                             iExchangeId            : integer ;
                             IMarketFilter          : ISuperObject ;
                             var aResult            : ArrayOfTbfListEventTypesResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listEventTypes' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listEventTypes' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfListEventTypesResultObj.create ;
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
            
            if IResult['eventType']['id'  ] <> nil then aResult[iCount-1].obfEventType.sEventTypeId   := IResult['eventType']['id'  ].asstring ;
            if IResult['eventType']['name'] <> nil then aResult[iCount-1].obfEventType.sEventTypeName := IResult['eventType']['name'].asstring ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listEventTypes', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listEventTypes. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listEventTypes: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListCompetitions( sSessionToken, sAppKey : string ;
                               iExchangeId            : integer ;
                               IMarketFilter          : ISuperObject ;
                               var aResult            : ArrayOfTbfListCompetitionsResultObj ) : boolean ;
{************************************************************************************}
var
  iIndex             : integer ;
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listCompetitions' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listCompetitions' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
        
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfListCompetitionsResultObj.create ;
            if IResult['marketCount'] <> nil then aResult[iCount-1].iMarketCount := IResult['marketCount'].asinteger ;
            
            if IResult['competitionRegion'] <> nil then aResult[iCount-1].sCompetitionRegion := IResult['competitionRegion'].asstring  ;
    
            if IResult['competition']['id'  ] <> nil then aResult[iCount-1].obfCompetition.sCompetitionId   := IResult['competition']['id'  ].asstring ;
            if IResult['competition']['name'] <> nil then aResult[iCount-1].obfCompetition.sCompetitionName := IResult['competition']['name'].asstring ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listCompetitions', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listCompetitions. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listCompetitions: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListEvents( sSessionToken, sAppKey : string ;
                         iExchangeId            : integer ;
                         IMarketFilter          : ISuperObject ;
                         var aResult            : ArrayOfTbfListEventsResultObj ) : boolean ;
{************************************************************************************}
var
  iCount             : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listEvents' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listEvents' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      IParams.O['filter']   := IMarketFilter ;
      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
      
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;
    
            aResult[iCount-1] := TbfListEventsResultObj.create ;
            if IResult['marketCount']                <> nil then aResult[iCount-1].iMarketCount          := IResult['marketCount'].asinteger ;
            if IResult['event'      ]['id'         ] <> nil then aResult[iCount-1].obfEvent.sEventId     := IResult['event'      ]['id'         ].asstring ;
            if IResult['event'      ]['name'       ] <> nil then aResult[iCount-1].obfEvent.sEventName   := IResult['event'      ]['name'       ].asstring ;
            if IResult['event'      ]['countryCode'] <> nil then aResult[iCount-1].obfEvent.sCountryCode := IResult['event'      ]['countryCode'].asstring ;
            if IResult['event'      ]['timezone'   ] <> nil then aResult[iCount-1].obfEvent.sTimeZone    := IResult['event'      ]['timezone'   ].asstring ;
            if IResult['event'      ]['venue'      ] <> nil then aResult[iCount-1].obfEvent.sVenue       := IResult['event'      ]['venue'      ].asstring ;
            if IResult['event'      ]['openDate'   ] <> nil then aResult[iCount-1].obfEvent.dOpenDate    := JsonStringToDateTime( IResult['event']['openDate'].asstring) ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listEvents', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listEvents. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listEvents: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListMarketBookCallHandler( sSessionToken, sAppKey : string ;
                                        iExchangeId            : integer ;
                                        slMarketIds            : TStringList ;
                                        oPriceProjection       : TbfPriceProjectionObj ;
                                        eOrderProjection       : TbfngOrderProjection ;
                                        eMatchProjection       : TbfngMatchProjection ;
                                        sCurrencyCode          : string ;
                                        var aResult            : ArrayOfTbfMarketBookObj ) : boolean ;
{************************************************************************************}
var
  I, iCount, iIndex, iRun : longint ;
  S, sResponse            : string ;
  IFunction, IParams      : ISuperObject ;
  IResult, IJson          : ISuperObject ;
  IPriceProj, IMatch      : ISuperObject ;
  IRunner, Iso, IOrder    : ISuperObject ;
  httpClient              : TIdHttp ;
  sslIOHandler            : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                    : TStringStream ;
  formJSONDump            : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listMarketBook' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;

      {***************}
      { Market Ids    }
      {***************}
      IParams.O['marketIds'] := SA([]) ;

      if slMarketIds.count > 0 then
      begin
        for I := 0 to slMarketIds.count - 1 do
        begin
          IParams.A['marketIds'].S[I] := slMarketIds[I] ;
        end ;
      end else
      begin
        raise EbfAPIError.Create(-1, 'No Market Ids specified!', nil, '') ;
      end ;


      {*******************}
      { Market Projection }
      {*******************}
      if oPriceProjection <> nil then
      begin
        IPriceProj := SO ;
      
        IPriceProj.O['priceData'] := SA([]) ;
        I := 0 ;

        if bfpdSP_AVAILABLE        in oPriceProjection.setPriceData then begin inc(I) ; IPriceProj.A['priceData'].S[I-1] := 'SP_AVAILABLE' ;   end ;
        if bfpdSP_TRADED           in oPriceProjection.setPriceData then begin inc(I) ; IPriceProj.A['priceData'].S[I-1] := 'SP_TRADED' ;      end ;
        if bfpdEX_BEST_OFFERS      in oPriceProjection.setPriceData then begin inc(I) ; IPriceProj.A['priceData'].S[I-1] := 'EX_BEST_OFFERS' ; end ;
        if bfpdEX_ALL_OFFERS       in oPriceProjection.setPriceData then begin inc(I) ; IPriceProj.A['priceData'].S[I-1] := 'EX_ALL_OFFERS' ;  end ;
        if bfpdEX_TRADED           in oPriceProjection.setPriceData then begin inc(I) ; IPriceProj.A['priceData'].S[I-1] := 'EX_TRADED' ;      end ;


        if oPriceProjection.oBestOffersOverrides <> nil then
        begin
          IPriceProj.O['exBestOffersOverrides'] := SO ;

          if oPriceProjection.oBestOffersOverrides.iBestPricesDepth > -1 then
                   IPriceProj.O['exBestOffersOverrides'].I['bestPricesDepth'] := oPriceProjection.oBestOffersOverrides.iBestPricesDepth ;

          case oPriceProjection.oBestOffersOverrides.eRollupModel of
            bfrollupSTAKE:             IPriceProj.O['exBestOffersOverrides'].S['rollupModel'] := 'STAKE' ;
            bfrollupPAYOUT:            IPriceProj.O['exBestOffersOverrides'].S['rollupModel'] := 'PAYOUT' ;
            bfrollupMANAGED_LIABILITY: IPriceProj.O['exBestOffersOverrides'].S['rollupModel'] := 'MANAGED_LIABILITY' ;
            bfrollupNONE:              IPriceProj.O['exBestOffersOverrides'].S['rollupModel'] := 'NONE' ;
          end ;

          if oPriceProjection.oBestOffersOverrides.iRollupLimit > -1 then
                   IPriceProj.O['exBestOffersOverrides'].I['rollupLimit'] := oPriceProjection.oBestOffersOverrides.iRollupLimit ;

          if oPriceProjection.oBestOffersOverrides.rRollupLiabilityThreshold > -1 then
                   IPriceProj.O['exBestOffersOverrides'].S['rollupLiabilityThreshold'] := floattostrf(oPriceProjection.oBestOffersOverrides.rRollupLiabilityThreshold,ffFixed,15,2) ;

          if oPriceProjection.oBestOffersOverrides.iRollupLiabilityFactor > -1 then
                   IPriceProj.O['exBestOffersOverrides'].I['rollupLiabilityFactor'] := oPriceProjection.oBestOffersOverrides.iRollupLiabilityFactor ;
        end ;

        IPriceProj.B['virtualise']     := oPriceProjection.bVirtualise ;
        IPriceProj.B['rolloverStakes'] := oPriceProjection.bRolloverStakes ;
        
        IParams.O['priceProjection'] := IPriceProj ;
      end ;


      {******************}
      { Order Projection }
      {******************}
      if eOrderProjection <> bforpNone then
      begin
        case eOrderProjection of
          bforpALL:                IParams.S['orderProjection'] := 'ALL' ;
          bforpEXECUTABLE:         IParams.S['orderProjection'] := 'EXECUTABLE' ;
          bforpEXECUTION_COMPLETE: IParams.S['orderProjection'] := 'EXECUTION_COMPLETE' ;
        end ;
      end ;


      {******************}
      { Match Projection }
      {******************}
      if eMatchProjection <> bfmtpNone then
      begin
        case eMatchProjection of
          bfmtpNO_ROLLUP:              IParams.S['matchProjection'] := 'NO_ROLLUP' ;
          bfmtpROLLED_UP_BY_PRICE:     IParams.S['matchProjection'] := 'ROLLED_UP_BY_PRICE' ;
          bfmtpROLLED_UP_BY_AVG_PRICE: IParams.S['matchProjection'] := 'ROLLED_UP_BY_AVG_PRICE' ;
        end ;
      end ;


      {***************}
      { Currency Code }
      {***************}
      if length(sCurrencyCode) > 0 then IParams.S['currencyCode'] := sCurrencyCode ;

      IFunction.O['params'] := IParams ;

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listMarketBook' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
      
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;

            aResult[iCount-1] := TbfMarketBookObj.create ;

            with aResult[iCount-1] do
            begin
              if IResult['marketId'           ] <> nil then sMarketId            := IResult['marketId'           ].asstring ;
              if IResult['isMarketDataDelayed'] <> nil then bIsMarketDataDelayed := IResult['isMarketDataDelayed'].asboolean ;

              eMarketStatus := bfmksUnknown ;
              if IResult['status'] <> nil then
              begin
                if IResult['status'].asstring = 'INACTIVE'  then eMarketStatus := bfmksINACTIVE ;
                if IResult['status'].asstring = 'OPEN'      then eMarketStatus := bfmksOPEN ;
                if IResult['status'].asstring = 'SUSPENDED' then eMarketStatus := bfmksSUSPENDED ;
                if IResult['status'].asstring = 'CLOSED'    then eMarketStatus := bfmksCLOSED ;
              end ;
              
              if IResult['betDelay'             ] <> nil then iBetdelay            := IResult['betDelay'             ].asinteger ;
              if IResult['bspReconciled'        ] <> nil then bBSPReconciled       := IResult['bspReconciled'        ].asboolean ;
              if IResult['complete'             ] <> nil then bComplete            := IResult['complete'             ].asboolean ;
              if IResult['inplay'               ] <> nil then bInPlay              := IResult['inplay'               ].asboolean ;
              if IResult['numberOfWinners'      ] <> nil then iNoOfWinners         := IResult['numberOfWinners'      ].asinteger ;
              if IResult['numberOfRunners'      ] <> nil then iNoOfRunners         := IResult['numberOfRunners'      ].asinteger ;
              if IResult['numberOfActiveRunners'] <> nil then iNoOfActiveRunners   := IResult['numberOfActiveRunners'].asinteger ;
              if IResult['lastMatchTime'        ] <> nil then dLastMatchTime       := JsonStringToDateTime(IResult['lastMatchTime'].asstring) ;
              if IResult['totalMatched'         ] <> nil then rTotalMatched        := IResult['totalMatched'         ].asdouble ;
              if IResult['totalAvailable'       ] <> nil then rTotalAvailable      := IResult['totalAvailable'       ].asdouble ;
              if IResult['crossMatching'        ] <> nil then bCrossMatching       := IResult['crossMatching'        ].asboolean ;
              if IResult['runnersVoidable'      ] <> nil then bRunnersVoidable     := IResult['runnersVoidable'      ].asboolean ;
              if IResult['version'              ] <> nil then iVersion             := IResult['version'              ].asinteger ;
              
              
              if IResult['runners'] <> nil then
              begin
                iRun := 0 ;
                
                for IRunner in IResult['runners'] do
                begin
                  inc(iRun) ;
                  setlength(aRunners, iRun) ;

                  aRunners[iRun-1] := TbfRunnerObj.create ;

                  with aRunners[iRun-1] do
                  begin
                    if IRunner['selectionId'      ] <> nil then iSelectionId         := IRunner['selectionId'      ].asinteger ;
                    if IRunner['handicap'         ] <> nil then rHandicap            := IRunner['handicap'         ].asdouble ;

                    if IRunner['status'] <> nil then
                    begin
                      if IRunner['status'].asstring = 'ACTIVE'         then eRunnerStatus := bfrnsACTIVE ;
                      if IRunner['status'].asstring = 'WINNER'         then eRunnerStatus := bfrnsWINNER ;
                      if IRunner['status'].asstring = 'LOSER'          then eRunnerStatus := bfrnsLOSER ;
                      if IRunner['status'].asstring = 'REMOVED_VACANT' then eRunnerStatus := bfrnsREMOVED_VACANT ;
                      if IRunner['status'].asstring = 'REMOVED'        then eRunnerStatus := bfrnsREMOVED ;
                    end ;
                    
                    if IRunner['adjustmentFactor' ] <> nil then rAdjustmentFactor    := IRunner['adjustmentFactor' ].asdouble ;
                    if IRunner['lastPriceTraded'  ] <> nil then rLastPriceMatched    := IRunner['lastPriceTraded'  ].asdouble ;
                    if IRunner['totalMatched'     ] <> nil then rTotalMatched        := IRunner['totalMatched'     ].asdouble ;
                    if IRunner['removalDate'      ] <> nil then dRemovalDate         := JsonStringToDateTime(IRunner['removalDate'].asstring) ;

                    if IRunner['sp'] <> nil then
                    begin
                      oSPPrices := TbfStartingPricesObj.create ;

                      if IRunner['sp']['nearPrice'] <> nil then oSPPrices.rNearPrice    := IRunner['sp']['nearPrice'].asdouble ;
                      if IRunner['sp']['farPrice' ] <> nil then oSPPrices.rFarPrice     := IRunner['sp']['farPrice' ].asdouble ;

                      if IRunner['sp']['backStakeTaken'] <> nil then
                      begin
                        I := 0 ;
                        for Iso in IRunner['sp']['backStakeTaken'] do
                        begin
                          inc(I) ;
                          setlength(oSPPrices.aBackStakeTaken, I) ;
                          oSPPrices.aBackStakeTaken[I-1] := TbfPriceSizeObj.create ;
                          if Iso['price'] <> nil then oSPPrices.aBackStakeTaken[I-1].rPrice := Iso['price'].asdouble ;
                          if Iso['size' ] <> nil then oSPPrices.aBackStakeTaken[I-1].rSize  := Iso['size' ].asdouble ;
                        end ;  
                      end ;  
                        
                      if IRunner['sp']['layLiabilityTaken'] <> nil then
                      begin
                        I := 0 ;
                        for Iso in IRunner['sp']['layLiabilityTaken'] do
                        begin
                          inc(I) ;
                          setlength(oSPPrices.aLayLiabilityTaken, I) ;
                          oSPPrices.aLayLiabilityTaken[I-1] := TbfPriceSizeObj.create ;
                          if Iso['price'] <> nil then oSPPrices.aLayLiabilityTaken[I-1].rPrice := Iso['price'].asdouble ;
                          if Iso['size' ] <> nil then oSPPrices.aLayLiabilityTaken[I-1].rSize  := Iso['size' ].asdouble ;
                        end ;  
                      end ;  

                      if IRunner['sp']['actualSP' ] <> nil then oSPPrices.rActualSP    := IRunner['sp']['actualSP' ].asdouble ;
                    end ;


                    if IRunner['ex'] <> nil then
                    begin
                      oExchangePrices := TbfExchangePricesObj.create ;

                      if IRunner['ex']['availableToBack'] <> nil then
                      begin
                        I := 0 ;
                        for Iso in IRunner['ex']['availableToBack'] do
                        begin
                          inc(I) ;
                          setlength(oExchangePrices.aAvailableToBack, I) ;
                          oExchangePrices.aAvailableToBack[I-1] := TbfPriceSizeObj.create ;
                          if Iso['price'] <> nil then oExchangePrices.aAvailableToBack[I-1].rPrice := Iso['price'].asdouble ;
                          if Iso['size' ] <> nil then oExchangePrices.aAvailableToBack[I-1].rSize  := Iso['size' ].asdouble ;
                        end ;  
                      end ;  

                      if IRunner['ex']['availableToLay'] <> nil then
                      begin
                        I := 0 ;
                        for Iso in IRunner['ex']['availableToLay'] do
                        begin
                          inc(I) ;
                          setlength(oExchangePrices.aAvailableToLay, I) ;
                          oExchangePrices.aAvailableToLay[I-1] := TbfPriceSizeObj.create ;
                          if Iso['price'] <> nil then oExchangePrices.aAvailableToLay[I-1].rPrice := Iso['price'].asdouble ;
                          if Iso['size' ] <> nil then oExchangePrices.aAvailableToLay[I-1].rSize  := Iso['size' ].asdouble ;
                        end ;  
                      end ;  

                      if IRunner['ex']['tradedVolume'] <> nil then
                      begin
                        I := 0 ;
                        for Iso in IRunner['ex']['tradedVolume'] do
                        begin
                          inc(I) ;
                          setlength(oExchangePrices.aTradedVolume, I) ;
                          oExchangePrices.aTradedVolume[I-1] := TbfPriceSizeObj.create ;
                          if Iso['price'] <> nil then oExchangePrices.aTradedVolume[I-1].rPrice := Iso['price'].asdouble ;
                          if Iso['size' ] <> nil then oExchangePrices.aTradedVolume[I-1].rSize  := Iso['size' ].asdouble ;
                        end ;  
                      end ;  
                    end ;


                    if IRunner['orders'] <> nil then
                    begin
                      I := 0 ;
                      for IOrder in IRunner['orders'] do
                      begin
                        inc(I) ;
                        setlength(aOrders, I) ;
                        aOrders[I-1] := TbfOrderObj.create ;

                        with aOrders[I-1] do
                        begin
                          if IOrder['betId'           ] <> nil then sBetId            := IOrder['betId'           ].asstring ;
                          
                          if IOrder['orderType'] <> nil then
                          begin
                            if IOrder['orderType'].asstring = 'LIMIT'           then eOrderType := bfordtypLIMIT ;
                            if IOrder['orderType'].asstring = 'LIMIT_ON_CLOSE'  then eOrderType := bfordtypLIMIT_ON_CLOSE ;
                            if IOrder['orderType'].asstring = 'MARKET_ON_CLOSE' then eOrderType := bfordtypMARKET_ON_CLOSE ;
                          end ;

                          if IOrder['status'] <> nil then
                          begin
                            if IOrder['status'].asstring = 'EXECUTION_COMPLETE' then eOrderStatus := bfordstEXECUTION_COMPLETE ;
                            if IOrder['status'].asstring = 'EXECUTABLE'         then eOrderStatus := bfordstEXECUTABLE ;
                          end ;

                          if IOrder['persistenceType'] <> nil then
                          begin
                            if IOrder['persistenceType'].asstring = 'LAPSE'           then ePersistenceType := bfperstypLAPSE ;
                            if IOrder['persistenceType'].asstring = 'PERSIST'         then ePersistenceType := bfperstypPERSIST ;
                            if IOrder['persistenceType'].asstring = 'MARKET_ON_CLOSE' then ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                          end ;

                          if IOrder['side'] <> nil then
                          begin
                            if IOrder['side'].asstring = 'BACK' then eOrderSide := bfsideBACK ;
                            if IOrder['side'].asstring = 'LAY'  then eOrderSide := bfsideLAY ;
                          end ;

                          if IOrder['price'          ] <> nil then rOrderPrice        := IOrder['price'          ].asdouble ;
                          if IOrder['size'           ] <> nil then rOrderSize         := IOrder['size'           ].asdouble ;
                          if IOrder['bspLiability'   ] <> nil then rBSPLiability      := IOrder['bspLiability'   ].asdouble ;
                          if IOrder['placedDate'     ] <> nil then dPlacedDate        := JsonStringToDateTime(IOrder['placedDate'].asstring) ;
                          if IOrder['avgPriceMatched'] <> nil then rAvgPriceMatched   := IOrder['avgPriceMatched'].asdouble ;
                          if IOrder['sizeMatched'    ] <> nil then rSizeMatched       := IOrder['sizeMatched'    ].asdouble ;
                          if IOrder['sizeRemaining'  ] <> nil then rSizeRemaining     := IOrder['sizeRemaining'  ].asdouble ;
                          if IOrder['sizeLapsed'     ] <> nil then rSizeLapsed        := IOrder['sizeLapsed'     ].asdouble ;
                          if IOrder['sizeCancelled'  ] <> nil then rSizeCancelled     := IOrder['sizeCancelled'  ].asdouble ;
                          if IOrder['sizeVoided'     ] <> nil then rSizeVoided        := IOrder['sizeVoided'     ].asdouble ;
                        end ;
                      end ;
                    end ;



                    if IRunner['matches'] <> nil then
                    begin
                      I := 0 ;
                      for IMatch in IRunner['matches'] do
                      begin
                        inc(I) ;
                        setlength(aMatches, I) ;
                        aMatches[I-1] := TbfMatchObj.create ;

                        with aMatches[I-1] do
                        begin
                          if IMatch['betId'           ] <> nil then sBetId            := IMatch['betId'           ].asstring ;
                          if IMatch['matchId'         ] <> nil then sMatchId          := IMatch['matchId'         ].asstring ;

                          if IMatch['side'] <> nil then
                          begin
                            if IMatch['side'].asstring = 'BACK' then eSide := bfsideBACK ;
                            if IMatch['side'].asstring = 'LAY'  then eSide := bfsideLAY ;
                          end ;

                          if IMatch['price'           ] <> nil then rPrice            := IMatch['price'           ].asdouble ;
                          if IMatch['size'            ] <> nil then rSize             := IMatch['size'            ].asdouble ;
                          if IMatch['matchDate'       ] <> nil then dMatchDate        := JsonStringToDateTime(IMatch['matchDate'].asstring) ;
                        end ;
                      end ;
                    end ;
                    
                  end ;
                end ;
              end ;
            end ;

          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listMarketBook', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listMarketBook. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listMarketBook: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;




{************************************************************************************}
function bfngListMarketBook( sSessionToken, sAppKey : string ;
                             iExchangeId            : integer ;
                             slMarketIds            : TStringList ;
                             oPriceProjection       : TbfPriceProjectionObj ;
                             eOrderProjection       : TbfngOrderProjection ;
                             eMatchProjection       : TbfngMatchProjection ;
                             sCurrencyCode          : string ;
                             var aResult            : ArrayOfTbfMarketBookObj ) : boolean ;
{************************************************************************************}
var
  I, J, iCount       : longint ;
  iWeightPerMarket   : integer ;
  iMaxMarketsPerCall : integer ;
  slLocalIds         : TStringList ;
  aLocalResult       : ArrayOfTbfMarketBookObj ;
  
begin
  try
    try
      result     := true ;
      slLocalIds := nil ;
      setlength(aResult, 0) ;
      
      {****************************************************************************************************}
      { There is a limit to the number of results that will be returned depending on the number of markets }
      { requested and the Price Projection requirement.                                                    }
      {****************************************************************************************************}
      iWeightPerMarket   := 0 ;
      iMaxMarketsPerCall := -1 ;

      if slMarketIds.count > 4 then {Can always handle up to 4 markets.}
      begin
        if oPriceProjection <> nil then
        begin
          if bfpdSP_AVAILABLE   in oPriceProjection.setPriceData then inc(iWeightPerMarket,  3) ;
          if bfpdSP_TRADED      in oPriceProjection.setPriceData then inc(iWeightPerMarket,  7) ;
          if bfpdEX_BEST_OFFERS in oPriceProjection.setPriceData then inc(iWeightPerMarket,  5) ;
          if bfpdEX_ALL_OFFERS  in oPriceProjection.setPriceData then inc(iWeightPerMarket, 17) ;
          if bfpdEX_TRADED      in oPriceProjection.setPriceData then inc(iWeightPerMarket, 17) ;
          
          if iWeightPerMarket > 0 then iMaxMarketsPerCall := trunc(200 / iWeightPerMarket) ;
        end ; 
      end ;

      if (iMaxMarketsPerCall > -1) and (slMarketIds.count > iMaxMarketsPerCall) then
      begin
        {************************************************}
        { We need to 'page' the calls to listMarketBook. }
        {************************************************}
        slLocalIds    := TStringList.create ;
        slLocalIds.clear ;
        setlength(aLocalResult, 0) ;
        I := 0 ;
        
        while (I <= slMarketIds.count - 1) and (result) do
        begin
          slLocalIds.add( slMarketIds[I] ) ;

          if (slLocalIds.count = iMaxMarketsPerCall) or (I = slMarketIds.count - 1) then
          begin
            if bfngListMarketBookCallHandler( sSessionToken, sAppKey,
                                              iExchangeId,
                                              slLocalIds,
                                              oPriceProjection,
                                              eOrderProjection,
                                              eMatchProjection,
                                              sCurrencyCode,
                                              aLocalResult ) then
            begin
              if length(aLocalResult) > 0 then
              begin
                iCount := length(aResult) ;
                
                for J := 0 to length(aLocalResult) - 1 do
                begin
                  inc(iCount) ;
                  setlength(aResult, iCount) ;
                  aResult[iCount-1] := aLocalResult[J] ;
                end ;
                
                setlength(aLocalResult, 0) ;
                slLocalIds.clear ;
              end ;
            end else
            begin
              result := false ;
            end ;
          end ;
          
          inc(I) ;
        end ;
      
      end else
      begin
        {*************************************************}
        { No paging required just make a single API call. }
        {*************************************************}
        result := bfngListMarketBookCallHandler( sSessionToken, sAppKey,
                                                 iExchangeId,
                                                 slMarketIds,
                                                 oPriceProjection,
                                                 eOrderProjection,
                                                 eMatchProjection,
                                                 sCurrencyCode,
                                                 aResult ) ;
      end ;

    except
      on E:Exception do
      begin
        result := false ;
        raise ;
      end ;
    end ;
  finally
    if slLocalIds <> nil then slLocalIds.free ;
    setlength(aLocalResult, 0) ;
  end ;
end ;



{************************************************************************************}
function bfngListMarketCatalogueCallHandler( sSessionToken, sAppKey : string ;
                                             iExchangeId            : integer ;
                                             IMarketFilter          : ISuperObject ;
                                             setMarketProjection    : TbfngMarketProjectionSet ;
                                             eMarketSort            : TbfngMarketSort ;
                                             iMaxResults            : integer ;  { Range: 1 to unlimited. }
                                             var aResult            : ArrayOfTbfMarketCatalogueObj ) : boolean ;
{************************************************************************************}
var
  I, iCount, iIndex  : longint ;
  S, sResponse       : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  IRunner            : ISuperObject ;
  INames, IValues    : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listMarketCatalogue' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listMarketCatalogue' ;
        formJSONDump.memMsg.lines.add('JSON MARKET FILTER: "' + IMarketFilter.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {***************}
      { Market Filter }
      {***************}
      IParams.O['filter']   := IMarketFilter ;
      
      {*******************}
      { Market Projection }
      {*******************}
      if setMarketProjection <> [] then
      begin
        IParams.O['marketProjection'] := SA([]) ;
        I := 0 ;

        if bfmpjCOMPETITION        in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'COMPETITION' ;        end ;
        if bfmpfEVENT              in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'EVENT' ;              end ;
        if bfmpjEVENT_TYPE         in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'EVENT_TYPE' ;         end ;
        if bfmpjMARKET_START_TIME  in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'MARKET_START_TIME' ;  end ;
        if bfmpjMARKET_DESCRIPTION in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'MARKET_DESCRIPTION' ; end ;
        if bfmpjRUNNER_DESCRIPTION in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'RUNNER_DESCRIPTION' ; end ;
        if bfmpjRUNNER_METADATA    in setMarketProjection then begin inc(I) ; IParams.A['marketProjection'].S[I-1] := 'RUNNER_METADATA' ;    end ;
      end ;

      {*************}
      { Market Sort }
      {*************}
      case eMarketSort of
        bfmsortMINIMUM_TRADED    : IParams.S['sort'] := 'MINIMUM_TRADED' ;
        bfmsortMAXIMUM_TRADED    : IParams.S['sort'] := 'MAXIMUM_TRADED' ;
        bfmsortMINIMUM_AVAILABLE : IParams.S['sort'] := 'MINIMUM_AVAILABLE' ;
        bfmsortMAXIMUM_AVAILABLE : IParams.S['sort'] := 'MAXIMUM_AVAILABLE' ;
        bfmsortFIRST_TO_START    : IParams.S['sort'] := 'FIRST_TO_START' ;
        bfmosrtLAST_TO_START     : IParams.S['sort'] := 'LAST_TO_START' ;
      end ;

      {*************}
      { Max Results }
      {*************}
      IParams.I['maxResults'] := iMaxResults ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON FUNCTION: "' + IFunction.asstring + '"') ; 

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
      
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;

            aResult[iCount-1] := TbfMarketCatalogueObj.create ;

            if IResult['marketId'       ] <> nil then aResult[iCount-1].sMarketId        := IResult['marketId'      ].asstring ;
            if IResult['marketName'     ] <> nil then aResult[iCount-1].sMarketName      := IResult['marketName'    ].asstring ;
            if IResult['marketStartTime'] <> nil then aResult[iCount-1].dMarketStartTime := JsonStringToDateTime( IResult['marketStartTime'].asstring) ;

            if IResult['description'] <> nil then
            begin
              if IResult['description']['persistenceEnabled'] <> nil then aResult[iCount-1].oMarketDesc.bPersistenceEnabled    := IResult['description']['persistenceEnabled'].asboolean ;
              if IResult['description']['bspMarket'         ] <> nil then aResult[iCount-1].oMarketDesc.bBSPMarket             := IResult['description']['bspMarket'         ].asboolean ;
              if IResult['description']['marketTime'        ] <> nil then aResult[iCount-1].oMarketDesc.dMarketTime            := JsonStringToDateTime(IResult['description']['marketTime' ].asstring) ;
              if IResult['description']['suspendTime'       ] <> nil then aResult[iCount-1].oMarketDesc.dSuspendTime           := JsonStringToDateTime(IResult['description']['suspendTime'].asstring) ;
              if IResult['description']['settleTime'        ] <> nil then aResult[iCount-1].oMarketDesc.dSettleTime            := JsonStringToDateTime(IResult['description']['settleTime' ].asstring) ;

              if IResult['description']['bettingType'       ] <> nil then
              begin
                S := IResult['description']['bettingType'].asstring ;

                if S = 'ODDS'                       then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtODDS ;
                if S = 'LINE'                       then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtLINE ;
                if S = 'RANGE'                      then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtRANGE ;
                if S = 'ASIAN_HANDICAP_DOUBLE_LINE' then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtASIAN_HANDICAP_DOUBLE_LINE ;
                if S = 'ASIAN_HANDICAP_SINGLE_LINE' then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtASIAN_HANDICAP_SINGLE_LINE ;
                if S = 'FIXED_ODDS'                 then aResult[iCount-1].oMarketDesc.eBettingType := bfmbtFIXED_ODDS ;
              end ;

              if IResult['description']['turnInPlayEnabled' ] <> nil then aResult[iCount-1].oMarketDesc.bTurnInPlayEnabled     := IResult['description']['turnInPlayEnabled' ].asboolean ;
              if IResult['description']['marketType'        ] <> nil then aResult[iCount-1].oMarketDesc.sMarketType            := IResult['description']['marketType'        ].asstring ;
              if IResult['description']['regulator'         ] <> nil then aResult[iCount-1].oMarketDesc.sRegulator             := IResult['description']['regulator'         ].asstring ;
              if IResult['description']['marketBaseRate'    ] <> nil then aResult[iCount-1].oMarketDesc.rMarketBaseRate        := IResult['description']['marketBaseRate'    ].asdouble ;
              if IResult['description']['discountAllowed'   ] <> nil then aResult[iCount-1].oMarketDesc.bDiscountAllowed       := IResult['description']['discountAllowed'   ].asboolean ;
              if IResult['description']['wallet'            ] <> nil then aResult[iCount-1].oMarketDesc.sWallet                := IResult['description']['wallet'            ].asstring ;
              if IResult['description']['rules'             ] <> nil then aResult[iCount-1].oMarketDesc.sRules                 := IResult['description']['rules'             ].asstring ;
              if IResult['description']['rulesHasDate'      ] <> nil then aResult[iCount-1].oMarketDesc.bRulesHasDate          := IResult['description']['rulesHasDate'      ].asboolean ;
              if IResult['description']['clarifications'    ] <> nil then aResult[iCount-1].oMarketDesc.sClarifications        := IResult['description']['clarifications'    ].asstring ;
            end ;
            
            
            if IResult['eventType'] <> nil then
            begin
              if IResult['eventType']['id'  ] <> nil then aResult[iCount-1].oEventType.sEventTypeId   := IResult['eventType']['id'  ].asstring ;
              if IResult['eventType']['name'] <> nil then aResult[iCount-1].oEventType.sEventTypeName := IResult['eventType']['name'].asstring ;
            end ;
            
            
            if IResult['competition'] <> nil then
            begin
              if IResult['competition']['id'  ] <> nil then aResult[iCount-1].oCompetition.sCompetitionId   := IResult['competition']['id'  ].asstring ;
              if IResult['competition']['name'] <> nil then aResult[iCount-1].oCompetition.sCompetitionName := IResult['competition']['name'].asstring ;
            end ;
            
            
            if IResult['event'] <> nil then
            begin
              if IResult['event']['id'         ] <> nil then aResult[iCount-1].oEvent.sEventId     := IResult['event']['id'         ].asstring ;
              if IResult['event']['name'       ] <> nil then aResult[iCount-1].oEvent.sEventName   := IResult['event']['name'       ].asstring ;
              if IResult['event']['countryCode'] <> nil then aResult[iCount-1].oEvent.sCountryCode := IResult['event']['countryCode'].asstring ;
              if IResult['event']['timezone'   ] <> nil then aResult[iCount-1].oEvent.sTimeZone    := IResult['event']['timezone'   ].asstring ;
              if IResult['event']['venue'      ] <> nil then aResult[iCount-1].oEvent.sVenue       := IResult['event']['venue'      ].asstring ;
              if IResult['event']['openDate'   ] <> nil then aResult[iCount-1].oEvent.dOpenDate    := JsonStringToDateTime( IResult['event']['openDate'].asstring) ;
            end ;
            
            
            if IResult['runners'] <> nil then
            begin
              iIndex := 0 ;
              
              for IRunner in IResult['runners'] do
              begin
                inc(iIndex) ;
                setlength(aResult[iCount-1].aRunners, iIndex) ;
                aResult[iCount-1].aRunners[iIndex-1] := TbfRunnerCatalogueObj.create ;
                
                if IRunner['selectionId' ] <> nil then aResult[iCount-1].aRunners[iIndex-1].iSelectionId    := IRunner['selectionId' ].asinteger ;
                if IRunner['runnerName'  ] <> nil then aResult[iCount-1].aRunners[iIndex-1].sRunnerName     := IRunner['runnerName'  ].asstring ;
                if IRunner['handicap'    ] <> nil then aResult[iCount-1].aRunners[iIndex-1].rHandicap       := IRunner['handicap'    ].asdouble ;
                if IRunner['sortPriority'] <> nil then aResult[iCount-1].aRunners[iIndex-1].iSortPriority   := IRunner['sortPriority'].asinteger ;

                if IRunner['metadata'] <> nil then
                begin
                  {***********************************************************************************************}
                  { Populate the dictionary of runner metadata information. These are Key/Value pairs as strings. }
                  {***********************************************************************************************}
                  INames  := IRunner['metadata'].asobject.GetNames ;
                  IValues := IRunner['metadata'].asobject.GetValues ;

                  for I := 0 to IValues.AsArray.length - 1 do
                  begin
                    if not aResult[iCount-1].aRunners[iIndex-1].dictMetaData.ContainsKey(INames.asarray[I].asstring) then aResult[iCount-1].aRunners[iIndex-1].dictMetaData.add(INames.asarray[I].asstring, IValues.asarray[I].asstring) ;
                  end ;
                end ;
              end ;
            end ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listMarketCatalogue', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listMarketCatalogue. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listMarketCatalogue: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListMarketCatalogue( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  IMarketFilter          : ISuperObject ;
                                  setMarketProjection    : TbfngMarketProjectionSet ;
                                  eMarketSort            : TbfngMarketSort ;
                                  iMaxResults            : integer ;
                                  var aResult            : ArrayOfTbfMarketCatalogueObj ) : boolean ;
{************************************************************************************}
var
  I, J, iTotal, iCount : longint ;
  bMultiCallsRequired  : boolean ;
  aListEventsResult    : ArrayOfTbfListEventsResultObj ;
  slEventIds           : TStringList ;
  aLocalResult         : ArrayOfTbfMarketCatalogueObj ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      setlength(aListEventsResult, 0) ;
      slEventIds := nil ;
      bMultiCallsRequired := false ;

      {***********************************}
      { Make a single call attempt first. }
      {***********************************}
      try
        if bfngListMarketCatalogueCallHandler( sSessionToken, sAppKey,
                                               iExchangeId,
                                               IMarketFilter,
                                               setMarketProjection,
                                               eMarketSort,
                                               min(1000, iMaxResults),
                                               aResult ) then
        begin
          if (length(aResult) = 1000) and (iMaxResults > 1000) then
          begin
            bMultiCallsRequired := true ;
          end else
          begin
            result := true ;
          end ;
        end ;
      except
        on E:Exception do
        begin
          if pos('TOO_MUCH_DATA', E.Message) > 0 then
          begin
            bMultiCallsRequired := true ;
          end else
          begin
            raise ;
          end ;
        end ;
      end ;
      

      if bMultiCallsRequired then
      begin
        {********************************************************}
        { We need to break the request down into multiple calls. }
        { We shall do this by first obtaining a list of EventIds }
        { for the same market filter, and then paging through    }
        { these at 100 markets a time.                           }
        {********************************************************}
        if bfngListEvents( sSessionToken, sAppKey, iExchangeId, IMarketFilter, aListEventsResult ) then
        begin
          if length(aListEventsResult) > 0 then
          begin
            if length(aResult) > 0 then for I := 0 to length(aResult) - 1 do freeandnil(aResult[I]) ;
            setlength(aResult, 0) ;
            iCount := 0 ;
                
            slEventIds := TStringList.create ;
            slEventIds.clear ;
            iTotal := 0 ;
                
            for I := 0 to length(aListEventsResult) - 1 do
            begin
              if ((iTotal + aListEventsResult[I].iMarketCount) <= 100) or (aListEventsResult[I].iMarketCount >= 100) then
              begin
                slEventIds.add( aListEventsResult[I].obfEvent.sEventId ) ;
                inc(iTotal, aListEventsResult[I].iMarketCount) ;
              end else
              begin
                if (slEventIds.count > 0) and (iCount+1 <= iMaxResults) then
                begin
                  if IMarketFilter.O['eventIds'] = nil then
                  begin
                    IMarketFilter.O['eventIds'] := SA([]) ;
                  end else
                  begin
                    IMarketFilter.A['eventIds'].Clear(true) ;
                  end ;
                      
                  for J := 0 to slEventIds.count - 1 do IMarketFilter.A['eventIds'].S[J] := slEventIds[J] ;

                  if bfngListMarketCatalogueCallHandler( sSessionToken, sAppKey,
                                                         iExchangeId,
                                                         IMarketFilter,
                                                         setMarketProjection,
                                                         eMarketSort,
                                                         1000,
                                                         aLocalResult ) then
                  begin
                    if length(aLocalResult) > 0 then
                    begin
                      for J := 0 to length(aLocalResult) - 1 do
                      begin
                        if iCount+1 <= iMaxResults then
                        begin
                          inc(iCount) ;
                          setlength(aResult, iCount) ;
                          aResult[iCount-1] := aLocalResult[J] ;
                        end ;
                      end ;
                    end ;
                  end ;
                        
                  application.processmessages ;
                end ;
                
                slEventIds.clear ;
                iTotal := 0 ;
                slEventIds.add( aListEventsResult[I].obfEvent.sEventId ) ;
                inc(iTotal, aListEventsResult[I].iMarketCount) ;
              end ;
            end ;


            if (slEventIds.count > 0) and (iCount+1 <= iMaxResults) then
            begin
              if IMarketFilter.O['eventIds'] = nil then
              begin
                IMarketFilter.O['eventIds'] := SA([]) ;
              end else
              begin
                IMarketFilter.A['eventIds'].Clear(true) ;
              end ;
                      
              for J := 0 to slEventIds.count - 1 do IMarketFilter.A['eventIds'].S[J] := slEventIds[J] ;
                  
              if bfngListMarketCatalogueCallHandler( sSessionToken, sAppKey,
                                                     iExchangeId,
                                                     IMarketFilter,
                                                     setMarketProjection,
                                                     eMarketSort,
                                                     1000,
                                                     aLocalResult ) then
              begin
                if length(aLocalResult) > 0 then
                begin
                  for J := 0 to length(aLocalResult) - 1 do
                  begin
                    if iCount+1 <= iMaxResults then
                    begin
                      inc(iCount) ;
                      setlength(aResult, iCount) ;
                      aResult[iCount-1] := aLocalResult[J] ;
                    end ;
                  end ;
                end ;
              end ;
            end ;

            { Ideally these results should be sorted as required - TODO }
            if length(aResult) > 0 then result := true ;
          end ;
        end ;
      end ;

    except
      on E:Exception do
      begin
        result := false ;
        raise ;
      end ;
    end ;

  finally
    if length(aListEventsResult) > 0 then
    begin
      for I := 0 to length(aListEventsResult) - 1 do freeandnil(aListEventsResult[I]) ;
      setlength(aListEventsResult, 0) ;
    end ;

    if slEventIds <> nil then freeandnil(slEventIds) ;

    setlength(aLocalResult, 0) ;
  end ;
end ;



{************************************************************************************}
function bfngPlaceOrders( sSessionToken, sAppKey : string ;
                          iExchangeId            : integer ;
                          sMarketId              : string ;
                          aInstructions          : ArrayOfTbfPlaceInstructionObj ;
                          sCustomerRef           : string ;
                          var oResult            : TbfPlaceExecutionReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IInstruction        : ISuperObject ;
  ILimitOrder         : ISuperObject ;
  ILimitOnCloseOrder  : ISuperObject ;
  IMarketOnCloseOrder : ISuperObject ;
  IReport             : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/placeOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      IParams.S['marketId']   := sMarketId ;

      if length(aInstructions) > 0 then
      begin
        IParams.O['instructions'] := SA([]) ;

        for I := 0 to length(aInstructions) - 1 do
        begin
          IInstruction := SO ;

          case aInstructions[I].eOrderType of
            bfordtypUnknown:         raise EbfFunctionError.Create(-1, 'No OrderType specified in bet instruction!', IFunction, sResponse) ;
            bfordtypLIMIT:           IInstruction.S['orderType'] := 'LIMIT' ;
            bfordtypLIMIT_ON_CLOSE:  IInstruction.S['orderType'] := 'LIMIT_ON_CLOSE' ;
            bfordtypMARKET_ON_CLOSE: IInstruction.S['orderType'] := 'MARKET_ON_CLOSE' ;
          end ;

          IInstruction.I['selectionId'] := aInstructions[I].iSelectionId ;
          
          if aInstructions[I].rHandicap > -1 then IInstruction.S['handicap'] := floattostrf(aInstructions[I].rHandicap,ffFixed,15,2) ;
          
          case aInstructions[I].eSide of
            bfsideUnknown: raise EbfFunctionError.Create(-1, 'No Back or Lay side specified in bet instruction!', IFunction, sResponse) ;
            bfsideBACK:    IInstruction.S['side'] := 'BACK' ;
            bfsideLAY:     IInstruction.S['side'] := 'LAY' ;
          end ;

          if aInstructions[I].oLimitOrder <> nil then
          begin
            ILimitOrder := SO ;
            ILimitOrder.S['size' ] := floattostrf(aInstructions[I].oLimitOrder.rSize, ffFixed,15,2) ;
            ILimitOrder.S['price'] := floattostrf(aInstructions[I].oLimitOrder.rPrice,ffFixed,15,2) ;

            case aInstructions[I].oLimitOrder.ePersistenceType of
              bfperstypUnknown:         raise EbfFunctionError.Create(-1, 'No Persistence Type specified in bet instruction!', IFunction, sResponse) ;
              bfperstypLAPSE:           ILimitOrder.S['persistenceType'] := 'LAPSE' ;
              bfperstypPERSIST:         ILimitOrder.S['persistenceType'] := 'PERSIST' ;
              bfperstypMARKET_ON_CLOSE: ILimitOrder.S['persistenceType'] := 'MARKET_ON_CLOSE' ;
            end ;

            IInstruction.O['limitOrder'] := ILimitOrder ;
          end ;

          if aInstructions[I].oLimitOnCloseOrder <> nil then
          begin
            ILimitOnCloseOrder := SO ;
            ILimitOnCloseOrder.S['liability'] := floattostrf(aInstructions[I].oLimitOnCloseOrder.rLiability,ffFixed,15,2) ;
            ILimitOnCloseOrder.S['price'    ] := floattostrf(aInstructions[I].oLimitOnCloseOrder.rPrice,    ffFixed,15,2) ;

            IInstruction.O['limitOnCloseOrder'] := ILimitOnCloseOrder ;
          end ;

          if aInstructions[I].oMarketOnCloseOrder <> nil then
          begin
            IMarketOnCloseOrder := SO ;
            IMarketOnCloseOrder.S['liability'] := floattostrf(aInstructions[I].oMarketOnCloseOrder.rLiability,ffFixed,15,2) ;

            IInstruction.O['marketOnCloseOrder'] := IMarketOnCloseOrder ;
          end ;

          IParams.A['instructions'].O[I] := IInstruction ;
        end ;
      end ;

      if length(trim(sCustomerRef)) > 0 then IParams.S['customerRef'] := sCustomerRef ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'placeOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfPlaceExecutionReportObj.create ;
            
            if IJson['result']['customerRef'] <> nil then oResult.sCustomerRef := IJson['result']['customerRef'].asstring ;
            if IJson['result']['marketId'   ] <> nil then oResult.sMarketId    := IJson['result']['marketId'   ].asstring ;
            
            if IJson['result']['status'] <> nil then
            begin
              if IJson['result']['status'].asstring = 'SUCCESS'               then oResult.eStatus := bfersSUCCESS ;
              if IJson['result']['status'].asstring = 'FAILURE'               then oResult.eStatus := bfersFAILURE ;
              if IJson['result']['status'].asstring = 'PROCESSED_WITH_ERRORS' then oResult.eStatus := bfersPROCESSED_WITH_ERRORS ;
              if IJson['result']['status'].asstring = 'TIMEOUT'               then oResult.eStatus := bfersTIMEOUT ;
            end ;

            if IJson['result']['errorCode'] <> nil then
            begin
              if IJson['result']['errorCode'].asstring = 'ERROR_IN_MATCHER'            then oResult.eErrorCode := bferecERROR_IN_MATCHER ;
              if IJson['result']['errorCode'].asstring = 'PROCESSED_WITH_ERRORS'       then oResult.eErrorCode := bferecPROCESSED_WITH_ERRORS ;
              if IJson['result']['errorCode'].asstring = 'BET_ACTION_ERROR'            then oResult.eErrorCode := bferecBET_ACTION_ERROR ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ACCOUNT_STATE'       then oResult.eErrorCode := bferecINVALID_ACCOUNT_STATE ;
              if IJson['result']['errorCode'].asstring = 'INVALID_WALLET_STATUS'       then oResult.eErrorCode := bferecINVALID_WALLET_STATUS ;
              if IJson['result']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'          then oResult.eErrorCode := bferecINSUFFICIENT_FUNDS ;
              if IJson['result']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'         then oResult.eErrorCode := bferecLOSS_LIMIT_EXCEEDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_SUSPENDED'            then oResult.eErrorCode := bferecMARKET_SUSPENDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING' then oResult.eErrorCode := bferecMARKET_NOT_OPEN_FOR_BETTING ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_TRANSACTION'       then oResult.eErrorCode := bferecDUPLICATE_TRANSACTION ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ORDER'               then oResult.eErrorCode := bferecINVALID_ORDER ;
              if IJson['result']['errorCode'].asstring = 'INVALID_MARKET_ID'           then oResult.eErrorCode := bferecINVALID_MARKET_ID ;
              if IJson['result']['errorCode'].asstring = 'PERMISSION_DENIED'           then oResult.eErrorCode := bferecPERMISSION_DENIED ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_BETIDS'            then oResult.eErrorCode := bferecDUPLICATE_BETIDS ;
              if IJson['result']['errorCode'].asstring = 'NO_ACTION_REQUIRED'          then oResult.eErrorCode := bferecNO_ACTION_REQUIRED ;
              if IJson['result']['errorCode'].asstring = 'SERVICE_UNAVAILABLE'         then oResult.eErrorCode := bferecSERVICE_UNAVAILABLE ;
              if IJson['result']['errorCode'].asstring = 'REJECTED_BY_REGULATOR'       then oResult.eErrorCode := bferecREJECTED_BY_REGULATOR ;
            end ;
      
            if IJson['result']['instructionReports'] <> nil then
            begin
              iCount := 0 ;
            
              for IReport in IJson['result']['instructionReports'] do
              begin
                inc(iCount) ;
                setlength(oResult.aInstructionReports, iCount) ;
                oResult.aInstructionReports[iCount-1] := TbfPlaceInstructionReportObj.create ;

                if IReport['betId'] <> nil then oResult.aInstructionReports[iCount-1].sBetId := IReport['betId'].asstring ;
                
                if IReport['status'] <> nil then
                begin
                  if IReport['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].eStatus := bfirsSUCCESS ;
                  if IReport['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].eStatus := bfirsFAILURE ;
                  if IReport['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].eStatus := bfirsTIMEOUT ;
                end ;

                if IReport['errorCode'] <> nil then
                begin
                  if IReport['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_SIZE ;
                  if IReport['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_RUNNER ;
                  if IReport['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                  if IReport['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_IN_PROGRESS ;
                  if IReport['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRUNNER_REMOVED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                  if IReport['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                  if IReport['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PRICE_EDIT ;
                  if IReport['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_ODDS ;
                  if IReport['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                  if IReport['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_MATCHER ;
                  if IReport['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_ORDER ;
                  if IReport['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BID_TYPE ;
                  if IReport['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_ID ;
                  if IReport['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                  if IReport['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRELATED_ACTION_FAILED ;
                  if IReport['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecNO_ACTION_REQUIRED ;
                end ;

                if IReport['placedDate'         ] <> nil then oResult.aInstructionReports[iCount-1].dPlacedDate          := JsonStringToDateTime(IReport['placedDate'].asstring) ;
                if IReport['averagePriceMatched'] <> nil then oResult.aInstructionReports[iCount-1].rAveragePriceMatched := IReport['averagePriceMatched'].asdouble ;
                if IReport['sizeMatched'        ] <> nil then oResult.aInstructionReports[iCount-1].rSizeMatched         := IReport['sizeMatched'        ].asdouble ;

                if IReport['instruction'] <> nil then
                begin
                  oResult.aInstructionReports[iCount-1].oInstruction := TbfPlaceInstructionObj.create ;

                  if IReport['instruction']['orderType'] <> nil then
                  begin
                    if IReport['instruction']['orderType'].asstring = 'LIMIT'           then oResult.aInstructionReports[iCount-1].oInstruction.eOrderType := bfordtypLIMIT ;
                    if IReport['instruction']['orderType'].asstring = 'LIMIT_ON_CLOSE'  then oResult.aInstructionReports[iCount-1].oInstruction.eOrderType := bfordtypLIMIT_ON_CLOSE ;
                    if IReport['instruction']['orderType'].asstring = 'MARKET_ON_CLOSE' then oResult.aInstructionReports[iCount-1].oInstruction.eOrderType := bfordtypMARKET_ON_CLOSE ;
                  end ;
                  
                  if IReport['instruction']['selectionId'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.iSelectionId := IReport['instruction']['selectionId'].asinteger ;
                  if IReport['instruction']['handicap'   ] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.rHandicap    := IReport['instruction']['handicap'   ].asdouble ;

                  if IReport['instruction']['side'] <> nil then
                  begin
                    if IReport['instruction']['side'].asstring = 'BACK' then oResult.aInstructionReports[iCount-1].oInstruction.eSide := bfsideBack ;
                    if IReport['instruction']['side'].asstring = 'LAY'  then oResult.aInstructionReports[iCount-1].oInstruction.eSide := bfsideLay ;
                  end ;

                  if IReport['instruction']['limitOrder'] <> nil then
                  begin
                    oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder := TbfLimitOrderObj.create ;

                    if IReport['instruction']['limitOrder']['size' ] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder.rSize  := IReport['instruction']['limitOrder']['size' ].asdouble ;
                    if IReport['instruction']['limitOrder']['price'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder.rPrice := IReport['instruction']['limitOrder']['price'].asdouble ;

                    if IReport['instruction']['limitOrder']['persistenceType'] <> nil then
                    begin
                      if IReport['instruction']['limitOrder']['persistenceType'].asstring = 'LAPSE'           then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder.ePersistenceType := bfperstypLAPSE ;
                      if IReport['instruction']['limitOrder']['persistenceType'].asstring = 'PERSIST'         then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder.ePersistenceType := bfperstypPERSIST ;
                      if IReport['instruction']['limitOrder']['persistenceType'].asstring = 'MARKET_ON_CLOSE' then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOrder.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                    end ;
                  end ;
                  
                  if IReport['instruction']['limitOnCloseOrder'] <> nil then
                  begin
                    oResult.aInstructionReports[iCount-1].oInstruction.oLimitOnCloseOrder := TbfLimitOnCloseOrderObj.create ;
                    
                    if IReport['instruction']['limitOnCloseOrder']['price'    ] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOnCloseOrder.rPrice     := IReport['instruction']['limitOnCloseOrder']['price'    ].asdouble ;
                    if IReport['instruction']['limitOnCloseOrder']['liability'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.oLimitOnCloseOrder.rLiability := IReport['instruction']['limitOnCloseOrder']['liability'].asdouble ;
                  end ;                    
                  
                  if IReport['instruction']['marketOnCloseOrder'] <> nil then
                  begin
                    oResult.aInstructionReports[iCount-1].oInstruction.oMarketOnCloseOrder := TbfMarketOnCloseOrderObj.create ;
                    
                    if IReport['instruction']['marketOnCloseOrder']['liability'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.oMarketOnCloseOrder.rLiability := IReport['instruction']['marketOnCloseOrder']['liability'].asdouble ;
                  end ;                    
                end ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('placeOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function placeOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function placeOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngCancelOrders( sSessionToken, sAppKey : string ;
                           iExchangeId            : integer ;
                           sMarketId              : string ;
                           aInstructions          : ArrayOfTbfCancelInstructionObj ;
                           sCustomerRef           : string ;
                           var oResult            : TbfCancelExecutionReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IInstruction        : ISuperObject ;
  IReport             : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/cancelOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      IParams.S['marketId']  := sMarketId ;
      
      if length(trim(sCustomerRef)) > 0 then IParams.S['customerRef'] := sCustomerRef ;


      if length(aInstructions) > 0 then
      begin
        IParams.O['instructions'] := SA([]) ;

        for I := 0 to length(aInstructions) - 1 do
        begin
          IInstruction := SO ;

          IInstruction.S['betId'] := aInstructions[I].sBetId ;

          if aInstructions[I].rSizeReduction > -1 then IInstruction.S['sizeReduction'] := floattostrf(aInstructions[I].rSizeReduction,ffFixed,15,2) ;

          IParams.A['instructions'].O[I] := IInstruction ;
        end ;
      end ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'cancelOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfCancelExecutionReportObj.create ;

            if IJson['result']['customerRef'] <> nil then oResult.sCustomerRef := IJson['result']['customerRef'].asstring ;
            if IJson['result']['marketId'   ] <> nil then oResult.sMarketId    := IJson['result']['marketId'   ].asstring ;
            
            if IJson['result']['status'] <> nil then
            begin
              if IJson['result']['status'].asstring = 'SUCCESS'               then oResult.eStatus := bfersSUCCESS ;
              if IJson['result']['status'].asstring = 'FAILURE'               then oResult.eStatus := bfersFAILURE ;
              if IJson['result']['status'].asstring = 'PROCESSED_WITH_ERRORS' then oResult.eStatus := bfersPROCESSED_WITH_ERRORS ;
              if IJson['result']['status'].asstring = 'TIMEOUT'               then oResult.eStatus := bfersTIMEOUT ;
            end ;

            if IJson['result']['errorCode'] <> nil then
            begin
              if IJson['result']['errorCode'].asstring = 'ERROR_IN_MATCHER'            then oResult.eErrorCode := bferecERROR_IN_MATCHER ;
              if IJson['result']['errorCode'].asstring = 'PROCESSED_WITH_ERRORS'       then oResult.eErrorCode := bferecPROCESSED_WITH_ERRORS ;
              if IJson['result']['errorCode'].asstring = 'BET_ACTION_ERROR'            then oResult.eErrorCode := bferecBET_ACTION_ERROR ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ACCOUNT_STATE'       then oResult.eErrorCode := bferecINVALID_ACCOUNT_STATE ;
              if IJson['result']['errorCode'].asstring = 'INVALID_WALLET_STATUS'       then oResult.eErrorCode := bferecINVALID_WALLET_STATUS ;
              if IJson['result']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'          then oResult.eErrorCode := bferecINSUFFICIENT_FUNDS ;
              if IJson['result']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'         then oResult.eErrorCode := bferecLOSS_LIMIT_EXCEEDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_SUSPENDED'            then oResult.eErrorCode := bferecMARKET_SUSPENDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING' then oResult.eErrorCode := bferecMARKET_NOT_OPEN_FOR_BETTING ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_TRANSACTION'       then oResult.eErrorCode := bferecDUPLICATE_TRANSACTION ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ORDER'               then oResult.eErrorCode := bferecINVALID_ORDER ;
              if IJson['result']['errorCode'].asstring = 'INVALID_MARKET_ID'           then oResult.eErrorCode := bferecINVALID_MARKET_ID ;
              if IJson['result']['errorCode'].asstring = 'PERMISSION_DENIED'           then oResult.eErrorCode := bferecPERMISSION_DENIED ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_BETIDS'            then oResult.eErrorCode := bferecDUPLICATE_BETIDS ;
              if IJson['result']['errorCode'].asstring = 'NO_ACTION_REQUIRED'          then oResult.eErrorCode := bferecNO_ACTION_REQUIRED ;
              if IJson['result']['errorCode'].asstring = 'SERVICE_UNAVAILABLE'         then oResult.eErrorCode := bferecSERVICE_UNAVAILABLE ;
              if IJson['result']['errorCode'].asstring = 'REJECTED_BY_REGULATOR'       then oResult.eErrorCode := bferecREJECTED_BY_REGULATOR ;
            end ;
      
            if IJson['result']['instructionReports'] <> nil then
            begin
              iCount := 0 ;
            
              for IReport in IJson['result']['instructionReports'] do
              begin
                inc(iCount) ;
                setlength(oResult.aInstructionReports, iCount) ;
                oResult.aInstructionReports[iCount-1] := TbfCancelInstructionReportObj.create ;

                if IReport['cancelledDate'] <> nil then oResult.aInstructionReports[iCount-1].dCancelledDate := JsonStringToDateTime(IReport['cancelledDate'].asstring) ;
                if IReport['sizeCancelled'] <> nil then oResult.aInstructionReports[iCount-1].rSizeCancelled := IReport['sizeCancelled'].asdouble ;
                
                if IReport['status'] <> nil then
                begin
                  if IReport['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].eStatus := bfirsSUCCESS ;
                  if IReport['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].eStatus := bfirsFAILURE ;
                  if IReport['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].eStatus := bfirsTIMEOUT ;
                end ;

                if IReport['errorCode'] <> nil then
                begin
                  if IReport['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_SIZE ;
                  if IReport['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_RUNNER ;
                  if IReport['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                  if IReport['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_IN_PROGRESS ;
                  if IReport['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRUNNER_REMOVED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                  if IReport['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                  if IReport['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PRICE_EDIT ;
                  if IReport['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_ODDS ;
                  if IReport['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                  if IReport['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_MATCHER ;
                  if IReport['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_ORDER ;
                  if IReport['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BID_TYPE ;
                  if IReport['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_ID ;
                  if IReport['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                  if IReport['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRELATED_ACTION_FAILED ;
                  if IReport['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecNO_ACTION_REQUIRED ;
                end ;

                if IReport['instruction'] <> nil then
                begin
                  oResult.aInstructionReports[iCount-1].oInstruction := TbfCancelInstructionObj.create ;

                  if IReport['instruction']['betId'        ] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.sBetId         := IReport['instruction']['betId'        ].asstring ;
                  if IReport['instruction']['sizeReduction'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.rSizeReduction := IReport['instruction']['sizeReduction'].asdouble ;
                end ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('cancelOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function cancelOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function cancelOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngReplaceOrders( sSessionToken, sAppKey : string ;
                            iExchangeId            : integer ;
                            sMarketId              : string ;
                            aInstructions          : ArrayOfTbfReplaceInstructionObj ;
                            sCustomerRef           : string ;
                            var oResult            : TbfReplaceExecutionReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IInstruction        : ISuperObject ;
  IReport             : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/replaceOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      IParams.S['marketId']  := sMarketId ;
      
      if length(trim(sCustomerRef)) > 0 then IParams.S['customerRef'] := sCustomerRef ;


      if length(aInstructions) > 0 then
      begin
        IParams.O['instructions'] := SA([]) ;

        for I := 0 to length(aInstructions) - 1 do
        begin
          IInstruction := SO ;

          IInstruction.S['betId'   ] := aInstructions[I].sBetId ;
          IInstruction.S['newPrice'] := floattostrf(aInstructions[I].rNewPrice,ffFixed,15,2) ;

          IParams.A['instructions'].O[I] := IInstruction ;
        end ;
      end ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'replaceOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfReplaceExecutionReportObj.create ;
            
            if IJson['result']['customerRef'] <> nil then oResult.sCustomerRef := IJson['result']['customerRef'].asstring ;
            if IJson['result']['marketId'   ] <> nil then oResult.sMarketId    := IJson['result']['marketId'   ].asstring ;
            
            if IJson['result']['status'] <> nil then
            begin
              if IJson['result']['status'].asstring = 'SUCCESS'               then oResult.eStatus := bfersSUCCESS ;
              if IJson['result']['status'].asstring = 'FAILURE'               then oResult.eStatus := bfersFAILURE ;
              if IJson['result']['status'].asstring = 'PROCESSED_WITH_ERRORS' then oResult.eStatus := bfersPROCESSED_WITH_ERRORS ;
              if IJson['result']['status'].asstring = 'TIMEOUT'               then oResult.eStatus := bfersTIMEOUT ;
            end ;

            if IJson['result']['errorCode'] <> nil then
            begin
              if IJson['result']['errorCode'].asstring = 'ERROR_IN_MATCHER'            then oResult.eErrorCode := bferecERROR_IN_MATCHER ;
              if IJson['result']['errorCode'].asstring = 'PROCESSED_WITH_ERRORS'       then oResult.eErrorCode := bferecPROCESSED_WITH_ERRORS ;
              if IJson['result']['errorCode'].asstring = 'BET_ACTION_ERROR'            then oResult.eErrorCode := bferecBET_ACTION_ERROR ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ACCOUNT_STATE'       then oResult.eErrorCode := bferecINVALID_ACCOUNT_STATE ;
              if IJson['result']['errorCode'].asstring = 'INVALID_WALLET_STATUS'       then oResult.eErrorCode := bferecINVALID_WALLET_STATUS ;
              if IJson['result']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'          then oResult.eErrorCode := bferecINSUFFICIENT_FUNDS ;
              if IJson['result']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'         then oResult.eErrorCode := bferecLOSS_LIMIT_EXCEEDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_SUSPENDED'            then oResult.eErrorCode := bferecMARKET_SUSPENDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING' then oResult.eErrorCode := bferecMARKET_NOT_OPEN_FOR_BETTING ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_TRANSACTION'       then oResult.eErrorCode := bferecDUPLICATE_TRANSACTION ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ORDER'               then oResult.eErrorCode := bferecINVALID_ORDER ;
              if IJson['result']['errorCode'].asstring = 'INVALID_MARKET_ID'           then oResult.eErrorCode := bferecINVALID_MARKET_ID ;
              if IJson['result']['errorCode'].asstring = 'PERMISSION_DENIED'           then oResult.eErrorCode := bferecPERMISSION_DENIED ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_BETIDS'            then oResult.eErrorCode := bferecDUPLICATE_BETIDS ;
              if IJson['result']['errorCode'].asstring = 'NO_ACTION_REQUIRED'          then oResult.eErrorCode := bferecNO_ACTION_REQUIRED ;
              if IJson['result']['errorCode'].asstring = 'SERVICE_UNAVAILABLE'         then oResult.eErrorCode := bferecSERVICE_UNAVAILABLE ;
              if IJson['result']['errorCode'].asstring = 'REJECTED_BY_REGULATOR'       then oResult.eErrorCode := bferecREJECTED_BY_REGULATOR ;
            end ;
            
      
            if IJson['result']['instructionReports'] <> nil then
            begin
              iCount := 0 ;
            
              for IReport in IJson['result']['instructionReports'] do
              begin
                inc(iCount) ;
                setlength(oResult.aInstructionReports, iCount) ;
                oResult.aInstructionReports[iCount-1] := TbfReplaceInstructionReportObj.create ;

                if IReport['status'] <> nil then
                begin
                  if IReport['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].eStatus := bfirsSUCCESS ;
                  if IReport['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].eStatus := bfirsFAILURE ;
                  if IReport['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].eStatus := bfirsTIMEOUT ;
                end ;

                if IReport['errorCode'] <> nil then
                begin
                  if IReport['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_SIZE ;
                  if IReport['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_RUNNER ;
                  if IReport['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                  if IReport['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_IN_PROGRESS ;
                  if IReport['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRUNNER_REMOVED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                  if IReport['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                  if IReport['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PRICE_EDIT ;
                  if IReport['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_ODDS ;
                  if IReport['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                  if IReport['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_MATCHER ;
                  if IReport['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_ORDER ;
                  if IReport['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BID_TYPE ;
                  if IReport['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_ID ;
                  if IReport['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                  if IReport['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRELATED_ACTION_FAILED ;
                  if IReport['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecNO_ACTION_REQUIRED ;
                end ;


                if IReport['placeInstructionReport'] <> nil then
                begin
                  oResult.aInstructionReports[iCount-1].oPlaceInstructionReport := TbfPlaceInstructionReportObj.create ;

                  if IReport['placeInstructionReport']['betId'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.sBetId := IReport['placeInstructionReport']['betId'].asstring ;
                
                  if IReport['placeInstructionReport']['status'] <> nil then
                  begin
                    if IReport['placeInstructionReport']['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eStatus := bfirsSUCCESS ;
                    if IReport['placeInstructionReport']['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eStatus := bfirsFAILURE ;
                    if IReport['placeInstructionReport']['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eStatus := bfirsTIMEOUT ;
                  end ;

                  if IReport['placeInstructionReport']['errorCode'] <> nil then
                  begin
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_BET_SIZE ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_RUNNER ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecBET_IN_PROGRESS ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecRUNNER_REMOVED ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_PRICE_EDIT ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_ODDS ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecERROR_IN_MATCHER ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecERROR_IN_ORDER ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_BID_TYPE ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecINVALID_BET_ID ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecRELATED_ACTION_FAILED ;
                    if IReport['placeInstructionReport']['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.eErrorCode := bfirecNO_ACTION_REQUIRED ;
                  end ;

                  if IReport['placeInstructionReport']['placedDate'         ] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.dPlacedDate          := JsonStringToDateTime(IReport['placeInstructionReport']['placedDate'].asstring) ;
                  if IReport['placeInstructionReport']['averagePriceMatched'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.rAveragePriceMatched := IReport['placeInstructionReport']['averagePriceMatched'].asdouble ;
                  if IReport['placeInstructionReport']['sizeMatched'        ] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.rSizeMatched         := IReport['placeInstructionReport']['sizeMatched'        ].asdouble ;

                  if IReport['placeInstructionReport']['instruction'] <> nil then
                  begin
                    oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction := TbfPlaceInstructionObj.create ;

                    if IReport['placeInstructionReport']['instruction']['orderType'] <> nil then
                    begin
                      if IReport['placeInstructionReport']['instruction']['orderType'].asstring = 'LIMIT'           then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.eOrderType := bfordtypLIMIT ;
                      if IReport['placeInstructionReport']['instruction']['orderType'].asstring = 'LIMIT_ON_CLOSE'  then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.eOrderType := bfordtypLIMIT_ON_CLOSE ;
                      if IReport['placeInstructionReport']['instruction']['orderType'].asstring = 'MARKET_ON_CLOSE' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.eOrderType := bfordtypMARKET_ON_CLOSE ;
                    end ;
                  
                    if IReport['placeInstructionReport']['instruction']['selectionId'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.iSelectionId := IReport['placeInstructionReport']['instruction']['selectionId'].asinteger ;
                    if IReport['placeInstructionReport']['instruction']['handicap'   ] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.rHandicap    := IReport['placeInstructionReport']['instruction']['handicap'   ].asdouble ;

                    if IReport['placeInstructionReport']['instruction']['side'] <> nil then
                    begin
                      if IReport['placeInstructionReport']['instruction']['side'].asstring = 'BACK' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.eSide := bfsideBack ;
                      if IReport['placeInstructionReport']['instruction']['side'].asstring = 'LAY'  then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.eSide := bfsideLay ;
                    end ;

                    if IReport['placeInstructionReport']['instruction']['limitOrder'] <> nil then
                    begin
                      oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder := TbfLimitOrderObj.create ;
  
                      if IReport['placeInstructionReport']['instruction']['limitOrder']['size' ] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder.rSize  := IReport['placeInstructionReport']['instruction']['limitOrder']['size' ].asdouble ;
                      if IReport['placeInstructionReport']['instruction']['limitOrder']['price'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder.rPrice := IReport['placeInstructionReport']['instruction']['limitOrder']['price'].asdouble ;

                      if IReport['placeInstructionReport']['instruction']['limitOrder']['persistenceType'] <> nil then
                      begin
                        if IReport['placeInstructionReport']['instruction']['limitOrder']['persistenceType'].asstring = 'LAPSE'           then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder.ePersistenceType := bfperstypLAPSE ;
                        if IReport['placeInstructionReport']['instruction']['limitOrder']['persistenceType'].asstring = 'PERSIST'         then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder.ePersistenceType := bfperstypPERSIST ;
                        if IReport['placeInstructionReport']['instruction']['limitOrder']['persistenceType'].asstring = 'MARKET_ON_CLOSE' then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOrder.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                      end ;
                    end ;
                  
                    if IReport['placeInstructionReport']['instruction']['limitOnCloseOrder'] <> nil then
                    begin
                      oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOnCloseOrder := TbfLimitOnCloseOrderObj.create ;
                    
                      if IReport['placeInstructionReport']['instruction']['limitOnCloseOrder']['price'    ] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOnCloseOrder.rPrice     := IReport['placeInstructionReport']['instruction']['limitOnCloseOrder']['price'    ].asdouble ;
                      if IReport['placeInstructionReport']['instruction']['limitOnCloseOrder']['liability'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oLimitOnCloseOrder.rLiability := IReport['placeInstructionReport']['instruction']['limitOnCloseOrder']['liability'].asdouble ;
                    end ;                    
                  
                    if IReport['placeInstructionReport']['instruction']['marketOnCloseOrder'] <> nil then
                    begin
                      oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oMarketOnCloseOrder := TbfMarketOnCloseOrderObj.create ;
                    
                      if IReport['placeInstructionReport']['instruction']['marketOnCloseOrder']['liability'] <> nil then oResult.aInstructionReports[iCount-1].oPlaceInstructionReport.oInstruction.oMarketOnCloseOrder.rLiability := IReport['placeInstructionReport']['instruction']['marketOnCloseOrder']['liability'].asdouble ;
                    end ;                    
                  end ;
                end ;



                if IReport['cancelInstructionReport'] <> nil then
                begin
                  oResult.aInstructionReports[iCount-1].oCancelInstructionReport := TbfCancelInstructionReportObj.create ;

                  if IReport['cancelInstructionReport']['cancelledDate'] <> nil then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.dCancelledDate := JsonStringToDateTime(IReport['cancelInstructionReport']['cancelledDate'].asstring) ;
                  if IReport['cancelInstructionReport']['sizeCancelled'] <> nil then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.rSizeCancelled := IReport['cancelInstructionReport']['sizeCancelled'].asdouble ;
                
                  if IReport['cancelInstructionReport']['status'] <> nil then
                  begin
                    if IReport['cancelInstructionReport']['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eStatus := bfirsSUCCESS ;
                    if IReport['cancelInstructionReport']['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eStatus := bfirsFAILURE ;
                    if IReport['cancelInstructionReport']['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eStatus := bfirsTIMEOUT ;
                  end ;

                  if IReport['cancelInstructionReport']['errorCode'] <> nil then
                  begin
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_BET_SIZE ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_RUNNER ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecBET_IN_PROGRESS ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecRUNNER_REMOVED ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_PRICE_EDIT ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_ODDS ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecERROR_IN_MATCHER ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecERROR_IN_ORDER ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_BID_TYPE ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecINVALID_BET_ID ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecRELATED_ACTION_FAILED ;
                    if IReport['cancelInstructionReport']['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.eErrorCode := bfirecNO_ACTION_REQUIRED ;
                  end ;

                  if IReport['cancelInstructionReport']['instruction'] <> nil then
                  begin
                    oResult.aInstructionReports[iCount-1].oCancelInstructionReport.oInstruction := TbfCancelInstructionObj.create ;

                    if IReport['cancelInstructionReport']['instruction']['betId'        ] <> nil then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.oInstruction.sBetId         := IReport['cancelInstructionReport']['instruction']['betId'        ].asstring ;
                    if IReport['cancelInstructionReport']['instruction']['sizeReduction'] <> nil then oResult.aInstructionReports[iCount-1].oCancelInstructionReport.oInstruction.rSizeReduction := IReport['cancelInstructionReport']['instruction']['sizeReduction'].asdouble ;
                  end ;
                end ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('replaceOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function replaceOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function replaceOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngUpdateOrders( sSessionToken, sAppKey : string ;
                           iExchangeId            : integer ;
                           sMarketId              : string ;
                           aInstructions          : ArrayOfTbfUpdateInstructionObj ;
                           sCustomerRef           : string ;
                           var oResult            : TbfUpdateExecutionReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IInstruction        : ISuperObject ;
  IReport             : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/updateOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;
      IParams.S['marketId']  := sMarketId ;
      
      if length(trim(sCustomerRef)) > 0 then IParams.S['customerRef'] := sCustomerRef ;


      if length(aInstructions) > 0 then
      begin
        IParams.O['instructions'] := SA([]) ;

        for I := 0 to length(aInstructions) - 1 do
        begin
          IInstruction := SO ;

          IInstruction.S['betId'   ] := aInstructions[I].sBetId ;

          case aInstructions[I].ePersistenceType of
            bfperstypLAPSE:           IInstruction.S['newPersistenceType'] := 'LAPSE' ;
            bfperstypPERSIST:         IInstruction.S['newPersistenceType'] := 'PERSIST' ;
            bfperstypMARKET_ON_CLOSE: IInstruction.S['newPersistenceType'] := 'MARKET_ON_CLOSE' ;
          end ;          

          IParams.A['instructions'].O[I] := IInstruction ;
        end ;
      end ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;


      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'updateOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfUpdateExecutionReportObj.create ;

            if IJson['result']['customerRef'] <> nil then oResult.sCustomerRef := IJson['result']['customerRef'].asstring ;
            if IJson['result']['marketId'   ] <> nil then oResult.sMarketId    := IJson['result']['marketId'   ].asstring ;
            
            if IJson['result']['status'] <> nil then
            begin
              if IJson['result']['status'].asstring = 'SUCCESS'               then oResult.eStatus := bfersSUCCESS ;
              if IJson['result']['status'].asstring = 'FAILURE'               then oResult.eStatus := bfersFAILURE ;
              if IJson['result']['status'].asstring = 'PROCESSED_WITH_ERRORS' then oResult.eStatus := bfersPROCESSED_WITH_ERRORS ;
              if IJson['result']['status'].asstring = 'TIMEOUT'               then oResult.eStatus := bfersTIMEOUT ;
            end ;

            if IJson['result']['errorCode'] <> nil then
            begin
              if IJson['result']['errorCode'].asstring = 'ERROR_IN_MATCHER'            then oResult.eErrorCode := bferecERROR_IN_MATCHER ;
              if IJson['result']['errorCode'].asstring = 'PROCESSED_WITH_ERRORS'       then oResult.eErrorCode := bferecPROCESSED_WITH_ERRORS ;
              if IJson['result']['errorCode'].asstring = 'BET_ACTION_ERROR'            then oResult.eErrorCode := bferecBET_ACTION_ERROR ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ACCOUNT_STATE'       then oResult.eErrorCode := bferecINVALID_ACCOUNT_STATE ;
              if IJson['result']['errorCode'].asstring = 'INVALID_WALLET_STATUS'       then oResult.eErrorCode := bferecINVALID_WALLET_STATUS ;
              if IJson['result']['errorCode'].asstring = 'INSUFFICIENT_FUNDS'          then oResult.eErrorCode := bferecINSUFFICIENT_FUNDS ;
              if IJson['result']['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'         then oResult.eErrorCode := bferecLOSS_LIMIT_EXCEEDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_SUSPENDED'            then oResult.eErrorCode := bferecMARKET_SUSPENDED ;
              if IJson['result']['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING' then oResult.eErrorCode := bferecMARKET_NOT_OPEN_FOR_BETTING ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_TRANSACTION'       then oResult.eErrorCode := bferecDUPLICATE_TRANSACTION ;
              if IJson['result']['errorCode'].asstring = 'INVALID_ORDER'               then oResult.eErrorCode := bferecINVALID_ORDER ;
              if IJson['result']['errorCode'].asstring = 'INVALID_MARKET_ID'           then oResult.eErrorCode := bferecINVALID_MARKET_ID ;
              if IJson['result']['errorCode'].asstring = 'PERMISSION_DENIED'           then oResult.eErrorCode := bferecPERMISSION_DENIED ;
              if IJson['result']['errorCode'].asstring = 'DUPLICATE_BETIDS'            then oResult.eErrorCode := bferecDUPLICATE_BETIDS ;
              if IJson['result']['errorCode'].asstring = 'NO_ACTION_REQUIRED'          then oResult.eErrorCode := bferecNO_ACTION_REQUIRED ;
              if IJson['result']['errorCode'].asstring = 'SERVICE_UNAVAILABLE'         then oResult.eErrorCode := bferecSERVICE_UNAVAILABLE ;
              if IJson['result']['errorCode'].asstring = 'REJECTED_BY_REGULATOR'       then oResult.eErrorCode := bferecREJECTED_BY_REGULATOR ;
            end ;

            if IJson['result']['instructionReports'] <> nil then
            begin
              iCount := 0 ;
            
              for IReport in IJson['result']['instructionReports'] do
              begin
                inc(iCount) ;
                setlength(oResult.aInstructionReports, iCount) ;
                oResult.aInstructionReports[iCount-1] := TbfUpdateInstructionReportObj.create ;
                
                if IReport['status'] <> nil then
                begin
                  if IReport['status'].asstring = 'SUCCESS' then oResult.aInstructionReports[iCount-1].eStatus := bfirsSUCCESS ;
                  if IReport['status'].asstring = 'FAILURE' then oResult.aInstructionReports[iCount-1].eStatus := bfirsFAILURE ;
                  if IReport['status'].asstring = 'TIMEOUT' then oResult.aInstructionReports[iCount-1].eStatus := bfirsTIMEOUT ;
                end ;

                if IReport['errorCode'] <> nil then
                begin
                  if IReport['errorCode'].asstring = 'INVALID_BET_SIZE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_SIZE ;
                  if IReport['errorCode'].asstring = 'INVALID_RUNNER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_RUNNER ;
                  if IReport['errorCode'].asstring = 'BET_TAKEN_OR_LAPSED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_TAKEN_OR_LAPSED ;
                  if IReport['errorCode'].asstring = 'BET_IN_PROGRESS'                then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecBET_IN_PROGRESS ;
                  if IReport['errorCode'].asstring = 'RUNNER_REMOVED'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRUNNER_REMOVED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BETTING'    then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BETTING ;
                  if IReport['errorCode'].asstring = 'LOSS_LIMIT_EXCEEDED'            then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecLOSS_LIMIT_EXCEEDED ;
                  if IReport['errorCode'].asstring = 'MARKET_NOT_OPEN_FOR_BSP_BETTING'then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecMARKET_NOT_OPEN_FOR_BSP_BETTING ;
                  if IReport['errorCode'].asstring = 'INVALID_PRICE_EDIT'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PRICE_EDIT ;
                  if IReport['errorCode'].asstring = 'INVALID_ODDS'                   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_ODDS ;
                  if IReport['errorCode'].asstring = 'INSUFFICIENT_FUNDS'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINSUFFICIENT_FUNDS ;
                  if IReport['errorCode'].asstring = 'INVALID_PERSISTENCE_TYPE'       then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_PERSISTENCE_TYPE ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_MATCHER'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_MATCHER ;
                  if IReport['errorCode'].asstring = 'INVALID_BACK_LAY_COMBINATION'   then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BACK_LAY_COMBINATION ;
                  if IReport['errorCode'].asstring = 'ERROR_IN_ORDER'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecERROR_IN_ORDER ;
                  if IReport['errorCode'].asstring = 'INVALID_BID_TYPE'               then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BID_TYPE ;
                  if IReport['errorCode'].asstring = 'INVALID_BET_ID'                 then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecINVALID_BET_ID ;
                  if IReport['errorCode'].asstring = 'CANCELLED_NOT_PLACED'           then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecCANCELLED_NOT_PLACED ;
                  if IReport['errorCode'].asstring = 'RELATED_ACTION_FAILED'          then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecRELATED_ACTION_FAILED ;
                  if IReport['errorCode'].asstring = 'NO_ACTION_REQUIRED'             then oResult.aInstructionReports[iCount-1].eErrorCode := bfirecNO_ACTION_REQUIRED ;
                end ;
                
                if IReport['instruction'] <> nil then
                begin
                  oResult.aInstructionReports[iCount-1].oInstruction := TbfUpdateInstructionObj.create ;
                  
                  if IReport['instruction']['betId'] <> nil then oResult.aInstructionReports[iCount-1].oInstruction.sBetId := IReport['instruction']['betId'].asstring ;

                  if IReport['instruction']['newPersistenceType'] <> nil then
                  begin
                    if IReport['instruction']['newPersistenceType'].asstring = 'LAPSE'           then oResult.aInstructionReports[iCount-1].oInstruction.ePersistenceType := bfperstypLAPSE ;
                    if IReport['instruction']['newPersistenceType'].asstring = 'PERSIST'         then oResult.aInstructionReports[iCount-1].oInstruction.ePersistenceType := bfperstypPERSIST ;
                    if IReport['instruction']['newPersistenceType'].asstring = 'MARKET_ON_CLOSE' then oResult.aInstructionReports[iCount-1].oInstruction.ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                  end ;
                end ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('updateOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function updateOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function updateOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListCurrentOrdersCallHandler( sSessionToken, sAppKey : string ;
                                           iExchangeId            : integer ;
                                           slBetIds               : TStringList ;
                                           slMarketIds            : TStringList ;
                                           eOrderProjection       : TbfngOrderProjection ;
                                           oDateRange             : TbfTimeRangeObj ;
                                           eOrderBy               : TbfngOrderBy ;
                                           eSortDir               : TbfngSortDir ;
                                           iStartRecord           : longint ;
                                           var bMoreAvailable     : boolean ;
                                           var oResult            : TbfCurrentOrderSummaryReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IDateRange          : ISuperObject ;
  ICurrentOrder       : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listCurrentOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;

      {***************}
      { Bet Ids       }
      {***************}
      if slBetIds.count > 0 then
      begin
        IParams.O['betIds'] := SA([]) ;
        
        for I := 0 to slBetIds.count - 1 do
        begin
          IParams.A['betIds'].S[I] := slBetIds[I] ;
        end ;
      end ;

      {***************}
      { Market Ids    }
      {***************}
      if slMarketIds.count > 0 then
      begin
        IParams.O['marketIds'] := SA([]) ;
        
        for I := 0 to slMarketIds.count - 1 do
        begin
          IParams.A['marketIds'].S[I] := slMarketIds[I] ;
        end ;
      end ;

      {*****************}
      { OrderProjection }
      {*****************}
      if eOrderProjection <> bforpNone then
      begin
        case eOrderProjection of
          bforpALL:                IParams.S['orderProjection'] := 'ALL' ;
          bforpEXECUTABLE:         IParams.S['orderProjection'] := 'EXECUTABLE' ;
          bforpEXECUTION_COMPLETE: IParams.S['orderProjection'] := 'EXECUTION_COMPLETE' ;
        end ;
      end ;

      {*****************}
      { DateRange       }
      {*****************}
      if oDateRange <> nil then
      begin
        IDateRange := SO ;
        IDateRange.S['from']   := DateTimeToJsonString(oDateRange.dFrom) ;
        IDateRange.S['to'  ]   := DateTimeToJsonString(oDateRange.dTo  ) ;
        IParams.O['dateRange'] := IDateRange ;
      end ;
      
      {*********}
      { OrderBy }
      {*********}
      if eOrderBy <> bfordbyNone then
      begin
        case eOrderBy of
          bfordbyBY_BET:        IParams.S['orderBy'] := 'BY_BET' ;
          bfordbyBY_MARKET:     IParams.S['orderBy'] := 'BY_MARKET' ;
          bfordbyBY_MATCH_TIME: IParams.S['orderBy'] := 'BY_MATCH_TIME' ;
        end ;
      end ;

      {*********}
      { SortDir }
      {*********}
      if eSortDir <> bfsortdirNone then
      begin
        case eSortDir of
          bfsortdirEARLIEST_TO_LATEST: IParams.S['sortDir'] := 'EARLIEST_TO_LATEST' ;
          bfsortdirLATEST_TO_EARLIEST: IParams.S['sortDir'] := 'LATEST_TO_EARLIEST' ;
        end ;      
      end ;      


      {************}
      { FromRecord }
      {************}
      IParams.I['fromRecord'] := iStartRecord ;

      {*************}
      { RecordCount }
      {*************}
      IParams.I['recordCount'] := 0 ; {Always request all records (the max retruned will be 1000)}


      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listCurrentOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfCurrentOrderSummaryReportObj.create ;

            if IJson['result']['moreAvailable'] <> nil then
            begin
              oResult.bMoreAvailable := IJson['result']['moreAvailable'].asboolean ;
              bMoreAvailable         := oResult.bMoreAvailable ;
            end ;

            if IJson['result']['currentOrders'] <> nil then
            begin
              iCount := 0 ;
            
              for ICurrentOrder in IJson['result']['currentOrders'] do
              begin
                inc(iCount) ;
                setlength(oResult.aCurrentOrders, iCount) ;
                oResult.aCurrentOrders[iCount-1] := TbfCurrentOrderSummaryObj.create ;

                if ICurrentOrder['betId'       ] <> nil then oResult.aCurrentOrders[iCount-1].sBetId        := ICurrentOrder['betId'       ].asstring ;
                if ICurrentOrder['marketId'    ] <> nil then oResult.aCurrentOrders[iCount-1].sMarketId     := ICurrentOrder['marketId'    ].asstring ;
                if ICurrentOrder['selectionId' ] <> nil then oResult.aCurrentOrders[iCount-1].iSelectionId  := ICurrentOrder['selectionId' ].asinteger ;
                if ICurrentOrder['handicap'    ] <> nil then oResult.aCurrentOrders[iCount-1].rHandicap     := ICurrentOrder['handicap'    ].asdouble ;

                if ICurrentOrder['priceSize'] <> nil then
                begin
                  oResult.aCurrentOrders[iCount-1].oPriceSize := TbfPriceSizeObj.create ;
                  if ICurrentOrder['priceSize']['price'] <> nil then oResult.aCurrentOrders[iCount-1].oPriceSize.rPrice := ICurrentOrder['priceSize']['price'].asdouble ;
                  if ICurrentOrder['priceSize']['size' ] <> nil then oResult.aCurrentOrders[iCount-1].oPriceSize.rSize  := ICurrentOrder['priceSize']['size' ].asdouble ;
                end ;

                if ICurrentOrder['bspLiability'] <> nil then oResult.aCurrentOrders[iCount-1].rBSPLiability := ICurrentOrder['bspLiability'].asdouble ;
                
                if ICurrentOrder['side'] <> nil then
                begin
                  if ICurrentOrder['side'].asstring = 'BACK' then oResult.aCurrentOrders[iCount-1].eSide := bfsideBack ;
                  if ICurrentOrder['side'].asstring = 'LAY'  then oResult.aCurrentOrders[iCount-1].eSide := bfsideLay ;
                end ;

                if ICurrentOrder['status'] <> nil then
                begin
                  if ICurrentOrder['status'].asstring = 'EXECUTION_COMPLETE' then oResult.aCurrentOrders[iCount-1].eStatus := bfordstEXECUTION_COMPLETE ;
                  if ICurrentOrder['status'].asstring = 'EXECUTABLE'         then oResult.aCurrentOrders[iCount-1].eStatus := bfordstEXECUTABLE ;
                end ;
                
                if ICurrentOrder['persistenceType'] <> nil then
                begin
                  if ICurrentOrder['persistenceType'].asstring = 'LAPSE'           then oResult.aCurrentOrders[iCount-1].ePersistenceType := bfperstypLAPSE ;
                  if ICurrentOrder['persistenceType'].asstring = 'PERSIST'         then oResult.aCurrentOrders[iCount-1].ePersistenceType := bfperstypPERSIST ;
                  if ICurrentOrder['persistenceType'].asstring = 'MARKET_ON_CLOSE' then oResult.aCurrentOrders[iCount-1].ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                end ;
                
                if ICurrentOrder['orderType'] <> nil then
                begin
                  if ICurrentOrder['orderType'].asstring = 'LIMIT'           then oResult.aCurrentOrders[iCount-1].eOrderType := bfordtypLIMIT ;
                  if ICurrentOrder['orderType'].asstring = 'LIMIT_ON_CLOSE'  then oResult.aCurrentOrders[iCount-1].eOrderType := bfordtypLIMIT_ON_CLOSE ;
                  if ICurrentOrder['orderType'].asstring = 'MARKET_ON_CLOSE' then oResult.aCurrentOrders[iCount-1].eOrderType := bfordtypMARKET_ON_CLOSE ;
                end ;

                if ICurrentOrder['placedDate' ] <> nil then oResult.aCurrentOrders[iCount-1].dPlacedDate  := JsonStringToDateTime(ICurrentOrder['placedDate' ].asstring) ;
                if ICurrentOrder['matchedDate'] <> nil then oResult.aCurrentOrders[iCount-1].dMatchedDate := JsonStringToDateTime(ICurrentOrder['matchedDate'].asstring) ;

                if ICurrentOrder['averagePriceMatched'] <> nil then oResult.aCurrentOrders[iCount-1].rAveragePriceMatched := ICurrentOrder['averagePriceMatched'].asdouble ;
                if ICurrentOrder['sizeMatched'        ] <> nil then oResult.aCurrentOrders[iCount-1].rSizeMatched         := ICurrentOrder['sizeMatched'        ].asdouble ;
                if ICurrentOrder['sizeRemaining'      ] <> nil then oResult.aCurrentOrders[iCount-1].rSizeRemaining       := ICurrentOrder['sizeRemaining'      ].asdouble ;
                if ICurrentOrder['sizeLapsed'         ] <> nil then oResult.aCurrentOrders[iCount-1].rSizeLapsed          := ICurrentOrder['sizeLapsed'         ].asdouble ;
                if ICurrentOrder['sizeCancelled'      ] <> nil then oResult.aCurrentOrders[iCount-1].rSizeCancelled       := ICurrentOrder['sizeCancelled'      ].asdouble ;
                if ICurrentOrder['sizeVoided'         ] <> nil then oResult.aCurrentOrders[iCount-1].rSizeVoided          := ICurrentOrder['sizeVoided'         ].asdouble ;

                if ICurrentOrder['regulatorAuthCode'  ] <> nil then oResult.aCurrentOrders[iCount-1].sRegulatorAuthCode   := ICurrentOrder['regulatorAuthCode'  ].asstring ;
                if ICurrentOrder['regulatorCode'      ] <> nil then oResult.aCurrentOrders[iCount-1].sRegulatorCode       := ICurrentOrder['regulatorCode'      ].asstring ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('listCurrentOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listCurrentOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listCurrentOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListCurrentOrders( sSessionToken, sAppKey : string ;
                                iExchangeId            : integer ;
                                slBetIds               : TStringList ;
                                slMarketIds            : TStringList ;
                                eOrderProjection       : TbfngOrderProjection ;
                                oDateRange             : TbfTimeRangeObj ;
                                eOrderBy               : TbfngOrderBy ;
                                eSortDir               : TbfngSortDir ;
                                var oResult            : TbfCurrentOrderSummaryReportObj ) : boolean ;
{************************************************************************************}
var
  I, iStartRecord   : longint ;
  iLocalCount       : longint ;
  bMoreAvailable    : boolean ;
  oLocalResult      : TbfCurrentOrderSummaryReportObj ;
  
begin
  try
    try
      result         := false ;
      oResult        := nil ;

      iLocalCount    := 0 ;
      iStartRecord   := 0 ;
      bMoreAvailable := true ;

      while (bMoreAvailable) do
      begin
        if bfngListCurrentOrdersCallHandler( sSessionToken, sAppKey,
                                             iExchangeId,
                                             slBetIds,
                                             slMarketIds,
                                             eOrderProjection,
                                             oDateRange,
                                             eOrderBy,
                                             eSortDir,
                                             iStartRecord,
                                             bMoreAvailable,
                                             oResult ) then
        begin
          if bMoreAvailable then
          begin
            {***********************************************************************************}
            { There are more orders to come. Copy the orders just obtained to our local object. }
            {***********************************************************************************}
            if iLocalCount = 0 then oLocalResult := TbfCurrentOrderSummaryReportObj.create ;
            
            if length(oResult.aCurrentOrders) > 0 then
            begin
              for I := 0 to length(oResult.aCurrentOrders) - 1 do
              begin
                inc(iLocalCount) ;
                setlength(oLocalResult.aCurrentOrders, iLocalCount) ;
                oLocalResult.aCurrentOrders[iLocalCount-1] := oResult.aCurrentOrders[I] ;
              end ;
              
              iStartRecord := iStartRecord + length(oResult.aCurrentOrders) ;
            end else
            begin
              bMoreAvailable := false ; {Shouldn't get here but if we do then don't get stuck in a loop.}
            end ;
          end else
          begin
            {*********************************************************************************************}
            { We have obtained all of the orders. Deal with the local object if we have needed to use it. }
            {*********************************************************************************************}
            if iLocalCount > 0 then
            begin
              if length(oResult.aCurrentOrders) > 0 then
              begin
                for I := 0 to length(oResult.aCurrentOrders) - 1 do
                begin
                  inc(iLocalCount) ;
                  setlength(oLocalResult.aCurrentOrders, iLocalCount) ;
                  oLocalResult.aCurrentOrders[iLocalCount-1] := oResult.aCurrentOrders[I] ;
                end ;
              end ;
              
              {**********************************}
              { Return the complete orders list. }
              {**********************************}
              oResult := oLocalResult ;
              result  := true ;
            end else
            begin
              {*******************************************************************}
              { Nothing further to do, oResult contains the complete orders list. }
              {*******************************************************************}
              result  := true ;
            end ;
          end ;
        end ;
      end ;

    except
      on E:Exception do
      begin
        result := false ;
        raise ;
      end ;
    end ;
    
  finally
  end ;
end ;



{************************************************************************************}
function bfngListClearedOrdersCallHandler( sSessionToken, sAppKey  : string ;
                                           iExchangeId             : integer ;
                                           eBetStatus              : TbfngBetStatus ;
                                           slEventTypeIds          : TStringList ;
                                           slEventIds              : TStringList ;
                                           slMarketIds             : TStringList ;
                                           aRunnerIds              : ArrayOfTbfRunnerIdObj ;
                                           slBetIds                : TStringList ;
                                           eSide                   : TbfngSide ;
                                           oSettledDateRange       : TbfTimeRangeObj ;
                                           eGroupBy                : TbfngGroupBy ;
                                           bIncludeItemDescription : boolean ;
                                           sLocale                 : string ;
                                           iStartRecord            : longint ;
                                           var bMoreAvailable      : boolean ;
                                           var oResult             : TbfClearedOrderSummaryReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IResult, IJson      : ISuperObject ;
  IRunnerId           : ISuperObject ;
  ISettledDateRange   : ISuperObject ;
  IClearedOrder       : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listClearedOrders' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;


      {***************}
      { Bet Status    }
      {***************}
      if eBetStatus <> bfbetstUnknown then
      begin
        case eBetStatus of
          bfbetstSETTLED:   IParams.S['betStatus'] := 'SETTLED' ;
          bfbetstVOIDED:    IParams.S['betStatus'] := 'VOIDED' ;
          bfbetstLAPSED:    IParams.S['betStatus'] := 'LAPSED' ;
          bfbetstCANCELLED: IParams.S['betStatus'] := 'CANCELLED' ;
        end ;
      end ;


      {***************}
      { EventTypeIds  }
      {***************}
      if slEventTypeIds.count > 0 then
      begin
        IParams.O['eventTypeIds'] := SA([]) ;
        
        for I := 0 to slEventTypeIds.count - 1 do
        begin
          IParams.A['eventTypeIds'].S[I] := slEventTypeIds[I] ;
        end ;
      end ;


      {***************}
      { EventIds      }
      {***************}
      if slEventIds.count > 0 then
      begin
        IParams.O['eventIds'] := SA([]) ;
        
        for I := 0 to slEventIds.count - 1 do
        begin
          IParams.A['eventIds'].S[I] := slEventIds[I] ;
        end ;
      end ;


      {***************}
      { Market Ids    }
      {***************}
      if slMarketIds.count > 0 then
      begin
        IParams.O['marketIds'] := SA([]) ;
        
        for I := 0 to slMarketIds.count - 1 do
        begin
          IParams.A['marketIds'].S[I] := slMarketIds[I] ;
        end ;
      end ;


      {***************}
      { RunnerIds     }
      {***************}
      if length(aRunnerIds) > 0 then
      begin
        IParams.O['runnerIds'] := SA([]) ;

        for I := 0 to length(aRunnerIds) - 1 do
        begin
          IRunnerId := SO ;

          IRunnerId.S['marketId'   ] := aRunnerIds[I].sMarketId ;
          IRunnerId.I['selectionId'] := aRunnerIds[I].iSelectionId ;

          if aRunnerIds[I].rHandicap > -1 then IRunnerId.D['handicap'] := aRunnerIds[I].rHandicap ;

          IParams.A['runnerIds'].O[I] := IRunnerId ;
        end ;
      end ;


      {***************}
      { Bet Ids       }
      {***************}
      if slBetIds.count > 0 then
      begin
        IParams.O['betIds'] := SA([]) ;
        
        for I := 0 to slBetIds.count - 1 do
        begin
          IParams.A['betIds'].S[I] := slBetIds[I] ;
        end ;
      end ;


      {***************}
      { Side          }
      {***************}
      if eSide <> bfsideUnknown then
      begin
        case eSide  of
          bfsideBACK: IParams.S['side'] := 'BACK' ;
          bfsideLAY:  IParams.S['side'] := 'LAY' ;
        end ;
      end ;
      
      
      {******************}
      { SettledDateRange }
      {******************}
      if oSettledDateRange <> nil then
      begin
        ISettledDateRange := SO ;
        ISettledDateRange.S['from']   := DateTimeToJsonString(oSettledDateRange.dFrom) ;
        ISettledDateRange.S['to'  ]   := DateTimeToJsonString(oSettledDateRange.dTo  ) ;
        IParams.O['settledDateRange'] := ISettledDateRange ;
      end ;
      
      
      {******************}
      { GroupBy          }
      {******************}
      if eGroupBy <> bfgrpbyNone then
      begin
        case eGroupBy of
          bfgrpbyEVENT_TYPE: IParams.S['groupBy'] := 'EVENT_TYPE' ;
          bfgrpbyEVENT:      IParams.S['groupBy'] := 'EVENT' ;
          bfgrpbyMARKET:     IParams.S['groupBy'] := 'MARKET' ;
          bfgrpbyRUNNER:     IParams.S['groupBy'] := 'RUNNER' ;
          bfgrpbySIDE:       IParams.S['groupBy'] := 'SIDE' ;
          bfgrpbyBET:        IParams.S['groupBy'] := 'BET' ;
        end ;      
      end ;      


      {************************}
      { IncludeItemDescription }
      {************************}
      if bIncludeItemDescription then IParams.B['includeItemDescription'] := true else IParams.B['includeItemDescription'] := false ;


      {************************}
      { Locale                 }
      {************************}
      if sLocale <> '' then IParams.S['locale'] := sLocale ;
      

      {************}
      { FromRecord }
      {************}
      IParams.I['fromRecord'] := iStartRecord ;

      {*************}
      { RecordCount }
      {*************}
      IParams.I['recordCount'] := 0 ; {Always request all records (the max returned will be 50)}

      
      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listClearedOrders' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult   := TbfClearedOrderSummaryReportObj.create ;

            if IJson['result']['moreAvailable'] <> nil then
            begin
              oResult.bMoreAvailable := IJson['result']['moreAvailable'].asboolean ;
              bMoreAvailable         := oResult.bMoreAvailable ;
            end ;

            if IJson['result']['clearedOrders'] <> nil then
            begin
              iCount := 0 ;
            
              for IClearedOrder in IJson['result']['clearedOrders'] do
              begin
                inc(iCount) ;
                setlength(oResult.aClearedOrders, iCount) ;
                oResult.aClearedOrders[iCount-1] := TbfClearedOrderSummaryObj.create ;

                if IClearedOrder['eventTypeId'] <> nil then oResult.aClearedOrders[iCount-1].sEventTypeId        := IClearedOrder['eventTypeId'].asstring ;
                if IClearedOrder['eventId'    ] <> nil then oResult.aClearedOrders[iCount-1].sEventId            := IClearedOrder['eventId'    ].asstring ;
                if IClearedOrder['marketId'   ] <> nil then oResult.aClearedOrders[iCount-1].sMarketId           := IClearedOrder['marketId'   ].asstring ;
                if IClearedOrder['selectionId'] <> nil then oResult.aClearedOrders[iCount-1].iSelectionId        := IClearedOrder['selectionId'].asinteger ;
                if IClearedOrder['handicap'   ] <> nil then oResult.aClearedOrders[iCount-1].rHandicap           := IClearedOrder['handicap'   ].asdouble ;
                if IClearedOrder['betId'      ] <> nil then oResult.aClearedOrders[iCount-1].sBetId              := IClearedOrder['betId'      ].asstring ;
                if IClearedOrder['placedDate' ] <> nil then oResult.aClearedOrders[iCount-1].dPlacedDate         := JsonStringToDateTime(IClearedOrder['placedDate'].asstring) ;

                if IClearedOrder['persistenceType'] <> nil then
                begin
                  if IClearedOrder['persistenceType'].asstring = 'LAPSE'           then oResult.aClearedOrders[iCount-1].ePersistenceType := bfperstypLAPSE ;
                  if IClearedOrder['persistenceType'].asstring = 'PERSIST'         then oResult.aClearedOrders[iCount-1].ePersistenceType := bfperstypPERSIST ;
                  if IClearedOrder['persistenceType'].asstring = 'MARKET_ON_CLOSE' then oResult.aClearedOrders[iCount-1].ePersistenceType := bfperstypMARKET_ON_CLOSE ;
                end ;

                if IClearedOrder['orderType'] <> nil then
                begin
                  if IClearedOrder['orderType'].asstring = 'LIMIT'           then oResult.aClearedOrders[iCount-1].eOrderType := bfordtypLIMIT ;
                  if IClearedOrder['orderType'].asstring = 'LIMIT_ON_CLOSE'  then oResult.aClearedOrders[iCount-1].eOrderType := bfordtypLIMIT_ON_CLOSE ;
                  if IClearedOrder['orderType'].asstring = 'MARKET_ON_CLOSE' then oResult.aClearedOrders[iCount-1].eOrderType := bfordtypMARKET_ON_CLOSE ;
                end ;
                
                if IClearedOrder['side'] <> nil then
                begin
                  if IClearedOrder['side'].asstring = 'BACK' then oResult.aClearedOrders[iCount-1].eSide := bfsideBack ;
                  if IClearedOrder['side'].asstring = 'LAY'  then oResult.aClearedOrders[iCount-1].eSide := bfsideLay ;
                end ;

                if IClearedOrder['itemDescription'] <> nil then
                begin
                  oResult.aClearedOrders[iCount-1].oItemDescription := TbfItemDescriptionObj.create ;

                  if IClearedOrder['itemDescription']['eventTypeDesc'  ] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.sEventTypeDesc   := IClearedOrder['itemDescription']['eventTypeDesc'  ].asstring ;
                  if IClearedOrder['itemDescription']['eventDesc'      ] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.sEventDesc       := IClearedOrder['itemDescription']['eventDesc'      ].asstring ;
                  if IClearedOrder['itemDescription']['marketDesc'     ] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.sMarketDesc      := IClearedOrder['itemDescription']['marketDesc'     ].asstring ;

                  if IClearedOrder['itemDescription']['marketStartTime'] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.dMarketStartTime := JsonStringToDateTime(IClearedOrder['itemDescription']['marketStartTime'].asstring) ;

                  if IClearedOrder['itemDescription']['runnerDesc'     ] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.sRunnerDesc      := IClearedOrder['itemDescription']['runnerDesc'     ].asstring ;
                  if IClearedOrder['itemDescription']['numberOfWinners'] <> nil then oResult.aClearedOrders[iCount-1].oItemDescription.iNumberOfWinners := IClearedOrder['itemDescription']['numberOfWinners'].asinteger ;
                end ;

                if IClearedOrder['priceRequested'] <> nil then oResult.aClearedOrders[iCount-1].rPriceRequested   := IClearedOrder['priceRequested'].asdouble ;
                if IClearedOrder['settledDate'   ] <> nil then oResult.aClearedOrders[iCount-1].dSettledDate      := JsonStringToDateTime(IClearedOrder['settledDate'].asstring) ;
                if IClearedOrder['betCount'      ] <> nil then oResult.aClearedOrders[iCount-1].iBetCount         := IClearedOrder['betCount'      ].asinteger ;
                if IClearedOrder['commission'    ] <> nil then oResult.aClearedOrders[iCount-1].rCommission       := IClearedOrder['commission'    ].asdouble ;
                if IClearedOrder['priceMatched'  ] <> nil then oResult.aClearedOrders[iCount-1].rPriceMatched     := IClearedOrder['priceMatched'  ].asdouble ;
                if IClearedOrder['priceReduced'  ] <> nil then oResult.aClearedOrders[iCount-1].bPriceReduced     := IClearedOrder['priceReduced'  ].asboolean ;
                if IClearedOrder['sizeSettled'   ] <> nil then oResult.aClearedOrders[iCount-1].rSizeSettled      := IClearedOrder['sizeSettled'   ].asdouble ;
                if IClearedOrder['profit'        ] <> nil then oResult.aClearedOrders[iCount-1].rProfit           := IClearedOrder['profit'        ].asdouble ;
                if IClearedOrder['sizeCancelled' ] <> nil then oResult.aClearedOrders[iCount-1].rSizeCancelled    := IClearedOrder['sizeCancelled' ].asdouble ;
              end ;
            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('listClearedOrders', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listClearedOrders. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listClearedOrders: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngListClearedOrders( sSessionToken, sAppKey  : string ;
                                iExchangeId             : integer ;
                                eBetStatus              : TbfngBetStatus ;
                                slEventTypeIds          : TStringList ;
                                slEventIds              : TStringList ;
                                slMarketIds             : TStringList ;
                                aRunnerIds              : ArrayOfTbfRunnerIdObj ;
                                slBetIds                : TStringList ;
                                eSide                   : TbfngSide ;
                                oSettledDateRange       : TbfTimeRangeObj ;
                                eGroupBy                : TbfngGroupBy ;
                                bIncludeItemDescription : boolean ;
                                sLocale                 : string ;
                                var oResult             : TbfClearedOrderSummaryReportObj ) : boolean ;
{************************************************************************************}
var
  I, iStartRecord   : longint ;
  iLocalCount       : longint ;
  bMoreAvailable    : boolean ;
  oLocalResult      : TbfClearedOrderSummaryReportObj ;
  
begin
  try
    try
      result         := false ;
      oResult        := nil ;

      iLocalCount    := 0 ;
      iStartRecord   := 0 ;
      bMoreAvailable := true ;

      while (bMoreAvailable) do
      begin
        if bfngListClearedOrdersCallHandler( sSessionToken, sAppKey,
                                             iExchangeId,
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
                                             iStartRecord,
                                             bMoreAvailable,
                                             oResult ) then
        begin
          if bMoreAvailable then
          begin
            {***********************************************************************************}
            { There are more orders to come. Copy the orders just obtained to our local object. }
            {***********************************************************************************}
            if iLocalCount = 0 then oLocalResult := TbfClearedOrderSummaryReportObj.create ;
            
            if length(oResult.aClearedOrders) > 0 then
            begin
              for I := 0 to length(oResult.aClearedOrders) - 1 do
              begin
                inc(iLocalCount) ;
                setlength(oLocalResult.aClearedOrders, iLocalCount) ;
                oLocalResult.aClearedOrders[iLocalCount-1] := oResult.aClearedOrders[I] ;
              end ;
              
              iStartRecord := iStartRecord + length(oResult.aClearedOrders) ;
            end else
            begin
              bMoreAvailable := false ; {Shouldn't get here but if we do then don't get stuck in a loop.}
            end ;
          end else
          begin
            {*********************************************************************************************}
            { We have obtained all of the orders. Deal with the local object if we have needed to use it. }
            {*********************************************************************************************}
            if iLocalCount > 0 then
            begin
              if length(oResult.aClearedOrders) > 0 then
              begin
                for I := 0 to length(oResult.aClearedOrders) - 1 do
                begin
                  inc(iLocalCount) ;
                  setlength(oLocalResult.aClearedOrders, iLocalCount) ;
                  oLocalResult.aClearedOrders[iLocalCount-1] := oResult.aClearedOrders[I] ;
                end ;
              end ;
              
              {**********************************}
              { Return the complete orders list. }
              {**********************************}
              oResult := oLocalResult ;
              result  := true ;
            end else
            begin
              {*******************************************************************}
              { Nothing further to do, oResult contains the complete orders list. }
              {*******************************************************************}
              result  := true ;
            end ;
          end ;
        end ;
      end ;

    except
      on E:Exception do
      begin
        result := false ;
        raise ;
      end ;
    end ;
    
  finally
  end ;
end ;



{************************************************************************************}
function bfngListMarketProfitAndLoss( sSessionToken, sAppKey  : string ;
                                      iExchangeId             : integer ;
                                      slMarketIds             : TStringList ;
                                      bIncludeSettledBets     : boolean ;
                                      bIncludeBSPBets         : boolean ;
                                      bNetOfCommission        : boolean ;
                                      var aResult             : ArrayOfTbfMarketProfitAndLossObj ) : boolean ;
{************************************************************************************}
var
  I, iCount, iPL     : longint ;
  sResponse          : string ;
  IFunction, IParams : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  IPandL             : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result := false ;
      setlength(aResult, 0) ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'SportsAPING/v1.0/listMarketProfitAndLoss' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;

      {************}
      { Market Ids }
      {************}
      if slMarketIds.count > 0 then
      begin
        IParams.O['marketIds'] := SA([]) ;
        
        for I := 0 to slMarketIds.count - 1 do
        begin
          IParams.A['marketIds'].S[I] := slMarketIds[I] ;
        end ;
      end ;


      {***************}
      { Boolean Flags }
      {***************}
      IParams.B['includeSettledBets'] := bIncludeSettledBets ;
      IParams.B['includeBSPBets'    ] := bIncludeBSPBets ;
      IParams.B['netOfCommission'   ] := bNetOfCommission ;

      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'listMarketProfitAndLoss' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngBettingAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngBettingAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
      
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          iCount := 0 ;
  
          for IResult in IJson['result'] do
          begin
            inc(iCount) ;
            setlength(aResult, iCount) ;

            aResult[iCount-1] := TbfMarketProfitAndLossObj.create ;

            if IResult['marketId'         ] <> nil then aResult[iCount-1].sMarketId          := IResult['marketId'].asstring ;
            if IResult['commissionApplied'] <> nil then aResult[iCount-1].rCommissionApplied := IResult['commissionApplied'].asdouble ;
            
            if IResult['profitAndLosses'] <> nil then
            begin
              iPL := 0 ;
              
              for IPandL in IResult['profitAndLosses'] do
              begin
                inc(iPL) ;
                
                setlength(aResult[iCount-1].aProfitAndLoss, iPL) ;
                aResult[iCount-1].aProfitAndLoss[iPL-1] := TbfRunnerProfitAndLossObj.create ;
                
                if IPandL['selectionId'] <> nil then aResult[iCount-1].aProfitAndLoss[iPL-1].iSelectionId := IPandL['selectionId'].asinteger ;
                if IPandL['ifWin'      ] <> nil then aResult[iCount-1].aProfitAndLoss[iPL-1].rIfWin       := IPandL['ifWin'      ].asdouble ;
                if IPandL['ifLose'     ] <> nil then aResult[iCount-1].aProfitAndLoss[iPL-1].rIfLose      := IPandL['ifLose'     ].asdouble ;
              end ;
            end ;
          end ;

          result := true ;
        end else
        begin
          HandleAPINGErrorResponse('listProfitAndLoss', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function listProfitAndLoss. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function listProfitAndLoss: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngGetAccountFunds( sSessionToken, sAppKey  : string ;
                              iExchangeId             : integer ;
                              var oResult             : TbfAccountFundsResponseObj ) : boolean ;
{************************************************************************************}
var
  sResponse          : string ;
  IFunction          : ISuperObject ;
  IResult, IJson     : ISuperObject ;
  httpClient         : TIdHttp ;
  sslIOHandler       : TIdSSLIOHandlerSocketOpenSSL ;
  Strm               : TStringStream ;
  formJSONDump       : TfmJSONDump ;
  
begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'AccountAPING/v1.0/getAccountFunds' ;
      IFunction.S['id'     ] := '1' ;
  

      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;
      
      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'getAccountFunds' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngAccountsAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngAccountsAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;
      
        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result'] <> nil then
          begin
            oResult := TbfAccountFundsResponseObj.create ;

            if IJson['result']['availableToBetBalance'] <> nil then oResult.rAvailableToBetBalance := IJson['result']['availableToBetBalance'].asdouble ;
            if IJson['result']['exposure'             ] <> nil then oResult.rExposure              := IJson['result']['exposure'             ].asdouble ;
            if IJson['result']['retainedCommission'   ] <> nil then oResult.rRetainedCommission    := IJson['result']['retainedCommission'   ].asdouble ;
            if IJson['result']['exposureLimit'        ] <> nil then oResult.rExposureLimit         := IJson['result']['exposureLimit'        ].asdouble ;
            
            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('getAccountFunds', IFunction, IJson) ;
        end ;
      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function getAccountFunds. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function getAccountFunds: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngGetAccountStatementCallHandler( sSessionToken, sAppKey : string ;
                                             iExchangeId            : integer ;
                                             oDateRange             : TbfTimeRangeObj ;
                                             eIncludeItem           : TbfngIncludeItem ;
                                             eWallet                : TbfngWallet ;
                                             sLocale                : string ;
                                             iStartRecord           : longint ;
                                             var bMoreAvailable     : boolean ;
                                             var oResult            : TbfAccountStatementReportObj ) : boolean ;
{************************************************************************************}
var
  I, iCount           : longint ;
  sResponse           : string ;
  IFunction, IParams  : ISuperObject ;
  IJson               : ISuperObject ;
  INames, IValues     : ISuperObject ;
  IDateRange, IItem   : ISuperObject ;
  httpClient          : TIdHttp ;
  sslIOHandler        : TIdSSLIOHandlerSocketOpenSSL ;
  Strm                : TStringStream ;
  formJSONDump        : TfmJSONDump ;

begin
  try
    try
      result    := false ;
      oResult   := nil ;
      IFunction := nil ;
      sResponse := '' ;

      {*******************************************************************************}
      { Create the Json string to call the API function with the required parameters. }
      {*******************************************************************************}
      IFunction := SO ;
      IFunction.S['jsonrpc'] := '2.0' ;
      IFunction.S['method' ] := 'AccountAPING/v1.0/getAccountStatement' ;
      IFunction.S['id'     ] := '1' ;
  
      IParams := SO ;

      {*****************}
      { itemDateRange   }
      {*****************}
      if oDateRange <> nil then
      begin
        IDateRange := SO ;
        IDateRange.S['from']       := DateTimeToJsonString(oDateRange.dFrom) ;
        IDateRange.S['to'  ]       := DateTimeToJsonString(oDateRange.dTo  ) ;
        IParams.O['itemDateRange'] := IDateRange ;
      end ;

      {*************}
      { IncludeItem }
      {*************}
      case eIncludeItem of
        bfiitALL:                  IParams.S['includeItem'] := 'ALL' ;
        bfiitDEPOSITS_WITHDRAWALS: IParams.S['includeItem'] := 'DEPOSITS_WITHDRAWALS' ;
        bfiitEXCHANGE:             IParams.S['includeItem'] := 'EXCHANGE' ;
        bfiitPOKER_ROOM:           IParams.S['includeItem'] := 'POKER_ROOM' ;
      end ;

      {********}
      { Wallet }
      {********}
      case eWallet of
        bfwalletUK:         IParams.S['wallet'] := 'UK' ;
        bfwalletAUSTRALIAN: IParams.S['wallet'] := 'AUSTRALIAN' ;
      end ;

      {********}
      { Locale }
      {********}
      if sLocale <> '' then IParams.S['locale'] := sLocale ;
      
      {************}
      { FromRecord }
      {************}
      IParams.I['fromRecord'] := iStartRecord ;

      {*************}
      { RecordCount }
      {*************}
      IParams.I['recordCount'] := 100 ; {Max page size is 100 items.}


      IFunction.O['params'] := IParams ;


      {****************************************************}
      { Create the Http Client for making the API request. }
      {****************************************************}
      httpClient           := bfngGetClientWithSessionAndAuth( sSessionToken, sAppKey) ;
      sslIOHandler         := TIdSSLIOHandlerSocketOpenSSL.Create(nil) ;
      httpClient.IOHandler := sslIOHandler ;

      if gDebugJSON then
      begin
        formJSONDump := TfmJSONDump.create(application) ;
        formJSONDump.caption := 'getAccountStatement' ;
        formJSONDump.memMsg.lines.add('JSON FUNCTION: "' + IFunction.asstring + '"') ; 
        formJSONDump.show ;
      end ;

      {****************}
      { Make the call. }
      {****************}
      Strm := TStringStream.Create(IFunction.AsString) ;
      
      case iExchangeId of
        cbfngUKExchange : sResponse := httpClient.Post(cbfngAccountsAPI_UKExchange,  Strm) ;
        cbfngAUSExchange: sResponse := httpClient.Post(cbfngAccountsAPI_AUSExchange, Strm) ;
      end ;

      {***********************}
      { Process the response. }
      {***********************}
      if httpClient.responsecode = 200 then
      begin
        if gDebugJSON then formJSONDump.memMsg.lines.add(CRLF + 'JSON RESPONSE: ' + sResponse) ;

        IJson := SO(sResponse) ;

        if (IJson['error'] = nil) then
        begin
          if IJson['result']['accountStatement'] <> nil then
          begin
            oResult := TbfAccountStatementReportObj.create ;

            if IJson['result']['moreAvailable'] <> nil then
            begin
              oResult.bMoreAvailable := IJson['result']['moreAvailable'].asboolean ;
              bMoreAvailable         := oResult.bMoreAvailable ;
            end ;

            iCount := 0 ;


            for IItem in IJson['result']['accountStatement'] do
            begin
              inc(iCount) ;
              setlength(oResult.aAccountStatement, iCount) ;
              oResult.aAccountStatement[iCount-1] := TbfStatementItemObj.create ;

              if IItem['refId'   ] <> nil then oResult.aAccountStatement[iCount-1].sRefId      := IItem['refId'].asstring ;
              if IItem['itemDate'] <> nil then oResult.aAccountStatement[iCount-1].dItemDate   := JsonStringToDateTime(IItem['itemDate' ].asstring) ;
              if IItem['amount'  ] <> nil then oResult.aAccountStatement[iCount-1].rAmount     := IItem['amount'].asdouble ;
              if IItem['balance' ] <> nil then oResult.aAccountStatement[iCount-1].rBalance    := IItem['balance'].asdouble ;
              
              if IItem['itemClass'] <> nil then
              begin
                if IItem['itemClass' ].asstring = 'UNKNOWN' then oResult.aAccountStatement[iCount-1].eItemClass := bfitcUNKNOWN ;
              end ;


              if IItem['itemClassData']['unknownStatementItem'] <> nil then
              begin
                {***********************************************************************************************}
                { Populate the dictionary of item class data information. These are Key/Value pairs as strings. }
                {***********************************************************************************************}
                INames  := SO(IItem['itemClassData']['unknownStatementItem'].asstring).asobject.GetNames ;
                IValues := SO(IItem['itemClassData']['unknownStatementItem'].asstring).asobject.GetValues ;
                
                for I := 0 to IValues.AsArray.length - 1 do
                begin
                  if not oResult.aAccountStatement[iCount-1].dictItemClassData.ContainsKey(INames.asarray[I].asstring) then oResult.aAccountStatement[iCount-1].dictItemClassData.add(INames.asarray[I].asstring, IValues.asarray[I].asstring) ;
                end ;
              end ;

              if IItem['legacyData'] <> nil then
              begin
                oResult.aAccountStatement[iCount-1].oLegacyData := TbfStatementLegacyDataObj.create ;

                if IItem['legacyData']['avgPrice'       ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.rAvgPrice        := IItem['legacyData']['avgPrice'       ].asdouble ;
                if IItem['legacyData']['betSize'        ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.rBetSize         := IItem['legacyData']['betSize'        ].asdouble ;
                if IItem['legacyData']['betType'        ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sBetType         := IItem['legacyData']['betType'        ].asstring ;
                if IItem['legacyData']['betCategoryType'] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sBetCategoryType := IItem['legacyData']['betCategoryType'].asstring ;
                if IItem['legacyData']['commissionRate' ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sCommissionRate  := IItem['legacyData']['commissionRate' ].asstring ;
                if IItem['legacyData']['eventId'        ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.iEventId         := IItem['legacyData']['eventId'        ].asinteger ;
                if IItem['legacyData']['eventTypeId'    ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.iEventTypeId     := IItem['legacyData']['eventTypeId'    ].asinteger ;
                if IItem['legacyData']['fullMarketName' ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sFullMarketName  := IItem['legacyData']['fullMarketName' ].asstring ;
                if IItem['legacyData']['grossBetAmount' ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.rGrossBetAmount  := IItem['legacyData']['grossBetAmount' ].asdouble ;
                if IItem['legacyData']['marketName'     ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sMarketName      := IItem['legacyData']['marketName'     ].asstring ;
                if IItem['legacyData']['marketType'     ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sMarketType      := IItem['legacyData']['marketType'     ].asstring ;
                if IItem['legacyData']['placedDate'     ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.dPlacedDate      := JsonStringToDateTime(IItem['legacyData']['placedDate'].asstring) ;
                if IItem['legacyData']['selectionId'    ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.iSelectionId     := IItem['legacyData']['selectionId'    ].asinteger ;
                if IItem['legacyData']['selectionName'  ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sSelectionName   := IItem['legacyData']['selectionName'  ].asstring ;
                if IItem['legacyData']['startDate'      ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.dStartDate       := JsonStringToDateTime(IItem['legacyData']['startDate'].asstring) ;
                if IItem['legacyData']['transactionType'] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sTransactionType := IItem['legacyData']['transactionType'].asstring ;
                if IItem['legacyData']['transactionId'  ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.iTransactionId   := IItem['legacyData']['transactionId'  ].asinteger ;
                if IItem['legacyData']['winLose'        ] <> nil then oResult.aAccountStatement[iCount-1].oLegacyData.sWinLose         := IItem['legacyData']['winLose'        ].asstring ;
              end ;

            end ;

            result := true ;
          end ;
        end else
        begin
          HandleAPINGErrorResponse('getAccountStatement', IFunction, IJson) ;
        end ;

      end else
      begin
        raise EbfhttpError.Create(-1, 'Http error calling Betfair API-NG function getAccountStatement. Http error code: ' + inttostr(httpClient.responsecode), IFunction, sResponse) ;
      end ;

    except
      on E:EbfhttpError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
      
      on E:EbfFunctionError do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, E.Message, IFunction, sResponse) ;
      end ;
    
      on E:Exception do
      begin
        result := false ;
        raise EbfAPIError.Create(-1, 'Exception in Betfair API function getAccountStatement: ' + E.Message, IFunction, sResponse) ;
      end ;
    end ;
    
  finally
    sslIOHandler.free  ;
    httpClient.free ;
    strm.free ;
  end ;
end ;



{************************************************************************************}
function bfngGetAccountStatement( sSessionToken, sAppKey : string ;
                                  iExchangeId            : integer ;
                                  oDateRange             : TbfTimeRangeObj ;
                                  eIncludeItem           : TbfngIncludeItem ;
                                  eWallet                : TbfngWallet ;
                                  sLocale                : string ;
                                  var oResult            : TbfAccountStatementReportObj ) : boolean ;
{************************************************************************************}
var
  I, iStartRecord   : longint ;
  iLocalCount       : longint ;
  bMoreAvailable    : boolean ;
  oLocalResult      : TbfAccountStatementReportObj ;
  
begin
  try
    try
      result         := false ;
      oResult        := nil ;

      iLocalCount    := 0 ;
      iStartRecord   := 0 ;
      bMoreAvailable := true ;

      while (bMoreAvailable) do
      begin
        if bfngGetAccountStatementCallHandler( sSessionToken, sAppKey,
                                               iExchangeId,
                                               oDateRange,
                                               eIncludeItem,
                                               eWallet,
                                               sLocale,
                                               iStartRecord,
                                               bMoreAvailable,
                                               oResult ) then
        begin
          if bMoreAvailable then
          begin
            {*********************************************************************************}
            { There are more items to come. Copy the items just obtained to our local object. }
            {*********************************************************************************}
            if iLocalCount = 0 then oLocalResult := TbfAccountStatementReportObj.create ;

            if length(oResult.aAccountStatement) > 0 then
            begin
              for I := 0 to length(oResult.aAccountStatement) - 1 do
              begin
                inc(iLocalCount) ;
                setlength(oLocalResult.aAccountStatement, iLocalCount) ;
                oLocalResult.aAccountStatement[iLocalCount-1] := oResult.aAccountStatement[I] ;
              end ;
              
              iStartRecord := iStartRecord + length(oResult.aAccountStatement) ;
            end else
            begin
              bMoreAvailable := false ; {Shouldn't get here but if we do then don't get stuck in a loop.}
            end ;
          end else
          begin
            {********************************************************************************************}
            { We have obtained all of the items. Deal with the local object if we have needed to use it. }
            {********************************************************************************************}
            if iLocalCount > 0 then
            begin
              if length(oResult.aAccountStatement) > 0 then
              begin
                for I := 0 to length(oResult.aAccountStatement) - 1 do
                begin
                  inc(iLocalCount) ;
                  setlength(oLocalResult.aAccountStatement, iLocalCount) ;
                  oLocalResult.aAccountStatement[iLocalCount-1] := oResult.aAccountStatement[I] ;
                end ;
              end ;

              {********************************}
              { Return the complete statement. }
              {********************************}
              oResult := oLocalResult ;
              result  := true ;
            end else
            begin
              {*****************************************************************}
              { Nothing further to do, oResult contains the complete statement. }
              {*****************************************************************}
              result  := true ;
            end ;
          end ;
        end ;
      end ;

    except
      on E:Exception do
      begin
        result := false ;
        raise ;
      end ;
    end ;
    
  finally
  end ;
end ;




initialization
  gDebugJSON := false ;


end.
