/*
* Copyright (C) 1996, 1997 Free Software Foundation, Inc.
* Copyright (C) 2000 Dr.-Ing. Martin Froehlich <MartinFroehlich@ACM.org>
*
* PURPOSE OF THIS FILE: The main functions for a user augmented guile
*   version that can handle wrapped calls as generated by the Simplified
*   Wrapper and Interface Generator (SWIG 1.1)
*
* - Automatic Version Information via RCS/CVS:
*   $Id$
*   $Source$
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/
%{
#include <libguile.h>

/* Debugger interface (don't change the order of the following lines) */
#define GDB_TYPE SCM
#include <libguile/gdb_interface.h>
GDB_INTERFACE;

static void
inner_main(void *closure, int argc, char **argv)
{
  void SWIG_init();		/* SWIG init function's prototype */

  SWIG_init();			/* SWIG init function */
  scm_shell(argc, argv);	/* scheme interpreter */
  /* never reached: scm_shell will perform an exit */
}

int
main(int argc, char **argv)
{
  /* put any default initialisation code here: e.g. exit handlers */
  scm_boot_guile(argc, argv, inner_main, 0); /* make a stack entry for the
						garbage collector */
  return 0; /* never reached, but avoids a warning */
}
%}
