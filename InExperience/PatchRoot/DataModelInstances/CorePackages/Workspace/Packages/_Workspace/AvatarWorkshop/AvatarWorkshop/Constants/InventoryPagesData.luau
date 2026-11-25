local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local InventoryOutfitType = require(AvatarWorkshop.Parent.AvatarExperienceModel).Enums.InventoryOutfitType

return {
	[ScreensModule.Inventory.Avatars] = { outfitInventoryType = InventoryOutfitType.Avatar },
	[ScreensModule.Inventory.Body.FullBody] = { outfitInventoryType = InventoryOutfitType.Body },
	[ScreensModule.Inventory.Body.Head] = { outfitInventoryType = InventoryOutfitType.DynamicHead },
	[ScreensModule.Inventory.Body.Hair] = { assetTypes = { Enum.AvatarAssetType.HairAccessory } },
	[ScreensModule.Inventory.Clothing.Top] = {
		assetTypes = {
			Enum.AvatarAssetType.TShirtAccessory,
			Enum.AvatarAssetType.ShirtAccessory,
			Enum.AvatarAssetType.SweaterAccessory
		}
	},
	[ScreensModule.Inventory.Clothing.Outterwear] = { assetTypes = { Enum.AvatarAssetType.JacketAccessory } },
	[ScreensModule.Inventory.Clothing.Bottom] = {
		assetTypes = {
			Enum.AvatarAssetType.PantsAccessory,
			Enum.AvatarAssetType.ShortsAccessory,
			Enum.AvatarAssetType.DressSkirtAccessory
		}
	},
	[ScreensModule.Inventory.Clothing.Shoes] = { outfitInventoryType = InventoryOutfitType.Shoes },
	[ScreensModule.Inventory.Clothing.ClassicShirt] = { assetTypes = { Enum.AvatarAssetType.Shirt } },
	[ScreensModule.Inventory.Clothing.ClassicPants] = { assetTypes = { Enum.AvatarAssetType.Pants } },
	[ScreensModule.Inventory.Clothing.ClassicTShirt] = { assetTypes = { Enum.AvatarAssetType.TShirt } },
	[ScreensModule.Inventory.Accessories.Hat] = { assetTypes = { Enum.AvatarAssetType.Hat } },
	[ScreensModule.Inventory.Accessories.Face] = { assetTypes = { Enum.AvatarAssetType.FaceAccessory } },
	[ScreensModule.Inventory.Accessories.Neck] = { assetTypes = { Enum.AvatarAssetType.NeckAccessory } },
	[ScreensModule.Inventory.Accessories.Back] = { assetTypes = { Enum.AvatarAssetType.BackAccessory } },
	[ScreensModule.Inventory.Accessories.Waist] = { assetTypes = { Enum.AvatarAssetType.WaistAccessory } },
	[ScreensModule.Inventory.Accessories.Shoulder] = { assetTypes = { Enum.AvatarAssetType.ShoulderAccessory } },
	[ScreensModule.Inventory.Accessories.Front] = { assetTypes = { Enum.AvatarAssetType.FrontAccessory } },
	[ScreensModule.Inventory.Accessories.Gear] = { assetTypes = { Enum.AvatarAssetType.Gear } },
	[ScreensModule.Inventory.Animations.FullSet] = { outfitInventoryType = InventoryOutfitType.Animations },
	[ScreensModule.Inventory.Animations.Idle] = { assetTypes = { Enum.AvatarAssetType.IdleAnimation } },
	[ScreensModule.Inventory.Animations.Walk] = { assetTypes = { Enum.AvatarAssetType.WalkAnimation } },
	[ScreensModule.Inventory.Animations.Run] = { assetTypes = { Enum.AvatarAssetType.RunAnimation } },
	[ScreensModule.Inventory.Animations.Jump] = { assetTypes = { Enum.AvatarAssetType.JumpAnimation } },
	[ScreensModule.Inventory.Animations.Fall] = { assetTypes = { Enum.AvatarAssetType.FallAnimation } },
	[ScreensModule.Inventory.Animations.Climb] = { assetTypes = { Enum.AvatarAssetType.ClimbAnimation } },
	[ScreensModule.Inventory.Animations.Swim] = { assetTypes = { Enum.AvatarAssetType.SwimAnimation } },
	[ScreensModule.Inventory.Emotes] = { assetTypes = { Enum.AvatarAssetType.EmoteAnimation } }
}