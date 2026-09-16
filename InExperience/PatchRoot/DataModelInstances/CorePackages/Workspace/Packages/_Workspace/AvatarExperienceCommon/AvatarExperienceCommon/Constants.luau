local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local labelAbuseTypeMappingModule = require(script.Parent.LabelAbuseTypeMapping)
local _ = require(script.Parent.Types.CategoryTypes.CategoryTypes)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local outfitTypesModule = require(script.Parent.Enums.OutfitTypes)
local inventoryOutfitType = require(parent.AvatarExperienceModel).Enums.InventoryOutfitType
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local t = {
	["1"] = "Body",
	["2"] = "AvatarAnimations",
	["3"] = "Shoes",
	["4"] = "DynamicHead"
}
local t_1 = {}
local t_2 = {}

for i, v in Enum.AvatarAssetType:GetEnumItems() do
	t_1[v.Name] = tostring(v.Value)
	t_2[tostring(v.Value)] = v.Name
end
local t_3 = {
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
local t_4 = {}

for i_1, v_1 in t_3 do
	t_4[v_1] = i_1
end
local t_5 = {
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
}
local t_6 = {
	bodyType = "BodyTypeScale",
	head = "HeadScale",
	height = "HeightScale",
	proportion = "ProportionScale",
	depth = "DepthScale",
	width = "WidthScale"
}
local t_7 = {
	headColor3 = "HeadColor",
	leftArmColor3 = "LeftArmColor",
	leftLegColor3 = "LeftLegColor",
	rightArmColor3 = "RightArmColor",
	rightLegColor3 = "RightLegColor",
	torsoColor3 = "TorsoColor"
}
local t_8 = { IS_LEFT = "IS_LEFT", IS_RIGHT = "IS_RIGHT" }
local t_9 = {
	Seen = "AXTooltipSeen",
	TimeDismiss = "AXTooltipTimeDismiss",
	ClickDismiss = "AXTooltipClickDismiss",
	CallbackDismiss = "AXTooltipCallbackDismiss"
}
local t_10 = {
	CreateOutfitKey = "avatar.createOutfit",
	CreateMakeupLookKey = if fFlagAXCatalogMakeupSupport then "avatar.createMakeupLook" else nil
}
local t_11 = {
	[t_1.EyebrowAccessory] = 0,
	[t_1.EyelashAccessory] = 1,
	[t_1.Pants] = 2,
	[t_1.Shirt] = 3,
	[t_1.TShirt] = 4,
	[t_1.LeftShoeAccessory] = 5,
	[t_1.RightShoeAccessory] = 5,
	[t_1.PantsAccessory] = 6,
	[t_1.ShortsAccessory] = 7,
	[t_1.DressSkirtAccessory] = 8,
	[t_1.TShirtAccessory] = 9,
	[t_1.ShirtAccessory] = 10,
	[t_1.SweaterAccessory] = 11,
	[t_1.JacketAccessory] = 12,
	[t_1.HairAccessory] = 13
}
local t_12 = {
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
}
local t_13 = {
	[t_1.EyeMakeup] = true,
	[t_1.FaceMakeup] = true,
	[t_1.LipMakeup] = true,
	[t_1.EyebrowAccessory] = true,
	[t_1.EyelashAccessory] = true
}
local t_14 = { Avatar = "Avatar", Makeup = "Makeup", Outfit = "Outfit" }
local t_15 = {
	[t_1.EyeMakeup] = Enum.MakeupType.Eye,
	[t_1.FaceMakeup] = Enum.MakeupType.Face,
	[t_1.LipMakeup] = Enum.MakeupType.Lip
}
local t_16 = {
	[Enum.MakeupType.Eye] = t_1.EyeMakeup,
	[Enum.MakeupType.Face] = t_1.FaceMakeup,
	[Enum.MakeupType.Lip] = t_1.LipMakeup
}
local t_17 = {
	[t_1.FaceMakeup] = 0,
	[t_1.LipMakeup] = 1,
	[t_1.EyeMakeup] = 2
}
local t_18 = {
	Head = Enum.BodyPart.Head,
	LeftArm = Enum.BodyPart.LeftArm,
	LeftLeg = Enum.BodyPart.LeftLeg,
	RightArm = Enum.BodyPart.RightArm,
	RightLeg = Enum.BodyPart.RightLeg,
	Torso = Enum.BodyPart.Torso
}
local t_19 = { AttributeKey = "IXP_LAYER", TagName = "WIDGET" }
local t_20 = {
	[inventoryOutfitType.Body] = outfitTypesModule.Avatar,
	[inventoryOutfitType.Avatar] = outfitTypesModule.Avatar,
	[inventoryOutfitType.DynamicHead] = outfitTypesModule.DynamicHead,
	[inventoryOutfitType.Shoes] = outfitTypesModule.Shoes,
	[inventoryOutfitType.Animations] = outfitTypesModule.Animations,
	[inventoryOutfitType.PurchasedMakeup] = outfitTypesModule.Makeup,
	[inventoryOutfitType.CreatedMakeup] = outfitTypesModule.Makeup
}
local t_21 = {
	["1"] = inventoryOutfitType.Body,
	["2"] = inventoryOutfitType.DynamicHead,
	["3"] = inventoryOutfitType.Avatar,
	["4"] = inventoryOutfitType.Shoes,
	["5"] = inventoryOutfitType.Animations,
	["6"] = inventoryOutfitType.PurchasedMakeup,
	["7"] = inventoryOutfitType.CreatedMakeup
}
local t_22 = {}

for i_2, v_2 in t_21 do
	t_22[v_2] = tonumber(i_2)
end
return {
	BODY_BUNDLE_TYPE_ID = "1",
	AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2",
	SHOES_BUNDLE_TYPE_ID = "3",
	DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4",
	BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = t,
	ASSET_TYPE_TO_ACCESSORY_TYPE = t_3,
	ACCESSORY_TYPE_TO_ASSET_TYPE = t_4,
	ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = t_5,
	HUMANOID_DESCRIPTION_SCALE_TO_NAME = t_6,
	BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = t_7,
	ASSET_TYPE_NAME_TO_ID_STRING = t_1,
	ASSET_TYPE_ID_STRING_TO_NAME = t_2,
	NAVIGATION_DIRECTION = t_8,
	LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6,
	LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4,
	AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356",
	AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey",
	AX_TOOLTIP_COUNTERS = t_9,
	AVATAR_EDITOR_CONSTANTS = t_10,
	LAYERED_CLOTHING_ORDER = t_11,
	LAYERED_ASSET_TYPES = t_12,
	ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = t_15,
	MAKEUP_TYPE_TO_ASSET_TYPE_ID = t_16,
	LAYERED_MAKEUP_ORDER = t_17,
	MAKEUP_LOOK_ASSET_TYPES = t_13,
	MAX_MAKEUP_LAYERS = 6,
	LOOK_TYPE = t_14,
	MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2,
	LabelAbuseTypeMapping = labelAbuseTypeMappingModule,
	BODY_PART_NAME_TO_ENUM = t_18,
	STATIC_FACIAL_ANIMATION = "StaticFacialAnimation",
	NON_EDITABLE_MAKEUP_GRANT_KEY = "NonEditableMakeup",
	INVENTORY_OUTFIT_TYPE_TO_OUTFIT_TYPE = t_20,
	INVENTORY_TYPE_ID_TO_INVENTORY_OUTFIT_TYPE = t_21,
	INVENTORY_OUTFIT_TYPE_TO_INVENTORY_TYPE_ID = t_22,
	IXP_WIDGET_LAYER_EXPOSURE = t_19
}