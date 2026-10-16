local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ Line: 11 ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	
	return {
		getChatWindowWidth = Signal,
		setChatWindowWidth = Signal2
	}
end