let excludes = []
git diff --full-index --binary HEAD upstream/main ...$excludes | save update.patch -f;
# open update.patch --raw | patch -p1 --no-backup-if-mismatch --reject-file=- --version-control=none -f | complete 
# ls **/* | where name =~ "~" | each { rm $in.name };
