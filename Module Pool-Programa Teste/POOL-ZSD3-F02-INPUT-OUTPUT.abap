*&---------------------------------------------------------------------*
*&      Module  STATUS_9001  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_9001 OUTPUT.

  SET PF-STATUS 'DEFAULT'.
*  SET TITLEBAR 'xxx'.

  PERFORM: f_alv.

ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9001 INPUT.

CASE sy-ucomm.

  WHEN 'EXEC'.
    PERFORM: f_alv.

  WHEN 'BACK'.
    LEAVE TO SCREEN 0.

  WHEN 'EXIT'.
    LEAVE TO SCREEN 0.

  WHEN 'CANCEL'.
    LEAVE PROGRAM.

  WHEN OTHERS.
ENDCASE.

ENDMODULE.