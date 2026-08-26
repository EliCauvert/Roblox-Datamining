local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createGlobalChatTooltipStoreModule = require(script.createGlobalChatTooltipStore)
local fetchGlobalChatTooltipEligibilityModule = require(script.fetchGlobalChatTooltipEligibility)

return signalsModule.createComputed(function()
	-- upvalues: createGlobalChatTooltipStoreModule (ref), fetchGlobalChatTooltipEligibilityModule (ref)
	local var1 = createGlobalChatTooltipStoreModule()
	var1.reportImpression = fetchGlobalChatTooltipEligibilityModule.reportImpression
	fetchGlobalChatTooltipEligibilityModule.fetchEligibility(function(p1)
		-- upvalues: var1 (ref)
		var1.setIsGlobalChatTooltipEligible(p1.shouldShowTooltip)
	end)
	
	return var1
end)