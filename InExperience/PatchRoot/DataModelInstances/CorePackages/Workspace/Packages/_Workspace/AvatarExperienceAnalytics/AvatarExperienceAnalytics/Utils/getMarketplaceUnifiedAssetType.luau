local UnifiedEventEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.UnifiedEventEnums)

return function(p1)
	-- upvalues: UnifiedEventEnumsModule (copy)
	return if p1 == nil then nil else UnifiedEventEnumsModule.toAssetType((tonumber(p1)))
end