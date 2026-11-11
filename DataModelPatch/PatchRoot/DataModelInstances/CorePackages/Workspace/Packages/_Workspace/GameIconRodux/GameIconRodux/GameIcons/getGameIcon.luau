local GameIconReducerModule = require(script:FindFirstAncestor("GameIconRodux").GameIcons.GameIconReducer)

return function(p1, p2)
	-- upvalues: GameIconReducerModule (copy)
	local v1 = p1[GameIconReducerModule.key][p2]
	
	return if v1 then v1.url else ""
end