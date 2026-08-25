local parent = script:FindFirstAncestor("ExpChat").Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), displayModule (ref)
	local var2, var3 = createSignal(false)
	local var4, var5 = createSignal(false)
	local var6, var7 = createSignal(false)
	local var8, var9 = createSignal(false)
	
	return {
		getShouldShowGlobalChatTooltip = var2,
		setShouldShowGlobalChatTooltip = var3,
		getIsChatWindowOpen = var4,
		setIsChatWindowOpen = var5,
		getIsGlobalChatTooltipDismissed = var6,
		setIsGlobalChatTooltipDismissed = var7,
		getIsGlobalChatTooltipEligible = var8,
		setIsGlobalChatTooltipEligible = var9,
		getIsScreenWideEnough = signalsModule.createComputed(function(p0)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p0).getViewportSize(p0).X >= 720
		end),
		reportImpression = function() end
	}
end