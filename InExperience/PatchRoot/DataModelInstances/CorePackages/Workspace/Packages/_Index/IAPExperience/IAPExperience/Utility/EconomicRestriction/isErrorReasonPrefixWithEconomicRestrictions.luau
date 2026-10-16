return function(Text: string): boolean --[[ Line: 3 | Named "isErrorReasonPrefixWithEconomicRestrictions" ]]
	return string.sub(Text, 1, 20) == "EconomicRestrictions"
end