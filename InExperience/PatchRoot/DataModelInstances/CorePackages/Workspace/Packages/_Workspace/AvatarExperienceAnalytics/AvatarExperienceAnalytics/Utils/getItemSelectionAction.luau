local MarketplaceUnifiedAction = require(script:FindFirstAncestor("AvatarExperienceAnalytics").UnifiedEventLogEnums).MarketplaceUnifiedAction

return function(p1)
	-- upvalues: MarketplaceUnifiedAction (copy)
	return if p1 then MarketplaceUnifiedAction.ITEM_DESELECTED else MarketplaceUnifiedAction.ITEM_SELECTED
end