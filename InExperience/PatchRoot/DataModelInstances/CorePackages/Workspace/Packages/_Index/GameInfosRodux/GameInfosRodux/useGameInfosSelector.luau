local GameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local GameInfosReducerModule = require(GameInfosRodux.GameInfosReducer)
local UseSelectorFunction = require(GameInfosRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 6 | Named "useGameInfosSelector" ]]
	-- upvalues: UseSelectorFunction (copy), GameInfosReducerModule (copy)
	return (UseSelectorFunction(function(p2) --[[ Line: 7 ]]
		-- upvalues: GameInfosReducerModule (upval), p1 (copy)
		return p2.Personalization[GameInfosReducerModule.key][p1]
	end))
end