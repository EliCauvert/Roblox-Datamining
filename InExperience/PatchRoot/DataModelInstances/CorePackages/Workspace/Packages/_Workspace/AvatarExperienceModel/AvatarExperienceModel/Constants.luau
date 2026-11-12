local AvatarExperienceModel = script:FindFirstAncestor("AvatarExperienceModel")
local _ = require(AvatarExperienceModel.Types.CommonTypes)
local InventoryOutfitTypeModule = require(AvatarExperienceModel.Enums.InventoryOutfitType)
local FFlagAXInventoryDurablesSupport = require(AvatarExperienceModel.Parent.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport
local BundleTypeIdStrings = {}
local BundleTypeIdStringToName = {}
local EnumItems = Enum.BundleType:GetEnumItems()

for _, enumItem in EnumItems do
	BundleTypeIdStrings[enumItem.Name] = tostring(enumItem.Value)
	BundleTypeIdStringToName[tostring(enumItem.Value)] = enumItem.Name
end
if FFlagAXInventoryDurablesSupport then
	local Text = tostring(#EnumItems + 1)
	BundleTypeIdStrings.Avatars = Text
	BundleTypeIdStringToName[Text] = "Avatars"
end
local CameraZoomRadius = {
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
		Bodysuits = 12
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
local InventoryTypeIdToInventoryOutfitType = {
	["1"] = InventoryOutfitTypeModule.Body,
	["2"] = InventoryOutfitTypeModule.DynamicHead,
	["3"] = InventoryOutfitTypeModule.Avatar,
	["4"] = InventoryOutfitTypeModule.Shoes,
	["5"] = InventoryOutfitTypeModule.Animations,
	["6"] = InventoryOutfitTypeModule.PurchasedMakeup,
	["7"] = InventoryOutfitTypeModule.CreatedMakeup
}
local InventoryOutfitTypeToInventoryTypeId = {}

for i, value in InventoryTypeIdToInventoryOutfitType do
	InventoryOutfitTypeToInventoryTypeId[value] = tonumber(i)
end
return {
	AnimationCategoryCameraZoomRadius = 5,
	BundleTypeIdStrings = BundleTypeIdStrings,
	BundleTypeIdStringToName = BundleTypeIdStringToName,
	CameraZoomRadius = CameraZoomRadius,
	InventoryOutfitTypeToInventoryTypeId = InventoryOutfitTypeToInventoryTypeId,
	InventoryTypeIdToInventoryOutfitType = InventoryTypeIdToInventoryOutfitType
}