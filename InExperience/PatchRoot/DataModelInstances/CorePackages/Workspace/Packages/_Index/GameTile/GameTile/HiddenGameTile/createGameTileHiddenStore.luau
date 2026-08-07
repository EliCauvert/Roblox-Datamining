local signalsModule = require(script:FindFirstAncestor("GameTile").Parent.Signals)

return function() --[[ line: 15 | named "createGameTileHiddenStore" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		setGameHidden = function(p0, p1) --[[ line: 18 ]]
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[p0] = p1
			var2(cloned)
		end,
		getHiddenGames = var1
	}
end