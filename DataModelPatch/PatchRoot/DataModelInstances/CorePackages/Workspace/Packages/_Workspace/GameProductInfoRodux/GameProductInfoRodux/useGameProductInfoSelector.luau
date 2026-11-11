local GameProductInfoRodux = script:FindFirstAncestor("GameProductInfoRodux")
local GamesProductInfoReducerModule = require(GameProductInfoRodux.GamesProductInfoReducer)
local UseSelectorFunction = require(GameProductInfoRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GamesProductInfoReducerModule (copy)
	return (UseSelectorFunction(function(p2)
		-- upvalues: GamesProductInfoReducerModule (upval), p1 (copy)
		return p2[GamesProductInfoReducerModule.key][p1]
	end))
end