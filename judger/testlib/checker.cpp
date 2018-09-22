#include "testlib.h"
#define S "\t\n\v\f\r "
using namespace std;

bool compare(string a, string b) {
	a.erase(a.find_last_not_of(S) + 1);
	b.erase(a.find_last_not_of(S) + 1);
	return a == b;
}

int main(int argc, char * argv[]) {
	setName("Compare output with answer, ignore spaces at EOL and empty lines at EOF");
	registerTestlibCmd(argc, argv);

	int line = 0;
	while (line++, !ouf.seekEof() && !ans.seekEof())
		if (!compare(ouf.readLine(), ans.readLine()))
			quitf(_wa, "incompatible output at line %d", line);

	while (line++, !ouf.seekEof())
		if (ouf.readLine().find_first_not_of(S) != -1)
			quitf(_wa, "incompatible output at line %d", line);

	while (line++, !ans.seekEof())
		if (ans.readLine().find_first_not_of(S) != -1)
			quitf(_wa, "incompatible output at line %d", line);

	quitf(_ok, "no difference, well done");
}
