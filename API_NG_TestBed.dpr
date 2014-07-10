{*******************************************************************************************}
{*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*}
{*+                                                                                       +*}
{*+ Filename    : API_NG_TestBed.dpr                                                      +*}
{*+                                                                                       +*}
{*+ Project/Job : Test application for the Betfair API-NG Delphi Interface Library        +*}
{*+                                                                                       +*}
{*+ Contents    : DelphiXE Project file.                                                  +*}
{*+                                                                                       +*}
{*+ Version     : 1.09.00                                                                 +*}
{*+                                                                                       +*}
{*+ Parameters  : None                                                                    +*}
{*+                                                                                       +*}
{*+ Compiler    : DelphiXE                                                                +*}
{*+                                                                                       +*}
{*+                                                                                       +*}
{*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*}
{*******************************************************************************************}
program API_NG_TestBed;

uses
  Forms,
  Sysutils,
  frmMain in 'frmMain.pas' {fmMain},
  frmBetfairLogin in 'frmBetfairLogin.pas' {fmBetfairLogin},
  superobject in 'superobject.pas',
  superxmlparser in 'superxmlparser.pas',
  LBS_BetFairAPINGClasses in 'LBS_BetFairAPINGClasses.pas',
  LBS_BetFairAPINGFunctions in 'LBS_BetFairAPINGFunctions.pas',
  LBS_BetFairAPINGUtils in 'LBS_BetFairAPINGUtils.pas',
  frmJSONDump in 'frmJSONDump.pas' {fmJSONDump};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
