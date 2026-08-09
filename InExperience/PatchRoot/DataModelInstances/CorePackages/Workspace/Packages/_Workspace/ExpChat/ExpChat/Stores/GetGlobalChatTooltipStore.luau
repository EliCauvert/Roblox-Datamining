local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local createGlobalChatTooltipStoreModule = require(script.createGlobalChatTooltipStore)
local fetchGlobalChatTooltipEligibilityModule = require(script.fetchGlobalChatTooltipEligibility)
local fFlagExpChatShowGlobalChatTooltip = sharedFlagsModule.FFlagExpChatShowGlobalChatTooltip

return signalsModule.createComputed(function() --[[ line: 9 ]]
	-- upvalues: createGlobalChatTooltipStoreModule (ref), fFlagExpChatShowGlobalChatTooltip (ref), fetchGlobalChatTooltipEligibilityModule (ref)
	local var4 = createGlobalChatTooltipStoreModule()
	
	if fFlagExpChatShowGlobalChatTooltip then
		var4.reportImpression = fetchGlobalChatTooltipEligibilityModule.reportImpression
		fetchGlobalChatTooltipEligibilityModule.fetchEligibility(function(p0) --[[ line: 15 ]]
			-- upvalues: var4 (ref)
			var4.setIsGlobalChatTooltipEligible(p0.shouldShowTooltip)
		end)
	end
	return var4
end)