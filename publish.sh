set -e
git submodule init
git submodule update
cd _site
git checkout master
cd ..
sh runStack --nix setup
sh runStack --nix build
sh runStack --nix exec cascadeofinsights clean
sh runStack --nix exec cascadeofinsights build

cd _site/
git adda
git commit -m "Update [ci skip]"
git push origin master
cd ..
git add _site/
git commit -m "Update [ci skip]"
git push origin hakyll
