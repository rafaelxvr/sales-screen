unit Model.Venda;

interface
uses
  Model.Interfaces, Controller.Interfaces;

Type
  TModelVenda = class(TInterfacedObject, IModelVenda)
    private
      FItem : IModelItem;
    public
      constructor Create;
      class function New : IModelVenda;
      function Item : IModelItem;
  end;

implementation

{ TModelVenda }

constructor TModelVenda.Create;
begin
  FItem := TModelItens.New(Self);
end;

function TModelVenda.Item: IModelItem;
begin
  Result := FItem;
end;

class function TModelVenda.New: IModelVenda;
begin
  Result := Self.Create;
end;

end.
