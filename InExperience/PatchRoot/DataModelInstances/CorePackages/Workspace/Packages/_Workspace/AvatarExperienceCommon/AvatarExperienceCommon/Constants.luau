local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local labelAbuseTypeMappingModule = require(script.Parent.LabelAbuseTypeMapping)
local _ = require(script.Parent.Types.CategoryTypes.CategoryTypes)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local outfitTypesModule = require(script.Parent.Enums.OutfitTypes)
local inventoryOutfitTypeModule = require(script.Parent.Enums.InventoryOutfitType)
local fFlagAXCatalogBodySuits = avatarExperienceFlagsModule.FFlagAXCatalogBodySuits
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local fFlagAXInventoryDurablesSupport = avatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local t = {}
local t_1 = {}
local enumItems = Enum.BundleType:GetEnumItems()

for i, v in enumItems do
	t[v.Name] = tostring(v.Value)
	t_1[tostring(v.Value)] = v.Name
end
if fFlagAXInventoryDurablesSupport then
	local var1 = tostring(#enumItems + 1)
	t.Avatars = var1
	t_1[var1] = "Avatars"
end
local t_2 = {
	["1"] = "Body",
	["2"] = "AvatarAnimations",
	["3"] = "Shoes",
	["4"] = "DynamicHead"
}
local t_3 = {}
local t_4 = {}

for i_1, v_1 in Enum.AvatarAssetType:GetEnumItems() do
	t_3[v_1.Name] = tostring(v_1.Value)
	t_4[tostring(v_1.Value)] = v_1.Name
end
local t_5 = {
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
local t_6 = {}

for i_2, v_2 in t_5 do
	t_6[v_2] = i_2
end
local t_7 = {
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
local t_8 = {
	bodyType = "BodyTypeScale",
	head = "HeadScale",
	height = "HeightScale",
	proportion = "ProportionScale",
	depth = "DepthScale",
	width = "WidthScale"
}
local t_9 = {
	headColor3 = "HeadColor",
	leftArmColor3 = "LeftArmColor",
	leftLegColor3 = "LeftLegColor",
	rightArmColor3 = "RightArmColor",
	rightLegColor3 = "RightLegColor",
	torsoColor3 = "TorsoColor"
}
local t_10 = { IS_LEFT = "IS_LEFT", IS_RIGHT = "IS_RIGHT" }
local t_11 = {
	BodyCategories = {
		Heads = 8.5,
		Hair = 8.5,
		ClassicHeads = 6.5,
		ClassicFaces = 7
	},
	DynamicBodyCategories = {
		Style = 6.5,
		Hair = 8.5,
		ClassicHeads = 6.5,
		ClassicFaces = 7,
		Torsos = 9,
		Arms = 13,
		Legs = 13.5
	},
	CatalogAccessories = {
		Hats = 11,
		Face = 4.5,
		Neck = 9,
		Shoulder = 11,
		Front = 9.5,
		Back = 21,
		Waist = 17
	},
	AvatarEditorAccessories = {
		Hats = 11,
		Face = 7,
		Neck = 9,
		Shoulder = 11,
		Front = 9.5,
		Back = 21,
		Waist = 17
	},
	AccessoryAdjustment = {
		Hat = 11,
		Face = 7,
		Neck = 9,
		Shoulder = 11,
		Front = 21,
		Back = 21,
		Waist = 17
	},
	Clothing = {
		Shirts = 12,
		TShirts = 12,
		Sweaters = 12,
		Jackets = 12,
		Pants = 12,
		Shorts = 12,
		Shoes = 12,
		ClassicShirts = 12,
		ClassicTShirts = 12,
		ClassicPants = 12,
		Tops = 12,
		Outerwear = 12,
		Bottoms = 12,
		Bodysuits = if fFlagAXCatalogBodySuits then 12 else nil
	},
	Makeup = {
		Makeup = game:DefineFastInt("AXMakeupZoomRadius", 7),
		MakeupLooks = game:DefineFastInt("AXMakeupLooksZoomRadius", 7),
		Eyelashes = game:DefineFastInt("AXEyelashesZoomRadius", 7),
		Eyebrows = game:DefineFastInt("AXEyebrowsZoomRadius", 7),
		FaceMakeup = game:DefineFastInt("AXFaceMakeupZoomRadius", 7),
		LipMakeup = game:DefineFastInt("AXLipMakeupZoomRadius", 7),
		EyeMakeup = game:DefineFastInt("AXEyeMakeupZoomRadius", 7)
	},
	Special = { HeadRefinement = 7 }
}
local t_12 = {
	Seen = "AXTooltipSeen",
	TimeDismiss = "AXTooltipTimeDismiss",
	ClickDismiss = "AXTooltipClickDismiss",
	CallbackDismiss = "AXTooltipCallbackDismiss"
}
local t_13 = {
	CreateOutfitKey = "avatar.createOutfit",
	CreateMakeupLookKey = if fFlagAXCatalogMakeupSupport then "avatar.createMakeupLook" else nil
}
local t_14 = {
	[t_3.EyebrowAccessory] = 0,
	[t_3.EyelashAccessory] = 1,
	[t_3.Pants] = 2,
	[t_3.Shirt] = 3,
	[t_3.TShirt] = 4,
	[t_3.LeftShoeAccessory] = 5,
	[t_3.RightShoeAccessory] = 5,
	[t_3.PantsAccessory] = 6,
	[t_3.ShortsAccessory] = 7,
	[t_3.DressSkirtAccessory] = 8,
	[t_3.TShirtAccessory] = 9,
	[t_3.ShirtAccessory] = 10,
	[t_3.SweaterAccessory] = 11,
	[t_3.JacketAccessory] = 12,
	[t_3.HairAccessory] = 13
}
local t_15 = {
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
local t_16 = {
	[t_3.EyeMakeup] = true,
	[t_3.FaceMakeup] = true,
	[t_3.LipMakeup] = true,
	[t_3.EyebrowAccessory] = true,
	[t_3.EyelashAccessory] = true
}
local t_17 = { Avatar = "Avatar", Makeup = "Makeup", Outfit = "Outfit" }
local t_18 = {
	[t_3.EyeMakeup] = Enum.MakeupType.Eye,
	[t_3.FaceMakeup] = Enum.MakeupType.Face,
	[t_3.LipMakeup] = Enum.MakeupType.Lip
}
local t_19 = {
	[Enum.MakeupType.Eye] = t_3.EyeMakeup,
	[Enum.MakeupType.Face] = t_3.FaceMakeup,
	[Enum.MakeupType.Lip] = t_3.LipMakeup
}
local t_20 = {
	[t_3.FaceMakeup] = 0,
	[t_3.LipMakeup] = 1,
	[t_3.EyeMakeup] = 2
}
local t_21 = {
	Head = Enum.BodyPart.Head,
	LeftArm = Enum.BodyPart.LeftArm,
	LeftLeg = Enum.BodyPart.LeftLeg,
	RightArm = Enum.BodyPart.RightArm,
	RightLeg = Enum.BodyPart.RightLeg,
	Torso = Enum.BodyPart.Torso
}
local t_22 = { AttributeKey = "IXP_LAYER", TagName = "WIDGET" }
local t_23 = {
	[inventoryOutfitTypeModule.Body] = outfitTypesModule.Avatar,
	[inventoryOutfitTypeModule.Avatar] = outfitTypesModule.Avatar,
	[inventoryOutfitTypeModule.DynamicHead] = outfitTypesModule.DynamicHead,
	[inventoryOutfitTypeModule.Shoes] = outfitTypesModule.Shoes,
	[inventoryOutfitTypeModule.Animations] = outfitTypesModule.Animations,
	[inventoryOutfitTypeModule.PurchasedMakeup] = outfitTypesModule.Makeup,
	[inventoryOutfitTypeModule.CreatedMakeup] = outfitTypesModule.Makeup
}
local t_24 = {
	["1"] = inventoryOutfitTypeModule.Body,
	["2"] = inventoryOutfitTypeModule.DynamicHead,
	["3"] = inventoryOutfitTypeModule.Avatar,
	["4"] = inventoryOutfitTypeModule.Shoes,
	["5"] = inventoryOutfitTypeModule.Animations,
	["6"] = inventoryOutfitTypeModule.PurchasedMakeup,
	["7"] = inventoryOutfitTypeModule.CreatedMakeup
}
local t_25 = {}

for i_3, v_3 in t_24 do
	t_25[v_3] = tonumber(i_3)
end
return {
	BODY_BUNDLE_TYPE_ID = "1",
	AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2",
	SHOES_BUNDLE_TYPE_ID = "3",
	DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4",
	BUNDLE_TYPE_ID_STRINGS = t,
	BUNDLE_TYPE_ID_STRING_TO_NAME = t_1,
	BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = t_2,
	ASSET_TYPE_TO_ACCESSORY_TYPE = t_5,
	ACCESSORY_TYPE_TO_ASSET_TYPE = t_6,
	ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = t_7,
	HUMANOID_DESCRIPTION_SCALE_TO_NAME = t_8,
	BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = t_9,
	ASSET_TYPE_NAME_TO_ID_STRING = t_3,
	ASSET_TYPE_ID_STRING_TO_NAME = t_4,
	NAVIGATION_DIRECTION = t_10,
	LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6,
	LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4,
	CAMERA_ZOOM_RADIUS = t_11,
	AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356",
	AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey",
	AX_TOOLTIP_COUNTERS = t_12,
	AVATAR_EDITOR_CONSTANTS = t_13,
	LAYERED_CLOTHING_ORDER = t_14,
	LAYERED_ASSET_TYPES = t_15,
	ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = t_18,
	MAKEUP_TYPE_TO_ASSET_TYPE_ID = t_19,
	LAYERED_MAKEUP_ORDER = t_20,
	MAKEUP_LOOK_ASSET_TYPES = t_16,
	MAX_MAKEUP_LAYERS = 6,
	LOOK_TYPE = t_17,
	MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2,
	LabelAbuseTypeMapping = labelAbuseTypeMappingModule,
	BODY_PART_NAME_TO_ENUM = t_21,
	STATIC_FACIAL_ANIMATION = "StaticFacialAnimation",
	NON_EDITABLE_MAKEUP_GRANT_KEY = "NonEditableMakeup",
	INVENTORY_OUTFIT_TYPE_TO_OUTFIT_TYPE = t_23,
	INVENTORY_TYPE_ID_TO_INVENTORY_OUTFIT_TYPE = t_24,
	INVENTORY_OUTFIT_TYPE_TO_INVENTORY_TYPE_ID = t_25,
	IXP_WIDGET_LAYER_EXPOSURE = t_22
}