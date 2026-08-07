local signalsModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Signals)
local var1 = nil

return {
	getInGameFriendsByGame = function(p0) --[[ line: 7 ]]
		-- upvalues: var1 (write), signalsModule (ref)
		if var1 == nil then
			var1 = signalsModule.createSignal({})
		end
		return var1(p0)
	end,
	setInGameFriendsByGameSignal = function(value) --[[ line: 14 ]]
		-- upvalues: var1 (write)
		var1 = value
	end
}