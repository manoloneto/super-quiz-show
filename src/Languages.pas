unit Languages;

interface

uses crt, Questions;

procedure chooseLanguage;

implementation

const
    MaxLanguages = 1000;

type
    LanguageRecord = record
        displayName: string;
        directoryName: string;
    end;

    LanguageArray = array[1..MaxLanguages] of LanguageRecord;

procedure chooseLanguage;
var
    languageFile: text;
    languages: LanguageArray;
    i, len, chosenOption: integer;
begin
    assign(languageFile, '../categories/_languages.txt');
    reset(languageFile);
    i := 1;

    while (not eof(languageFile)) and (i <= MaxLanguages) do
    begin
        readln(languageFile, languages[i].displayName);
        readln(languageFile, languages[i].directoryName);
        i := i + 1;
    end;

    len := i - 1;  // Record the number of languages
    close(languageFile);

    repeat
        clrscr;
        writeln('Choose a language:');
        writeln;
        for i := 1 to len do
            writeln(i, '. ', languages[i].displayName);

        writeln;
        writeln('Choice an option: ');
        readln(chosenOption);
    until (chosenOption >= 1) and (chosenOption <= len);
    
    playGame('../categories/' + languages[chosenOption].directoryName);
end;

end.
