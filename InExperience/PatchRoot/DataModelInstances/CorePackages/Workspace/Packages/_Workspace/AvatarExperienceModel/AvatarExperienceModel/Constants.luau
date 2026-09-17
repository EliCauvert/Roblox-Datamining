local avatarExperienceModel = script:FindFirstAncestor("AvatarExperienceModel")
local _ = require(avatarExperienceModel.Types.CommonTypes)
local avatarExperienceFlagsModule = require(avatarExperienceModel.Parent.AvatarExperienceFlags)
local fFlagAXCatalogBodySuits = avatarExperienceFlagsModule.FFlagAXCatalogBodySuits
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
return {
	AnimationCategoryCameraZoomRadius = 5,
	BundleTypeIdStrings = t,
	BundleTypeIdStringToName = t_1,
	CameraZoomRadius = {
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
}