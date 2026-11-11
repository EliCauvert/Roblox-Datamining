local SignalsModule = require(script:FindFirstAncestor("SystemScrim").Parent.Signals)

local function createDefaultStates()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(1)
	local Signal3, Signal2_2 = SignalsModule.createSignal(true)
	
	return {
		visible = Signal,
		setVisibility = Signal2,
		transparency = Signal1,
		setTransparency = Signal2_1,
		autoDismiss = Signal3,
		setAutoDismiss = Signal2_2,
		backgroundScrimActivated = Instance.new("BindableEvent")
	}
end

return SignalsModule.createComputed(function(_)
	-- upvalues: createDefaultStates (copy)
	return (createDefaultStates())
end)