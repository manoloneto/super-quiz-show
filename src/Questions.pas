unit Questions;

interface

uses crt, Scores;

procedure playGame(languageDir: string);

implementation

type
    Question = record
        quest: string;
        options: array[1..4] of string;
        correctAnswer: integer;
        points: integer;
    end;

function intToStr(num: integer): string;
var
    s: string;
begin
    s := '';
    while num > 0 do
    begin
        s := chr((num mod 10) + ord('0')) + s;
        num := num div 10;
    end;
    if s = '' then
        s := '0';
    intToStr := s;
end;

procedure readQuestion(var f: text; var q: Question);
var
    i: integer;
begin
    readln(f, q.quest);
    for i := 1 to 4 do
        readln(f, q.options[i]);
    readln(f, q.correctAnswer);
    readln(f, q.points);
end;

procedure showQuestion(q: Question);
var
    i: integer;
begin
    writeln(q.quest);
    for i := 1 to 4 do
        writeln(i, '. ', q.options[i]);
    writeln;
end;

procedure playGame(languageDir: string);
var
    f: text;
    q: array [1..10] of Question;
    index, count, randomQ, randomA, i, userAnswer, totalPoints: integer;
    tmp, playerName: string;
    temp: Question;
begin
    assign(f, languageDir + '/questions.txt');
    reset(f);
    index := 1;
    while not eof(f) and (index <= 10) do
    begin
        readQuestion(f, q[index]);
        index := index + 1;
    end;
    count := index - 1;
    close(f);
    totalPoints := 0;

    randomize;
    for index := count downto 2 do 
    begin
        // Randomize questions
        randomQ := Random(index) + 1; 
        temp := q[index];
        q[index] := q[randomQ];
        q[randomQ] := temp;

        // Randomize answers within selected question
        for i := 1 to 4 do
        begin
            randomA := Random(4) + 1;
            tmp := q[index].options[i];
            q[index].options[i] := q[index].options[randomA];
            q[index].options[randomA] := tmp;
            if q[index].correctAnswer = i then
                q[index].correctAnswer := randomA
            else if q[index].correctAnswer = randomA then
                q[index].correctAnswer := i;
        end;
    end;

    // Play game
    for index := 1 to count do
    begin
        repeat
            clrscr;
            writeln('Your score: ', intToStr(totalPoints));
            writeln;
            showQuestion(q[index]);
            writeln('Your answer (1-4): ');
            readln(userAnswer);
        until (userAnswer >= 1) and (userAnswer <= 4);

        if userAnswer = q[index].correctAnswer then
            totalPoints := totalPoints + q[index].points
        else
        begin
            totalPoints := totalPoints div 2;
            break;
        end;
    end;

    writeln('Game over. Your score: ', intToStr(totalPoints));
    write('Enter your name: ');
    readln(playerName);
    saveScore(playerName, totalPoints); // Save the score
end;

end.
