unit UDAO.Base;

interface

uses
  UDAO.Intf,
  System.JSON;

type
  TDAOBase = class(TInterfacedObject, IDAO)
    protected
      FTabela: String;
      FCondicao: String;
    public
      function ProcurarPorID(const aIdentificador: Integer): TJSONObject; virtual;
  end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  UUtil.Banco;

{ TDAOBase }

function TDAOBase.ProcurarPorID(const aIdentificador: Integer): TJSONObject;
var
  xJSONArray: TJSONArray;
begin
   try
    xJSONArray := TUtilBanco.ExecutarConsulta(
                    Format('SELECT * FROM %s WHERE %s = %d',
                      [FTabela, FCondicao, aIdentificador]));

    if xJSONArray.Count = 0 then
    begin
      Result := TJSONObject.Create;
      xJSONArray.Free;
      Exit;
    end;

    Result := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[0].ToJSON), 0) as TJSONObject;
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

end.
