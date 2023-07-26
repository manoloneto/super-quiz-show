unit MainMenu;

interface

uses crt, Questions, Languages, Scores;

procedure showMainMenu;

implementation

var
    option: integer;

procedure showMainMenu;
begin   
		repeat            
		    clrscr;
		    
		    if (option < 1) or (option > 3) then
            writeln('Please choose a valid number!') 
        else
	        	writeln('Welcome to Super Quiz Show!');
		     
		    writeln;
		    writeln('1. Play the game');
		    writeln('2. View high scores');
		    writeln('3. Exit');          
		    writeln;
		    writeln('Choice an option: ');
		    readln(option);
		    
		    clrscr;
		    
		    case option of
		        1: begin
		        		option := 0;
		            chooseLanguage;
		        end;
		        2: begin
		        		option := 0;
		            showScores;
		        end;
		        3: begin
		            writeln('Thanks for playing!');
		            exit;
		        end;
		    end;
		until (option >= 1) and (option <= 3);
end;

end.
