local IsMakeupAssetTypeModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Utils.isMakeupAssetType)
local SelectTryOnItemsModule = require(script.Parent.selectTryOnItems)

return function(p1): boolean --[[ Line: 9 | Named "selectHasMakeupTryOn" ]]
	-- upvalues: SelectTryOnItemsModule (copy), IsMakeupAssetTypeModule (copy)
	for _, value in SelectTryOnItemsModule(p1) do
		if value.selectedInTryOnManager and value.itemType and IsMakeupAssetTypeModule(value.itemSubType) then
			return true
		end
	end
	return false
end