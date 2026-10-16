local Parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(Parent.Chrome)
local SignalsModule = require(Parent.Signals)

return function() --[[ Line: 25 | Named "createIntegrationsStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local Signal3, Signal2_2 = SignalsModule.createSignal({})
	local Signal4, Signal2_3 = SignalsModule.createSignal({})
	local Signal5, Signal2_4 = SignalsModule.createSignal({})
	local Signal6, Signal2_5 = SignalsModule.createSignal({})
	
	return {
		getUnibarIntegrations = Signal,
		setUnibarIntegrations = Signal2,
		getAboveFoldIntegrations = Signal1,
		setAboveFoldIntegrations = Signal2_1,
		getBelowFoldIntegrations = Signal3,
		setBelowFoldIntegrations = Signal2_2,
		getSessionActionIntegrations = Signal4,
		setSessionActionIntegrations = Signal2_3,
		getScrollableContentTopWidgetIntegrations = Signal5,
		setScrollableContentTopWidgetIntegrations = Signal2_4,
		getScrollableContentBottomWidgetIntegrations = Signal6,
		setScrollableContentBottomWidgetIntegrations = Signal2_5
	}
end