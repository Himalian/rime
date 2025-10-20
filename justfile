set shell := ["nu", "-c"]

alias build := deploy

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
