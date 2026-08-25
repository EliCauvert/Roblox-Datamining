local signalsModule = require(script:FindFirstAncestor("SystemScrim").Parent.Signals)

local function createDefaultStates()
	-- upvalues: signalsModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	local var4, var5 = signalsModule.createSignal(1)
	local var6, var7 = signalsModule.createSignal(true)
	
	return {
		visible = var2,
		setVisibility = var3,
		transparency = var4,
		setTransparency = var5,
		autoDismiss = var6,
		setAutoDismiss = var7,
		backgroundScrimActivated = Instance.new("BindableEvent")
	}
end

return signalsModule.createComputed(function(_)
	-- upvalues: createDefaultStates (ref)
	return createDefaultStates()
end)