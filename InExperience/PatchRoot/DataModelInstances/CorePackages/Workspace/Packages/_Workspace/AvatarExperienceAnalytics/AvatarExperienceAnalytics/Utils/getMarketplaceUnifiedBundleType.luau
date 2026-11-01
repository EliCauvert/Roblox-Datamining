local BundleTypeIdStrings = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceModel).Constants.BundleTypeIdStrings

return function(p1)
	-- upvalues: BundleTypeIdStrings (copy)
	return if p1 == nil then nil else tonumber(p1) or tonumber(BundleTypeIdStrings[p1])
end