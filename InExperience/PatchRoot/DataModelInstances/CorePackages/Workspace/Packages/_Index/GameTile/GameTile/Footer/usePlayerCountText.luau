local useAbbreviatedNumberLocalization = require(script:FindFirstAncestor("GameTile").Parent.Localization).Hooks.useAbbreviatedNumberLocalization

return function(p1)
	-- upvalues: useAbbreviatedNumberLocalization (ref)
	local var1 = useAbbreviatedNumberLocalization(p1)
	
	return if var1 == nil or p1 == -1 then "--" else var1
end