# Proof of concept for generating clang's LibTooling documentation.
#
# Code snippets in the documentation are taken from real code, which is
# compiled during the normal clang build/test process, so the documentation
# never contains invalid code.
#
# Inspired by Go's codewalks: http://golang.org/doc/codewalk/
#
# Run with:
#   LLVM_SRC=path/to/llvm/source LLVM_BUILD=path/to/llvm/build make

LibTooling.html: LibTooling.html.src ClangCheck.cpp codewalk
	@[ -n "$$LLVM_SRC" -a -n "$$LLVM_BUILD" ] || \
	  { echo "Error: You must set LLVM_SRC and LLVM_BUILD" >&2; exit 1; }
	cat $< | ./codewalk > $@

clean:
	rm -f LibTooling.html
.PHONY: clean

.DELETE_ON_ERROR:
