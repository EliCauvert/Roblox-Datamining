local gameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local gamesProductInfoReducerModule = require(gameProductInfoRodux.GamesProductInfoReducer)
local useSelector = require(gameProductInfoRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref), gamesProductInfoReducerModule (ref)
	return useSelector(function(p2)
		-- upvalues: gamesProductInfoReducerModule (copy), p1 (ref)
		return p2[gamesProductInfoReducerModule.key][p1]
	end)
end