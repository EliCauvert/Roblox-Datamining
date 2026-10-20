local IsMakeupAssetTypeModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Utils.isMakeupAssetType)
local SelectTryOnItemsModule = require(script.Parent.selectTryOnItems)
local SelectEquippedLayeredMakeupAssetsModule = require(script.Parent.selectEquippedLayeredMakeupAssets)

return function(p1): number
	-- upvalues: SelectEquippedLayeredMakeupAssetsModule (copy), SelectTryOnItemsModule (copy), IsMakeupAssetTypeModule (copy)
	local Count = #SelectEquippedLayeredMakeupAssetsModule(p1)
	local Count1 = 0
	
	for _, value in SelectTryOnItemsModule(p1) do
		if value.selectedInTryOnManager and value.itemType and IsMakeupAssetTypeModule(value.itemSubType) then
			Count1 += 1
		end
	end
	return Count + Count1
end