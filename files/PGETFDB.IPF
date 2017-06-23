/* #A=VariableToAnswer #B=QustionNum #C=AnswersCount */
/* Get an answer from FormName using quetion number QuestionNum from TQ DB and answers from TANS DB where there are AnswersCount answers or show FormErr */
/* On the form there must be TQ.QNAME for Question Name, ANS for user answer and ANSWERS(i) for answers */
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