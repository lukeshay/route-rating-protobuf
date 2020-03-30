.PHONY: clean generate compile publish lint format compile-java publish-java

PWD=$(shell pwd)

default: generate

clean:
	@rm -r $(PWD)/gen/proto/java/src $(PWD)/gen/proto/java/build || exit 0

generate: clean
	@prototool generate

compile-java:
	@cd gen/proto/java && sh ./gradlew build

compile: generate compile-java

publish-java:
	@cd gen/proto/java && sh ./gradlew publish

publish: compile publish-java

lint:
	@prototool lint

format:
	@prototool format -f
