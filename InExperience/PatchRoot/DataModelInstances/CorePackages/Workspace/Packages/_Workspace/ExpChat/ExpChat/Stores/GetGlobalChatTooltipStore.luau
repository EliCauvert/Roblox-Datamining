local CreateGlobalChatTooltipStoreModule = require(script.createGlobalChatTooltipStore)
local FetchGlobalChatTooltipEligibilityModule = require(script.fetchGlobalChatTooltipEligibility)

return require(script:FindFirstAncestor("ExpChat").Parent.Signals).createComputed(function()
	-- upvalues: CreateGlobalChatTooltipStoreModule (copy), FetchGlobalChatTooltipEligibilityModule (copy)
	local GlobalChatTooltipStoreModule = CreateGlobalChatTooltipStoreModule()
	GlobalChatTooltipStoreModule.reportImpression = FetchGlobalChatTooltipEligibilityModule.reportImpression
	FetchGlobalChatTooltipEligibilityModule.fetchEligibility(function(p1)
		-- upvalues: GlobalChatTooltipStoreModule (copy)
		GlobalChatTooltipStoreModule.setIsGlobalChatTooltipEligible(p1.shouldShowTooltip)
	end)
	
	return GlobalChatTooltipStoreModule
end)