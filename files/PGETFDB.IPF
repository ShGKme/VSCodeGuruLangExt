/* #A=VariableToAnswer #B=FormName #C=FormErrName #D=QustionNum #E=AnswersCount */
/* Get an answer from FormName using quetion number QuestionNum from QUESTION DB and answers from ANSWER DB where there are AnswersCount answers or show FormErr */
/* On the form there must be QUESTION.QNAME for Question Name, ANS for user answer and ANSWERS(i) for answers */
CONVERT VARIANT FROM TANS FOR TANS.ANSNUM=#D TO ARRAY ANSWERS
OBTAIN RECORD FROM TQ FOR TQ.QNUM=#D
CLEAR
ANS=UNKNOWN
LOAD #B
PUTFORM #B
TALLY #B
GETFORM #B
RELEASE #B
WHILE ANS<=0 or ANS>#E DO
  ANS=UNKNOWN
  CLEAR
  LOAD #C
  PUTFORM #C
  WAIT
  RELEASE #C

  CLEAR
  LOAD #B
  PUTFORM #B
  TALLY #B
  GETFORM #B
  RELEASE #B
ENDWHILE
#A=ANS