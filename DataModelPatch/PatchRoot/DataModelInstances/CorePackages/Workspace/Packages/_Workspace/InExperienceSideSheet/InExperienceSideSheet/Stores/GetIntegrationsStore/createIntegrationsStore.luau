local Parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(Parent.Chrome)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	local Signal3, Signal2_2 = SignalsModule.createSignal({})
	local Signal4, Signal2_3 = SignalsModule.createSignal({})
	
	return {
		getUnibarIntegrations = Signal,
		setUnibarIntegrations = Signal2,
		getToggleIntegrations = Signal1,
		setToggleIntegrations = Signal2_1,
		getPageIntegrations = Signal3,
		setPageIntegrations = Signal2_2,
		getSessionActionIntegrations = Signal4,
		setSessionActionIntegrations = Signal2_3
	}
end