#include <getopt.h>
#include <stdio.h>

static void
usage(const char *binname)
{
	printf("Usage: %s [-h|-v] [desu]\n", binname);
}

static void
version(const char *binname)
{
	printf("%s 0.1.1\n", binname);
}

int
main(const int c, char *const v[])
{
	int opt;

	while ((opt = getopt(c, v, "hv")) != -1) {
		switch (opt) {
		case 'h':
			usage(v[0]);
			return 0;
		case 'v':
			version(v[0]);
			return 0;
		}
	}

	const char *desu = (optind == c ? "desu" : v[optind]);

	for (;;) {
		fputs(desu, stdout);
		fputc('\n', stdout);
	}
}
