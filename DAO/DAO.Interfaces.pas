unit DAO.Interfaces;

interface

uses
  Data.DB, System.Classes, FireDAC.Comp.Client;

type
  IConexao = interface
    ['{A4C97BB4-1CE7-442C-9DAF-1D493567F689}']
    function AbreTabela(const ASQL: String; var ATabela: TFDQuery): Boolean; overload;
    function AbreTabela(const ASQL: String; AArgs: Array of const; var ATabela: TFDQuery): Boolean; overload;
    function AbreTabela(const ASQL: String; AArgs: Array of const): TFDQuery; overload;
    function AbreTabela(const ASQL: String): TFDQuery; overload;
    procedure ConfiguraTabela(const ATabela: TFDQuery);
    procedure ExecutarSQL(const ASQL: String); overload;
    procedure ExecutarSQL(const ASQL: String; AArgs: Array of const); overload;
    function ConsultarString(const ASQL: String; AArgs: Array of const): String;
    function ConsultarInteiro(const ASQL: String; AArgs: Array of const): Integer;
    function ConsultarExtended(const ASQL: String; AArgs: Array of const): Extended;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;


  function CreateConnection: IConexao;

implementation

uses
  DAO.Classes;

function CreateConnection: IConexao;
begin
  Result := TConexao.Create;
end;

end.
