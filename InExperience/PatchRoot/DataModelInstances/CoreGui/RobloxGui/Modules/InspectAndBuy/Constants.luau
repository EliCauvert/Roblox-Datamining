local fFlagAXInspectAndBuyMakeupSupport = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport
local t = {
	NotificationKeys = {
		MultipleBundleNoticeKey = "InGame.InspectMenu.Description.MultipleBundlesNotice",
		SingleBundleNoticeKey = "InGame.InspectMenu.Description.SingleBundleNotice",
		LimitedItemNoticeKey = "InGame.InspectMenu.Description.LimitedNotice",
		LayeredClothingOnR6Key = "InGame.InspectMenu.Description.LayeredClothingR6"
	},
	ItemType = { Asset = "Asset", Bundle = "Bundle" },
	View = { Compact = 0, Wide = 1, WideLandscape = 2 },
	AssetCategories = {
		Animation = "Animation",
		Body = "Body",
		Clothing = "Clothing",
		Accessory = "Accessory",
		Emotes = "Emotes",
		Makeup = if fFlagAXInspectAndBuyMakeupSupport then "Makeup" else nil
	},
	AssetTypeIdStringToHumanoidDescriptionProp = {
		[tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt",
		[tostring(Enum.AssetType.Hat.Value)] = "HatAccessory",
		[tostring(Enum.AssetType.Shirt.Value)] = "Shirt",
		[tostring(Enum.AssetType.Pants.Value)] = "Pants",
		[tostring(Enum.AssetType.Head.Value)] = "Head",
		[tostring(Enum.AssetType.Face.Value)] = "Face",
		[tostring(Enum.AssetType.Torso.Value)] = "Torso",
		[tostring(Enum.AssetType.RightArm.Value)] = "RightArm",
		[tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm",
		[tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg",
		[tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg",
		[tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory",
		[tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory",
		[tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory",
		[tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory",
		[tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory",
		[tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory",
		[tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory",
		[tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation",
		[tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation",
		[tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation",
		[tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation",
		[tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation",
		[tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation",
		[tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation",
		[tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
	},
	AnimationAssetTypes = {
		["48"] = 48,
		["50"] = 50,
		["51"] = 51,
		["52"] = 52,
		["53"] = 53,
		["54"] = 54,
		["55"] = 55,
		["61"] = 61,
		["78"] = 78
	},
	AssetTypeIdToAccessoryTypeEnum = {
		[tostring(Enum.AssetType.Hat.Value)] = Enum.AccessoryType.Hat,
		[tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair,
		[tostring(Enum.AssetType.FaceAccessory.Value)] = Enum.AccessoryType.Face,
		[tostring(Enum.AssetType.NeckAccessory.Value)] = Enum.AccessoryType.Neck,
		[tostring(Enum.AssetType.ShoulderAccessory.Value)] = Enum.AccessoryType.Shoulder,
		[tostring(Enum.AssetType.FrontAccessory.Value)] = Enum.AccessoryType.Front,
		[tostring(Enum.AssetType.BackAccessory.Value)] = Enum.AccessoryType.Back,
		[tostring(Enum.AssetType.WaistAccessory.Value)] = Enum.AccessoryType.Waist,
		[tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt,
		[tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt,
		[tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants,
		[tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket,
		[tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater,
		[tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts,
		[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe,
		[tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe,
		[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt,
		[tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow,
		[tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
	},
	LayeredAssetTypes = {
		[tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt,
		[tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt,
		[tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants,
		[tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket,
		[tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater,
		[tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts,
		[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe,
		[tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe,
		[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt,
		[tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair,
		[tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow,
		[tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
	},
	AssetCategory = { Tops = "Tops", Bottoms = "Bottoms" }
}
t.AssetTypeIdToCategory = {
	[tostring(Enum.AssetType.TShirt.Value)] = t.AssetCategories.Clothing,
	[tostring(Enum.AssetType.Hat.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.HairAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.FaceAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.NeckAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.ShoulderAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.FrontAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.BackAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.WaistAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.Shirt.Value)] = t.AssetCategories.Clothing,
	[tostring(Enum.AssetType.Pants.Value)] = t.AssetCategories.Clothing,
	[tostring(Enum.AssetType.Gear.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.Head.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.Face.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.Torso.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.RightArm.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.LeftArm.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.LeftLeg.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.RightLeg.Value)] = t.AssetCategories.Body,
	[tostring(Enum.AssetType.ClimbAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.FallAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.IdleAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.JumpAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.RunAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.SwimAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.WalkAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.EmoteAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.PantsAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.JacketAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.RightShoeAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.EyelashAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.EyebrowAccessory.Value)] = t.AssetCategories.Accessory,
	[tostring(Enum.AssetType.MoodAnimation.Value)] = t.AssetCategories.Animation,
	[tostring(Enum.AssetType.DynamicHead.Value)] = t.AssetCategories.Body
}

if fFlagAXInspectAndBuyMakeupSupport then
	t.AssetTypeIdToCategory[tostring(Enum.AssetType.EyeMakeup.Value)] = t.AssetCategories.Makeup
	t.AssetTypeIdToCategory[tostring(Enum.AssetType.FaceMakeup.Value)] = t.AssetCategories.Makeup
	t.AssetTypeIdToCategory[tostring(Enum.AssetType.LipMakeup.Value)] = t.AssetCategories.Makeup
end
t.AssetCategoriesLocalized = {
	[t.AssetCategories.Animation] = "Feature.Catalog.Label.Animation",
	[t.AssetCategories.Body] = "Feature.Catalog.Label.Body",
	[t.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing",
	[t.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory",
	[t.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
}

if fFlagAXInspectAndBuyMakeupSupport then
	t.AssetCategoriesLocalized[t.AssetCategories.Makeup] = "Feature.Catalog.Label.Makeup"
end
t.AssetTypeIdToTypeLocalized = {
	[tostring(Enum.AssetType.TShirt.Value)] = "Feature.Avatar.Label.ClassicTShirts",
	[tostring(Enum.AssetType.Hat.Value)] = "Feature.Avatar.Label.Hat",
	[tostring(Enum.AssetType.HairAccessory.Value)] = "Feature.Avatar.Label.Hair",
	[tostring(Enum.AssetType.FaceAccessory.Value)] = "Feature.Avatar.Label.Face",
	[tostring(Enum.AssetType.NeckAccessory.Value)] = "Feature.Avatar.Label.Neck",
	[tostring(Enum.AssetType.ShoulderAccessory.Value)] = "Feature.Avatar.Label.Shoulder",
	[tostring(Enum.AssetType.FrontAccessory.Value)] = "Feature.Avatar.Label.Front",
	[tostring(Enum.AssetType.BackAccessory.Value)] = "Feature.Avatar.Label.Back",
	[tostring(Enum.AssetType.WaistAccessory.Value)] = "Feature.Avatar.Label.Waist",
	[tostring(Enum.AssetType.Shirt.Value)] = "Feature.Avatar.Label.ClassicShirts",
	[tostring(Enum.AssetType.Pants.Value)] = "Feature.Avatar.Label.ClassicPants",
	[tostring(Enum.AssetType.Gear.Value)] = "Feature.Avatar.Label.Gear",
	[tostring(Enum.AssetType.Head.Value)] = "Feature.Avatar.Label.Head",
	[tostring(Enum.AssetType.Face.Value)] = "Feature.Avatar.Label.Face",
	[tostring(Enum.AssetType.Torso.Value)] = "Feature.Avatar.Label.Torso",
	[tostring(Enum.AssetType.RightArm.Value)] = "Feature.Avatar.Label.RightArms",
	[tostring(Enum.AssetType.LeftArm.Value)] = "Feature.Avatar.Label.LeftArms",
	[tostring(Enum.AssetType.LeftLeg.Value)] = "Feature.Avatar.Label.LeftLegs",
	[tostring(Enum.AssetType.RightLeg.Value)] = "Feature.Avatar.Label.RightLegs",
	[tostring(Enum.AssetType.ClimbAnimation.Value)] = "Feature.Avatar.Label.Climb",
	[tostring(Enum.AssetType.FallAnimation.Value)] = "Feature.Avatar.Label.Fall",
	[tostring(Enum.AssetType.IdleAnimation.Value)] = "Feature.Avatar.Label.Idle",
	[tostring(Enum.AssetType.JumpAnimation.Value)] = "Feature.Avatar.Label.Jump",
	[tostring(Enum.AssetType.RunAnimation.Value)] = "Feature.Avatar.Label.Run",
	[tostring(Enum.AssetType.SwimAnimation.Value)] = "Feature.Avatar.Label.Swim",
	[tostring(Enum.AssetType.WalkAnimation.Value)] = "Feature.Avatar.Label.Walk",
	[tostring(Enum.AssetType.EmoteAnimation.Value)] = "Feature.Avatar.Label.Emote",
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = "Feature.Avatar.Label.TShirt",
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = "Feature.Avatar.Label.Shirt",
	[tostring(Enum.AssetType.PantsAccessory.Value)] = "Feature.Avatar.Label.Pants",
	[tostring(Enum.AssetType.JacketAccessory.Value)] = "Feature.Avatar.Label.Jacket",
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = "Feature.Avatar.Label.Sweater",
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = "Feature.Avatar.Label.Shorts",
	[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = "Feature.Avatar.Label.LeftShoe",
	[tostring(Enum.AssetType.RightShoeAccessory.Value)] = "Feature.Avatar.Label.RightShoe",
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "Feature.Avatar.Label.DressesAndSkirts",
	[tostring(Enum.AssetType.EyelashAccessory.Value)] = "Feature.Catalog.Label.Eyelash",
	[tostring(Enum.AssetType.EyebrowAccessory.Value)] = "Feature.Catalog.Label.Eyebrow",
	[tostring(Enum.AssetType.MoodAnimation.Value)] = "Feature.Avatar.Label.Mood",
	[tostring(Enum.AssetType.DynamicHead.Value)] = "Feature.Avatar.Label.DynamicHead"
}

if fFlagAXInspectAndBuyMakeupSupport then
	t.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.EyeMakeup.Value)] = "Feature.Catalog.Label.EyeMakeup"
	t.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.FaceMakeup.Value)] = "Feature.Catalog.Label.FaceMakeup"
	t.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.LipMakeup.Value)] = "Feature.Catalog.Label.LipMakeup"
end
t.MoodAnimationAssetTypeId = "78"
t.DynamicHeadAssetTypeId = "79"
t.DetailsThumbnailFrameHeight = 250
t.LimitedIconFrameSizeXOffset = 9
t.LimitedIconFrameSizeYOffset = 4
t.DynamicHeadAssetTypes = {
	[tostring(Enum.AssetType.EyebrowAccessory.Value)] = true,
	[tostring(Enum.AssetType.EyelashAccessory.Value)] = true,
	[t.MoodAnimationAssetTypeId] = true,
	[t.DynamicHeadAssetTypeId] = true
}
t.AccessoryTypeEnumToAssetTypeId = {}

for i, v in pairs(t.AssetTypeIdToAccessoryTypeEnum) do
	t.AccessoryTypeEnumToAssetTypeId[v] = i
end
t.AssetCategoryToAssetType = {
	[t.AssetCategory.Tops] = {
		tostring(Enum.AssetType.ShirtAccessory.Value),
		tostring(Enum.AssetType.TShirtAccessory.Value),
		tostring(Enum.AssetType.SweaterAccessory.Value)
	},
	[t.AssetCategory.Bottoms] = {
		tostring(Enum.AssetType.PantsAccessory.Value),
		tostring(Enum.AssetType.ShortsAccessory.Value),
		tostring(Enum.AssetType.DressSkirtAccessory.Value)
	}
}
t.AssetTypeToAssetCategory = {}

for i_1, v_1 in pairs(t.AssetCategoryToAssetType) do
	for i_2, v_2 in ipairs(v_1) do
		t.AssetTypeToAssetCategory[v_2] = i_1
	end
end
t.LayeredClothingOrder = {
	[tostring(Enum.AssetType.Pants.Value)] = 0,
	[tostring(Enum.AssetType.Shirt.Value)] = 1,
	[tostring(Enum.AssetType.TShirt.Value)] = 2,
	[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = 3,
	[tostring(Enum.AssetType.RightShoeAccessory.Value)] = 3,
	[tostring(Enum.AssetType.PantsAccessory.Value)] = 4,
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = 5,
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = 6,
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = 7,
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = 8,
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = 9,
	[tostring(Enum.AssetType.JacketAccessory.Value)] = 10,
	[tostring(Enum.AssetType.HairAccessory.Value)] = 11,
	[tostring(Enum.AssetType.EyebrowAccessory.Value)] = 3,
	[tostring(Enum.AssetType.EyelashAccessory.Value)] = 3
}
t.ProductType = { CollectibleItem = "Collectible Item" }
t.ItemRestrictions = {
	Limited = "Limited",
	LimitedUnique = "LimitedUnique",
	Collectible = "Collectible"
}
t.SaleStatus = { OnSale = "OnSale" }
t.SaleLocationType = {
	Invalid = 0,
	ShopOnly = 1,
	MyExperiencesOnly = 2,
	ShopAndMyExperiences = 3,
	ExperiencesById = 4,
	ShopAndAllExperiences = 5,
	ExperiencesDevApiOnly = 6,
	ShopAndExperiencesById = 7
}
t.CounterSuffix = {
	RequestSucceeded = "RequestSucceeded",
	RequestRejected = "RequestRejected",
	RequestFailed = "RequestFailed"
}
t.Counters = {
	CreateFavoriteForAsset = "CreateFavoriteForAsset",
	CreateFavoriteForBundle = "CreateFavoriteForBundle",
	DeleteFavoriteForAsset = "DeleteFavoriteForAsset",
	DeleteFavoriteForBundle = "DeleteFavoriteForBundle",
	GetAssetBundles = "GetAssetBundles",
	GetAssetFavoriteCount = "GetAssetFavoriteCount",
	GetBundleFavoriteCount = "GetBundleFavoriteCount",
	GetCharacterModelFromUserId = "GetCharacterModelFromUserId",
	GetCollectibleResellableInstances = "GetCollectibleResellableInstances",
	GetCollectibleResellableInstancesRequestSucceededWithoutResult = "GetCollectibleResellableInstancesRequestSucceededWithoutResult",
	GetEconomyProductInfo = "GetEconomyV1DeprecatedProductInfo",
	GetExperienceInfo = "GetExperienceInfo",
	GetExperiencePlayability = "GetExperiencePlayability",
	GetFavoriteForAsset = "GetFavoriteForAsset",
	GetFavoriteForBundle = "GetFavoriteForBundle",
	GetItemDetails = "GetItemDetails",
	GetItemDetailsRespondedWithUnknownItemType = "GetItemDetailsRespondedWithUnknownItemType",
	GetPlayerName = "GetPlayerName",
	GetProductInfo = "MarketplaceServiceGetProductInfo",
	GetVersionInfo = "GetVersionInfo",
	PromptLimitedCollectiblesPurchase = "PromptLimitedCollectiblesPurchase",
	PromptBundlePurchase = "PromptBundlePurchase",
	PromptUnlimitedCollectiblePurchase = "PromptUnlimitedCollectiblePurchase",
	PromptRobloxPurchase = "PromptRobloxPurchase",
	PromptPurchaseUnknownItemType = "PromptPurchaseUnknownItemType",
	PurchaseSucceededBundle = "PurchaseSucceededBundle",
	PurchaseSucceededAsset = "PurchaseSucceededAsset",
	PurchaseSucceededOther = "PurchaseSucceededOther",
	PurchaseFinished = "PurchaseFinished",
	ItemDetailPageOpened = "ItemDetailPageOpened",
	TryOnButtonClicked = "TryOnButtonClicked",
	GetAvatarPreview = "GetAvatarPreview",
	BatchGetAssets = "BatchGetAssets",
	BatchGetItemDetails = "BatchGetItemDetails"
}

return t