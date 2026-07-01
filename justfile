set shell := ["nu", "-c"]

alias build := deploy
alias sync := update

default:
    just -l

clean:
    rm -rf ./build

deploy:
    @nu ./scripts/build.nu

rebuild: fix
    @nu ./scripts/rebuild.nu

fix:
	@nu ./scripts/fix.nu

download-model:
	curl -L -o wanxiang-lts-zh-hans.gram https://github.com/amzxyz/RIME-LMDG/releases/download/LTS/wanxiang-lts-zh-hans.gram
# sync with upstream
update:
	git merge upstream main --squash -X theirs --allow-unrelated-histories
