unit unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm2 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormPaint(Sender: TObject);
var GraphicElements:array[1..8] of TBitmap;
I:Integer;
F:string;
begin
     for I := 1 to 8 do
       GraphicElements[I]:=TBitmap.Create;
       try
         F:=ExtractFilePath(Application.ExeName);
         GraphicElements[1].LoadFromFile(F+'skins\FORM_ANGLE_BOTTOM_LEFT.BMP');
         GraphicElements[2].LoadFromFile(F+'skins\FORM_ANGLE_BOTTOM_RIGHT.BMP');
         GraphicElements[3].LoadFromFile(F+'skins\FORM_ANGLE_TOP_LEFT.BMP');
         GraphicElements[4].LoadFromFile(F+'skins\FORM_ANGLE_TOP_RIGHT.BMP');
         GraphicElements[5].LoadFromFile(F+'skins\FORM_LEFT.BMP');
         GraphicElements[6].LoadFromFile(F+'skins\FORM_RIGHT.BMP');
         GraphicElements[7].LoadFromFile(F+'skins\FORM_BOTTOM.BMP');
         GraphicElements[8].LoadFromFile(F+'skins\FORM_TOP.BMP');
         with Canvas do
         begin
           Draw(0, (ClientHeight-(GraphicElements[1].Height)),GraphicElements[1]);
           Draw((ClientWidth-GraphicElements[2].Width),(ClientHeight-(GraphicElements[2].Height)), GraphicElements[2]);
           Draw(0,0, GraphicElements[3]);
           Draw((ClientWidth-(GraphicElements[4].Width)),0, GraphicElements[4]);

           StretchDraw(Rect(GraphicElements[1].Width, (ClientHeight-(GraphicElements[7].Height)), (ClientWidth-GraphicElements[2].Width), ClientHeight), GraphicElements[7]);
           StretchDraw(Rect(0, GraphicElements[3].Height, GraphicElements[1].Width, ClientHeight-GraphicElements[1].Height), GraphicElements[5]);
           StretchDraw(Rect(ClientWidth-GraphicElements[6].Width, GraphicElements[4].Height, ClientWidth, ClientHeight- GraphicElements[2].Height), GraphicElements[6]);
           StretchDraw(Rect(GraphicElements[3].Width, 0, ClientWidth-GraphicElements[4].Width, GraphicElements[8].Height), GraphicElements[8]);
         end;
       finally

       end;
end;

end.
