local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getFStringUGCLCAllowedAssetTypeIdsModule = require(parent.flags.getFStringUGCLCAllowedAssetTypeIds)

return {
	isRigidAccessoryAllowed = function(p1)
		-- upvalues: constantsModule (ref)
		local var1 = constantsModule.ASSET_TYPE_INFO[p1]
		
		return if var1 == nil then false else var1.rigidAllowed == true
	end,
	isLayeredClothingAllowed = function(p1)
		-- upvalues: getFStringUGCLCAllowedAssetTypeIdsModule (ref)
		return table.find(string.split(getFStringUGCLCAllowedAssetTypeIdsModule(), ","), tostring(p1.Value)) ~= nil
	end
}