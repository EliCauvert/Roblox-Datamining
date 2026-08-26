local selectTryOnBodyIdsModule = require(script.Parent.selectTryOnBodyIds)
local fFlagAXMISEnableMultiShopping = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping

return function(p1)
	-- upvalues: selectTryOnBodyIdsModule (ref), fFlagAXMISEnableMultiShopping (ref)
	local var1 = if fFlagAXMISEnableMultiShopping then p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem else nil
	
	for i, v in selectTryOnBodyIdsModule(p1) do
		local var2 = p1.AvatarExperience.Common.BundleInfos[v]
		
		if not fFlagAXMISEnableMultiShopping or not var2 or (not var2.isRecolorable or not var1) or var1.itemId ~= v then
			if not fFlagAXMISEnableMultiShopping and var2 and var2.isRecolorable then
				return true
			end
		end
		return true
	end
	return false
end