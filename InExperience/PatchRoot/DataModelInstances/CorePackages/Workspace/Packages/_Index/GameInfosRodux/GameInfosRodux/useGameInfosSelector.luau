local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local useSelector = require(gameInfosRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref), gameInfosReducerModule (ref)
	return useSelector(function(p2)
		-- upvalues: gameInfosReducerModule (copy), p1 (ref)
		return p2.Personalization[gameInfosReducerModule.key][p1]
	end)
end