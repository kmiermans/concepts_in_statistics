./gh-md-toc --insert readme_raw.md > readme.md
python -m readme2tex --output README.md readme_raw.md --nocdn
sed  -i "" 's/?invert_in_darkmode//g' README.md
