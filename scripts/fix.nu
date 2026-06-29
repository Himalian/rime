let modified_files = git diff --name-only; git ls-files --others --exclude-standard | find "*.yaml"


if ( $modified_files | is-empty ) {
  print "there is nothing to do today"
} else {
  print "replace '  ' with <tab>..."
  let buildTime = timeit { sd "  " "\t" $modified_files }; print $"done, took ($buildTime)"
}


