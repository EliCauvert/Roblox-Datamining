local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local gameIconReducerModule = require(gameIconRodux.GameIcons.GameIconReducer)
local useSelector = require(gameIconRodux.Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref), gameIconReducerModule (ref)
	return useSelector(function(p1)
		-- upvalues: gameIconReducerModule (copy), p0 (ref)
		return p1[gameIconReducerModule.key][p0]
	end)
end