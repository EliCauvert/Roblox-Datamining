local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local useSelector = require(gameInfosRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0) --[[ line: 6 | named "useGameInfosSelector" ]]
	-- upvalues: useSelector (ref), gameInfosReducerModule (ref)
	return useSelector(function(p1) --[[ line: 7 ]]
		-- upvalues: gameInfosReducerModule (copy), p0 (ref)
		return p1.Personalization[gameInfosReducerModule.key][p0]
	end)
end