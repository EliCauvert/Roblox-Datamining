local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local BundleTypeIdStrings = require(Parent.AvatarExperienceModel).Constants.BundleTypeIdStrings
local UnifiedEventEnumsModule = require(Parent.UnifiedEventEnums)

return function(p1)
	-- upvalues: UnifiedEventEnumsModule (copy), BundleTypeIdStrings (copy)
	return if p1 == nil then nil else UnifiedEventEnumsModule.toMarketplaceBundleType(tonumber(p1) or tonumber(BundleTypeIdStrings[p1]))
end