local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local IconName = require(AvatarWorkshop.Parent.Foundation).Enums.IconName
local Inventory = ScreensModule.Inventory

return {
	[Inventory.Body.FullBody] = {
		showsBody = true,
		placeholderIcon = IconName.PersonStanding
	},
	[Inventory.Body.Head] = {
		placeholderIcon = IconName.HeadBlank,
		equippedAssetTypes = { Enum.AvatarAssetType.DynamicHead }
	},
	[Inventory.Body.Hair] = { placeholderIcon = IconName.HeadFemale },
	[Inventory.Clothing.Top] = { placeholderIcon = IconName.Tshirt },
	[Inventory.Clothing.Outterwear] = { placeholderIcon = IconName.Jacket },
	[Inventory.Clothing.Bottom] = { placeholderIcon = IconName.Pants },
	[Inventory.Clothing.Shoes] = {
		placeholderIcon = IconName.Shoe,
		equippedAssetTypes = { Enum.AvatarAssetType.RightShoeAccessory }
	},
	[Inventory.Clothing.ClassicShirt] = { placeholderIcon = IconName.Shirt_2dText },
	[Inventory.Clothing.ClassicPants] = { placeholderIcon = IconName.Pants_2dText },
	[Inventory.Clothing.ClassicTShirt] = { placeholderIcon = IconName.Tshirt_2dText },
	[Inventory.Accessories.Hat] = { placeholderIcon = IconName.HatFedora },
	[Inventory.Accessories.Face] = { placeholderIcon = IconName.Glasses },
	[Inventory.Accessories.Neck] = { placeholderIcon = IconName.Necklace },
	[Inventory.Accessories.Back] = { placeholderIcon = IconName.ButterflyWings },
	[Inventory.Accessories.Waist] = { placeholderIcon = IconName.Belt },
	[Inventory.Accessories.Shoulder] = { placeholderIcon = IconName.Parrot },
	[Inventory.Accessories.Front] = { placeholderIcon = IconName.Purse },
	[Inventory.Accessories.Gear] = { placeholderIcon = IconName.Sword },
	[Inventory.Animations.FullSet] = {
		placeholderIcon = IconName.DotFramePersonStanding,
		equippedAssetTypes = { Enum.AvatarAssetType.IdleAnimation }
	},
	[Inventory.Animations.Idle] = { placeholderIcon = IconName.PersonStanding },
	[Inventory.Animations.Walk] = { placeholderIcon = IconName.PersonWalking },
	[Inventory.Animations.Run] = { placeholderIcon = IconName.PersonRunning },
	[Inventory.Animations.Jump] = { placeholderIcon = IconName.PersonJumping },
	[Inventory.Animations.Fall] = { placeholderIcon = IconName.PersonFalling },
	[Inventory.Animations.Climb] = { placeholderIcon = IconName.PersonClimbing },
	[Inventory.Animations.Swim] = { placeholderIcon = IconName.PersonSwimming }
}