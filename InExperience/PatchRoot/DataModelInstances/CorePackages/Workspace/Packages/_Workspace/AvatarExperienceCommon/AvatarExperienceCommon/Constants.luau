local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local LabelAbuseTypeMappingModule = require(script.Parent.LabelAbuseTypeMapping)
local _ = require(script.Parent.Types.CategoryTypes.CategoryTypes)
local AvatarExperienceModelModule = require(Parent.AvatarExperienceModel)
local OutfitTypesModule = require(script.Parent.Enums.OutfitTypes)
local InventoryOutfitType = AvatarExperienceModelModule.Enums.InventoryOutfitType
local FFlagAXCatalogMakeupSupport = require(Parent.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local Frozen = table.freeze({
	height = 1,
	width = 1,
	depth = 1,
	head = 1,
	bodyType = 0,
	proportion = 0
})
local config = {
	["1"] = "Body",
	["2"] = "AvatarAnimations",
	["3"] = "Shoes",
	["4"] = "DynamicHead"
}
local HumanoidDescription = {}
local Names = {}

for _, enumItem in Enum.AvatarAssetType:GetEnumItems() do
	HumanoidDescription[enumItem.Name] = tostring(enumItem.Value)
	Names[tostring(enumItem.Value)] = enumItem.Name
end
local config1 = {
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
}
local t = {}

for i, value in config1 do
	t[value] = i
end
return {
	BODY_BUNDLE_TYPE_ID = "1",
	AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2",
	SHOES_BUNDLE_TYPE_ID = "3",
	DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4",
	DEFAULT_AVATAR_SCALES = Frozen,
	BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = config,
	ASSET_TYPE_TO_ACCESSORY_TYPE = config1,
	ACCESSORY_TYPE_TO_ASSET_TYPE = t,
	ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = {
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
		[tostring(Enum.AssetType.MoodAnimation.Value)] = "MoodAnimation",
		[tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
	},
	HUMANOID_DESCRIPTION_SCALE_TO_NAME = {
		bodyType = "BodyTypeScale",
		head = "HeadScale",
		height = "HeightScale",
		proportion = "ProportionScale",
		depth = "DepthScale",
		width = "WidthScale"
	},
	BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = {
		headColor3 = "HeadColor",
		leftArmColor3 = "LeftArmColor",
		leftLegColor3 = "LeftLegColor",
		rightArmColor3 = "RightArmColor",
		rightLegColor3 = "RightLegColor",
		torsoColor3 = "TorsoColor"
	},
	ASSET_TYPE_NAME_TO_ID_STRING = HumanoidDescription,
	ASSET_TYPE_ID_STRING_TO_NAME = Names,
	NAVIGATION_DIRECTION = { IS_LEFT = "IS_LEFT", IS_RIGHT = "IS_RIGHT" },
	LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6,
	LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4,
	AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356",
	AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey",
	AX_TOOLTIP_COUNTERS = {
		Seen = "AXTooltipSeen",
		TimeDismiss = "AXTooltipTimeDismiss",
		ClickDismiss = "AXTooltipClickDismiss",
		CallbackDismiss = "AXTooltipCallbackDismiss"
	},
	AVATAR_EDITOR_CONSTANTS = {
		CreateOutfitKey = "avatar.createOutfit",
		CreateMakeupLookKey = if FFlagAXCatalogMakeupSupport then "avatar.createMakeupLook" else nil
	},
	LAYERED_CLOTHING_ORDER = {
		[HumanoidDescription.EyebrowAccessory] = 0,
		[HumanoidDescription.EyelashAccessory] = 1,
		[HumanoidDescription.Pants] = 2,
		[HumanoidDescription.Shirt] = 3,
		[HumanoidDescription.TShirt] = 4,
		[HumanoidDescription.LeftShoeAccessory] = 5,
		[HumanoidDescription.RightShoeAccessory] = 5,
		[HumanoidDescription.PantsAccessory] = 6,
		[HumanoidDescription.ShortsAccessory] = 7,
		[HumanoidDescription.DressSkirtAccessory] = 8,
		[HumanoidDescription.TShirtAccessory] = 9,
		[HumanoidDescription.ShirtAccessory] = 10,
		[HumanoidDescription.SweaterAccessory] = 11,
		[HumanoidDescription.JacketAccessory] = 12,
		[HumanoidDescription.HairAccessory] = 13
	},
	LAYERED_ASSET_TYPES = {
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
	ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = {
		[HumanoidDescription.EyeMakeup] = Enum.MakeupType.Eye,
		[HumanoidDescription.FaceMakeup] = Enum.MakeupType.Face,
		[HumanoidDescription.LipMakeup] = Enum.MakeupType.Lip
	},
	MAKEUP_TYPE_TO_ASSET_TYPE_ID = {
		[Enum.MakeupType.Eye] = HumanoidDescription.EyeMakeup,
		[Enum.MakeupType.Face] = HumanoidDescription.FaceMakeup,
		[Enum.MakeupType.Lip] = HumanoidDescription.LipMakeup
	},
	LAYERED_MAKEUP_ORDER = {
		[HumanoidDescription.FaceMakeup] = 0,
		[HumanoidDescription.LipMakeup] = 1,
		[HumanoidDescription.EyeMakeup] = 2
	},
	MAKEUP_LOOK_ASSET_TYPES = {
		[HumanoidDescription.EyeMakeup] = true,
		[HumanoidDescription.FaceMakeup] = true,
		[HumanoidDescription.LipMakeup] = true,
		[HumanoidDescription.EyebrowAccessory] = true,
		[HumanoidDescription.EyelashAccessory] = true
	},
	MAX_MAKEUP_LAYERS = 6,
	LOOK_TYPE = {
		Avatar = "Avatar",
		Makeup = "Makeup",
		Outfit = "Outfit",
		AvatarMoment = "AvatarMoment"
	},
	MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2,
	LabelAbuseTypeMapping = LabelAbuseTypeMappingModule,
	BODY_PART_NAME_TO_ENUM = {
		Head = Enum.BodyPart.Head,
		LeftArm = Enum.BodyPart.LeftArm,
		LeftLeg = Enum.BodyPart.LeftLeg,
		RightArm = Enum.BodyPart.RightArm,
		RightLeg = Enum.BodyPart.RightLeg,
		Torso = Enum.BodyPart.Torso
	},
	STATIC_FACIAL_ANIMATION = "StaticFacialAnimation",
	NON_EDITABLE_MAKEUP_GRANT_KEY = "NonEditableMakeup",
	INVENTORY_OUTFIT_TYPE_TO_OUTFIT_TYPE = {
		[InventoryOutfitType.Body] = OutfitTypesModule.Avatar,
		[InventoryOutfitType.Avatar] = OutfitTypesModule.Avatar,
		[InventoryOutfitType.DynamicHead] = OutfitTypesModule.DynamicHead,
		[InventoryOutfitType.Shoes] = OutfitTypesModule.Shoes,
		[InventoryOutfitType.Animations] = OutfitTypesModule.Animations,
		[InventoryOutfitType.PurchasedMakeup] = OutfitTypesModule.Makeup,
		[InventoryOutfitType.CreatedMakeup] = OutfitTypesModule.Makeup
	},
	INVENTORY_TYPE_ID_TO_INVENTORY_OUTFIT_TYPE = AvatarExperienceModelModule.Constants.InventoryTypeIdToInventoryOutfitType,
	INVENTORY_OUTFIT_TYPE_TO_INVENTORY_TYPE_ID = AvatarExperienceModelModule.Constants.InventoryOutfitTypeToInventoryTypeId,
	IXP_WIDGET_LAYER_EXPOSURE = { AttributeKey = "IXP_LAYER", TagName = "WIDGET" }
}