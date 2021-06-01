       IDENTIFICATION DIVISION.
       PROGRAM-ID. "pronoun-filterer".
       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT F-PEOPLE-FILE ASSIGN TO "people.dat"
                 ORGANISATION IS LINE SEQUENTIAL.
               SELECT SHE-PEOPLE-FILE ASSIGN TO "sheherpeople.dat"
                 ORGANISATION IS LINE SEQUENTIAL.
       DATA DIVISION.
           FILE SECTION.
           FD F-PEOPLE-FILE.
           01 RC-PERSON.
             05 RC-PERSON-NAME PIC X(20).
             05 RC-PERSON-PRONOUN.
               10 RC-PERSON-PRONOUN-NOM PIC X(4).
               10 RC-PERSON-PRONOUN-OBJ PIC X(4).
           FD SHE-PEOPLE-FILE.
           01 RC-SHE-PERSON PIC X(28).
           WORKING-STORAGE SECTION.
           01 WS-FILE-IS-ENDED PIC 9.
       PROCEDURE DIVISION.
           OPEN INPUT F-PEOPLE-FILE.
           OPEN OUTPUT SHE-PEOPLE-FILE.
           MOVE 0 TO WS-FILE-IS-ENDED.

           PERFORM UNTIL WS-FILE-IS-ENDED = 1
             READ F-PEOPLE-FILE
               NOT AT END
                 IF RC-PERSON-PRONOUN-NOM = "she"
                  AND RC-PERSON-PRONOUN-OBJ = "her"
                   MOVE RC-PERSON TO RC-SHE-PERSON
                   WRITE RC-SHE-PERSON
                   END-WRITE
                 END-IF
               AT END
                   MOVE 1 TO WS-FILE-IS-ENDED
             END-READ
           END-PERFORM.

           CLOSE SHE-PEOPLE-FILE.
           CLOSE F-PEOPLE-FILE.
