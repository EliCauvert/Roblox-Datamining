local gameIconReducerModule = require(script:FindFirstAncestor("GameIconRodux").GameIcons.GameIconReducer)

return function(p0, p1) --[[ line: 4 ]]
	-- upvalues: gameIconReducerModule (ref)
	local var1 = p0[gameIconReducerModule.key][p1]
	
	return if var1 then var1.url else ""
end