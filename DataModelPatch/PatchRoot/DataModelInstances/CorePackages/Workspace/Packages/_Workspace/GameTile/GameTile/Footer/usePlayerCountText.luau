local UseAbbreviatedNumberLocalizationFunction = require(script:FindFirstAncestor("GameTile").Parent.Localization).Hooks.useAbbreviatedNumberLocalization

return function(p1)
	-- upvalues: UseAbbreviatedNumberLocalizationFunction (copy)
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(p1)
	
	return if UseAbbreviatedNumberLocalizationResult == nil or p1 == -1 then "--" else UseAbbreviatedNumberLocalizationResult
end