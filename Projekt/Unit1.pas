unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, unit2;

type
    TArray = Array [1..18] of integer;
    TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Button5: TButton;
    Button6: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var                 //global definierte Variable
  Form1: TForm1;
  spielerkarten:  Tarray;   //alle spielerkarten
  dealerkarten:   TArray;   //alle dealerkarteb
  z, y, einsatz, konto :integer; //y und z = Anzahl der spielzüge vom Dealer/spieler   Einsatz und Konto variablen für Einsatz und Geldgewinnberechnung
  gesamts, gesamtd, gs:integer;   //gesamtwert der Handkarten und der des Dealers   gs = Gewinnvariable

implementation

{$R *.dfm}

function karteziehen:integer;  //Zufallszahl aus 1 bis 52 eine Zahl für jede karte in einem Kartendeck
begin
  Randomize;
  result:=random(52)+1

end;



function kartenwert(karte:integer):integer; //den karten wird der spielwert zu geteilt
begin
  case karte of
    1..4: result:=2;
    5..8: result:=3;
    9..12: result:=4;
    13..16: result:=5;
    17..20: result:=6;
    21..24: result:=7;
    25..28: result:=8;
    29..32: result:=9;
    33..48: result:=10;
    49..52: result:= 11;
  end;
end;



function muster (kartenwert:integer):string; //Muster der Karte wird bestimmt
begin
  case kartenwert mod 4 of
    0: result:='Herz';
    1: result:='Karo';
    2: result:='Kreuz';
    3: result:='Pik';
  end;
end;



function gesicht(kartenwert:integer):string; //der Karte werden die Gesichter zugeordnet
begin
  case kartenwert of
    1..36: result:='';
    37..40: result:='Jack';
    41..44: result:='Queen';
    45..48: result:='King';
    49..52: result:='Ace';
  end;
end;



function gewinn(gesamtspieler, gesamtdealer:integer):integer; //gewinn überprüfen
begin
                                                  //1 Gewonnen 2 gleichstand 3 verloren
if gesamtspieler > gesamtdealer  then
    if gesamtspieler <=21 then
        result:=1
    else
        result:=3;

if gesamtspieler = gesamtdealer then
        result:=2;

if gesamtdealer > gesamtspieler then
    if gesamtdealer <=21 then
        result:=3
    else
        result:=1;

if gesamtspieler > 21 then
        result:= 3
end;



function gewinnausgabe(gewinnzahl:integer):string;      // Bezeichung für die Fälle
begin
  case gewinnzahl of
    1:result:='Gewonnen';
    2:result:='Gleichstand';
    3:result:='Verloren';
  end;
end;



function bust(werte:integer):boolean;        // Überprüfen ob über 21
begin
    if werte > 21 then
      result:=true
    else
      result:=false;
 end;




