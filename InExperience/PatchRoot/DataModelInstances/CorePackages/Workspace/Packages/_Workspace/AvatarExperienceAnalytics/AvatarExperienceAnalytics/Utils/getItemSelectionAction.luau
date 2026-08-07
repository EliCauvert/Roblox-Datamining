local unifiedEventLogEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogEnums)

return function(p0) --[[ line: 5 | named "getItemSelectionAction" ]]
	-- upvalues: unifiedEventLogEnumsModule (ref)
	return if p0 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED
end