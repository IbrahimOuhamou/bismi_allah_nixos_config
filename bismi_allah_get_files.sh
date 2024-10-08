#bash

echo "in the name of Allah"
echo "this script will get all the dotfiles in the system and copy them to this repo by the will of Allah"
echo "system => repo"

echo ""
echo "*******************           copying by the will of Allah    *******************"
echo ""

echo "will copy system's config by the will of Allah"
cat /etc/nixos/configuration.nix > bismi_allah_nixos/configuration.nix.main
cp /etc/nixos/packages/* bismi_allah_nixos/packages/

echo "will copy the dev_envs by the will of Allah"
cp -r ~/helpers/* dev_envs/

echo "will copy sway's config by the will of Allah"
cp -r ~/.config/sway/* sway/

echo "will copy foot's config by the will of Allah"
cp -r ~/.config/foot/* foot/

echo "will copy kitty's config by the will of Allah"
cp -r ~/.config/kitty/* kitty/

echo "will copy waybar's config by the will of Allah"
cp -r ~/.config/waybar/* waybar/

echo "will copy wofi's config by the will of Allah"
cp -r ~/.config/wofi/* wofi/

echo "will copy waypaper's config by the will of Allah"
cp -r ~/.config/waypaper/* waypaper/

echo ""
echo "*******************                   git status              *******************"
git status

echo ""
echo "*******************                   git add --all           *******************"
git add --all

echo ""
echo "*******************     git add commit -am \"alhamdo li Allah\" *******************"
echo ""
git commit -am "alhamdo li Allah"

echo ""
echo "*******************                   git push                *******************"
git push

