#include <stdio.h>

static void
usage(char* binname)
{
	printf("Usage: %s -h | -v | [desu]\n", binname);
}

int
main(int c, char* v[])
{
	char* desu;

	if (c == 1) {
		desu = "desu";
	} else if (c == 2) {
		if (v[1][0] == '-') {
			if (v[1][1] == 'v') {
				printf("desu 0.1.0\n");
			} else {
				usage(v[0]);
			}
			return 0;
		} else {
			desu = v[1];
		}
	} else {
		usage(v[0]);
		return 1;
	}

	while (1) {
		printf("%s\n", desu);
	}
}
