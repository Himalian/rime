print "removing old build files..."
let buildTime = timeit { rm -rf ./build }
print $"done took ($buildTime)"
print "building new config..."
let buildTime = timeit { WeaselDeployer.exe /deploy }
print $"done, took ($buildTime)"
