local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return { getPortalTarget = var1, setPortalTarget = var2 }
end