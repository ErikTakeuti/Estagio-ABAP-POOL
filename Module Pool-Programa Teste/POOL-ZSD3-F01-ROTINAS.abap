*&---------------------------------------------------------------------*
*&  Include           ZSD003
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Form  F_SELECT_PROD
*&---------------------------------------------------------------------*

FORM f_select_prod.

  SELECT *
    FROM ztable_02_prod2
    INTO TABLE it_prod
    WHERE produto IN s_prod.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  F_ALV
*&---------------------------------------------------------------------*

FORM f_alv.

  PERFORM f_select_prod.

  IF o_alv IS BOUND.

    o_alv->free( ).

  ENDIF.

  IF o_countainer IS NOT BOUND.

    CREATE OBJECT o_countainer
      EXPORTING
        container_name = 'CC_ALV'.

  ENDIF.

  CREATE OBJECT o_alv
    EXPORTING
      i_parent = o_countainer.

  PERFORM f_layout_alv.

  CALL METHOD o_alv->set_table_for_first_display
    EXPORTING
      i_structure_name = 'ZTABLE_E_02_PROD2'
      is_layout        = st_layout
    CHANGING
      it_outtab        = it_prod.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  F_LAYOUT_ALV
*&---------------------------------------------------------------------*


FORM f_layout_alv.

  st_layout-cwidth_opt = 'X'.
  st_layout-zebra = 'X'.

ENDFORM.