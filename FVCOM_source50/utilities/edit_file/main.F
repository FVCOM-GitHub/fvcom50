PROGRAM EDIT_FILE
  use mod_edit
  IMPLICIT NONE

  character(len=*),parameter::CVS_Id="$Id$" ! [sng] CVS Identification
  character(len=*),parameter::CVS_Date="$Date$" ! [sng] Date string
  character(len=*),parameter::CVS_Name="$Name$" ! [sng] File name string
  character(len=*),parameter::CVS_Revision="$Revision$" ! [sng] File revision string



  ! INTIALIZE MEMORY FROM libfvcom.a
  CALL INITIALIZE_CONTROL("EDIT")

# if defined (MULTIPROCESSOR)
  CALL INIT_MPI_ENV(MYID,NPROCS,SERIAL,PAR,MSR,MSRID)
  MPI_FVCOM_GROUP = MPI_COMM_WORLD ! FOR NOW MAKE THEM EQUAL
# endif

  IF (PAR) CALL FATAL_ERROR &
       & ("THIS PROGRAM IS WAY TO SHORT TO BOTHER WITH WRITING AS A PARALLE CODE.",&
       & "STOP AND RERUN WITH JUST ONE PROCESSOR!")


  CALL GET_COMMANDLINE(CVS_ID,CVS_Date,CVS_Name,CVS_Revision)

  IF (DBG_SET(DBG_LOG)) THEN
     WRITE(IPT,*) "! ========================="
     WRITE(IPT,*) "!   BEGIN EDIT"
     WRITE(IPT,*) "! ========================="
  END IF
  
  CALL EDIT

  
  IF (DBG_SET(DBG_LOG)) WRITE(IPT,*) "! TADA!!!"
  CALL PSHUTDOWN


END PROGRAM EDIT_FILE
