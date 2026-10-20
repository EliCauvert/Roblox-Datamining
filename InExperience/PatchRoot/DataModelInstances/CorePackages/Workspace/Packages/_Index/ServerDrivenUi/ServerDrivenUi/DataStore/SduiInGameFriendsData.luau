local SignalsModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Signals)
local Signal = nil

return {
	getInGameFriendsByGame = function(p1)
		-- upvalues: Signal (ref), SignalsModule (copy)
		if Signal == nil then
			Signal = SignalsModule.createSignal({})
		end
		return Signal(p1)
	end,
	setInGameFriendsByGameSignal = function(Value)
		-- upvalues: Signal (ref)
		Signal = Value
	end
}