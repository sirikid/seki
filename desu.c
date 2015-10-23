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

	switch (c) {
	case 1:
		desu = "desu";
		break;
	case 2:
		if (v[1][0] == '-') {
			switch (v[1][1]) {
			case 'h':
				usage(v[0]);
				break;
			case 'v':
				printf("desu 0.1.0\n");
				break;
			default:
				printf("Unknown flag -%c, try desu -h\n", v[1][1]);
				break;
			}
			return 0;
		} else {
			desu = v[1];
		}
		break;
	default:
		usage(v[0]);
		return 1;
	}

	while (1) {
		printf("%s\n", desu);
	}
}
