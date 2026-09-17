local isMakeupAssetTypeModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Utils.isMakeupAssetType)
local selectTryOnItemsModule = require(script.Parent.selectTryOnItems)
local selectEquippedLayeredMakeupAssetsModule = require(script.Parent.selectEquippedLayeredMakeupAssets)

return function(value)
	-- upvalues: selectEquippedLayeredMakeupAssetsModule (ref), selectTryOnItemsModule (ref), isMakeupAssetTypeModule (ref)
	local count = #selectEquippedLayeredMakeupAssetsModule(value)
	local var1 = 0
	
	for i, v in selectTryOnItemsModule(value) do
		if v.selectedInTryOnManager and v.itemType and isMakeupAssetTypeModule(v.itemSubType) then
			var1 += 1
		end
	end
	return count + var1
end