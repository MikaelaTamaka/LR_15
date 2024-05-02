program AlphabetFrequencyDictionary;

uses SysUtils, Classes, Generics.Collections;

var
  inputFile, outputFile: TextFile;
  word: string;
  freqDict: TDictionary<string, Integer>;
  key: string;
  count: Integer;

begin
  // Создание словаря для хранения частот слов
  freqDict := TDictionary<string, Integer>.Create;

  // Открываем входной файл
  AssignFile(inputFile, 'C:\Users\Кампухтер\Desktop\лр15\input.txt');
  Reset(inputFile);

  // Считываем слова из файла и заполняем словарь
  while not eof(inputFile) do
  begin
    Readln(inputFile, word);
    if word <> '' then
    begin
      if freqDict.ContainsKey(word) then
        freqDict[word] := freqDict[word] + 1
      else
        freqDict.Add(word, 1);
    end;
  end;

  // Закрываем входной файл
  CloseFile(inputFile);

  // Сортируем словарь по ключам (словам)
  for key in freqDict.Keys do
  begin
    freqDict.TryGetValue(key, count);
    WriteLn(key, ' ', count);
  end;

  // Открываем файл для записи результатов
  AssignFile(outputFile, 'output.txt');
  Rewrite(outputFile);

  // Записываем результаты в файл
  for key in freqDict.Keys do
  begin
    freqDict.TryGetValue(key, count);
    WriteLn(outputFile, key, ' ', count);
  end;

  // Закрываем выходной файл
  CloseFile(outputFile);

  // Освобождаем ресурсы
  freqDict.Free;
end.
