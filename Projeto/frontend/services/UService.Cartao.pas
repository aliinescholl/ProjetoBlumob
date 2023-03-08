unit UService.Cartao;

interface

uses
  UEntity.Cartao, UService.Base, System.JSON;

type
  TServiceCartao = class(TServiceBase)
  private
    FArquivoLog: TextFile;
    FCartao: TCartao;

    constructor Create;

    function GetCartao: TCartao;
    procedure SetCartao(const Value: TCartao);

  public

    class function ObterInstancia: TServiceCartao;
    class function NewInstance: TObject; override;
    procedure RegistrarLog(const aTexto: string);

    function ObterRegistro(const aId: String): TJSONObject; override;

    property Cartao: TCartao read GetCartao write SetCartao;
  end;

var
  Instancia: TServiceCartao;

implementation

uses
  System.SysUtils, Vcl.Forms, UUtils.Constants, Rest.Types;

{ TLoggerSingleton }

constructor TServiceCartao.Create;
var
  xDiretorioAplicacao: string;
begin
  Inherited;

  xDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(FArquivoLog, xDiretorioAplicacao + 'Log.txt');

  if not FileExists(xDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

function TServiceCartao.GetCartao: TCartao;
begin
  Result := FCartao;
end;

class function TServiceCartao.NewInstance: TObject;
begin

  if not Assigned(Instancia) then
  begin
    Instancia := TServiceCartao(inherited NewInstance);
  end;

  Result := Instancia;
end;

class function TServiceCartao.ObterInstancia: TServiceCartao;
begin
  Result := TServiceCartao.Create;
end;

function TServiceCartao.ObterRegistro(const aId: String): TJSONObject;
begin
    FRESTClient.BaseURL := URL_BASE_CARTAO + '/' + aID;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    FCartao := TCartao.Create(FRESTResponse.Content);
end;

procedure TServiceCartao.RegistrarLog(const aTexto: string);
begin
  Append(FArquivoLog);

  WriteLn(FArquivoLog, aTexto);

  CloseFile(FArquivoLog);
end;

procedure TServiceCartao.SetCartao(const Value: TCartao);
begin
  FCartao := Value;
end;

initialization

finalization
  FreeAndNil(Instancia);

end.