local Parent = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceRodux)
local DynamicHead = require(Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead

return function(List, Callback)
	-- upvalues: DynamicHead (copy), CryoModule (copy)
	local JoinResults = {}
	
	for i, value in List do
		if not value.bundleInfo then
			JoinResults[i] = value
			continue
		end
		local BundleInfo = {}
		
		for i1, value1 in value.bundleInfo do
			if value1.assetType == DynamicHead then
				local CallbackResult = Callback(value1)
				BundleInfo[i1] = if CallbackResult then CryoModule.Dictionary.join(value1, CallbackResult) else value1
			else
				BundleInfo[i1] = value1
			end
		end
		JoinResults[i] = CryoModule.Dictionary.join(value, { bundleInfo = BundleInfo })
	end
	return JoinResults
end