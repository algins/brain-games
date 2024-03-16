build:
	stack build

lint:
	stack exec -- hlint .

run:
	stack exec brain-games-exe