local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local selectTryOnItemsModule = require(script.Parent.selectTryOnItems)
local fFlagAXMakeupEquipping = avatarExperienceFlagsModule.FFlagAXMakeupEquipping

return function(p1)
	-- upvalues: fFlagAXMakeupEquipping (ref), selectTryOnItemsModule (ref), isMakeupAssetTypeModule (ref)
	if not fFlagAXMakeupEquipping then
		return false
	end
	for i, v in selectTryOnItemsModule(p1) do
		if v.selectedInTryOnManager and v.itemType and isMakeupAssetTypeModule(v.itemSubType) then
			return true
		end
	end
	return false
end