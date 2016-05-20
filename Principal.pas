unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TEscalamento = class
  public
    ID: string;
    PercentualDano: integer;
  end;

  TScaling = class
    Escalamento: array of TEscalamento;
  public
    procedure AddEscalamento(ID: string; Percentual: integer);
    function BuscaPercentual(ID: string): integer;
  end;

  TfrmPrincipal = class(TForm)
    grpVigor: TGroupBox;
    edtLevel: TEdit;
    lblLevel: TLabel;
    edtVigor: TEdit;
    img1: TcxImage;
    edtVida: TEdit;
    grpDestreza: TGroupBox;
    edtDestreza: TEdit;
    img2: TcxImage;
    edtDanoDestreza: TEdit;
    lblPontosV: TLabel;
    lblVida: TLabel;
    lblPontosD: TLabel;
    lblDestreza: TLabel;
    grpForca: TGroupBox;
    lblPontosF: TLabel;
    lblForca: TLabel;
    edtForca: TEdit;
    img3: TcxImage;
    edtDanoForca: TEdit;
    grpMental: TGroupBox;
    lblPontosM: TLabel;
    lblMental: TLabel;
    edtMental: TEdit;
    img4: TcxImage;
    edtDanoMental: TEdit;
    grpArma: TGroupBox;
    lblDanoBase: TLabel;
    edtDanoBase: TEdit;
    lblScalingD: TLabel;
    edtEscDex: TEdit;
    edtEscForca: TEdit;
    lblEscForca: TLabel;
    edtEscMental: TEdit;
    lblEscMental: TLabel;
    pnlDanoTotal: TPanel;
    edtDanoTotal: TEdit;
    btnCalcular: TcxButton;
    procedure edtVigorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtLevelChange(Sender: TObject);
    procedure edtDestrezaChange(Sender: TObject);
    procedure edtForcaChange(Sender: TObject);
    procedure edtMentalChange(Sender: TObject);
    procedure edtDanoBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Scaling: TScaling;
    procedure CalculaVida;
    procedure CalculaDestreza;
    function CalculaAtributos(pPontos: integer; pMulti1, pMulti2, pMulti3: double; pCap1,
      pCap2: integer; CalculaPorLvl: boolean = false; pMultiLvl: double = 0): double;
    procedure CalculaForca;
    procedure CalculaMental;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

//======================================================================================
procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
var
  PctMental,
  PctDex,
  PctForca: integer;
  DanoTotal: double;
begin
  if edtEscDex.Text <> '' then
    PctDex:= Scaling.BuscaPercentual(edtEscDex.Text)
  else
    PctDex:= 0;

  if edtEscForca.Text <> '' then
    PctForca:= Scaling.BuscaPercentual(edtEscForca.Text)
  else
    PctForca:= 0;

  if edtEscMental.Text <> '' then
    PctMental:= Scaling.BuscaPercentual(edtEscMental.Text)
  else
    PctMental:= 0;

  DanoTotal:= StrToInt(edtDanoBase.Text);
  DanoTotal:= DanoTotal + (PctMental*100) / StrToFloat(edtDanoMental.Text);
  DanoTotal:= DanoTotal + (PctForca*100) / StrToFloat(edtDanoForca.Text);
  DanoTotal:= DanoTotal + (PctDex*100) / StrToFloat(edtDanoDestreza.Text);
  edtDanoTotal.Text:= IntToStr(Trunc(DanoTotal));
end;

//======================================================================================
function TfrmPrincipal.CalculaAtributos(pPontos: integer; pMulti1, pMulti2, pMulti3: double; pCap1,
      pCap2: integer; CalculaPorLvl: boolean = false; pMultiLvl: double = 0): double;
var
 iLcLevel,
 iLcPontosRestante: integer;
 dLcAtributo: double;
begin
  if CalculaPorLvl then
  begin
    if edtLevel.Text = '' then
      iLcLevel:= 0
    else
      iLcLevel:= StrToInt(edtLevel.Text);

    dLcAtributo:= iLcLevel * pMultiLvl;
  end
  else
    dLcAtributo:= 0;

  //Calculo
  if pPontos > pCap1 then //Passa do Cap1
  begin
    dLcAtributo:= dLcAtributo + (pCap1 * pMulti1);

    iLcPontosRestante:= pPontos - pCap1;

    if(iLcPontosRestante > (pCap2 - pCap1)) then //Passa do Cap2
    begin
      dLcAtributo:= dLcAtributo + ((pCap2 - pCap1) * pMulti2);

      iLcPontosRestante:= iLcPontosRestante - (pCap2 - pCap1);

      dLcAtributo:= dLcAtributo + (iLcPontosRestante * pMulti3)
    end
    else
      dLcAtributo:= dLcAtributo + (iLcPontosRestante*pMulti2);
  end
  else
    dLcAtributo:= dLcAtributo + (pPontos * pMulti1);


  Result:= dLcAtributo;
