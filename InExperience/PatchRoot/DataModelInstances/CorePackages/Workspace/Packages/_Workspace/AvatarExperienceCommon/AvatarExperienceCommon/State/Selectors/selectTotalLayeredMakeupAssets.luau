local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local isMakeupAssetTypeModule = require(avatarExperienceCommon.Utils.isMakeupAssetType)
local selectTryOnItemsModule = require(script.Parent.selectTryOnItems)
local selectEquippedLayeredMakeupAssetsModule = require(script.Parent.selectEquippedLayeredMakeupAssets)
local fFlagAXMakeupEquipping = avatarExperienceFlagsModule.FFlagAXMakeupEquipping

return function(value)
	-- upvalues: fFlagAXMakeupEquipping (ref), selectEquippedLayeredMakeupAssetsModule (ref), selectTryOnItemsModule (ref), isMakeupAssetTypeModule (ref)
	if not fFlagAXMakeupEquipping then
		return 0
	end
	local count = #selectEquippedLayeredMakeupAssetsModule(value)
	local var1 = 0
	
	for i, v in selectTryOnItemsModule(value) do
		if v.selectedInTryOnManager and v.itemType and isMakeupAssetTypeModule(v.itemSubType) then
			var1 += 1
		end
	end
	return count + var1
end