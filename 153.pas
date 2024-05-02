//Дан односвязный (линейный) список. Найти максимальный и минимальный элементы в списке.
program LR153;
type
  TNode = record
    Value: Integer;
    Next: ^TNode;
  end;

var
  Head, Current: ^TNode;
  InputFile: TextFile;
  Num, MaxValue, MinValue: Integer;

begin
  AssignFile(InputFile, 'input.txt');
  Reset(InputFile);

  New(Head);
  Readln(InputFile, Num);
  Head^.Value := Num;
  Head^.Next := nil;
  Current := Head;


  while not Eof(InputFile) do
  begin
    New(Current^.Next);
    Current := Current^.Next;
    Readln(InputFile, Num);
    Current^.Value := Num;
    Current^.Next := nil;
  end;

  // Находим максимальный и минимальный элементы в списке
  MaxValue := Head^.Value;
  MinValue := Head^.Value;
  Current := Head;
  while Current <> nil do
  begin
    if Current^.Value > MaxValue then
      MaxValue := Current^.Value;
    if Current^.Value < MinValue then
      MinValue := Current^.Value;
    Current := Current^.Next;
  end;

  Writeln('max: ', MaxValue);
  Writeln('min: ', MinValue);

  CloseFile(InputFile);
  Current := Head;
  while Current <> nil do
  begin
    Current := Head^.Next;
    Dispose(Head);
    Head := Current;
  end;
end.
