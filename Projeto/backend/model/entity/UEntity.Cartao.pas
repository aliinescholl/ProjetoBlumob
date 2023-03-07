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
      FNumCartao: String;
      FSaldo: Double;
      FTipo: TTipo;
      FUsuario: TUsuario;
      FJSON: TJSONObject;

      function GetID: Integer;
      function GetJSON: TJSONObject;
      function GetNum: String;

    procedure SetId(const Value: Integer);
    procedure SetNum(const Value: String);

    function GetSaldo: Double;
    function GetTipo: TTipo;

    procedure SetSaldo(const Value: Double);
    procedure SetTipo(const Value: TTipo);

    function GetUser: TUsuario;
    procedure SetUser(const Value: TUsuario);

    public
      constructor Create(const aID: Integer; aSaldo: Double; aNumCartao: String);
      destructor Destroy;

      [SwagProp('Cartao ID', True)]
      property ID: Integer read GetID write SetId;

      [SwagProp('Cartao Numero', True)]
      property NumCartao: String read GetNum write SetNum;

      property Saldo: Double read GetSaldo write SetSaldo;

      property Tipo: TTipo read GetTipo write SetTipo;

      property Usuario: TUsuario read GetUser write SetUser;

      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TCartao }

constructor TCartao.Create(const aID: Integer; aSaldo: Double; aNumCartao: String);
begin
  FID := aID;
  FSaldo := aSaldo;
  FNumCartao := aNumCartao;
  FTipo := TTipo.Create;
  FUsuario := TUsuario.Create;
end;

destructor TCartao.Destroy;
begin
  FreeAndNil(FTipo);
  FreeAndNil(FUsuario);
  FreeAndNil(FJSON);
end;

function TCartao.GetID: Integer;
begin

end;

function TCartao.GetJSON: TJSONObject;
begin

end;

function TCartao.GetNum: String;
begin

end;

function TCartao.GetSaldo: Double;
begin

end;

function TCartao.GetTipo: TTipo;
begin

end;

function TCartao.GetUser: TUsuario;
begin

end;

procedure TCartao.SetId(const Value: Integer);
begin

end;

procedure TCartao.SetNum(const Value: String);
begin

end;

procedure TCartao.SetSaldo(const Value: Double);
begin

end;

procedure TCartao.SetTipo(const Value: TTipo);
begin

end;

procedure TCartao.SetUser(const Value: TUsuario);
begin

end;

end.