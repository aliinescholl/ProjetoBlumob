unit UEntity.Cartao;

interface
uses
  System.JSON,
  UEntity.Usuario,
  UEntity.Tipo;
type
  TCartao = class
    private
      FID: Integer;
      FNumCartao: Integer;
      FSaldo: Double;
      FTipo: TTipo;
      FUsuario: TUsuario;

    function GetSaldo: Double;
    function GetPassagem: Double;
    function GetNumCartao: Integer;

    procedure SetSaldo(const Value: Double);

    procedure CarregarTipo(aJSON: String);
    function GetTipo: TTipo;

    public
      constructor Create(aJSON: String); overload;
      destructor Destroy;


      property Saldo: Double read GetSaldo write SetSaldo;
      property Passagem: Double read GetPassagem;
      property NumCartao: Integer read GetNumCartao;
      property Tipo: TTipo read GetTipo;
  end;

implementation

uses
  System.SysUtils, FireDAC.comp.Client, DataSet.Serialize;
{ TCartao }

procedure TCartao.CarregarTipo(aJSON: String);
var
  xMemTable: TFDMemTable;
begin
  xMemTable := TFDMemTable.Create(nil);
  try
    xMemTable.LoadFromJSON(aJSON);

    FTipo := TTipo.Create(xMemTable.FieldByName('valorpassagem').AsFloat,
                          xMemTable.FieldByName('tipo').AsString);
  finally
    FreeAndNil(xMemTable);
  end;
end;

constructor TCartao.Create(aJSON: String);
var
  xMemTable: TFDMemTable;
begin
  xMemTable := TFDMemTable.Create(nil);
  try
    xMemTable.LoadFromJSON(aJSON);
    FSaldo := xMemTable.FieldByName('saldo').AsFloat;
    FNumCartao := xMemTable.FieldByName('numcartao').AsInteger;

    Self.CarregarTipo(xMemTable.FieldByName('tipo').AsString);
  finally
    FreeAndNil(xMemTable);
  end;
end;
destructor TCartao.Destroy;
begin
  FreeAndNil(FUsuario);
end;
function TCartao.GetNumCartao: Integer;
begin
  Result := FNumCartao;
end;

function TCartao.GetPassagem: Double;
begin
  //Result := FValorPassagem;
end;

function TCartao.GetSaldo: Double;
begin
  Result := FSaldo;
end;

function TCartao.GetTipo: TTipo;
begin
  Result := FTipo;
end;

procedure TCartao.SetSaldo(const Value: Double);
begin
 FSaldo := Value;
end;

end.
