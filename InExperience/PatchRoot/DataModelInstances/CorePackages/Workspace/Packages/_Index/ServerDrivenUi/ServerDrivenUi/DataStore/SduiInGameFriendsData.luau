local signalsModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Signals)
local var1 = nil

return {
	getInGameFriendsByGame = function(p0)
		-- upvalues: var1 (write), signalsModule (ref)
		if var1 == nil then
			var1 = signalsModule.createSignal({})
		end
		return var1(p0)
	end,
	setInGameFriendsByGameSignal = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end
}