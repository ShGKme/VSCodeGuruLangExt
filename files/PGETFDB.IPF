/* #A=VariableToAnswer #B=FormName #C=FormErrName #B=QustionNum #E=AnswersCount */
/* Get an answer from FormName using quetion number QuestionNum from QUESTION DB and answers from ANSWER DB where there are AnswersCount answers or show FormErr */
/* On the form there must be QUESTION.QNAME for Question Name, ANS for user answer and ANSWERS(i) for answers */
CONVERT VARIANT FROM TANS FOR TANS.ANSNUM=#B TO ARRAY ANSWERS
OBTAIN RECORD FROM TQ FOR TQ.QNUM=#B
CLEAR
ANS=UNKNOWN
LOAD FQ
PUTFORM FQ
TALLY FQ
GETFORM FQ
RELEASE FQ
WHILE ANS<=0 or ANS>#C DO
  ANS=UNKNOWN
  CLEAR
  LOAD FERR
  PUTFORM FERR
  WAIT
  RELEASE FERR

  CLEAR
  LOAD FQ
  PUTFORM FQ
  TALLY FQ
  GETFORM FQ
  RELEASE FQ
ENDWHILE
#A=ANS