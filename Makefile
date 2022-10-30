all: blog

blog:
	./build.sh

clean:
	rm -rf build

serve:
	cd build && python -m http.server

.PHONY: blog clean serve
