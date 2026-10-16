local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function() --[[ Line: 21 | Named "createMyCreationsFilterStore" ]]
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({ games = "MyGames" })
	
	return {
		getFilter = Signal,
		useFilter = function() --[[ Line: 24 ]]
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setFilter = Signal2
	}
end