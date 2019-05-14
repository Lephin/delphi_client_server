unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,JPEG, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.VCLUI.Error, FireDAC.Comp.UI;

type
  TForm2 = class(TForm)
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

//Подключение первого Юнита. Это для того, чтобы использовать 1 компонент для всех форм
//В идеале можно создать отдельную форму для компонентов. Так проще.
uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
//Очищаем поле ввода запроса, освобождя под другие запросы, если будет нужно
Form1.FDQuery1.SQL.Clear;
//Объявляем запрос, именно объявляем, но не исполняем его.
Form1.FDQuery1.SQL.Text:= 'INSERT INTO `end`.`test` (`ID`, `Фамилия`, `Имя`, `Отчество`, `Возраст`, `Стаж`) VALUES (NULL, :param1, :param2, :param3, :param4, :param5);';

//Задаем параметр, который будет равен и создан из компонента
Form1.FDQuery1.ParamByName('param1').AsString := LabeledEdit2.Text;;
Form1.FDQuery1.ParamByName('param2').AsString := LabeledEdit3.Text;;
Form1.FDQuery1.ParamByName('param3').AsString := LabeledEdit4.Text;;
Form1.FDQuery1.ParamByName('param4').AsString := LabeledEdit5.Text;;
Form1.FDQuery1.ParamByName('param5').AsString := LabeledEdit6.Text;;

//Исполняем запрос
Form1.FDQuery1.OpenOrExecute;

//Закрываем форму
Form2.Close;
end;

//Код на проверку ошибок работы компоненты
//procedure TForm2.FDConnection2Error(ASender, AInitiator: TObject;
  //var AException: Exception);
  //var
 // oExc: EFDDBEngineException;
//begin
//if AException is EFDDBEngineException then begin
    //oExc := EFDDBEngineException(AException);
    //if oExc.ErrorCode = 01054 then
     // oExc.Message := 'Привет мир';
     // FDQuery2.Cancel;
 //end;
//end;

end.
