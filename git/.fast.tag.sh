### Creates a new tag incremented from latest tag
### Supported tag formats:
### Release: v0.1.1
### PreRelease: v0.1.1-rc0, v0.1.1-beta1, v0.1.1-test3,
### "v[major].[minor].[build]-[dev-type][dev]"
### Results:  v0.1.1 --> v0.1.2, v0.1.1-rc0 --> v0.1.1-rc1

line="--------------------------------"

date_time="$(date '+%Y-%m-%d %H:%M:%S')"

### commit changes
git pull
git add .
git commit -m "update ${date_time}"
git push

### get current branch
git fetch
branch_current=$(git branch --show-current)

### get latest tag 
tag_latest=$(git describe --abbrev=0 --tags)
if [[ "${tag_latest}" == "" ]]; then
  tag_latest="v0.0.0"
fi

### version vars
major=-1
minor=-1
build=-1
dev=-1
dev_type=""

### show info
echo "${line}"
echo "Latest tag: [${tag_latest}]"
echo "Current branch: [${branch_current}]"
echo "${line}"

# tests
# tag_latest="v1.0.0-rc1"
# tag_latest="v1.0.2"

### parse version number
## dev regex: v0.0.1-rc1
regex_dev_version="([0-9]+).([0-9]+).([0-9]+)-([a-zA-Z]+)([0-9]+)$"
## release regex: v0.0.1
regex_version="([0-9]+).([0-9]+).([0-9]+)$"

if [[ ${tag_latest} =~ ${regex_dev_version} ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  build="${BASH_REMATCH[3]}"
  dev_type="${BASH_REMATCH[4]}"
  dev="${BASH_REMATCH[5]}"
  tag_parsed="${major}.${minor}.${build}-${dev_type}${dev}"  
elif [[ ${tag_latest} =~ ${regex_version} ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  build="${BASH_REMATCH[3]}"
  tag_parsed="${major}.${minor}.${build}"
fi

echo "Parsed tag: [${tag_parsed}]"

### increment dev or build 
if   [[ "${dev}" -ne "-1" ]]; then
  dev=$(echo ${dev} + 1 | bc)
  tag_new="v${major}.${minor}.${build}-${dev_type}${dev}"  
elif [[ "${build}" -ne "-1" ]]; then
  build=$(echo ${build} + 1 | bc)  
  tag_new="v${major}.${minor}.${build}"
fi

# echo the new version number
echo "New tag: [${tag_new}]"
echo "${line}"

### creating a new tag
git tag -a ${tag_new} -m "Tag: [${tag_new}] Time: ${date_time}"
git push origin ${tag_new}
