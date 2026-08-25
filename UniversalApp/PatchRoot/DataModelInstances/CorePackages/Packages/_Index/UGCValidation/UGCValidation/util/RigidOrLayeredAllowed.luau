local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getFStringUGCLCAllowedAssetTypeIdsModule = require(parent.flags.getFStringUGCLCAllowedAssetTypeIds)

return {
	isRigidAccessoryAllowed = function(p0)
		-- upvalues: constantsModule (ref)
		local var2 = constantsModule.ASSET_TYPE_INFO[p0]
		
		return if var2 == nil then false else var2.rigidAllowed == true
	end,
	isLayeredClothingAllowed = function(p1)
		-- upvalues: getFStringUGCLCAllowedAssetTypeIdsModule (ref)
		return table.find(string.split(getFStringUGCLCAllowedAssetTypeIdsModule(), ","), tostring(p1.Value)) ~= nil
	end
}