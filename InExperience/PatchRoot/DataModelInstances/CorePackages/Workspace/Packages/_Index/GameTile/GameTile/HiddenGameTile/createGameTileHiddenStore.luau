local SignalsModule = require(script:FindFirstAncestor("GameTile").Parent.Signals)

return function() --[[ Line: 15 | Named "createGameTileHiddenStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		setGameHidden = function(Key, p1) --[[ Line: 18 ]]
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = p1
			Signal2(Copy)
		end,
		getHiddenGames = Signal
	}
end