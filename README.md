# API-NG Library For Delphi XE

Date     : 26th June 2014
Version  : 1.09.00


## Version History
V1.09.00 - 26/06/2014 
* Updated the bfngKeepAlive function to check for a returned status of "SUCCESS" and return the error code if not.
* Updated the bfngLogout function to check for a returned status of "SUCCESS" and return the error code if not.
* Updated the interactive login process to catch the postback to the URL in order to check for a successful status code and obtain the session token.

V1.08.00 - 09/05/2014 
* Fixed bug in the listMarketCatalogue paged-calling mechanism.

## Application
-----------
API_NG_TestBed is a Delphi application for testing an interface function library for the [Betfair API-NG](https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/API-NG+Overview).

It was built using Delphi XE but should be backward compatible with most earlier versions.

PLEASE NOTE: You will need to provide your own Betfair Application Key in order to use this test application (see Application Key section below).

The API interface library consists of 3 files:

* LBS_BetfairAPINGClasses.pas
* LBS_BetfairAPINGUtils.pas
* LBS_BetfairAPINGFunctions.pas

The interface uses JSON-RPC protocol and supports the following API-NG functions:

* listCompetitions
* listCountries
* listCurrentOrders
* listClearedOrders
* listEvents
* listEventTypes
* listMarketBook
* listMarketCatalogue
* listMarketProfitAndLoss
* listMarketTypes
* listTimeRanges
* listVenues
* placeOrders
* cancelOrders
* replaceOrders
* updateOrders
* getAccountFunds
* getAccountStatement

## Application Key
---------------
In order to use the test application the user must provide their own Betfair Application Key.
Locate the following section of code in frmMain.pas and enter your key values here:

```delphi
  const
    {**************************}
    { Betfair application keys }
    {**************************}
    cBetfair_AppKey         = 'EnterAppKeyHere' ;
    cBetfair_AppKey_Delayed = 'EnterDelayedAppKeyHere' ;
```

## Disclaimer 
Betfair provides this Delphi Library ‘as is’.  There are no guarantees as to the functionality of the application, Betfair will not be liable for any bets placed erroneously as a result of misuse of the application or due to bugs in the application.

## JSON Popup Form
---------------
In order to support debugging/testing of the raw JSON request/response strings, a facility for displaying these is provided via a popup form.
To enable this feature the variable `LBS_BetfairAPINGFunctions.gDebugJSON` must be set to `true`. There is a checkbox at the top of the test application for this purpose.


## Superobject
-----------
This interface library implementation makes use of the excellent Superobject classes for JSON parsing and construction.
Detailed information and licensing for Superobject can be found [here](https://code.google.com/p/superobject/).


