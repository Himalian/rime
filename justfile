set shell := ["nu", "-c"]

alias build := deploy
alias sync := update

default:
    just -l

clean:
    rm -rf ./build

deploy: fix
    @nu ./scripts/build.nu

rebuild: fix
    @nu ./scripts/rebuild.nu

fix:
    @echo "replace '  ' with <tab>..."
    @let buildTime = timeit { sd "  " "\t" cn_dicts/*.yaml }; print $"done, took ($buildTime)"

download-model:
	curl -L -o wanxiang-lts-zh-hans.gram https://github.com/amzxyz/RIME-LMDG/releases/download/LTS/wanxiang-lts-zh-hans.gram
# sync with upstream
update:
	git merge upstream main --squash -X theirs
