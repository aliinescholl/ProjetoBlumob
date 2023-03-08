unit UEntity.Usuario;

interface

type
  TUsuario = class
    private
      FNome: String;
      FEmail: String;

    function GetEmail: String;
    function GetNome: String;

    public
      constructor Create(aNome, aEmail: String);

      property Nome: String read GetNome;
      property Email: String read GetEmail;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create(aNome, aEmail: String);
begin
  FNome := aNome;
  FEmail:= aEmail;
end;

function TUsuario.GetEmail: String;
begin
  Result := FEmail;
end;

function TUsuario.GetNome: String;
begin
  Result := FNome;
end;

end.
