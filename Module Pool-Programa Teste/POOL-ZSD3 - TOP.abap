TABLES:
  ZTABLE_02_PROD2.

DATA:
  it_prod TYPE TABLE OF ZTABLE_02_PROD2,
  st_layout TYPE lvc_s_layo.

DATA:
  o_alv TYPE REF TO cl_gui_alv_grid,
  o_countainer TYPE REF TO cl_gui_custom_container.