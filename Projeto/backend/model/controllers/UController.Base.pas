unit UController.Base;

interface

uses
  Horse,
  UDAO.Intf;

type
 TControllerBase = class
    protected
      class var FDAO: IDAO;
    public
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
      class procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc); virtual;
 end;

implementation

uses
  System.JSON, System.SysUtils;

{ TControllerBase }

class procedure TControllerBase.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  xId: Integer;
begin
  if (Req.Params.Count <> 1) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;

  xId := StrToIntDef(Req.Params.Items['id'], 0);

  Res.Send<TJSONObject>(FDAO.ProcurarPorId(xId));
end;

class procedure TControllerBase.Put(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin

end;

end.
