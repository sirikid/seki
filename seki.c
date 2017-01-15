#include <getopt.h>
#include <stdio.h>

int main(int const c, char *const v[]) {
	int opt;

	opterr = 0;
	while ((opt = getopt(c, v, "hv")) != -1) {
		switch (opt) {
		case 'h':
			puts("Usage: " NAME " -h\n"
			     "       " NAME " -v\n"
			     "       " NAME " [desu]");
			return 0;
		case 'v':
			puts(NAME " v" VERSION);
			return 0;
		case '?':
			printf("Unknown flag %s (-h for help)\n", v[optind - 1]);
			return 1;
		}
	}

	char const *const desu = (optind == c ? "desu" : v[optind]);

	for (;;) {
		puts(desu);
	}
}
