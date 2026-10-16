return function(Text: string): boolean --[[ Line: 1 | Named "isErrorReasonContainsEconomicRestrictions" ]]
	return string.find(Text, "EconomicRestrictions") ~= nil
end