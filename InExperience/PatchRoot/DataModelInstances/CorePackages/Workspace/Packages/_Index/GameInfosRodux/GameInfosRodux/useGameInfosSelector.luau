local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local useSelector = require(gameInfosRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref), gameInfosReducerModule (ref)
	return useSelector(function(p1)
		-- upvalues: gameInfosReducerModule (copy), p0 (ref)
		return p1.Personalization[gameInfosReducerModule.key][p0]
	end)
end