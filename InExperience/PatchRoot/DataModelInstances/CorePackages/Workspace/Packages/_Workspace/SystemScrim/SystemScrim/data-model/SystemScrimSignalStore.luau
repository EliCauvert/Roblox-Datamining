local signalsModule = require(script:FindFirstAncestor("SystemScrim").Parent.Signals)

local function createDefaultStates()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(1)
	local var5, var6 = signalsModule.createSignal(true)
	
	return {
		visible = var1,
		setVisibility = var2,
		transparency = var3,
		setTransparency = var4,
		autoDismiss = var5,
		setAutoDismiss = var6,
		backgroundScrimActivated = Instance.new("BindableEvent")
	}
end

return signalsModule.createComputed(function(_)
	-- upvalues: createDefaultStates (ref)
	return createDefaultStates()
end)