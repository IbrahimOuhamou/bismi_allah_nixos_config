#bash

echo "in the name of Allah"
echo "this script will put all the dotfiles in their places in the system"
echo "repo => system"

echo ""
echo "*******************"
echo "*******************"
echo ""

echo "will copy the dev_envs by the will of Allah"
mkdir ~/helpers
cp -r ./dev_envs/* ~/helpers/

echo "will copy sway's config by the will of Allah"
mkdir ~/.config/sway
cp -r ./sway/* ~/.config/sway/

echo "will copy foot's config by the will of Allah"
mkdir ~/.config/foot
cp -r ./foot/* ~/.config/foot/

echo "will copy waybar's config by the will of Allah"
mkdir ~/.config/waybar
cp -r ./waybar/* ~/.config/waybar/

echo "will copy wofi's config by the will of Allah"
mkdir ~/.config/wofi
cp -r ./wofi/* ~/.config/wofi/



