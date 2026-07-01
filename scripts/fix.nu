let modified = (do { git diff --name-only } | complete | get stdout | lines | where { ($in | str ends-with '.yaml') and not ($in | is-empty) })
let untracked = (do { git ls-files --others --exclude-standard } | complete | get stdout | lines | where { ($in | str ends-with '.yaml') and not ($in | is-empty) })

let files = ($modified | append $untracked)

if ( $files | is-empty ) {
	print "there is nothing to do today"
} else {
	print "replace '  ' with <tab>..."
	let buildTime = timeit { $files | each {|f| sd "  " "\t" $f } }
	print $"done, took ($buildTime)"
}
