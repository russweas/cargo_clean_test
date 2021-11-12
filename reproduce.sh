#!/bin/bash
rm -rf glob-in-rm
mkdir glob-in-rm
cd glob-in-rm

for d in 'hello'  '[hello]'; do
	mkdir "$d"
	pushd "$d"
	cargo new foo
	cd foo
	cargo check
	../../../../cargo/target/debug/cargo clean -p foo
	popd
done

diff -qr '[hello]/foo/target' 'hello/foo/target'
