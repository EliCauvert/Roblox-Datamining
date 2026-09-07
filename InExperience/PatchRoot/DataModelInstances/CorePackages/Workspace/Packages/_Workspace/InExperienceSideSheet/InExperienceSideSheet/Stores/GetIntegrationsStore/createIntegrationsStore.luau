local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(parent.Chrome)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal({})
	local _ = nil
	local _ = nil
	local var5, var6 = signalsModule.createSignal({})
	local var7, var8 = signalsModule.createSignal({})
	
	return {
		getUnibarIntegrations = var1,
		setUnibarIntegrations = var2,
		getToggleIntegrations = var3,
		setToggleIntegrations = var4,
		getPageIntegrations = var5,
		setPageIntegrations = var6,
		getSessionActionIntegrations = var7,
		setSessionActionIntegrations = var8
	}
end