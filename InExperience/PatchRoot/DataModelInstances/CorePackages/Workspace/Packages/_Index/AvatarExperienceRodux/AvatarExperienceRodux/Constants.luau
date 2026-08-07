local ASSET_TYPE_NAME_TO_ID_STRING = require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING
local t = { LCTops = "LCTops", LCBottoms = "LCBottoms" }
local t_1 = {
	[t.LCTops] = {
		ASSET_TYPE_NAME_TO_ID_STRING.ShirtAccessory,
		ASSET_TYPE_NAME_TO_ID_STRING.TShirtAccessory,
		ASSET_TYPE_NAME_TO_ID_STRING.SweaterAccessory
	},
	[t.LCBottoms] = {
		ASSET_TYPE_NAME_TO_ID_STRING.PantsAccessory,
		ASSET_TYPE_NAME_TO_ID_STRING.ShortsAccessory,
		ASSET_TYPE_NAME_TO_ID_STRING.DressSkirtAccessory
	}
}
local t_2 = {}

for i, v in t_1 do
	for i_1, v_1 in v do
		t_2[v_1] = i
	end
end
return {
	AssetCategory = t,
	AssetCategoryToAssetTypes = t_1,
	AssetTypeToAssetCategory = t_2
}