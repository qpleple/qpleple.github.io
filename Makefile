.PHONY: dep local

dep:
	jekyll build
	git add --all .
	git ci -m "Modif `date +"%%y-%%m-%%d %%T"`"
	cd _site && git add --all . && git ci -m "Deploy `date +"%%y-%%m-%%d %%T"`" && git push
	git push

local:
	jekyll serve