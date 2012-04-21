# Proof of concept for generating clang's LibTooling documentation.
#
# Code snippets in the documentation are taken from real code, which is
# compiled during the normal clang build/test process, so the documentation
# never contains invalid code.
#
# Inspired by Go's codewalks: http://golang.org/doc/codewalk/
#

LibTooling.html: LibTooling.html.src codewalk
	cat $< | ./codewalk > $@

clean:
	rm -f LibTooling.html
.PHONY: clean

.DELETE_ON_ERROR:
