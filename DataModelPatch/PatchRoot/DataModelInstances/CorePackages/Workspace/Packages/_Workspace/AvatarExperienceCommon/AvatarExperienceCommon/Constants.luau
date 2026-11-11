local LabelAbuseTypeMappingModule = require(script.Parent.LabelAbuseTypeMapping)
local _ = require(script.Parent.Types.CategoryTypes.CategoryTypes)
local AvatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags)
local FFlagAXCatalogBodySuits = AvatarExperienceFlagsModule.FFlagAXCatalogBodySuits
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXMakeupEquipping = AvatarExperienceFlagsModule.FFlagAXMakeupEquipping
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local t = {}
local Names = {}
local EnumItems = Enum.BundleType:GetEnumItems()

for _, enumItem in EnumItems do
	t[enumItem.Name] = tostring(enumItem.Value)
	Names[tostring(enumItem.Value)] = enumItem.Name
end
if FFlagAXInventoryDurablesSupport then
	local Text = tostring(#EnumItems + 1)
	t.Avatars = Text
	Names[Text] = "Avatars"
end
local config = {
	["1"] = "Body",
	["2"] = "AvatarAnimations",
	["3"] = "Shoes",
	["4"] = "DynamicHead"
}
local HumanoidDescription = {}
local Names1 = {}

for _, enumItem1 in Enum.AvatarAssetType:GetEnumItems() do
	HumanoidDescription[enumItem1.Name] = tostring(enumItem1.Value)
	Names1[tostring(enumItem1.Value)] = enumItem1.Name
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
local t1 = {}

for i, value in config1 do
	t1[value] = i
end
local AXMakeupZoomRadius = game:DefineFastInt("AXMakeupZoomRadius", 7)
local AXMakeupLooksZoomRadius = game:DefineFastInt("AXMakeupLooksZoomRadius", 7)
local AXEyelashesZoomRadius = game:DefineFastInt("AXEyelashesZoomRadius", 7)
local AXEyebrowsZoomRadius = game:DefineFastInt("AXEyebrowsZoomRadius", 7)
local AXFaceMakeupZoomRadius = game:DefineFastInt("AXFaceMakeupZoomRadius", 7)
local AXLipMakeupZoomRadius = game:DefineFastInt("AXLipMakeupZoomRadius", 7)
local AXEyeMakeupZoomRadius = game:DefineFastInt("AXEyeMakeupZoomRadius", 7)

return {
	BODY_BUNDLE_TYPE_ID = "1",
	AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2",
	SHOES_BUNDLE_TYPE_ID = "3",
	DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4",
	BUNDLE_TYPE_ID_STRINGS = t,
	BUNDLE_TYPE_ID_STRING_TO_NAME = Names,
	BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = config,
	ASSET_TYPE_TO_ACCESSORY_TYPE = config1,
	ACCESSORY_TYPE_TO_ASSET_TYPE = t1,
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
	ASSET_TYPE_ID_STRING_TO_NAME = Names1,
	NAVIGATION_DIRECTION = { IS_LEFT = "IS_LEFT", IS_RIGHT = "IS_RIGHT" },
	LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6,
	LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4,
	CAMERA_ZOOM_RADIUS = {
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
			Bodysuits = if FFlagAXCatalogBodySuits then 12 else nil
		},
		Makeup = if FFlagAXCustomizeMakeupSupport or FFlagAXCatalogMakeupSupport then {
			Makeup = AXMakeupZoomRadius,
			MakeupLooks = AXMakeupLooksZoomRadius,
			Eyelashes = AXEyelashesZoomRadius,
			Eyebrows = AXEyebrowsZoomRadius,
			FaceMakeup = AXFaceMakeupZoomRadius,
			LipMakeup = AXLipMakeupZoomRadius,
			EyeMakeup = AXEyeMakeupZoomRadius
		} else nil,
		Special = { HeadRefinement = 7 }
	},
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
	ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = if FFlagAXMakeupEquipping or FFlagAXCustomizeMakeupSupport then {
		[HumanoidDescription.EyeMakeup] = Enum.MakeupType.Eye,
		[HumanoidDescription.FaceMakeup] = Enum.MakeupType.Face,
		[HumanoidDescription.LipMakeup] = Enum.MakeupType.Lip
	} else nil,
	MAKEUP_TYPE_TO_ASSET_TYPE_ID = if FFlagAXCustomizeMakeupSupport then {
		[Enum.MakeupType.Eye] = HumanoidDescription.EyeMakeup,
		[Enum.MakeupType.Face] = HumanoidDescription.FaceMakeup,
		[Enum.MakeupType.Lip] = HumanoidDescription.LipMakeup
	} else nil,
	LAYERED_MAKEUP_ORDER = if FFlagAXCustomizeMakeupSupport then {
		[HumanoidDescription.FaceMakeup] = 0,
		[HumanoidDescription.LipMakeup] = 1,
		[HumanoidDescription.EyeMakeup] = 2
	} else nil,
	MAKEUP_LOOK_ASSET_TYPES = {
		[HumanoidDescription.EyeMakeup] = true,
		[HumanoidDescription.FaceMakeup] = true,
		[HumanoidDescription.LipMakeup] = true,
		[HumanoidDescription.EyebrowAccessory] = true,
		[HumanoidDescription.EyelashAccessory] = true
	},
	MAX_MAKEUP_LAYERS = 6,
	LOOK_TYPE = { Avatar = "Avatar", Makeup = "Makeup", Outfit = "Outfit" },
	MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2,
	LabelAbuseTypeMapping = LabelAbuseTypeMappingModule,
	IXP_WIDGET_LAYER_EXPOSURE = { AttributeKey = "IXP_LAYER", TagName = "WIDGET" }
}