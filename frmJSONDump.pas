unit frmJSONDump;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmJSONDump = class(TForm)
    memMsg: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmJSONDump: TfmJSONDump;

implementation

{$R *.dfm}

procedure TfmJSONDump.FormCreate(Sender: TObject);
begin
  memMsg.Clear ;
end;

end.
