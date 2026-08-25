local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createGlobalChatTooltipStoreModule = require(script.createGlobalChatTooltipStore)
local fetchGlobalChatTooltipEligibilityModule = require(script.fetchGlobalChatTooltipEligibility)

return signalsModule.createComputed(function()
	-- upvalues: createGlobalChatTooltipStoreModule (ref), fetchGlobalChatTooltipEligibilityModule (ref)
	local var3 = createGlobalChatTooltipStoreModule()
	var3.reportImpression = fetchGlobalChatTooltipEligibilityModule.reportImpression
	fetchGlobalChatTooltipEligibilityModule.fetchEligibility(function(p0)
		-- upvalues: var3 (ref)
		var3.setIsGlobalChatTooltipEligible(p0.shouldShowTooltip)
	end)
	
	return var3
end)