       IDENTIFICATION DIVISION.
       PROGRAM-ID. "main-program".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-NAME PIC X(20).
           01 WS-PRONOUN-NOM PIC X(5).
           01 WS-PRONOUN-OBJ PIC X(5).
       PROCEDURE DIVISION.
           DISPLAY "Please enter your name :" WITH NO ADVANCING.
           ACCEPT WS-NAME.
           DISPLAY "What's your nominative pronoun :"
               WITH NO ADVANCING.
           ACCEPT WS-PRONOUN-NOM.
           DISPLAY "What's your object pronoun :" WITH NO ADVANCING.
           ACCEPT WS-PRONOUN-OBJ.
           CALL "pronoun-writer" USING WS-NAME WS-PRONOUN-NOM
           WS-PRONOUN-OBJ.
