#include <stdio.h>
#include <stdlib.h>

int main() {

  const char *p = getenv("X_RELATIVE_PATH");

  printf("Content-Type: text/plain\n\n");

  FILE *fptr = fopen(p, "r");
  if (fptr == NULL) {
    fprintf(stderr, "Fileserver: File not found %s\n", p);
    printf("Status: 404\n\nNot Found\n");
    exit(0);
  }

  fprintf(stderr, "Fileserver: Loading file %s\n", p);

  int ch;
  while ((ch = fgetc(fptr)) != EOF) {
    putchar(ch);
  }

  fclose(fptr);
}
