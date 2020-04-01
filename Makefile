.PHONY: clean generate compile lint format compile-java stage-java stage

PWD=$(shell pwd)

default: generate

clean:
	@rm -r $(PWD)/gen/proto/java/src $(PWD)/gen/proto/java/build || exit 0

generate: clean
	@prototool generate

compile-java:
	@cd gen/proto/java && sh ./gradlew clean build

compile: generate compile-java

stage-java:
	@cd gen/proto/java && sh ./gradlew publishMavenJavaPublicationToMavenRepository

stage: compile stage-java

lint:
	@prototool lint

format:
	@prototool format -f
