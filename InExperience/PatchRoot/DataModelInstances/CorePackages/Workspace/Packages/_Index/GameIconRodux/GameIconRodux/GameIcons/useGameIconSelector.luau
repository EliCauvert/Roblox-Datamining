local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local gameIconReducerModule = require(gameIconRodux.GameIcons.GameIconReducer)
local useSelector = require(gameIconRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref), gameIconReducerModule (ref)
	return useSelector(function(p2)
		-- upvalues: gameIconReducerModule (copy), p1 (ref)
		return p2[gameIconReducerModule.key][p1]
	end)
end