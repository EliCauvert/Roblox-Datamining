local Parent = script:FindFirstAncestor("ExpChat").Parent
local CreateGlobalChatTooltipStoreModule = require(script.createGlobalChatTooltipStore)
local FetchGlobalChatTooltipEligibilityModule = require(script.fetchGlobalChatTooltipEligibility)
local FFlagExpChatShowGlobalChatTooltip = require(Parent.SharedFlags).FFlagExpChatShowGlobalChatTooltip

return require(Parent.Signals).createComputed(function()
	-- upvalues: CreateGlobalChatTooltipStoreModule (copy), FFlagExpChatShowGlobalChatTooltip (copy), FetchGlobalChatTooltipEligibilityModule (copy)
	local GlobalChatTooltipStoreModule = CreateGlobalChatTooltipStoreModule()
	
	if FFlagExpChatShowGlobalChatTooltip then
		GlobalChatTooltipStoreModule.reportImpression = FetchGlobalChatTooltipEligibilityModule.reportImpression
		FetchGlobalChatTooltipEligibilityModule.fetchEligibility(function(p1)
			-- upvalues: GlobalChatTooltipStoreModule (copy)
			GlobalChatTooltipStoreModule.setIsGlobalChatTooltipEligible(p1.shouldShowTooltip)
		end)
	end
	return GlobalChatTooltipStoreModule
end)