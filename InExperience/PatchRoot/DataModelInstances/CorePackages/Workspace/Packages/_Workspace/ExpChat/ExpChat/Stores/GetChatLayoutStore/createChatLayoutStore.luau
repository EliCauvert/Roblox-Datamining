local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 11 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	
	return { getChatWindowWidth = var0, setChatWindowWidth = var1 }
end