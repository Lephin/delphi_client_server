unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMySQL, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, Data.SqlExpr, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Z: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    ComboBox1: TComboBox;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Image1: TImage;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
s:string;
i:integer;
Form1: TForm1;

implementation

{$R *.dfm}

//Подключение второгоЮнита
uses Unit2;

//Зададим несколько событий при создании формы
procedure TForm1.FormCreate(Sender: TObject);
begin
ComboBox1.Text:='Таблица';
ComboBox1.Items.Strings[0]:='Только для чтения';
ComboBox1.Items.Strings[1]:='Редактирование';
end;

//Загрузка БД
procedure TForm1.N2Click(Sender: TObject);
begin
//Очищаем поле запросов
FDQuery1.SQL.Clear;

{Составляем запрос в компонент. Данный запрос говорит следующие.
"Вывести все из Таблицы Тест"}
FDQuery1.SQL.Text:=  'SELECT * FROM `test`';

//Выполняем запрос
fdquery1.OpenOrExecute;

end;

//Добавать нового сотрудника
procedure TForm1.N3Click(Sender: TObject);
begin
//Покажем вторую форму. Она будет иметь свой Unit
Form2.Show;
end;

//Обработчик событий, который отслеживает нажатие мыши
procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
{Переменная будет иметь значение выбранной строки DBGrid1.SelectedRows.Count
У каждой строки и столбца есть свой номер. Если нужно передать номер столбца, то
i:=DBGrid1.SelectedIndex;}

if ComboBox1.ItemIndex = 0 then
begin
i:=DBGrid1.SelectedRows.Count;
s:=DBGrid1.DataSource.DataSet.Fields.Fields[i].Value;
//Включим просмотр строк, Режим Только для Чтения
dbgrid1.Options := dbgrid1.Options + [dgRowSelect];
//Выключим редактирование:
dbgrid1.Options := dbgrid1.Options - [dgEditing];
end;


if ComboBox1.ItemIndex = 1 then
begin
//Выключить выделения строки и перевести в редактирование
dbgrid1.Options := dbgrid1.Options - [dgRowSelect];
//включить редактирование:
dbgrid1.Options := dbgrid1.Options + [dgEditing];
end;

LabeledEdit1.Text:=Form1.FDQuery1.FieldByName('Фамилия').AsString;
LabeledEdit2.Text:=Form1.FDQuery1.FieldByName('Имя').AsString;
LabeledEdit3.Text:=Form1.FDQuery1.FieldByName('Отчество').AsString;
LabeledEdit4.Text:=Form1.FDQuery1.FieldByName('Возраст').AsString;
LabeledEdit5.Text:=Form1.FDQuery1.FieldByName('Стаж').AsString;

end;

 //Для красоты кастомизируем наш компонент
 procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
 DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

//DBGrid1.Canvas.Font.Color := clred;
//DBGrid1.Canvas.Brush.Color := clMoneyGreen;
//DBGrid1.Canvas.FillRect(Rect);

end;

//Редактирование параметров
procedure TForm1.Button1Click(Sender: TObject);
begin
 fdquery1.OpenOrExecute;
end;

//Кнопка Удалить
procedure TForm1.N5Click(Sender: TObject);
begin
 FDQuery1.SQL.Clear;
 {Составим запрос на удаление нужной строки. Запрос говорит следующие:
 "Удалить из БД end таблица test где test и по ID  делаем удаление. Так как
 Он будит уникальным для каждой новой записи. Само же id будет равен параметру"
 Данный запрос мы объявили. Да да именно объявили, но пока его не исполняем}
 FDQuery1.SQL.Text:='DELETE FROM `end`.`test` WHERE `test`.`id` = :param1';
 {Для того, чтобы запрос исполнился нужно в него передать нужные данные, а именно
 передаем переменную s, значение которой будет равно выделенной строки}
 FDQuery1.ParamByName('param1').AsString:= s;
 //Исполняем запрос
 fdquery1.OpenOrExecute;
end;


end.
