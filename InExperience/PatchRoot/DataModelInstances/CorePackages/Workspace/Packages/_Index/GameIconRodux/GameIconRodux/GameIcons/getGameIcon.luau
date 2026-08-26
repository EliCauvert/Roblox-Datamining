local gameIconReducerModule = require(script:FindFirstAncestor("GameIconRodux").GameIcons.GameIconReducer)

return function(p1, p2)
	-- upvalues: gameIconReducerModule (ref)
	local var1 = p1[gameIconReducerModule.key][p2]
	
	return if var1 then var1.url else ""
end