end;

//======================================================================================
procedure TfrmPrincipal.CalculaDestreza;
const
  iLcMulti1 = 3.5;
  iLcMulti2 = 3;
  iLcMulti3 = 2.5;

  iLcCap1 = 20;
  iLcCap2 = 30;

var
 iLcPontos: integer;
begin
  if edtDestreza.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtDestreza.Text);

  edtDanoDestreza.Text:= FloatToStr(CalculaAtributos(iLcPontos,
                                                     iLcMulti1,
                                                     iLcMulti2,
                                                     iLcMulti3,
                                                     iLcCap1,
                                                     iLcCap2));

end;

//======================================================================================
procedure TfrmPrincipal.CalculaForca;
const
  iLcMulti1 = 3.5;
  iLcMulti2 = 3;
  iLcMulti3 = 2.5;

  iLcCap1 = 20;
  iLcCap2 = 30;

var
 iLcPontos: integer;
begin
  if edtForca.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtForca.Text);

  edtDanoForca.Text:= FloatToStr(CalculaAtributos(iLcPontos,
                                                  iLcMulti1,
                                                  iLcMulti2,
                                                  iLcMulti3,
                                                  iLcCap1,
                                                  iLcCap2));

end;

//======================================================================================
procedure TfrmPrincipal.CalculaMental;
const
  iLcMulti1 = 3;
  iLcMulti2 = 3.5;
  iLcMulti3 = 2.5;

  iLcCap1 = 20;
  iLcCap2 = 30;

var
 iLcPontos: integer;
begin
  if edtMental.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtMental.Text);

  edtDanoMental.Text:= FloatToStr(CalculaAtributos(iLcPontos,
                                                   iLcMulti1,
                                                   iLcMulti2,
                                                   iLcMulti3,
                                                   iLcCap1,
                                                   iLcCap2));
end;

//======================================================================================
procedure TfrmPrincipal.CalculaVida;
const
  iLcVidaLevel = 5;

  iLcMulti1 = 30;
  iLcMulti2 = 25;
  iLcMulti3 = 20;

  iLcCap1 = 20;
  iLcCap2 = 30;

var
 iLcPontos: integer;
begin
  if edtVigor.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtVigor.Text);

  edtVida.Text:= FloatToStr(CalculaAtributos(iLcPontos,
                                             iLcMulti1,
                                             iLcMulti2,
                                             iLcMulti3,
                                             iLcCap1,
                                             iLcCap2,
                                             True,
                                             iLcVidaLevel));
end;

//======================================================================================
procedure TfrmPrincipal.edtDanoBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnCalcular.Click;
end;

//======================================================================================
procedure TfrmPrincipal.edtDestrezaChange(Sender: TObject);
begin
  CalculaDestreza;
end;

//======================================================================================
procedure TfrmPrincipal.edtForcaChange(Sender: TObject);
begin
  CalculaForca;
end;

//======================================================================================
procedure TfrmPrincipal.edtLevelChange(Sender: TObject);
begin
  CalculaVida;
end;

//======================================================================================
procedure TfrmPrincipal.edtMentalChange(Sender: TObject);
begin
  CalculaMental;
end;

//======================================================================================
procedure TfrmPrincipal.edtVigorChange(Sender: TObject);
begin
  CalculaVida;
end;

//======================================================================================
procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

//======================================================================================
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Scaling:= TScaling.Create;
  Scaling.AddEscalamento('A+', 0);
  Scaling.AddEscalamento('A',  0);
  Scaling.AddEscalamento('A-', 0);
  Scaling.AddEscalamento('B+', 0);
  Scaling.AddEscalamento('B',  0);
  Scaling.AddEscalamento('B-', 0);
  Scaling.AddEscalamento('C+', 0);
  Scaling.AddEscalamento('C',  0);
  Scaling.AddEscalamento('C-', 0);
  Scaling.AddEscalamento('D+', 0);
  Scaling.AddEscalamento('D',  0);
  Scaling.AddEscalamento('D-', 0);
  Scaling.AddEscalamento('E+', 0);
  Scaling.AddEscalamento('E',  0);
  Scaling.AddEscalamento('E-', 0);
end;

{ TScaling }

//======================================================================================
procedure TScaling.AddEscalamento(ID: string; Percentual: integer);
var
  i: integer;
begin
  i:= Length(Escalamento);
  SetLength(Escalamento, i + 1);
  Escalamento[i]:= TEscalamento.Create;
  Escalamento[i].ID:= ID;
  Escalamento[i].PercentualDano:= Percentual;
end;

//======================================================================================
function TScaling.BuscaPercentual(ID: string): integer;
var
  i: integer;
begin
  Result:= 0;
  for i := 0 to Length(Escalamento) do
  begin
    if Escalamento[i].ID = ID then
    begin
      Result:= Escalamento[i].PercentualDano;
      Break;
    end;
  end;
end;

end.
