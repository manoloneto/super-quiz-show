unit Scores;

interface

uses crt;

procedure showScores; 
procedure saveScore(playerName: string; playerScore: integer);

implementation

type
    ScoreRecord = record
        name: string;
        score: integer;
    end;

const
    MaxScores = 20;
    LineLength = 25;

type
    ScoreArray = array[1..MaxScores] of ScoreRecord;

procedure bubbleSort(var data: ScoreArray; len: integer);
var
    i, j: integer;
    tmp: ScoreRecord;
begin
    for i := 1 to len do
        for j := 1 to len - i do
            if data[j].score < data[j + 1].score then
            begin
                tmp := data[j];
                data[j] := data[j + 1];
                data[j + 1] := tmp;
            end;
end;

function min(a, b: integer): integer;
begin
    if a < b then min := a else min := b;
end;

procedure saveScore(playerName: string; playerScore: integer);
var
    scoreFile: Text;
    scores: ScoreArray;
    i, len: integer;
begin
    assign(scoreFile, '_scores.txt');

    {$I-} // Disable I/O error checking
    reset(scoreFile); // Open file for reading
    {$I+} // Enable I/O error checking
    if IOResult = 0 then // If file opened successfully
    begin
        i := 1;
        while not eof(scoreFile) and (i <= MaxScores) do
        begin
            readln(scoreFile, scores[i].name);
            readln(scoreFile, scores[i].score);
            i := i + 1;
        end;
        len := i;
        close(scoreFile);
    end
    else
    begin
        len := 1; // If file did not exist before, start from 1
    end;

    // Save new score
    scores[len].name := playerName;
    scores[len].score := playerScore;

    bubbleSort(scores, len); // Sort scores

    rewrite(scoreFile); // Open file for writing
    for i := 1 to min(len, MaxScores) do // Write only top 20 scores
    begin
        writeln(scoreFile, scores[i].name);
        writeln(scoreFile, scores[i].score);
    end;
    close(scoreFile);
end;

function intToString(num: integer): string;
var
    str: string;
begin
    str := '';
    while num > 0 do
    begin
        str := chr(ord('0') + num mod 10) + str;
        num := num div 10;
    end;
    if str = '' then str := '0';
    intToString := str;
end;

procedure showScores;
var
    scoreFile: text;
    i, len, dotCount, j: integer;
    scores: ScoreArray;
    dots, scoreStr: string;
begin
    assign(scoreFile, '_scores.txt');
    reset(scoreFile);
    i := 1;

    while (not eof(scoreFile)) and (i <= MaxScores) do
    begin
        readln(scoreFile, scores[i].name);
        readln(scoreFile, scores[i].score);
        i := i + 1;
    end;

    len := i - 1;  // Record the number of scores
    close(scoreFile);

    bubbleSort(scores, len); // sort the scores

    writeln('Scoreboard:');
    writeln;
    for i := 1 to len do
    begin
        scoreStr := intToString(scores[i].score);
        // Calculate number of dots
        dotCount := LineLength - length(scores[i].name) - length(scoreStr) - length(' Points') - 3; // Subtract 3 for the ranking number and dot

        // Generate a string of dots
        dots := '';
        for j := 1 to dotCount do
            dots := dots + '.';
        
        writeln(i, '. ', scores[i].name, dots, scoreStr, ' Points');
    end;

    writeln;
    writeln('Press Enter to back...');
    readln;
end;

end.