procedure TForm1.Button1Click(Sender: TObject); // Hit (karte wird nach spielbeginn gezogen)
var i:integer;  //zählvariable
begin
    spielerkarten[3+z]:=karteziehen;
    gesamts:=gesamts+ kartenwert(spielerkarten[3+z]);
    panel1.Caption:=panel1.Caption + '  ' + inttostr(kartenwert(spielerkarten[3+z]))+' '+ muster(kartenwert(spielerkarten[3+z]))+  ' '+ gesicht(spielerkarten[3+z]);
    panel4.Caption:=inttostr(gesamts);

    if bust(gesamts)=true then                                  //bust mit beachtung vom Ass
      begin
       for i := low(spielerkarten) to High(spielerkarten) do
                 if kartenwert(spielerkarten[i]) = 11 then
              begin
              spielerkarten[i]:=1;
              gesamts:=gesamts-10;
              break;    //Loop beenden da nur ein ass geändert werden soll und gebraucht wird
              end;
       panel4.Caption:=inttostr(gesamts);
       end;

    if bust(gesamts)=true then               //doppel überprüfung vom bust nach der ersten If Bust=true um ass zu beachten
       begin
          showmessage('Bust!'+#13#10+'Dein Kartenwert überschreitet 21, du hast verloren');              // Nachricht beim Bust als Rückmeldung für den Spieler
          panel6.Caption:='0';
          button1.Enabled:=false;
          button2.Enabled:=false;
          panel3.Caption:=inttostr(kartenwert(dealerkarten[1])+kartenwert(dealerkarten[2]));
          panel2.caption:=inttostr(kartenwert(dealerkarten[1]))+' '+ muster(kartenwert(dealerkarten[1]))+  ' '+ gesicht(dealerkarten[1])+'  ' +inttostr(kartenwert(dealerkarten[2]))+' '+ muster(kartenwert(dealerkarten[2]))+  ' '+ gesicht(dealerkarten[2]);
       end;


        inc(z); //nächster Zug z wird um 1 erhöht um Karten an die richtige Arraystelle zuzuweisen
end;



procedure TForm1.Button2Click(Sender: TObject);    //spielzug beendet dealers zug
begin
    panel3.Caption:=inttostr(kartenwert(dealerkarten[1])+kartenwert(dealerkarten[2]));
    panel2.caption:=inttostr(kartenwert(dealerkarten[1])) + ' ' + muster(kartenwert(dealerkarten[1]))+ ' ' + gesicht(dealerkarten[1]) + '  ' +inttostr(kartenwert(dealerkarten[2])) + ' ' + muster(kartenwert(dealerkarten[2]))+  ' '+ gesicht(dealerkarten[2]);

    while gesamtd < 17 do
       begin
          dealerkarten[3+y]:=karteziehen;
          panel2.caption:=panel2.Caption + '  ' + inttostr(kartenwert(dealerkarten[3+y])) + ' ' + muster(kartenwert(dealerkarten[3+y])) + ' ' + gesicht(dealerkarten[3+y]);
          gesamtd:=gesamtd+ kartenwert(dealerkarten[3+y]);
          panel3.Caption:=inttostr(gesamtd);
          inc(y);   //nächster Zug y wird um 1 erhöht um Karten an die richtige Arraystelle zuzuweisen
       end;

    gs:=gewinn(gesamts,gesamtd);
    button1.Enabled:=false;
    button2.Enabled:=false;
    showmessage(gewinnausgabe(gs));

 if einsatz <>0 then
    case gs of
      1:begin
        panel5.Caption:=inttostr(Konto + (2*einsatz));
        panel6.Caption:='0';
      end;

      2:begin
        panel5.Caption:=inttostr(Konto+einsatz);
        panel6.Caption:='0';
      end;

      3:begin
      panel6.Caption:='0'
      end;
    end;
end;


procedure TForm1.Button3Click(Sender: TObject);        // das spiel wir begonnen 2 karten für spieler und haus
var  i:integer;
begin
    for i := Low(Spielerkarten) to High(spielerkarten) do     //arrays und Variablen werden "bereinigt"

            spielerkarten[i]:=0;

    for i := Low(dealerkarten) to High(dealerkarten) do
            dealerkarten[i]:=0;


    gesamtd:=0;
    gesamts:=0;
    y:=0;
    z:=0;

    spielerkarten[1]:=karteziehen;                                              //karten  ziehen und speichern im Array
    spielerkarten[2]:=karteziehen;
    gesamts:=kartenwert(spielerkarten[1])+kartenwert(spielerkarten[2]);
    panel4.Caption:=inttostr(gesamts);

    dealerkarten[1]:=karteziehen;
    dealerkarten[2]:=karteziehen;
    gesamtd:=kartenwert(dealerkarten[1])+kartenwert(dealerkarten[2]);

    panel1.caption:=inttostr(kartenwert(spielerkarten[1])) + ' ' + muster(kartenwert(spielerkarten[1])) + ' ' + gesicht(spielerkarten[1]) + '  ' + inttostr(kartenwert(spielerkarten[2])) + ' ' + muster(kartenwert(spielerkarten[2])) + ' ' + gesicht(spielerkarten[2]);
    panel2.caption:=inttostr(kartenwert(dealerkarten[1])) + ' ' + muster(kartenwert(dealerkarten[1])) + ' ' + gesicht(dealerkarten[1]) + '  #' ;
    button1.Enabled:=true;
    button2.Enabled:=true;

        if bust(gesamts)=true then                              //für den fall von doppel Ass auf der Hand
      begin
       for i := low(spielerkarten) to High(spielerkarten) do
                 if kartenwert(spielerkarten[i]) = 11 then
              begin
              spielerkarten[i]:=1;
              gesamts:=gesamts-10;
              break;
              end;
       end;

    panel3.caption:= '#';
    gs:=gewinn(gesamts,gesamtd);

end;

procedure TForm1.Button4Click(Sender: TObject); //Regeln dem Spieler anzeigen
begin
   Form2.visible :=true;
end;


procedure TForm1.Button5Click(Sender: TObject);            //einsatz erhöhen
begin                                                      //einsatz wir über Panels gemanaged um die Fehlerquelle Spieler einzuschränken
    einsatz:=strtoint(panel6.caption);
    konto:=strtoint(panel5.Caption);

       if Konto> 0 then
         begin
            einsatz:=einsatz+50;
            panel6.Caption:=inttostr(einsatz);
            panel5.caption:=inttostr(konto-50);
            konto:=strtoint(panel5.Caption);
         end
       else
          showmessage('Ihr Konto ist leer!')
end;

procedure TForm1.Button6Click(Sender: TObject);          //einsatz verringern
begin
  einsatz:=strtoint(panel6.caption);
  konto:=strtoint(panel5.Caption);

  if einsatz > 0 then
     begin
         einsatz:=einsatz-50;
         panel6.Caption:=inttostr(einsatz);
         panel5.Caption:=inttostr(konto+50);
         konto:=strtoint(panel5.Caption);
     end
   else
      showmessage('Der Einsatz kann nicht weiter gesenkt werden');


end;


end.




// alter code für eventuelle spätere nutzung

 { repeat spielerkarten[2]:=karteziehen;
      if (spielerkarten[2]) = (spielerkarten[1]) then
          n:=True
          else
          n:=false
    until n=false;


   repeat dealerkarten[1]:=karteziehen;
      if (dealerkarten[1]) = (spielerkarten[1]) then
          n:=True
      else if (dealerkarten[1]) = (spielerkarten[2]) then
          n:=True
          else
          n:=false
    until n=false;


   repeat dealerkarten[2]:=karteziehen;
      if (dealerkarten[2]) = (spielerkarten[1]) then
          n:=True
      else if (dealerkarten[2]) = (spielerkarten[2]) then
          n:=True
      else if (dealerkarten[2]) = (dealerkarten[1]) then
           n:= true
      else
          n:=false
    until n=false;}


     {spielerkarten[1]:=karteziehen;
    gesamtkarten[1]:=Spielerkarten[1];

    spielerkarten[2]:=testen(karteziehen,gesamtkarten);
    gesamtkarten[2]:=Spielerkarten[2];

    dealerkarten[1]:=testen(karteziehen,gesamtkarten);
    gesamtkarten[3]:=dealerkarten[1];

    dealerkarten[2]:=testen(karteziehen,gesamtkarten);
    gesamtkarten[4]:=dealerkarten[2];

    {function testen(neukarte:integer;gesamtkarten:TArray):integer;  //überprüfen ob eine Karte doppelt vorkommt und gegeben falls korrigieren
var I:Integer; n: boolean;
begin                                                             // nicht mehr notwending da es 6 kartendecks gibt und die wahrscheinlickeit zu gering wird

  n:=false;
  for I := Low(Gesamtkarten) to High(gesamtkarten) do
   begin
    if  gesamtkarten[I] = neukarte then
        result:=testen(karteziehen,gesamtkarten);
        n:=True;

   if (i = high(gesamtkarten)) and (n= false) then
            result:=neukarte;
   end;
end;  }


  {function ergebnis(kartenarray:TArray):integer;
var i, alles:integer;
begin
    alles:=0;
    for i := Low(kartenarray) to High(kartenarray) do
          begin
              alles :=alles +kartenwert(kartenarray[i]);
          end;
    result:=alles;

end; }


{function ass(gesamtwert:integer; gesamtkartenseite:TArray):integer;     // wenn Ass 10 abziehen
var i: integer;  //zählvariable
begin
      for i := low(gesamtkartenseite) to High(gesamtkartenseite) do
                 if kartenwert(gesamtkartenseite[i]) = 11 then
              begin
              gesamtkartenseite[i]:=1;
              result:=gesamtwert-10;
              end
           else
              result:=gesamtwert;
end;}

//test 1

