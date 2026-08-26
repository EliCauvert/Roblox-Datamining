local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(nil)
	
	return { getChatWindowWidth = var1, setChatWindowWidth = var2 }
end