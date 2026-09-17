local isMakeupAssetTypeModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Utils.isMakeupAssetType)
local selectTryOnItemsModule = require(script.Parent.selectTryOnItems)

return function(p1)
	-- upvalues: selectTryOnItemsModule (ref), isMakeupAssetTypeModule (ref)
	for i, v in selectTryOnItemsModule(p1) do
		if v.selectedInTryOnManager and v.itemType and isMakeupAssetTypeModule(v.itemSubType) then
			return true
		end
	end
	return false
end