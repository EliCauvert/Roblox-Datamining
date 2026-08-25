local useAbbreviatedNumberLocalization = require(script:FindFirstAncestor("GameTile").Parent.Localization).Hooks.useAbbreviatedNumberLocalization

return function(p0)
	-- upvalues: useAbbreviatedNumberLocalization (ref)
	local var0 = useAbbreviatedNumberLocalization(p0)
	
	return if var0 == nil or p0 == -1 then "--" else var0
end