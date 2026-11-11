local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local IsMakeupAssetTypeModule = require(AvatarExperienceCommon.Utils.isMakeupAssetType)
local SelectTryOnItemsModule = require(script.Parent.selectTryOnItems)
local FFlagAXMakeupEquipping = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags).FFlagAXMakeupEquipping

return function(p1): boolean
	-- upvalues: FFlagAXMakeupEquipping (copy), SelectTryOnItemsModule (copy), IsMakeupAssetTypeModule (copy)
	if not FFlagAXMakeupEquipping then
		return false
	end
	for _, value in SelectTryOnItemsModule(p1) do
		if value.selectedInTryOnManager and value.itemType and IsMakeupAssetTypeModule(value.itemSubType) then
			return true
		end
	end
	return false
end