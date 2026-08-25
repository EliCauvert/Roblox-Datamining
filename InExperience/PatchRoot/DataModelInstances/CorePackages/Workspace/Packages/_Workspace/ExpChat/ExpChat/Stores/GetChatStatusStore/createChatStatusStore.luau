local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal("Unknown")
	
	return { getChatStatus = var0, setChatStatus = var1 }
end