local gameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local gamesProductInfoReducerModule = require(gameProductInfoRodux.GamesProductInfoReducer)
local useSelector = require(gameProductInfoRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0) --[[ line: 8 | named "useGameProductInfoSelector" ]]
	-- upvalues: useSelector (ref), gamesProductInfoReducerModule (ref)
	return useSelector(function(p1) --[[ line: 9 ]]
		-- upvalues: gamesProductInfoReducerModule (copy), p0 (ref)
		return p1[gamesProductInfoReducerModule.key][p0]
	end)
end