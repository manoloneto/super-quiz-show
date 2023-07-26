# Super Quiz Show

![Super Quiz Show](./super_quiz_show.png)

This project is a simple Quiz Game developed using Pascal. The primary aim of this project was to brush up on Pascal, a language I had learned in college. The project was completed in one day, reflecting a quick recap of Pascal.

## Project Structure

The project is structured around five main files:

1. `Languages.pas` - This file contains the functions to load and select the language for the questions.
2. `MainMenu.pas` - This file sets up the main menu and handles user input to navigate through the menu.
3. `Questions.pas` - This file contains the logic for handling questions, answers, and the player's score.
4. `Scores.pas` - This file contains the functions to save and sort player scores.
5. `Setup.pas` - This file ties everything together, setting up the game, and handling the game loop.

## Development Environment

The game was developed using Pascal in the IDE PascalZim, which can be downloaded from [here](http://pascalzimbr.blogspot.com/).

## How to Run

To run the program, navigate to the `src` directory and run the `Setup.exe` file.

## How to Add New Questions

Each set of questions is stored in a text file inside a directory named after its language. To add new questions, follow these steps:

1. Navigate to the corresponding directory under the `categories` directory. For example, if you want to add English questions, go to the `categories/en_US` directory.
2. Open the `questions.txt` file.
3. At the end of the file, add your question, the four options, the correct answer number, and the points for the question. Each part should be on its own line. Follow this format:

    ```
    What is the capital of France?
    Paris
    London
    New York
    Tokyo
    1
    10
    ```
    In this example, "What is the capital of France?" is the question, "Paris", "London", "New York", and "Tokyo" are the options, 1 is the correct answer number, and 10 is the points for the question.

4. Save and close the file.

## How to Add New Languages

To add a new language, follow these steps:

1. Add a new entry in the `_languages.txt` file under the `categories` directory, according to the format:
    ```
    Display Name
    Directory Name
    ```
    where `Display Name` is the name to be displayed in the game, and `Directory Name` is the name of the directory to be created for the language.

2. Create a new directory in the `categories` directory. The directory name should be the `Directory Name` you added in `_languages.txt`.
3. Inside this directory, create a `questions.txt` file.
4. Add your questions, options, correct answers, and points to this file. Each part should be on its own line.

Please note that all questions, answers, and language names should be in English characters.

## And...

This project was a fun exercise to revisit Pascal. I hope it can be useful to you in your learning journey as well. Feel free to fork the project, add your own questions, and share it with others. If you want to update the game or add new languages and questions, you are more than welcome to do so. This project is an open invitation for you to build and improve upon.

Enjoy playing and learning!