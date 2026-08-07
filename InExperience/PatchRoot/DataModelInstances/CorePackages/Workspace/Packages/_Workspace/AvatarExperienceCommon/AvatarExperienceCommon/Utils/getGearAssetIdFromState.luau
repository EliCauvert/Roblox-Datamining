local ASSET_TYPE_NAME_TO_ID_STRING = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).ASSET_TYPE_NAME_TO_ID_STRING
local getEquippedAssetIdsForTypeModule = require(script.Parent.getEquippedAssetIdsForType)

return function(p0) --[[ line: 6 ]]
	-- upvalues: getEquippedAssetIdsForTypeModule (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref)
	local equippedAssets = p0.AvatarEditor.Character.EquippedAssets
	
	if equippedAssets == nil then
		return 0
	end
	local _, var1 = next(getEquippedAssetIdsForTypeModule(equippedAssets, ASSET_TYPE_NAME_TO_ID_STRING.Gear))
	
	return if var1 then tonumber(var1) or 0 else 0
end