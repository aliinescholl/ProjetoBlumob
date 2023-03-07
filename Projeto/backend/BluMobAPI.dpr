program BluMobAPI;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  Horse.JWT,
  Horse.BasicAuthentication,
  Horse.GBSwagger,
  System.SysUtils,
  UController.Cartao in 'model\controllers\UController.Cartao.pas',
  UDAO.Cartao in 'model\dao\UDAO.Cartao.pas',
  UDAO.Intf in 'model\dao\UDAO.Intf.pas',
  UDAO.Base in 'model\dao\UDAO.Base.pas',
  UEntity.Cartao in 'model\entity\UEntity.Cartao.pas',
  UUtil.Banco in 'model\utils\UUtil.Banco.pas',
  UEntity.Usuario in 'model\entity\UEntity.Usuario.pas',
  UEntity.Tipo in 'model\entity\UEntity.Tipo.pas',
  UController.Base in 'model\controllers\UController.Base.pas',
  UDAO.Tipo in 'model\dao\UDAO.Tipo.pas',
  UDAO.Usuario in 'model\dao\UDAO.Usuario.pas';

procedure SwaggerConfig;
begin
  THorseGBSwaggerRegister.RegisterPath(TControllerCartao);

  //http://localhost:9000/swagger/doc/html
  Swagger
    .Info
      .Title('Documenta��o API BluMob')
      .Description('BluMob - Verifique seu Saldo')
      .Contact
        .Name('Os pula catraca')
        .Email('PulaCatraca@Gmail.com')
        .URL('http://www.mypage.com.br')
      .&End
    .&End
    .BasePath('v1');
end;

procedure Registry;
begin
  THorse.Group.Prefix('v1')
    .Get('/Cartao/:id', TControllerCartao.Get)
    .Put('/Cartao', TControllerCartao.Put);
end;

begin

  THorse
    .Use(Cors)
    .Use(HorseSwagger)
    .Use(Jhonson);

  SwaggerConfig;
  Registry;

  THorse.Listen(9000);
end.