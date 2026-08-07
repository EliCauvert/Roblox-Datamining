-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getFStringUGCLCAllowedAssetTypeIdsModule = require(parent.flags.getFStringUGCLCAllowedAssetTypeIds)

return {
	isRigidAccessoryAllowed = function(p0) --[[ line: 9 ]]
		-- upvalues: constantsModule (ref)
		local var2 = constantsModule.ASSET_TYPE_INFO[p0]
		
		return if var2 == nil then false else var2.rigidAllowed == true
	end,
	isLayeredClothingAllowed = function(p1) --[[ line: 18 ]]
		-- upvalues: getFStringUGCLCAllowedAssetTypeIdsModule (ref)
		return table.find(string.split(getFStringUGCLCAllowedAssetTypeIdsModule(), ","), tostring(p1.Value)) ~= nil
	end
}