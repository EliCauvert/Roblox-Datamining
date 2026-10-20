local SignalsModule = require(script:FindFirstAncestor("GameTile").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		setGameHidden = function(Key, p1)
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = p1
			Signal2(Copy)
		end,
		getHiddenGames = Signal
	}
end