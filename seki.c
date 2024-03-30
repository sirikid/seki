#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef PACKAGE
#	error PACKAGE undefined!
#endif

#ifndef VERSION
#	error VERSION undefined!
#endif

int main(int const c, char *const v[]) {
	int opt;

	opterr = 0;
	while ((opt = getopt(c, v, "hv")) != -1) {
		switch (opt) {
		case 'h':
			puts("Usage: " PACKAGE " -h\n"
			     "       " PACKAGE " -v\n"
			     "       " PACKAGE " [--] [desu]");
			return EXIT_SUCCESS;
		case 'v':
			puts(PACKAGE " v" VERSION);
			return EXIT_SUCCESS;
		case '?':
			printf("Unknown flag %s (-h for help)\n", v[optind - 1]);
			return EXIT_FAILURE;
		}
	}

	char const *const desu = (optind == c ? "desu" : v[optind]);

	for (;;) {
		puts(desu);
	}
}
