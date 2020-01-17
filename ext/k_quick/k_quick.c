#include "k_quick.h"

VALUE rb_mKQuick;

void
Init_k_quick(void)
{
  rb_mKQuick = rb_define_module("KQuick");
}
