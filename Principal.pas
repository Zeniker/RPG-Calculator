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
    function CalculaBonus(pPontos: integer; pIntervalos: array of integer;
      pMultiplicadores: array of double; CalculaPorLvl: boolean = false;
      pMultiLvl: double = 0): double;
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

  PctBonusMental,
  PctBonusDex,
  PctBonusForca: integer;
  PctTotalBonus: double;

  DanoTotal: double;
begin
  //Scaling
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

  //Dano bonus
  if edtDanoDestreza.Text <> '' then
    PctBonusDex:= StrToInt(edtDanoDestreza.Text)
  else
    PctBonusDex:= 0;

  if edtDanoForca.Text <> '' then
    PctBonusForca:= StrToInt(edtDanoForca.Text)
  else
    PctBonusForca:= 0;

  if edtDanoMental.Text <> '' then
    PctBonusMental:= StrToInt(edtDanoMental.Text)
  else
    PctBonusMental:= 0;

  PctTotalBonus:= ((PctBonusMental*PctMental)/100) +
                  ((PctBonusDex*PctDex)/100) +
                  ((PctBonusForca*PctForca)/100);

  //Dano base
  if edtDanoBase.Text <> '' then
    DanoTotal:= StrToInt(edtDanoBase.Text)
  else
    DanoTotal:= 0;

  DanoTotal:= DanoTotal + ((DanoTotal*PctTotalBonus)/100);
  edtDanoTotal.Text:= IntToStr(Trunc(DanoTotal));
end;

//======================================================================================
function TfrmPrincipal.CalculaBonus(pPontos: integer; pIntervalos: array of integer;
  pMultiplicadores: array of double; CalculaPorLvl: boolean;
  pMultiLvl: double): double;
var
 iLcLevel: integer;
 dLcAtributo: double;
 i: integer;
 j: integer;
 bLcContinua: boolean;
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

  i := Length(pIntervalos)-1;
  bLcContinua:= True;
  while bLcContinua do
  begin
    if i > -1 then
    begin
      if pPontos >= pIntervalos[i] then
      begin
        for j := 0 to i-1 do
        begin
          dLcAtributo:= dLcAtributo + ((pIntervalos[j+1] - pIntervalos[j])*pMultiplicadores[j]);
        end;
        pPontos:= pPontos - pIntervalos[i];
        dLcAtributo:= dLcAtributo + (pPontos * pMultiplicadores[i]);
        bLcContinua:= False;
      end
      else
        i:= i - 1;
    end
    else
      bLcContinua:= false;
  end;

  Result:= dLcAtributo;
end;

//======================================================================================
procedure TfrmPrincipal.CalculaDestreza;
var
  iLcPontos: integer;
  iLcIntervalo: array of integer;
  dLcMulti: array of double;
begin
  if edtDestreza.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtDestreza.Text);

  iLcIntervalo:= [0,20,40];
  dLcMulti:= [2, 2.25, 1];

  edtDanoDestreza.Text:= FloatToStr(CalculaBonus(iLcPontos,
                                                 iLcIntervalo,
                                                 dLcMulti));

end;

//======================================================================================
procedure TfrmPrincipal.CalculaForca;
var
  iLcPontos: integer;
  iLcIntervalo: array of integer;
  dLcMulti: array of double;
begin
  if edtForca.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtForca.Text);

  iLcIntervalo:= [0,20,40];
  dLcMulti:= [2, 2.25, 1];

  edtDanoForca.Text:= FloatToStr(CalculaBonus(iLcPontos,
                                              iLcIntervalo,
                                              dLcMulti));

end;

//======================================================================================
procedure TfrmPrincipal.CalculaMental;
var
  iLcPontos: integer;
  iLcIntervalo: array of integer;
  dLcMulti: array of double;
begin
  if edtMental.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtMental.Text);

  iLcIntervalo:= [0,10,30,50,65];
  dLcMulti:= [1,2.25,1.75,1.25,1];

  edtDanoMental.Text:= FloatToStr(CalculaBonus(iLcPontos,
                                               iLcIntervalo,
                                               dLcMulti));
end;

//======================================================================================
procedure TfrmPrincipal.CalculaVida;
var
  iLcPontos: integer;
  iLcIntervalo: array of integer;
  dLcMulti: array of double;
begin
  if edtVigor.Text = '' then
    iLcPontos:= 0
  else
    iLcPontos:= StrToInt(edtVigor.Text);

  iLcIntervalo:= [0,20,30,40];
  dLcMulti:= [20,25,20,10];

  edtVida.Text:= FloatToStr(400 + CalculaBonus(iLcPontos,
                                               iLcIntervalo,
                                               dLcMulti,
                                               True,
                                               5));
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
  Scaling.Free;
  Action:= caFree;
end;

//======================================================================================
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Scaling:= TScaling.Create;
  Scaling.AddEscalamento('S+', 200);
  Scaling.AddEscalamento('S',  170);
  Scaling.AddEscalamento('S-', 145);
  Scaling.AddEscalamento('A+', 135);
  Scaling.AddEscalamento('A',  125);
  Scaling.AddEscalamento('A-', 110);
  Scaling.AddEscalamento('B+', 95);
  Scaling.AddEscalamento('B',  85);
  Scaling.AddEscalamento('B-', 80);
  Scaling.AddEscalamento('C+', 75);
  Scaling.AddEscalamento('C',  65);
  Scaling.AddEscalamento('C-', 55);
  Scaling.AddEscalamento('D+', 50);
  Scaling.AddEscalamento('D',  30);
  Scaling.AddEscalamento('D-', 25);
  Scaling.AddEscalamento('E+', 20);
  Scaling.AddEscalamento('E',  10);
  Scaling.AddEscalamento('E-', 1);
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
  for i := 0 to Length(Escalamento)-1 do
  begin
    if Escalamento[i].ID = ID then
    begin
      Result:= Escalamento[i].PercentualDano;
      Break;
    end;
  end;
end;

end.
