#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef NAME
#	error NAME undefined!
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
			puts("Usage: " NAME " -h\n"
			     "       " NAME " -v\n"
			     "       " NAME " [--] [desu]");
			return EXIT_SUCCESS;
		case 'v':
			puts(NAME " v" VERSION);
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
