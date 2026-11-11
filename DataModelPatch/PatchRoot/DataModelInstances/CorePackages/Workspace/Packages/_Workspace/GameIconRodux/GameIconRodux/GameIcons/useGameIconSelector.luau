local GameIconRodux = script:FindFirstAncestor("GameIconRodux")
local GameIconReducerModule = require(GameIconRodux.GameIcons.GameIconReducer)
local UseSelectorFunction = require(GameIconRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GameIconReducerModule (copy)
	return (UseSelectorFunction(function(p2)
		-- upvalues: GameIconReducerModule (upval), p1 (copy)
		return p2[GameIconReducerModule.key][p1]
	end))
end