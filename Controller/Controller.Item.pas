unit Controller.Item;

interface

uses
  Controller.Interfaces;

type
  TControllerItem = class(TInterfacedObject, IControllerItem)
    private
      [weak]
      FParent : IControllerVenda;
      FCodigo : Integer;
    public
      constructor Create (Parent : IControllerVenda);
      class function New(Parent : IControllerVenda) : IControllerItem;
      function Codigo(Value : Integer) : IControllerItem;
      function Vender : IControllerItem;
      function &End : IControllerVenda;
  end;

implementation

{ TControllerVenda }

constructor TControllerItem.Create(Parent : IControllerVenda);
begin
  FParent := Parent;
end;

class function TControllerItem.New(Parent : IControllerVenda) : IControllerItem;
begin
  Result := Self.Create(Parent);
end;

function TControllerItem.Codigo(Value: Integer): IControllerItem;
begin
  Result := Self;
  FCodigo := Value;
end;

function TControllerItem.Vender: IControllerItem;
begin
  Result := Self; // falta a liga��o entre o controller e o model para finalizar venda.
  FParent.Model.Item.Codigo(FCodigo).Vender; // tava no canto errado
end;

function TControllerItem.&End: IControllerVenda;
begin
  Result := FParent;
end;

end.
