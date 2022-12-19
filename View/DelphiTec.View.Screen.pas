unit DelphiTec.View.Screen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Controller.Observer.Interfaces,
  Vcl.StdCtrls, Controller.Interfaces;

type
  TViewScreen1 = class(TForm, iObserverItem)
    ListBox1: TListBox;
  private
    { Private declarations }
    FVenda : IControllerVenda;
    function UpdateItem(Value : TRecordItem) : IObserverItem;
  public
    { Public declarations }
    procedure ExibirForm(Parent : IControllerVenda);
  end;

var
  ViewScreen1: TViewScreen1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TViewScreen1.ExibirForm(Parent: IControllerVenda);
begin
  FVenda := Parent;
  FVenda.ObserverItem.Add(Self);
  Self.Show;
end;

function TViewScreen1.UpdateItem(Value: TRecordItem): IObserverItem;
begin
  Listbox1.Items.Add(Value.Descricao);
end;

end.
