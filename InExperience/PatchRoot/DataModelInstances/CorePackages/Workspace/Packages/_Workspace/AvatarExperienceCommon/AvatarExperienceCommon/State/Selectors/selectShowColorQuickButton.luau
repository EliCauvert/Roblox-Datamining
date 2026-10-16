local SelectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)

return function(p1): boolean --[[ Line: 3 | Named "selectShowColorQuickButton" ]]
	-- upvalues: SelectTryOnBodyIdsModule (copy)
	local LastToggledItem = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem
	
	for _, value in SelectTryOnBodyIdsModule(p1) do
		local BundleInfo = p1.AvatarExperience.Common.BundleInfos[value]
		
		if BundleInfo and BundleInfo.isRecolorable and LastToggledItem and LastToggledItem.itemId == value then
			return true
		end
	end
	return false
end