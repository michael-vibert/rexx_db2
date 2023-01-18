/* REXX */
Signal On Syntax
Parse Arg . 'user=' username . 1 . 'pass=' password . 1 . 'data=' database . 1 . 'serv=' server .

Call RxFuncAdd 'SQLLoadFuncs', 'rexxsql', 'SQLLoadFuncs'
Call SQLLoadFuncs
/*
 * Connect and display some details of the connection
 */
If SQLConnect( 'conn1', username, password, database, server ) < 0 Then Abort( 'connecting' )
    Say 'Connect succeeded!'
    rc = SQLCOMMAND(s1,"INSERT INTO Person VALUES (4, 'Harriette');")
    say rc
Parse Version ver
Say 'Rexx Version:' ver
Say 'Rexx/SQL Version:' SQLVariable( 'VERSION' )
If SQLGetinfo('conn1','DBMSNAME','desc.') < 0 Then Abort( 'getting db version' )
Say 'Database Name:   ' desc.1
If SQLGetinfo('conn1','DBMSVERSION','desc.') < 0 Then Abort( 'getting db version' )
Say 'Database Version:' desc.1


/* rc1 = SQLExecute(s1) */
say rc1
/*
 * All done, lets get out
 */
If SQLDisconnect( 'conn1' ) < 0 Then Abort( 'disconnecting' )
    Say 'Disconnect succeeded!'
Call SQLDropFuncs 'UNLOAD'
Return 0

Abort: Procedure Expose sqlca.
Parse Arg msg
Say 'Program failed:' msg
Say sqlca.interrm
If Datatype( sqlca.sqlerrm.0 ) = 'NUM' Then
   Do i = 1 To sqlca.sqlerrm.0
      Say '('sqlca.sqlstate.i')' sqlca.sqlerrm.i
   End
Else
   Do
      Say '('sqlca.sqlstate')' sqlca.sqlerrm
   End
Call SQLDropFuncs 'UNLOAD'
Exit 1

Syntax:
Call Abort 'syntax error on line' sigl
Return