local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local GetFStringUGCLCAllowedAssetTypeIdsModule = require(Parent.flags.getFStringUGCLCAllowedAssetTypeIds)

return {
	isRigidAccessoryAllowed = function(p1): boolean
		-- upvalues: ConstantsModule (copy)
		local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[p1]
		
		return ASSETTYPE ~= nil and ASSETTYPE.rigidAllowed == true
	end,
	isLayeredClothingAllowed = function(p1): boolean
		-- upvalues: GetFStringUGCLCAllowedAssetTypeIdsModule (copy)
		return table.find(string.split(GetFStringUGCLCAllowedAssetTypeIdsModule(), ","), (tostring(p1.Value))) ~= nil
	end
}