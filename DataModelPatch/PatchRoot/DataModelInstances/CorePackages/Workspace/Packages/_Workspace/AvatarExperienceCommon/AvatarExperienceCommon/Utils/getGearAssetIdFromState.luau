local ASSETTYPENAMETOIDSTRING = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants).ASSET_TYPE_NAME_TO_ID_STRING
local GetEquippedAssetIdsForTypeModule = require(script.Parent.getEquippedAssetIdsForType)

return function(p1): number
	-- upvalues: GetEquippedAssetIdsForTypeModule (copy), ASSETTYPENAMETOIDSTRING (copy)
	local EquippedAssets = p1.AvatarEditor.Character.EquippedAssets
	
	if EquippedAssets == nil then
		return 0
	else
		local _, Value = next((GetEquippedAssetIdsForTypeModule(EquippedAssets, ASSETTYPENAMETOIDSTRING.Gear)))
		
		return Value and tonumber(Value) or 0
	end
end