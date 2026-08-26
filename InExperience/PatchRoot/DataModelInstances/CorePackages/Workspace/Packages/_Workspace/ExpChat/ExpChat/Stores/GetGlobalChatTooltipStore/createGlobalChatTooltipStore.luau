local parent = script:FindFirstAncestor("ExpChat").Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), displayModule (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(false)
	
	return {
		getShouldShowGlobalChatTooltip = var1,
		setShouldShowGlobalChatTooltip = var2,
		getIsChatWindowOpen = var3,
		setIsChatWindowOpen = var4,
		getIsGlobalChatTooltipDismissed = var5,
		setIsGlobalChatTooltipDismissed = var6,
		getIsGlobalChatTooltipEligible = var7,
		setIsGlobalChatTooltipEligible = var8,
		getIsScreenWideEnough = signalsModule.createComputed(function(p1)
			-- upvalues: displayModule (copy)
			return displayModule.GetDisplayStore(p1).getViewportSize(p1).X >= 720
		end),
		reportImpression = function() end
	}
end