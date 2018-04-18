
set ROOT_DIR=%CD%

git clone https://github.com/amfdev/HandBrake.git ./HandBrake-sync

cd ./HandBrake-sync
git remote -v
git remote add upstream https://github.com/HandBrake/HandBrake.git
git remote -v
git fetch upstream
git checkout master
git merge upstream/master
git push

cd %ROOT_DIR%
