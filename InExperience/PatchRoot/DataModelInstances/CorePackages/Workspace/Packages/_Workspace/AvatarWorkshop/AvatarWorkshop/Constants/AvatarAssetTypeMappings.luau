local AssetTypeToAccessoryType = {
	[Enum.AvatarAssetType.Hat] = Enum.AccessoryType.Hat,
	[Enum.AvatarAssetType.HairAccessory] = Enum.AccessoryType.Hair,
	[Enum.AvatarAssetType.FaceAccessory] = Enum.AccessoryType.Face,
	[Enum.AvatarAssetType.NeckAccessory] = Enum.AccessoryType.Neck,
	[Enum.AvatarAssetType.ShoulderAccessory] = Enum.AccessoryType.Shoulder,
	[Enum.AvatarAssetType.FrontAccessory] = Enum.AccessoryType.Front,
	[Enum.AvatarAssetType.BackAccessory] = Enum.AccessoryType.Back,
	[Enum.AvatarAssetType.WaistAccessory] = Enum.AccessoryType.Waist,
	[Enum.AvatarAssetType.TShirtAccessory] = Enum.AccessoryType.TShirt,
	[Enum.AvatarAssetType.ShirtAccessory] = Enum.AccessoryType.Shirt,
	[Enum.AvatarAssetType.PantsAccessory] = Enum.AccessoryType.Pants,
	[Enum.AvatarAssetType.JacketAccessory] = Enum.AccessoryType.Jacket,
	[Enum.AvatarAssetType.SweaterAccessory] = Enum.AccessoryType.Sweater,
	[Enum.AvatarAssetType.ShortsAccessory] = Enum.AccessoryType.Shorts,
	[Enum.AvatarAssetType.LeftShoeAccessory] = Enum.AccessoryType.LeftShoe,
	[Enum.AvatarAssetType.RightShoeAccessory] = Enum.AccessoryType.RightShoe,
	[Enum.AvatarAssetType.DressSkirtAccessory] = Enum.AccessoryType.DressSkirt,
	[Enum.AvatarAssetType.EyebrowAccessory] = Enum.AccessoryType.Eyebrow,
	[Enum.AvatarAssetType.EyelashAccessory] = Enum.AccessoryType.Eyelash
}
local LayeredClothingOrder = {
	[Enum.AvatarAssetType.EyebrowAccessory] = 0,
	[Enum.AvatarAssetType.EyelashAccessory] = 1,
	[Enum.AvatarAssetType.LeftShoeAccessory] = 5,
	[Enum.AvatarAssetType.RightShoeAccessory] = 5,
	[Enum.AvatarAssetType.PantsAccessory] = 6,
	[Enum.AvatarAssetType.ShortsAccessory] = 7,
	[Enum.AvatarAssetType.DressSkirtAccessory] = 8,
	[Enum.AvatarAssetType.TShirtAccessory] = 9,
	[Enum.AvatarAssetType.ShirtAccessory] = 10,
	[Enum.AvatarAssetType.SweaterAccessory] = 11,
	[Enum.AvatarAssetType.JacketAccessory] = 12,
	[Enum.AvatarAssetType.HairAccessory] = 13
}
local AssetTypeToMakeupType = {
	[Enum.AvatarAssetType.FaceMakeup] = Enum.MakeupType.Face,
	[Enum.AvatarAssetType.LipMakeup] = Enum.MakeupType.Lip,
	[Enum.AvatarAssetType.EyeMakeup] = Enum.MakeupType.Eye
}
local LayeredMakeupOrder = {
	[Enum.AvatarAssetType.FaceMakeup] = 0,
	[Enum.AvatarAssetType.LipMakeup] = 1,
	[Enum.AvatarAssetType.EyeMakeup] = 2
}
local FromValueResult = Enum.AvatarAssetType:FromValue(97)
local AssetTypeFromId = {}

for _, enumItem in Enum.AvatarAssetType:GetEnumItems() do
	AssetTypeFromId[enumItem.Value] = enumItem
end
return {
	assetTypeToAccessoryType = AssetTypeToAccessoryType,
	layeredClothingOrder = LayeredClothingOrder,
	assetTypeToMakeupType = AssetTypeToMakeupType,
	layeredMakeupOrder = LayeredMakeupOrder,
	spawnEffectAssetType = FromValueResult,
	assetTypeFromId = AssetTypeFromId
}