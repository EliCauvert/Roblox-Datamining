local signalsModule = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	
	return { getVisibility = var1, setVisibility = var2 }
end