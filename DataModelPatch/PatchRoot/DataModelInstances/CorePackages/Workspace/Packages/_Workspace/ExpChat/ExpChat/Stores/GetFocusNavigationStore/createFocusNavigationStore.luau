local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	
	return {
		getChatInputBarFocused = Signal,
		focusChatInputBar = function()
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		unfocusChatInputBar = function()
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end
	}
end