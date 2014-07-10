unit frmBetfairLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TfmBetfairLogin = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
  private
    { Private declarations }
  public
    { Public declarations }
    sSessionToken      : string ;
    sAppKey            : string ;
    sBetfairLoginError : string ;
  end;

var
  fmBetfairLogin: TfmBetfairLogin;

implementation

{$R *.dfm}

uses LBS_BetfairAPINGUtils, mshtml, IdURI ;



{******************************************************************************************}
procedure TfmBetfairLogin.FormShow(Sender: TObject);
{******************************************************************************************}
begin
  sSessionToken      := '' ;
  sBetfairLoginError := '' ;
  WebBrowser1.navigate( cBFLoginURLInternational + sAppKey + '&url=' + cBFRedirectURL ) ;
  modalresult        := mrNo ;
end ;



{******************************************************************************************}
function OleVariantToMemoryStream(OV: OleVariant): TMemoryStream;
{******************************************************************************************}
var
  Data: PByteArray;
  Size: integer;
begin
  Result := TMemoryStream.Create;
  try
     Size := VarArrayHighBound (OV, 1) - VarArrayLowBound(OV, 1) + 1;
     Data := VarArrayLock(OV) ;
     try
       Result.Position := 0;
       Result.WriteBuffer(Data^, Size) ;
     finally
       VarArrayUnlock(OV) ;
     end;
  except
     Result.Free;
     Result := nil;
  end;
end;



{******************************************************************************************}
procedure TfmBetfairLogin.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
{******************************************************************************************}
var
  ms: TMemoryStream;
  ss: TStringStream;
  params: TStringList;

begin
  try
    try
      ss := TStringStream.Create('');
      params := TStringList.Create;
      if (URL = 'https://www.betfair.com/') and (Length(PostData) > 0) then
      begin
        ms := OleVariantToMemoryStream(PostData);
        ms.Position := 0;
        ss.CopyFrom(ms, ms.size);
        ss.Position := 0;

        params.Delimiter := '&';
        params.DelimitedText := ss.DataString;
        if params.Values['loginStatus'] = TIdURI.URLDecode('SUCCESS') then
        begin
          sSessionToken := TIdURI.URLDecode(params.Values['productToken']);
          Self.ModalResult := mrOK;
        end;
      end;
    except
      on E:Exception do
      begin
        sBetfairLoginError   := 'Exception during Betfair login process: ' + E.Message ;
        sSessionToken        := '' ;
        modalresult          := mrNo ;
      end ;
    end ;
  finally
    params.Free;
    ss.Free;
  end;
end ;



{******************************************************************************************}
procedure TfmBetfairLogin.WebBrowser1NavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
{******************************************************************************************}
begin
  if WebBrowser1.Document <> nil then (Webbrowser1.Document as IHTMLDocument2).ParentWindow.Focus ; {Set focus on the web browser so that the user can just type his credentials.}
end ;



end.
