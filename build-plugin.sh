#!/bin/bash
# Modified from https://github.com/hlashbrooke/WordPress-Plugin-Template

printf "Plugin name: "
read NAME

printf "Destination folder: "
read FOLDER

printf "Include Grunt support (y/n): "
read GRUNT

printf "Initialise new git repo (y/n): "
read NEWREPO

DEFAULT_NAME="Plugin Name"
DEFAULT_CLASS=${DEFAULT_NAME// /_}
DEFAULT_TOKEN=$( tr '[A-Z]' '[a-z]' <<< $DEFAULT_CLASS)
DEFAULT_SLUG=${DEFAULT_TOKEN//_/-}

CLASS=${NAME// /_}
TOKEN=$( tr '[A-Z]' '[a-z]' <<< $CLASS)
SLUG=${TOKEN//_/-}

# echo ${DEFAULT_CLASS}, ${DEFAULT_TOKEN}, ${DEFAULT_SLUG}, ${CLASS}, ${TOKEN}, ${SLUG}

git clone https://github.com/wintseng/WordPress-Plugin-Boilerplate.git $FOLDER/$SLUG

echo "Removing git files..."

mkdir -p $FOLDER
cd $FOLDER/$SLUG
# echo "$PWD"
# exit

rm -rf .git
rm README.md
rm build-plugin.sh
rm CHANGELOG.md

if [ "$GRUNT" == "n" ]; then
	rm Gruntfile.js
	rm package.json
fi

echo "Updating plugin files..."

mv $DEFAULT_SLUG.php $SLUG.php

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_NAME/$NAME/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp


cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" uninstall.tmp > uninstall.php
rm uninstall.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" uninstall.tmp > uninstall.php
rm uninstall.tmp


cd languages
mv $DEFAULT_SLUG.pot $SLUG.pot

cd ../includes
mv class-$DEFAULT_SLUG.php class-$SLUG.php

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

#add below
mv class-$DEFAULT_SLUG-activator.php class-$SLUG-activator.php
cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

cp class-$SLUG-activator.php class-$SLUG-activator.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-activator.tmp > class-$SLUG-activator.php
rm class-$SLUG-activator.tmp

mv class-$DEFAULT_SLUG-deactivator.php class-$SLUG-deactivator.php
cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

cp class-$SLUG-deactivator.php class-$SLUG-deactivator.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-deactivator.tmp > class-$SLUG-deactivator.php
rm class-$SLUG-deactivator.tmp

mv class-$DEFAULT_SLUG-api.php class-$SLUG-api.php

cp class-$SLUG-api.php class-$SLUG-api.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-api.tmp > class-$SLUG-api.php
rm class-$SLUG-api.tmp

cp class-$SLUG-api.php class-$SLUG-api.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-api.tmp > class-$SLUG-api.php
rm class-$SLUG-api.tmp

cp class-$SLUG-api.php class-$SLUG-api.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-api.tmp > class-$SLUG-api.php
rm class-$SLUG-api.tmp

mv class-$DEFAULT_SLUG-i18n.php class-$SLUG-i18n.php

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

cp class-$SLUG-i18n.php class-$SLUG-i18n.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-i18n.tmp > class-$SLUG-i18n.php
rm class-$SLUG-i18n.tmp

mv class-$DEFAULT_SLUG-loader.php class-$SLUG-loader.php

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-loader.tmp

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-loader.tmp

cp class-$SLUG-loader.php class-$SLUG-loader.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-loader.tmp > class-$SLUG-loader.php
rm class-$SLUG-i18n.tmp

cd ../public
mv class-$DEFAULT_SLUG-public.php class-$SLUG-public.php
mv css/$DEFAULT_SLUG-public.css css/$SLUG-public.css
mv js/$DEFAULT_SLUG-public.js js/$SLUG-public.js
mv partials/$DEFAULT_SLUG-public-display.php partials/$SLUG-public-display.php
cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp
cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp
cp class-$SLUG-public.php class-$SLUG-public.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-public.tmp > class-$SLUG-public.php
rm class-$SLUG-public.tmp

cd ./partials
cp $SLUG-public-display.php $SLUG-public-display.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-public-display.tmp > $SLUG-public-display.php
rm $SLUG-public-display.tmp
cd ..

cd ../admin
mv class-$DEFAULT_SLUG-admin.php class-$SLUG-admin.php
mv css/$DEFAULT_SLUG-admin.css css/$SLUG-admin.css
mv js/$DEFAULT_SLUG-admin.js js/$SLUG-admin.js
mv partials/$DEFAULT_SLUG-admin-display.php partials/$SLUG-admin-display.php
cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp
cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp
cp class-$SLUG-admin.php class-$SLUG-admin.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-admin.tmp > class-$SLUG-admin.php
rm class-$SLUG-admin.tmp
cd ./partials
cp $SLUG-admin-display.php $SLUG-admin-display.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG-admin-display.tmp > $SLUG-admin-display.php
rm $SLUG-admin-display.tmp
cd ..

if [ "$NEWREPO" == "y" ]; then
	echo "Initialising new git repo..."
	cd ../..
	git init
fi

echo "Complete!"
