local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal("Unknown")
	
	return { getChatStatus = var1, setChatStatus = var2 }
end