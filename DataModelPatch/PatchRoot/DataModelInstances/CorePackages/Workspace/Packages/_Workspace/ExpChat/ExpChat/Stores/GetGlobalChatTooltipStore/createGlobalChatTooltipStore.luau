local Parent = script:FindFirstAncestor("ExpChat").Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy), DisplayModule (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	
	return {
		getShouldShowGlobalChatTooltip = Signal,
		setShouldShowGlobalChatTooltip = Signal2,
		getIsChatWindowOpen = Signal1,
		setIsChatWindowOpen = Signal2_1,
		getIsGlobalChatTooltipDismissed = Signal3,
		setIsGlobalChatTooltipDismissed = Signal2_2,
		getIsGlobalChatTooltipEligible = Signal4,
		setIsGlobalChatTooltipEligible = Signal2_3,
		getIsScreenWideEnough = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: DisplayModule (upval)
			return DisplayModule.GetDisplayStore(p1).getViewportSize(p1).X >= 720
		end),
		reportImpression = function() end
	}
end