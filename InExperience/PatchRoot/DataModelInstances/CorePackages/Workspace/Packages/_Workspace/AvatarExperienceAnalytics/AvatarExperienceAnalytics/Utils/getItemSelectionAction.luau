local UnifiedEventLogEnumsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogEnums)

return function(p1) --[[ Line: 5 | Named "getItemSelectionAction" ]]
	-- upvalues: UnifiedEventLogEnumsModule (copy)
	return if p1 then UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED
end