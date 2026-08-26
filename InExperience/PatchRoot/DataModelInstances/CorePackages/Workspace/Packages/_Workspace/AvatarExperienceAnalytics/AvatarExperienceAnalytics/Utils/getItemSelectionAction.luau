local unifiedEventLogEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogEnums)

return function(p1)
	-- upvalues: unifiedEventLogEnumsModule (ref)
	return if p1 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED
end