local SelectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)
local FFlagAXMISEnableMultiShopping = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p1): boolean
	-- upvalues: SelectTryOnBodyIdsModule (copy), FFlagAXMISEnableMultiShopping (copy)
	local SelectTryOnBodyIdsModuleResult = SelectTryOnBodyIdsModule(p1)
	local LastToggledItem = if FFlagAXMISEnableMultiShopping then p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem else nil
	for _, value in SelectTryOnBodyIdsModuleResult do
		local BundleInfo = p1.AvatarExperience.Common.BundleInfos[value]
		
		if FFlagAXMISEnableMultiShopping and BundleInfo and BundleInfo.isRecolorable and LastToggledItem and LastToggledItem.itemId == value then
			return true
		elseif not FFlagAXMISEnableMultiShopping and BundleInfo and BundleInfo.isRecolorable then
			return true
		end
	end
	return false
end