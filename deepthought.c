#include "deepthought.h"
#include <unistd.h>

unsigned the_answer = 42;

unsigned compute_answer(void) {
  usleep(7500000);
  return the_answer;
}
